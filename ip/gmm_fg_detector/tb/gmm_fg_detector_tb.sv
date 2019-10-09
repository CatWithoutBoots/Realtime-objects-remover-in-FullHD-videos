`timescale 1ps/1ps
module gmm_fg_detector_tb();
    // editable
    localparam logic[15:0] WIDTH = 16'd16;
    localparam logic[15:0] HEIGHT = 16'd9;
    localparam RANDOM_VALID = 1; 
    localparam RANDOM_READY = 1;
    // not editable
    localparam RANDOM_DATA_EN = 0; 

    // RGB888 data format
	typedef struct packed {
		logic[7:0] r, g, b;
	} rgb888_t;

	// Output data format
	typedef struct packed {
		logic is_fg; // It indices 1, if the new_pixel is foreground and 0 otherwise
		rgb888_t mem_pixel; // It's the a pixel from "mem" sequence
		rgb888_t new_pixel; // It's a pixel from "video" sequence
	} out_t;

    // Cluster data format, 
	typedef struct packed {
		logic[5:0] rgb_std; // Standart deviation of color's distribution
		logic[7:0] w; // Distribution's weight
		rgb888_t rgb_mean; // Mean color
	} cluster_t;

	// Memory data format
	typedef struct packed {
		logic[1:0] clusters_num; // 2 bits
		logic[5:0] chm; // A number of times when the pixel was foreground
		logic[5:0] u; // A number of times when the pixel was previously distribution
		cluster_t[2:0] cluster; // 96 bits
	} mem_t;

    class Video_t;
        time t;
        out_t data;
        logic sop, eop;

        function new(input out_t _data, input _sop, input _eop);
            t = $time();
            data = _data;
            sop = _sop;
            eop = _eop;
        endfunction : new

        function print(string name);
            $display("----%s----", name);
            $display("time: %0t", t);
            $display("\tis_fg: %0d", data.is_fg);
            $display("\tmem_pixel: %0h", data.mem_pixel);
            $display("\tnew_pixel: %0h", data.new_pixel);
        endfunction : print
    endclass : Video_t

    class Mem_t;
        time t;
        mem_t data;
        logic sop, eop;

        function new(input mem_t _data, input _sop, input _eop);
            t = $time();
            data = _data;
            sop = _sop;
            eop = _eop;
        endfunction : new

        function print(string name);
            $display("----%s----", name);
            $display("time: %0t", t);
            $display("\tclusters_num: %0d", data.clusters_num);
            $display("\tchm: %0d", data.chm);
            $display("\tu: %0d", data.u);
            for(int i = 0; i < 3; ++i) begin
                $display("\tcluster(%0d): w: %0d, std: %0d, rgb: %0u", i+1, data.cluster[i].w, data.cluster[i].rgb_std, data.cluster[i].rgb_mean);
            end
        endfunction : print
    endclass : Mem_t

    mailbox #(Video_t) in_video_mb = new(), out_video_mb = new();
    mailbox #(Mem_t) in_mem_mb = new(), out_mem_mb = new();

    logic clk = '0, rst = '0;

    logic cpu_write = '0, cpu_read = '0, cpu_cs = '0;
    logic[3:0] cpu_addr = '0;
    logic[31:0] cpu_writedata = '0, cpu_readdata;

    logic snk_video_valid = '0, snk_video_sop = '0, snk_video_eop = '0, snk_video_ready;
    logic[23:0] snk_video_data = '0;

    logic snk_mem_valid = '0, snk_mem_sop = '0, snk_mem_eop = '0, snk_mem_ready;
    mem_t snk_mem_data = '0;
    logic[3:0] snk_mem_empty = '0; // terminated

    logic src_video_valid, src_video_sop, src_video_eop, src_video_ready = '1;
    out_t src_video_data;

    logic src_mem_valid, src_mem_sop, src_mem_eop, src_mem_ready = '1;
    mem_t src_mem_data;
    logic[3:0] src_mem_empty; // terminated

    int in_video_cnt = 0, in_mem_cnt = 0;
    int out_video_cnt = 0, out_mem_cnt = 0;

    always #1 clk <= ~clk;

    always_ff @(posedge clk) if (RANDOM_READY) begin
        src_video_ready <= $urandom();
        src_mem_ready <= $urandom();
    end
        
    initial begin : main
        fork
            in_video_monitor();
            out_video_monitor();
            video_comparer();

            in_mem_monitor();
            out_mem_monitor();
            mem_comparer();
        join_none

        reset();

        for (int i = 0; i < 1000; ++i) #1000 fork
            begin
                video_control_gen(HEIGHT, WIDTH);
                video_gen(HEIGHT, WIDTH);
            end
            begin
                mem_control_gen(HEIGHT, WIDTH);
                mem_gen(HEIGHT, WIDTH);
            end
        join

        #1000 $display("in_video_cnt: %0d, out_video_cnt: %0d", in_video_cnt, out_video_cnt);
        $display("in_mem_cnt: %0d, out_mem_cnt: %0d", in_mem_cnt, out_mem_cnt);
        #1000 $stop();
    end : main

    task mem_comparer();
        Mem_t in, out;
        forever @(negedge clk) begin
            if (in_mem_mb.num() > 0 && out_mem_mb.num() > 0) begin
                in_mem_mb.get(in);
                out_mem_mb.get(out);

                if (in.data != out.data) begin
                    $display("[%0t] MEM Error", $time());
                    in.print("input");
                    out.print("output");
                end
                else begin
                    //$display("[%0t] MEM Info in[%0t]: %0h == %0h :out[%0t]", $time(), in.t, in.data, out.data, out.t);
                    //in.print("input");
                    //out.print("output");
                end
            end
        end
    endtask : mem_comparer

    task video_comparer();
        Video_t in, out;
        forever @(negedge clk) begin
            if (in_video_mb.num() > 0 && out_video_mb.num() > 0) begin
                in_video_mb.get(in);
                out_video_mb.get(out);

                if (in.data != out.data) begin
                    $display("[%0t] VID Error in[%0t]: %0h != %0h :out[%0t]", $time(), in.t, in.data, out.data, out.t);
                    in.print("input");
                    out.print("output");
                end
                else begin
                    //$display("[%0t] VID Info in[%0t]: %0h == %0h :out[%0t]", $time(), in.t, in.data, out.data, out.t);
                    //in.print("input");
                    //out.print("output");
                end
            end
        end
    endtask : video_comparer

    task out_mem_monitor();
        Mem_t data;
        forever @(negedge clk) begin
            if (src_mem_valid && src_mem_ready) begin
                ++out_mem_cnt;
                data = new(src_mem_data, src_mem_sop, src_mem_eop);
                out_mem_mb.put(data);
            end
        end
    endtask : out_mem_monitor

    task in_mem_monitor();
        Mem_t data;
        mem_t mem_data;
        logic mem_sop;
        bit is_video;
        bit is_first_frame;
        int cnt;

        is_video = '0;
        is_first_frame = '1;
        cnt = 0;

        forever @(negedge clk) begin
            if (snk_mem_valid && snk_mem_ready) begin
                ++in_mem_cnt;
                if (snk_mem_sop && (4'h0 == snk_mem_data[3:0]))
                    is_video = '1;

                if (is_first_frame && is_video && !snk_mem_sop) begin 
                    mem_data.u = '0;
                    mem_data.chm = '0;
                    mem_data.clusters_num = 8'd1;
                    for (int i = 0; i < 3; ++i) begin
                        mem_data.cluster[i].w = 8'd3;
                        mem_data.cluster[i].rgb_std = 8'd17;
                        mem_data.cluster[i].rgb_mean = cnt;
                    end
                    cnt = cnt + 1;
                end
                else
                    mem_data = snk_mem_data;

                data = new(mem_data, snk_mem_sop, snk_mem_eop);
                in_mem_mb.put(data);

                if (snk_mem_eop && is_video)
                    is_first_frame = '0;
                if (snk_mem_eop)
                    is_video = '0;
            end
        end
    endtask : in_mem_monitor

    task out_video_monitor();
        Video_t data;
        forever @(negedge clk) begin
            if (src_video_valid && src_video_ready) begin
                ++out_video_cnt;
                data = new(src_video_data, src_video_sop, src_video_eop);
                out_video_mb.put(data);
            end
        end
    endtask : out_video_monitor

    task in_video_monitor();
        Video_t data;
        Mem_t mem_obj;
        mem_t mem_data;
        bit is_video;
        is_video = '0;

        forever @(negedge clk) begin
            if (snk_video_valid && snk_video_ready) begin
                ++in_video_cnt;
                if (snk_video_sop && (24'b0 == snk_video_data))
                    is_video = '1;
                else if (snk_video_sop && (24'h00000F == snk_video_data))
                    is_video = '0;

                if (is_video) begin // video_packet
                    if (snk_video_sop) begin // first video word
                        // video control
                        data = new({25'b0, snk_video_data}, snk_video_sop, snk_video_eop);
                        in_video_mb.put(data);
                    end
                    else begin
                        /*if (!(snk_mem_valid && snk_mem_ready))
                            $error("video and mem is bad");*/

                        mem_data = snk_mem_data;
                        data = new({1'b0, snk_video_data, snk_video_data}, snk_video_sop, snk_video_eop);
                        in_video_mb.put(data); 
                    end
                end
                else begin // control packet
                    data = new({25'b0, snk_video_data}, snk_video_sop, snk_video_eop);
                    in_video_mb.put(data);
                end
            end
        end
    endtask : in_video_monitor

    task video_control_gen(input[15:0] height, width);
        logic valid;
        @(posedge clk);

        for (int i = 0; i < 4; ) begin
            valid = RANDOM_VALID ? $urandom() : '1;
            if (snk_video_ready)
                snk_video_valid <= '0;

            if (valid) begin
                snk_video_valid <= '1;
                snk_video_data <= '0;
                snk_video_sop <= '0;
                snk_video_eop <= '0;

                case(i)
                0: begin
                    snk_video_data[3:0] <= 4'hF;
                    snk_video_sop <= '1;
                end
                1: begin
                    snk_video_data[3:0] <= width[15:12];
                    snk_video_data[11:8] <= width[11:8];
                    snk_video_data[19:16] <= width[7:4];
                end
                2: begin
                    snk_video_data[3:0] <= width[3:0];
                    snk_video_data[11:8] <= height[15:12];
                    snk_video_data[19:16] <= height[11:8];
                end
                3: begin
                    snk_video_data[3:0] <= height[7:4];
                    snk_video_data[11:8] <= height[3:0];
                    snk_video_data[19:16] <= 4'h3;
                    snk_video_eop <= '1;
                end
                endcase

                ++i;

                @(posedge clk);
                while(snk_video_valid && !snk_video_ready)
                    @(posedge clk);
            end
            else begin
                @(posedge clk);
            end
        end

        snk_video_valid <= '0;
        @(posedge clk);
        while(snk_video_valid && !snk_video_ready)
                @(posedge clk);
    endtask : video_control_gen

    task mem_control_gen(input[15:0] height, width);
        logic valid;
        @(posedge clk);

        for (int i = 0; i < 2; ) begin
            valid = RANDOM_VALID ? $urandom() : '1;
            if (snk_mem_ready)
                snk_mem_valid <= '0;
            
            if (valid) begin
                snk_mem_valid <= '1;
                snk_mem_data <= '0;
                snk_mem_sop <= '0;
                snk_mem_eop <= '0;

                case(i)
                0: begin
                    snk_mem_data[3:0] <= 4'hF;
                    snk_mem_sop <= '1;
                end
                1: begin
                    snk_mem_data[3:0] <= width[15:12];
                    snk_mem_data[11:8] <= width[11:8];
                    snk_mem_data[19:16] <= width[7:4];
                    snk_mem_data[27:24] <= width[3:0];
                    snk_mem_data[35:32] <= height[15:12];
                    snk_mem_data[43:40] <= height[11:8];
                    snk_mem_data[51:48] <= height[7:4];
                    snk_mem_data[59:56] <= height[3:0];
                    snk_mem_data[67:64] <= 4'h3;
                    snk_mem_eop <= '1;
                end
                endcase

                ++i;

                @(posedge clk);
                while(snk_mem_valid && !snk_mem_ready)
                    @(posedge clk);
            end
            else begin
                @(posedge clk);
            end
        end

        snk_mem_valid <= '0;
        @(posedge clk);
        while(snk_mem_valid && !snk_mem_ready)
            @(posedge clk);
    endtask : mem_control_gen

    task video_gen(input[15:0] width, height);
        logic valid;
        int n;
        n = width * height + 1; 
        @(posedge clk);

        for (int i = 0; i < n; ) begin
            valid = RANDOM_VALID ? $urandom() : '1;
            if (snk_video_ready)
                snk_video_valid <= '0;
            
            if (valid) begin
                snk_video_valid <= '1;
                snk_video_data <= '0;
                snk_video_sop <= '0;
                snk_video_eop <= '0;

                if (0 == i)
                    snk_video_sop <= '1;
                if (n == i + 1)
                    snk_video_eop <= '1;

                if (0 == i)
                    snk_video_data <= '0;
                else if (RANDOM_DATA_EN)
                    snk_video_data <= $urandom();
                else 
                    snk_video_data <= (i-1);

                ++i;

                @(posedge clk);
                while(snk_video_valid && !snk_video_ready)
                    @(posedge clk);
            end
            else begin
                @(posedge clk);
            end
        end

        snk_video_valid <= '0;
        @(posedge clk);
        while(snk_video_valid && !snk_video_ready)
                @(posedge clk);
    endtask : video_gen

    task mem_gen(input[15:0] width, height);
        logic valid;
        int n;
        n = width * height + 1;
        @(posedge clk);

        for (int i = 0; i < n; ) begin
            valid = RANDOM_VALID ? $urandom() : '1;
            if (snk_mem_ready)
                snk_mem_valid <= '0;

            if (valid) begin
                snk_mem_valid <= '1;
                snk_mem_data <= '0;
                snk_mem_sop <= '0;
                snk_mem_eop <= '0;

                if (0 == i)
                    snk_mem_sop <= '1;
                if (n == i + 1)
                    snk_mem_eop <= '1;

                if (0 == i)
                    snk_mem_data <= '0;
                else if (RANDOM_DATA_EN)
                    snk_mem_data <= {$urandom(), $urandom(), $urandom(), $urandom()};
                else begin
                    snk_mem_data.clusters_num <= 1 + $urandom() % 2;
                    snk_mem_data.u <= $urandom();
                    snk_mem_data.chm <= $urandom();
                    for (int k = 1; k <= 2; ++k) begin
                        snk_mem_data.cluster[k].w <= $urandom();
                        snk_mem_data.cluster[k].rgb_mean <= $urandom();
                        snk_mem_data.cluster[k].rgb_std <= $urandom();
                    end
                    snk_mem_data.cluster[0].w <= $urandom();
                    snk_mem_data.cluster[0].rgb_std <= $urandom();
                    snk_mem_data.cluster[0].rgb_mean <= (i-1);
                end

                ++i;

                @(posedge clk);
                while (snk_mem_valid && !snk_mem_ready)
                    @(posedge clk);
            end
            else begin
                @(posedge clk);
            end
        end

        snk_mem_valid <= '0;
        @(posedge clk);
        while (snk_mem_valid && !snk_mem_ready)
            @(posedge clk);
    endtask : mem_gen

    task reset();
        rst = '1;
        @(posedge clk);
        rst = '0;
        @(posedge clk);
        rst = '0;
    endtask : reset

    gmm_fg_detector u0( 
        .*
    );
endmodule : gmm_fg_detector_tb