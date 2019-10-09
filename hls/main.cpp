/*
-------------------------------------------------------------------------------------
	The MIT License.
	Copyright © 2019 Andrei Kalshchikov /KalshchikovAA@gmail.com/.
	National Research University "Moscow Power Engineering Institute"
	
	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in
	all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	THE SOFTWARE.
	-------------------------------------------------------------------------------------
*/
#include "HLS/hls.h"
#include "HLS/math.h"
#ifdef __INTELFPGA_COMPILER__
#include "HLS/ac_int.h"
#else
#include "ref/ac_int.h"
#endif
#include "bmp_tools.h"

#include <string>
#include <stdio.h> //printf
#include <stdlib.h> // malloc, free

#define DEBUG_AC_INT_WARNING

#define TB_ONLY


#define GET_BYTE0(x) ((x) & 0xFF)
#define GET_BYTE1(x) (((x) & 0xFF00) >> 8)
#define GET_BYTE2(x) (((x) & 0xFF0000) >> 16)

typedef unsigned char uchar;
typedef unsigned int uint;

typedef struct {
    uint8 color[3];
} rgb_t;

typedef struct {
    rgb_t rgb_mean;
    uint8 rgb_std;
    uint8 w;
} cluster_t;

typedef struct {
    uint2 clusters_num;
    uint6 chm;
    uint6 u;
    cluster_t cluster[3];
    rgb_t rgb_new;
    uint1 is_fg;
} data_t;


typedef ihc::readyLatency<0> READY_LATENCY_0;
typedef ihc::buffer<64> BUFFER_64;

typedef ihc::stream_in<data_t, READY_LATENCY_0, BUFFER_64> in_stream_t;
typedef ihc::stream_out<data_t, READY_LATENCY_0> out_stream_t;


float round_float(float in) {
    if (in - floor(in) >= 0.5f) {
        return ceil(in);
    }
    else {
        return floor(in);
    }
}

