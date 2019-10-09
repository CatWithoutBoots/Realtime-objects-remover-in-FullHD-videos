// Packet: follow video packet of "Avalon-ST Video Protocol" defined VIP spec.



module TERASIC_CAMERA(
	clk,
	reset_n,
	
	// streaming source interface
	st_data,
	st_valid,
	st_sop,
	st_eop,
	st_ready,



	// export
	CAMERA_D,
	CAMERA_FVAL,
	CAMERA_LVAL,
	CAMERA_PIXCLK
	
);



input		clk;
input 	reset_n;


output	  [23:0]	st_data;
output				st_valid;
output				st_sop;
output		 		st_eop;
input				st_ready;



input		      [11:0]		CAMERA_D;
input		            		CAMERA_FVAL;
input		            		CAMERA_LVAL;
input		            		CAMERA_PIXCLK;

////////////////////////////////////////////////
/*  ##lou mod
parameter VIDEO_W	= 800;
parameter VIDEO_H	= 600;
*/

//parameter VIDEO_W	= 1280;
//parameter VIDEO_H	= 720;
parameter VIDEO_W	= 1920;
parameter VIDEO_H	= 1080;

//`define VIDEO_PIX_NUM	(VIDEO_W * VIDEO_H)

////////////////////////////////////////////////




wire [11:0] RGB_R,RGB_G, RGB_B;
wire [11:0] RGB_X,RGB_Y;
wire		RGB_VALID;

CAMERA_RGB CAMERA_RGB_inst( 
	.reset_n(reset_n),
	
	// Bayer Input
	.CAMERA_D(CAMERA_D),
	.CAMERA_FVAL(CAMERA_FVAL),
	.CAMERA_LVAL(CAMERA_LVAL),
	.CAMERA_PIXCLK(CAMERA_PIXCLK),
	
	// RGB Output
	.RGB_R(RGB_R),
	.RGB_G(RGB_G),
	.RGB_B(RGB_B),
	.RGB_X(RGB_X),
	.RGB_Y(RGB_Y),
	.RGB_VALID(RGB_VALID)
	
);		

defparam CAMERA_RGB_inst.VIDEO_W = VIDEO_W;		
defparam CAMERA_RGB_inst.VIDEO_H = VIDEO_H;
							


/////////////////////////////
// write rgb to fifo

reg [25:0]	 fifo_w_data;  // 1-bit sop + 1-bit eop + 24-bits data
wire fifo_w_full;
wire sop;
wire eop;
wire in_active_area;

assign sop = (RGB_X == 0 && RGB_Y == 0)?1'b1:1'b0;
assign eop = (((RGB_X+1) == VIDEO_W) && ((RGB_Y+1) == VIDEO_H))?1'b1:1'b0;

assign in_active_area = ((RGB_X < VIDEO_W) && (RGB_Y < VIDEO_H))?1'b1:1'b0;

reg fifo_w_write;
always @ (posedge CAMERA_PIXCLK or negedge reset_n)
begin
	if (~reset_n)
	begin
		fifo_w_write <= 1'b0;
		//push_fail <= 1'b0;
	end
	else if (RGB_VALID & in_active_area)
	begin
		if (!fifo_w_full)
		begin
	      fifo_w_data <= {sop,eop, RGB_B[11:4], RGB_G[11:4], RGB_R[11:4]};
			fifo_w_write <= 1'b1;
		end
		else
		begin
			fifo_w_write <= 1'b0;
		//	push_fail <= 1'b1; // fifo full !!!!!
		end
	end
	else
		fifo_w_write <= 1'b0;
end



/////////////////////////////
// read from fifo
wire 		fifo_r_empty;
wire [25:0] fifo_r_q;		
wire 		fifo_r_rdreq_ack;





/////////////////////////////
// FIFO
rgb_fifo rgb_fifo_inst(
	// write
	.data(fifo_w_data),
	.wrclk(CAMERA_PIXCLK),
	.wrreq(fifo_w_write),
	.wrfull(fifo_w_full),
	
	// read
	.rdclk(clk),
	.rdreq(fifo_r_rdreq_ack),
	.q(fifo_r_q),
	.rdempty(fifo_r_empty),
	//
	.aclr(~reset_n)
	
	);	
	
	

///////////////////////////////
wire frame_start /* synthesis keep */;
assign frame_start = fifo_r_q[25] & ~fifo_r_empty;
 
//reg first_pix; 
//always @ (posedge clk or negedge reset_n)
//begin
//	if (~reset_n)
//		first_pix <= 1'b0;
//	else //if (in_send_data)
//	begin
//		if (send_packet_id & st_valid)
//			first_pix <= 1'b1;
//		else
//			first_pix <= 1'b0;
//	end
//end	
//
//wire send_packet_id /* synthesis keep */;
//assign send_packet_id = in_send_data & frame_start & ~first_pix;

/////////////////////////////
// flag for ready_latency=1
reg pre_ready;
always @ (posedge clk or negedge reset_n)
begin
	if (~reset_n)
		pre_ready <= 0;
	else
		pre_ready <= st_ready;
end

