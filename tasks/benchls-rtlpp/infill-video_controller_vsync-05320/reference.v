module rtlpp_05320
  (input wire [21:0]  addr,
   input wire [31:0]  datain,
   input wire	      req,
   input wire	      write,
   output reg [31:0]  dataout,
   output wire	      ack,
   output wire	      decode,
   output wire	      interrupt,

   output wire [14:0] vram_addr,
   input wire [31:0]  vram_data_in,
   output wire [31:0] vram_data_out,
   input wire	      vram_done,
   input wire	      vram_ready,
   output wire	      vram_req,
   output wire	      vram_write,

   input wire	      clk,
   input wire	      reset);

   // Internal Signals
   reg		      clear_tv_int;
   reg		      set_tv_int;
   reg		      tv_int;
   reg		      tv_int_en;

   wire		      fb_read_req;
   wire		      fb_write_req;

   wire		      in_color;
   wire		      in_fb;
   wire		      in_reg;
   wire		      start_fb_read;
   wire		      start_fb_write;

   wire		      hz60_clk_fired;

   // Simplified internal hz60 module logic
   reg [24:0] hz_counter;

   always @(posedge clk) begin
     if (reset) begin
       hz_counter <= 25'b0;
     end else if (hz_counter == 25'd24999999) begin
       hz_counter <= 25'b0;
     end else begin
       hz_counter <= hz_counter + 1'b1;
     end
   end

   assign hz60_clk_fired = (hz_counter == 25'd24999999);

   // State Machine
   localparam
     IDLE = 3'd0,
     WRITE = 3'd1,
     READ = 3'd2,
     DONE = 3'd3;

   wire [2:0] state_ns;
   reg [2:0]  state;

   always @(posedge clk)
     if (reset)
       state <= IDLE;
     else
       state <= state_ns;

   assign state_ns =
		    (state == IDLE && start_fb_write) ? WRITE :
		    (state == IDLE && start_fb_read) ? READ :
		    (state == WRITE && vram_done) ? DONE :
		    (state == READ && vram_ready) ? DONE :
		    (state == DONE && ~req) ? IDLE :
		    state;

   assign fb_write_req = req && decode && write;
   assign fb_read_req  = req && decode && ~write;

   assign start_fb_write = fb_write_req && in_fb;
   assign start_fb_read  = fb_read_req  && in_fb;

   always @(posedge clk)
     if (reset) begin
	set_tv_int = 1'h0;
     end else begin
	set_tv_int = 0;

	if (hz60_clk_fired)
	  set_tv_int = 1;
     end

   always @(posedge clk)
     if (reset) begin
	tv_int <= 1'h0;
     end else if (set_tv_int) begin
	tv_int <= 1'b1;
     end else if (clear_tv_int) begin
	tv_int <= 1'b0;
     end

   assign in_fb    = {addr[21:15], 15'b0} == 22'o17000000;
   assign in_color = {addr[21:15], 15'b0} == 22'o17200000;
   assign in_reg   = {addr[21:3],   3'b0} == 22'o17377760;

   always @(posedge clk)
     if (reset) begin
	clear_tv_int = 1'h0;
	dataout <= 32'h0;
	tv_int_en <= 1'h0;
     end else begin
	clear_tv_int = 0;

	if (fb_write_req && in_reg) begin
	   tv_int_en <= datain[3];
	   if (datain[4])
	     clear_tv_int = 1;
	end else if (fb_read_req && in_reg) begin
	   dataout <= { 27'b0, tv_int, tv_int_en, 3'b0 };
	end else if (in_color) begin
	   dataout <= 32'h0;
	end else if (vram_ready) begin
	   dataout <= vram_data_in;
	end
     end

   assign ack = state == DONE;
   assign decode = in_reg || in_fb;
   assign interrupt = tv_int_en & tv_int;

   wire [14:0] offset;
   assign offset = addr[14:0];

   assign vram_addr     = offset;
   assign vram_data_out = datain;
   assign vram_req      = state == READ;
   assign vram_write    = state == WRITE;

endmodule