/*
    "d" is a number in equation (x-x_mean)^2 < d*x_var
    "alpha"
*/
component hls_always_run_component hls_stall_free_return void gmm_substract (hls_stable_argument uint8 d, hls_stable_argument uint8 bg_th,  hls_stable_argument uint10 in_alpha, hls_stable_argument uint8 s,  in_stream_t &snk, out_stream_t &src) {
    data_t in = snk.read();


    uint10 alpha = (uint10) (in_alpha +  (uint10) (s * in.u));
    uint5 var_lim_coef = d;
    uint10 alpha_n = (uint10)1024 - alpha;
    uint16 mem_var[3];//[cluster_idx]
    uint17 d_rgb_sqr[3][3];
    uint20 vars[3] = {1, 1, 1};//[cluster_idx]
    uint20 var_min = 0, var_max = 0;
    int9 new_color[3];//[color_idx]
    int9 mem_color[3][3];//[cluster_idx][color_idx]
    uint8 mem_w[3];//[cluster_idx]
    uint16 w_sum = 0;
    
    int var_min_idx = 0, var_max_idx = 0;
    uint1 is_match = 0, is_matched = 1;
    uint1 is_fg = 0;
    int9 d_rgb[3][3];
    
    uint8 cluster_std[3];
    uint21 vars_lim[3];

    // Prepare data
    for (int j = 0; j < 3; ++j) {
        new_color[j] = in.rgb_new.color[j];
        #pragma unroll
        for (int k = 0; k < 3; ++k) {
            if (k < in.clusters_num)
                mem_color[k][j] = in.cluster[k].rgb_mean.color[j];
            else
                mem_color[k][j] = in.rgb_new.color[j];
        }
    }
    
    // Vars calc
    #pragma unroll
    for (int k = 0; k < 3; ++k) {
        if (k < in.clusters_num) {
            cluster_std[k] = (in.cluster[k].rgb_std);
            mem_w[k] = in.cluster[k].w;
        }
        else {
            cluster_std[k] = (uint8) 0;
            mem_w[k] = (uint8) 0;
        }

        mem_var[k] = (cluster_std[k] != 0) ? cluster_std[k] * cluster_std[k] : ((uint16)1);
        vars_lim[k] = var_lim_coef * mem_var[k];        
        
        #pragma unroll
        for(int j = 0; j < 3; ++j) {
            d_rgb[k][j] = new_color[j] - mem_color[k][j];
            d_rgb_sqr[k][j] = (d_rgb[k][j] * d_rgb[k][j]);
            vars[k] = vars[k] + d_rgb_sqr[k][j];
        }

        if (k == 0) {
            var_max = vars[k];
            var_max_idx = k;
        }
        else if ((vars[k] > var_max) && (k < in.clusters_num)) {
            var_max = vars[k];
            var_max_idx = k;
        }

        if ((vars[k] <= vars_lim[k]) && (k < in.clusters_num)) {
            if (is_match != is_matched) {
                is_match = is_matched;
                var_min = vars[k];
                var_min_idx = k;
            }
            else if (vars[k] < var_min) {
                var_min = vars[k];
                var_min_idx = k;
            }
        }
    }

    // params update
    if (is_match == is_matched) {
        if (in.u < 63) {
            in.u = (uint6) (in.u + (uint1)1);
        }

        #pragma unroll
        for (int k = 0; k < 3; ++k) {
            uint30 v0, v1;
            uint31 v_sum;
            uint18 w0, w1;
            uint19 w_sum;
            
            v0 = (uint30) (((uint30) alpha_n) * ((uint30) mem_var[k]));
            v1 = (uint30) (((uint30) alpha) * ((uint30) vars[k]));
            w0 = (uint18) (((uint18) alpha_n) * ((uint18) mem_w[k]));
            w1 = (uint18) (alpha * (uint8) 255);

            v_sum = (uint31) (v0 + v1);
            w_sum = (uint19) (w0 + w1);

            if (k < in.clusters_num) {
                if (var_min_idx == k) {
                    #pragma unroll
                    for (int j = 0; j < 3; ++j) {
                        uint18 c0, c1;
                        uint19 c_sum;
                        c0 = (uint18) (((uint18) alpha_n) * ((uint18) mem_color[k][j]));
                        c1 = (uint18) (((uint18) alpha) * ((uint18) new_color[j]));
                        c_sum = c0 + c1;

                        // Rounding
                        if (c_sum.slc<10>(0) > (uint10) 511) {
                            mem_color[k][j] = (int9) 1 + (int9) (c_sum >> (uint19)10);
                        }
                        else {
                            mem_color[k][j] = (int9) (c_sum >> (uint19)10);
                        }     
                    }
                    
                    // Rounding
                    if (v_sum.slc<10>(0) > (uint10) 511) {
                        mem_var[k] = (uint16) 1 + (uint16) (v_sum >> (uint31)10);
                    }
                    else {
                        mem_var[k] = (uint16) (v_sum >> (uint31)10);
                    }
 
                    // Rounding
                    if (w_sum.slc<10>(0) > (uint10) 511) {
                        mem_w[k] = (uint8) 1 +  (uint8) (w_sum >> (uint19) 10);
                    }
                    else {
                        mem_w[k] = (uint8) (w_sum >> (uint19) 10);
                    }
                }
                else {
                    if (w0.slc<10>(0) > (uint10) 511) {
                        mem_w[k] = (uint8) 1 + (uint8) (w0 >> (uint18) 10);
                    }
                    else {
                        mem_w[k] = (uint8) (w0 >> (uint18) 10);
                    }
                }
            }
            
        }
    }
    else {
        in.u = (uint6) 0;

        if (in.clusters_num < 3) {
            int k_idx = in.clusters_num;
            in.clusters_num = in.clusters_num + 1;
            #pragma unroll
            for (int j = 0; j < 3; ++j) {
                mem_color[k_idx][j] = new_color[j];
            }
            mem_w[k_idx] = (uint8) 3;
            mem_var[k_idx] = (uint16) (var_max >> (uint20) 3);
			vars[k_idx] = (uint20) 0;
        }
        else {
            int k_idx = var_max_idx;
            #pragma unroll
            for (int j = 0; j < 3; ++j) {
                mem_color[k_idx][j] = new_color[j];
            }
            mem_w[k_idx] = (uint8) 3;
            mem_var[k_idx] = (uint16) (var_max >> (uint20) 3);
			vars[k_idx] = (uint20) 0;
        }
    }

    // w normalized
    #pragma unroll
    for (int k = 0; k < 3; ++k) {
        if (k < in.clusters_num) {
            if (0 == mem_var[k]) {
                mem_var[k] = (uint16) 1;
            }

            if (0 == mem_w[k]) {
                mem_w[k] = (uint8) 1;
                w_sum = w_sum + ((uint16)1);
            }
            else {
                w_sum = w_sum + ((uint16)mem_w[k]);
            }
            
        }
    }
    #pragma unroll
    for (int k = 0; k < 3; ++k) {
        if (k < in.clusters_num) {
            uint17 w_new = (uint17) ((uint17) 510 * mem_w[k]) / w_sum;
            if (w_new.slc<1>(0) != 0) {
                mem_w[k] = (uint8) 1 + (uint8) (w_new >> (uint17) 1);
            }
            else {
                mem_w[k] = (uint8) (w_new >> (uint17) 1);
            }
        }
    }

    // sort
    if (in.clusters_num >= 2) {
        uint32 cluster_val[3];//[cluster_idx]
        #pragma unroll
        for (int k = 0; k < 3; ++k) {
            if (k < in.clusters_num) {
                cluster_val[k] = (uint32) ((((uint32)mem_w[k]) << (uint32) 24) / mem_var[k]);
            }
        }

        if (2 == in.clusters_num) {
            if (cluster_val[1] > cluster_val[0]) {
                uint8 w0;
                uint16 v0;
                w0 = mem_w[0];
                mem_w[0] = mem_w[1];
                mem_w[1] = w0;
                v0 = mem_var[0];
                mem_var[0] = mem_var[1];
                mem_var[1] = v0;
                int9 c0[3];
                #pragma unroll
                for (int j = 0; j < 3; ++j) {
                    c0[j] = mem_color[0][j];
                    mem_color[0][j] = mem_color[1][j];
                    mem_color[1][j] = c0[j];
                }
            }
        }
        else {
            for(int m = 0; m < 2; ++m) {
                for (int n = 0; n < (2-m); ++n) {
                    if (cluster_val[n+1] > cluster_val[n]) {
                        uint8 w0;
                        uint16 v0;
                        uint32 c0;
                        w0 = mem_w[n];
                        mem_w[n] = mem_w[n+1];
                        mem_w[n+1] = w0;
                        v0 = mem_var[n];
                        mem_var[n] = mem_var[n+1];
                        mem_var[n+1] = v0;
                        c0 = cluster_val[n];
                        cluster_val[n] = cluster_val[n+1];
                        cluster_val[n+1] = c0;

                        int9 c1[3];
                        #pragma unroll
                        for (int j = 0; j < 3; ++j) {
                            c1[j] = mem_color[n][j];
                            mem_color[n][j] = mem_color[n+1][j];
                            mem_color[n+1][j] = c1[j];
                        }
                    }
                }
            }
        }
    }

    // B calc
    int B = 0;
    uint8 B_w_sum = mem_w[0];
    for (int k = 1; k < in.clusters_num; ++k) {
        if (B_w_sum < bg_th) {
            B = k;
        }
        B_w_sum = B_w_sum + mem_w[k];
    }

    // probability calc
    float p[3];
    float p_max;
    int p_max_idx = 0;
    static float pi2 = 6.2831853071f; 
    #pragma unroll
    for (int k = 0; k < 3; ++k) {
        if (k < in.clusters_num) {
            float exp_arg = -((float)vars[k]) / (2.0f * ((float)mem_var[k]));


            float denum = sqrtf(pi2 * ((float)mem_var[k]));

            p[k] = ((float)mem_w[k]) * expf(exp_arg) / denum;
        }
    }
    
    for (int k = 0; k < 3; ++k) {
        if (k < in.clusters_num) {
            if (k == 0) {
                p_max = p[k];
                p_max_idx = k;
            }
            else if (p[k] > p_max) {
                p_max = p[k];
                p_max_idx = k;
            }
        }
    }

    // FG detector
    if (p_max_idx > B) {
        is_fg = 1;
    }

    data_t out = in;
    out.is_fg = is_fg;
    
    #pragma unroll
    for(int k = 0; k < 3; ++k) {
        if (k < in.clusters_num) {
            out.cluster[k].w = mem_w[k];
			if (mem_var[k] > 3969)
				out.cluster[k].rgb_std = 63;
			else if (mem_var[k] < 9) {
				out.cluster[k].rgb_std = 3;
			}
			else {
                uint10 std = (uint10) (sqrtf(((float)mem_var[k]) * 4.0f));
                if (std[0] != (uint1) 0) {
                    out.cluster[k].rgb_std = (uint8) 1 + (uint8) (std >> (uint10) 1);
                }
                else {
                    out.cluster[k].rgb_std = (uint8) (std >> (uint10) 1);
                }
			}

            #pragma unroll
            for (int j = 0; j < 3; ++j) {
                out.cluster[k].rgb_mean.color[j] = (uint8) (mem_color[k][j]);
            }
        }
    }
    
    src.write(out);
}

