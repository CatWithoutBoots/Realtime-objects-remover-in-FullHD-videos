`ifndef _GMM_STRUCTURES_SVH_
`define _GMM_STRUCTURES_SVH_

package gmm_structures;
    typedef struct packed {
		logic[2:0][7:0] color;
	} rgb_t;

	typedef struct packed {
		rgb_t rgb_mean;
		logic[5:0] rgb_std;
		logic[7:0] w;
	} cluster_t;

	typedef struct packed {
		logic[1:0] clusters_num;
		logic[5:0] chm;
		logic[5:0] u;
		cluster_t[2:0] cluster;
		rgb_t rgb_new;
		logic is_fg;
	} data_t; 

    typedef struct packed {
        data_t in;
		
        logic[2:0][15:0] mem_var;//[cluster_idx]
        logic[2:0][7:0] mem_w;//[cluster_idx]
        logic[2:0][2:0][7:0] mem_color;//[cluster_idx][color_idx]
		logic[2:0][19:0] vars;//[cluster_idx]

		logic[19:0] var_min, var_max;	
		logic[1:0] var_min_idx, var_max_idx;
    	logic is_matched;
		logic[1:0] p_max_idx;
		logic[1:0] B;
    } mega_data_t;

    typedef struct {
        logic ready, valid;
        mega_data_t data;
    } mega_bus_t;
endpackage : gmm_structures

`endif