//reg [31:0] count;
////debug
//always @ (posedge clk or negedge reset_n)
//begin
//  if(~reset_n)
//    count <= 0;
//  else if(fifo_r_rdreq_ack)
//  begin
//    count <= count + 1;
//  end
//  else if(st_sop)
//    count <= 0;
//  //else if(count == VIDEO_W*VIDEO_H)
//    //count[24] = 1'b1;
//  //else
//    //count <= count;
//  
//  
//end

////////////////////////////////////
//assign {st_sop, st_eop, st_data} = (in_send_data || in_wait_frame_start)?(send_packet_id)?{1'b1,1'b0, 24'h000000}:{1'b0,fifo_r_q[24:0]}:control_data;
wire [25:0] video_data;
assign video_data = (send_data_packet_id)?{1'b1,1'b0, 24'h000000}:{1'b0, fifo_r_q[24:0]};


assign {st_sop, st_eop, st_data} =  (in_wait_frame_start)?(fifo_r_q[25:0]): ((in_send_data?video_data:control_data));

//assign {st_sop, st_eop, st_data} = (send_packet_id)?{1'b1,1'b0, 24'h000000}:{1'b0, count};
//assign st_valid = (in_wait_frame_start | in_send_data)?(~fifo_r_empty & pre_ready):(in_send_control & pre_ready); 
assign st_valid = pre_ready & ((in_wait_frame_start)?( ~fifo_r_empty & ~fifo_r_q[25]):((in_send_data)?(send_data_packet_id | ~fifo_r_empty):(in_send_control))); 
assign fifo_r_rdreq_ack = (in_wait_frame_start | (in_send_data & ~send_data_packet_id)) & st_valid;


////////////////////////////////////
////////////////////////////////////
// Packet Type State Control
////////////////////////////////////
////////////////////////////////////


`define ST_WAIT_FRAME_START  	2'h0
`define ST_SEND_CONTROL_PKT	2'h1
`define ST_SEND_DATA_PKT		2'h2

wire 			in_wait_frame_start /* synthesis keep */;
wire 			in_send_control /* synthesis keep */;
wire 			in_send_data /* synthesis keep */;
reg [1:0]	state /*synthesis noprune*/;
reg [2:0] 	control_index /*synthesis noprune*/;

reg			send_data_packet_id/*synthesis noprune*/;
reg [31:0]	pixel_cnt/*synthesis noprune*/;
reg [31:0]	frame_cnt/*synthesis noprune*/;

assign in_wait_frame_start = (state == `ST_WAIT_FRAME_START)?1'b1:1'b0;
assign in_send_control = (state == `ST_SEND_CONTROL_PKT)?1'b1:1'b0;
assign in_send_data = (state == `ST_SEND_DATA_PKT)?1'b1:1'b0;

always @ (posedge clk or negedge reset_n)
begin
	if (~reset_n)
	begin
		state <= `ST_WAIT_FRAME_START;
		frame_cnt <= 0;
	end
	
	//
	else if (in_wait_frame_start)
	begin
		if (frame_start)
		begin
			state <= `ST_SEND_CONTROL_PKT;
			control_index <= 0;
		end
			
	end
	
	//
	else if (in_send_control)
	begin
		if (st_valid)
		begin		
			if (control_index == 3)
			begin
				state <= `ST_SEND_DATA_PKT;
				send_data_packet_id <= 1'b1;
				pixel_cnt <= 0;
			end
			else
				control_index <= control_index + 1;
		end
	end
	
	//
	else if (in_send_data)
	begin
		if (send_data_packet_id)
			send_data_packet_id <= ~st_valid;
		else
		begin
			if (st_valid)
				pixel_cnt <= pixel_cnt + 1;
			if ((st_eop & st_valid) | (frame_start && (pixel_cnt > 0)))// last video pixel is send or new frame start is find
				state <= `ST_WAIT_FRAME_START;
			if (st_eop & st_valid & ((pixel_cnt+1) == (VIDEO_W*VIDEO_H)))
				frame_cnt <= frame_cnt + 1;
		end
	end
	
		
end




///////////////////////////
// prepare control data

wire [15:0] 	width;
wire [15:0] 	height;
wire [3:0]		interlacing;
reg  [25:0]  	control_data;

assign width  = VIDEO_W;
assign height = VIDEO_H;
assign interlacing = 4'h03 /* progress */; //  10 for unknown or 11 for not deinterlaced, 00 for F0 last, and 01 for F1 last.

always @ (*)
begin
	if (in_send_control)
	begin
		case(control_index) // sop, eop, 8-bit, 8-bit, 8-bit = 26 bits
			0: control_data <= {1'b1, 1'b0, 8'h0, 8'h0, 8'd15};
			1: control_data <= {1'b0, 1'b0, {4'h0,width[7:4]},   {4'h0,width[11:8]},   {4'h0,width[15:12]}};
			2: control_data <= {1'b0, 1'b0, {4'h0,height[11:8]}, {4'h0,height[15:12]}, {4'h0,width[3:0]}};
			3: control_data <= {1'b0, 1'b1, {4'h0, interlacing[3:0]}, {4'h0,height[3:0]}, {4'h0,height[7:4]}};
		endcase
	end
		
end


endmodule