void gmm_substract_tb (float d, float bg_th,  float in_alpha, float s,  in_stream_t &snk, out_stream_t &src) {
    data_t in = snk.read();

	

    float alpha = in_alpha + s * ((float) in.u);
	bg_th = bg_th;
	alpha = alpha / 1024.0f;
    float var_lim_coef = d;
    float alpha_n = 1 - alpha;
    float mem_var[3];//[cluster_idx]
    float d_rgb_sqr[3][3];
    float vars[3] = {1, 1, 1};//[cluster_idx]
    float var_min = 0, var_max = 0;
    float new_color[3];//[color_idx]
    float mem_color[3][3];//[cluster_idx][color_idx]
    float mem_w[3];//[cluster_idx]
    float w_sum = 0;
    
    int var_min_idx = 0, var_max_idx = 0;
    int is_match = 0, is_matched = 1;
    int is_fg = 0;
    float d_rgb[3][3];
    
    float cluster_std[3];
    float vars_lim[3];

    // Prepare data
    for (int j = 0; j < 3; ++j) {
        new_color[j] = (float) in.rgb_new.color[j];
        #pragma unroll
        for (int k = 0; k < 3; ++k) {
            if (k < in.clusters_num)
                mem_color[k][j] = (float) in.cluster[k].rgb_mean.color[j];
            else
                mem_color[k][j] = (float) in.rgb_new.color[j];
        }
    }
    
    // Vars calc
    #pragma unroll
    for (int k = 0; k < 3; ++k) {
        if (k < in.clusters_num) {
            cluster_std[k] = (float) (in.cluster[k].rgb_std);
            mem_w[k] = ((float)in.cluster[k].w);
        }
        else {
            cluster_std[k] = 0;
            mem_w[k] = 0;
        }

        mem_var[k] = (cluster_std[k] != 0) ? cluster_std[k] * cluster_std[k] : (1);
        vars_lim[k] = var_lim_coef * mem_var[k];        
        
        #pragma unroll
        for(int j = 0; j < 3; ++j) {
            d_rgb[k][j] = new_color[j] - mem_color[k][j];
            d_rgb_sqr[k][j] = (d_rgb[k][j] * d_rgb[k][j]);
            vars[k] = vars[k] + d_rgb_sqr[k][j];
        }

        if (k == 0) {
            var_max = vars[k];
            var_max_idx = k;
        }
        else if ((vars[k] > var_max) && (k < in.clusters_num)) {
            var_max = vars[k];
            var_max_idx = k;
        }

        if ((vars[k] <= vars_lim[k]) && (k < in.clusters_num)) {
            if (is_match != is_matched) {
                is_match = is_matched;
                var_min = vars[k];
                var_min_idx = k;
            }
            else if (vars[k] < var_min) {
                var_min = vars[k];
                var_min_idx = k;
            }
        }
    }

    // params update
    if (is_match == is_matched) {
        if (in.u < 63)
            in.u = in.u + 1;

        #pragma unroll
        for (int k = 0; k < 3; ++k) {
            if (k < in.clusters_num) {
                if (var_min_idx == k) {
                    float v0, v1;
                    float w0, w1;
                    
                    v0 = alpha_n *  mem_var[k];
                    v1 =  alpha * vars[k];
                    w0 =  alpha_n * mem_w[k];
                    w1 = alpha * 255;

                    #pragma unroll
                    for (int j = 0; j < 3; ++j) {
                        float c0, c1;
                        c0 = alpha_n * mem_color[k][j];
                        c1 = alpha * new_color[j];
                        mem_color[k][j] = round_float(c0 + c1);
                    }
                    mem_var[k] = round_float(v0 + v1);
                    mem_w[k] = round_float(w0 + w1);
                }
                else {
                    mem_w[k] = round_float(alpha_n * mem_w[k]);
                }
            }
            
        }
    }
    else {
        in.u = 0;

        if (in.clusters_num < 3) {
            int k_idx = in.clusters_num;
            in.clusters_num = in.clusters_num + 1;
            #pragma unroll
            for (int j = 0; j < 3; ++j) {
                mem_color[k_idx][j] = new_color[j];
            }
            mem_w[k_idx] =  3.0f;
            mem_var[k_idx] = floor((var_max / ( 8.0f)));
			vars[k_idx] = 0;
        }
        else {
            int k_idx = var_max_idx;
            #pragma unroll
            for (int j = 0; j < 3; ++j) {
                mem_color[k_idx][j] = new_color[j];
            }
            mem_w[k_idx] = 3.0f;
            mem_var[k_idx] = floor(var_max / ( 8.0f));
			vars[k_idx] = 0;
        }
    }

    // w normalized
    #pragma unroll
    for (int k = 0; k < 3; ++k) {
        if (k < in.clusters_num) {
            if (0 == mem_var[k]) {
                mem_var[k] = 1.0f;
            }

            if (0 == mem_w[k]) {
                mem_w[k] = 3.0f;
                w_sum = w_sum + 3.0f;
            }
            else {
                w_sum = w_sum + mem_w[k];
            }
            
        }
    }
    #pragma unroll
    for (int k = 0; k < 3; ++k) {
        if (k < in.clusters_num) {
            mem_w[k] = round_float(255.0f * mem_w[k] / w_sum);
        }
    }

    // sort
    if (in.clusters_num >= 2) {
        float cluster_val[3];//[cluster_idx]
        #pragma unroll
        for (int k = 0; k < 3; ++k) {
            if (k < in.clusters_num) {
                cluster_val[k] = floor ((0x1000000 * mem_w[k])/ mem_var[k]);
            }
        }

        if (2 == in.clusters_num) {
            if (cluster_val[1] > cluster_val[0]) {
                float w0;
                float v0;
                w0 = mem_w[0];
                mem_w[0] = mem_w[1];
                mem_w[1] = w0;
                v0 = mem_var[0];
                mem_var[0] = mem_var[1];
                mem_var[1] = v0;
                float c0[3];
                #pragma unroll
                for (int j = 0; j < 3; ++j) {
                    c0[j] = mem_color[0][j];
                    mem_color[0][j] = mem_color[1][j];
                    mem_color[1][j] = c0[j];
                }
            }
        }
        else {
            for(int m = 0; m < 2; ++m) {
                for (int n = 0; n < (2-m); ++n) {
                    if (cluster_val[n+1] > cluster_val[n]) {
                        float w0;
                        float v0;
                        float c0;
                        w0 = mem_w[n];
                        mem_w[n] = mem_w[n+1];
                        mem_w[n+1] = w0;
                        v0 = mem_var[n];
                        mem_var[n] = mem_var[n+1];
                        mem_var[n+1] = v0;
                        c0 = cluster_val[n];
                        cluster_val[n] = cluster_val[n+1];
                        cluster_val[n+1] = c0;

                        float c1[3];
                        #pragma unroll
                        for (int j = 0; j < 3; ++j) {
                            c1[j] = mem_color[n][j];
                            mem_color[n][j] = mem_color[n+1][j];
                            mem_color[n+1][j] = c1[j];
                        }
                    }
                }
            }
        }
    }

    // B calc
    int B = 0;
    float B_w_sum = mem_w[0];
    for (int k = 1; k < in.clusters_num; ++k) {
        if (B_w_sum < bg_th) {
            B = k;
        }
        B_w_sum = B_w_sum + mem_w[k];
    }

    // probability calc
    float p[3];
    float p_max;
    int p_max_idx = 0;
    static float pi2 = 6.2831853071f; 
    #pragma unroll
    for (int k = 0; k < 3; ++k) {
        if (k < in.clusters_num) {
            float exp_arg = -((float)vars[k]) / (2.0f * ((float)mem_var[k]));


            float denum = sqrtf(pi2 * ((float)mem_var[k]));

            p[k] = ((float)mem_w[k]) * expf(exp_arg) / denum;
        }
    }
    
    for (int k = 0; k < 3; ++k) {
        if (k < in.clusters_num) {
            if (k == 0) {
                p_max = p[k];
                p_max_idx = k;
            }
            else if (p[k] > p_max) {
                p_max = p[k];
                p_max_idx = k;
            }
        }
    }

    // FG detector
    if (p_max_idx > B) {
        is_fg = 1;
    }

    data_t out = in;
    out.is_fg = is_fg;
    
    #pragma unroll
    for(int k = 0; k < 3; ++k) {
        if (k < in.clusters_num) {
            out.cluster[k].w = round_float(mem_w[k]);
            
			if (mem_var[k] > 3969)
				out.cluster[k].rgb_std = 63;
			else if (mem_var[k] < 9) {
				out.cluster[k].rgb_std = 3;
			}
			else {
                out.cluster[k].rgb_std = round_float(sqrtf((float)mem_var[k]));
			}

            #pragma unroll
            for (int j = 0; j < 3; ++j) {
                out.cluster[k].rgb_mean.color[j] = round_float(mem_color[k][j]);
            }
        }
    }
    
    src.write(out);
}

bool is_tb_successed(data_t in, data_t tb) {
    if (in.clusters_num != tb.clusters_num)
        return false;
    if (in.is_fg != tb.is_fg)
        return false;
    if (in.u != tb.u)
        return false;
    if (in.chm != tb.chm)
        return false;
    for (int j = 0; j < 3; ++j) 
        if (in.rgb_new.color[j] != tb.rgb_new.color[j])
            return false;
    for (int k = 0; k < in.clusters_num; ++k) {
        if (in.cluster[k].w != tb.cluster[k].w)
            return false;
        if (in.cluster[k].rgb_std != tb.cluster[k].rgb_std)
            return false;
        for (int j = 0; j < 3; ++j)
            if (in.cluster[k].rgb_mean.color[j] != tb.cluster[k].rgb_mean.color[j])
                return false;
    }

    return true;
}

int main(void) {
    std::string input_path = "D:\\vc\\InnovateFPGA\\FPGA\\ObjectsRemover\\gmm_fg_detector\\hls\\in\\in_";
    std::string output_path = "D:\\vc\\InnovateFPGA\\FPGA\\ObjectsRemover\\gmm_fg_detector\\hls\\out\\out_";
    int h, w;
    int frames_num = 100;
    unsigned int *in_frame = NULL, *out_frame = NULL;
    uint10 min_alpha = 5;
    uint10 max_alpha = 66;
	uint10 u_max = 64;
    uint8 s = 0;//(uint8) ((max_alpha - min_alpha) / u_max);
    uchar bg_th = 178;
    uchar d = 9;

    in_stream_t snk, snk_tb;
    out_stream_t src, src_tb;
    data_t *data, *data_tb;
    data = data_tb = NULL;

    for (int t = 0; t < frames_num; ++t) {
        std::string in_filename = input_path + std::to_string((long long)(t+1)) + std::string(".bmp");
        std::string out_filename = output_path + std::to_string((long long)(t+1)) + std::string(".bmp");

        read_bmp(in_filename.c_str(), &in_frame, h, w);
		if (0 == t) {
			data = new data_t [h * w];
            data_tb = new data_t [h * w];
            out_frame = new unsigned int[h * w];
		}

        unsigned char *px = 0;
        for (int i = 0; i < (h * w); ++i) {
            px = (unsigned char *) &in_frame[i];
            if (0 == t) {
                data[i].clusters_num = 1;
                data[i].cluster[0].w = 3;
                data[i].cluster[0].rgb_std = 17;
                data[i].cluster[0].rgb_mean.color[0] = px[0];
                data[i].cluster[0].rgb_mean.color[1] = px[1];
                data[i].cluster[0].rgb_mean.color[2] = px[2];

                data_tb[i].clusters_num = 1;
                data_tb[i].cluster[0].w = 3;
                data_tb[i].cluster[0].rgb_std = 17;
                data_tb[i].cluster[0].rgb_mean.color[0] = px[0];
                data_tb[i].cluster[0].rgb_mean.color[1] = px[1];
                data_tb[i].cluster[0].rgb_mean.color[2] = px[2];
            }
            
            data[i].rgb_new.color[0] = px[0];
            data[i].rgb_new.color[1] = px[1];
            data[i].rgb_new.color[2] = px[2];

            data_tb[i].rgb_new.color[0] = px[0];
            data_tb[i].rgb_new.color[1] = px[1];
            data_tb[i].rgb_new.color[2] = px[2];

            snk.write(data[i]);
            snk_tb.write(data_tb[i]);

			if (i == 0x6e4f && t == 0x51)
			{
				int xxx = 1;
			}

            #ifndef TB_ONLY
                ihc_hls_enqueue_noret(gmm_substract, d, bg_th, min_alpha, s,  snk, src);
            #endif
            gmm_substract_tb((float) d, (float) bg_th, (float) min_alpha, (float) s,  snk_tb, src_tb);
        }

        free(in_frame);

        #ifndef TB_ONLY
            ihc_hls_component_run_all(gmm_substract);
        #endif


        for (int i = 0; i < (h * w); ++i) {
            data_t mem_tb = src_tb.read();
            data_tb[i] = mem_tb;

            #ifndef TB_ONLY
                data_t mem = src.read();
                data[i] = mem;

                if (!is_tb_successed(mem, mem_tb)) {
                    printf("[%0u] ERROR: test failed\n", t);
                }
            #endif
            
            unsigned int px;
            //px = ((unsigned int) t.cluster[0].rgb_mean.color[2] << 16) | ((unsigned int) t.cluster[0].rgb_mean.color[1] << 8) | ((unsigned int)  t.cluster[0].rgb_mean.color[0]);
            
            if (0 != mem_tb.is_fg) {
                px = 0x00FFFFFF;
                //px = ((unsigned int) mem_tb.cluster[0].rgb_mean.color[2] << 16) | ((unsigned int) mem_tb.cluster[0].rgb_mean.color[1] << 8) | ((unsigned int)  mem_tb.cluster[0].rgb_mean.color[0]);
            }
            else {
                px = 0x0;
                //px = ((unsigned int) mem_tb.rgb_new.color[2] << 16) | ((unsigned int) mem_tb.rgb_new.color[1] << 8) | ((unsigned int)  mem_tb.rgb_new.color[0]);
            }
            out_frame[i] = px;
        }

        write_bmp(out_filename.c_str(), out_frame, h, w);
        printf("Completed %0d %%\n", (int)((100.0*(t+1))/frames_num));
    }
    
    delete [] data;
    delete [] data_tb;
    delete [] out_frame;

    return EXIT_SUCCESS;
}