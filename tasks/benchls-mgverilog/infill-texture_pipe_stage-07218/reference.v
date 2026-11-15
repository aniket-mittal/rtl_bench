module mg_07218(input sys_clk,input sys_rst,output busy,input pipe_stb_i,output pipe_ack_o,input signed [11:0] dx,input signed [11:0] dy,input signed [17:0] tx,input signed [17:0] ty,input [17:0] tex_hmask,input [17:0] tex_vmask,output reg pipe_stb_o,input pipe_ack_i,output reg signed [11:0] dx_f,output reg signed [11:0] dy_f,output reg signed [17:0] tx_m,output reg signed [17:0] ty_m);
always @(posedge sys_clk) begin 
  if(sys_rst) 
  pipe_stb_o <= 1'b0; 
  else begin 
  if(pipe_ack_i) 
  pipe_stb_o <= 1'b0; 
  if(pipe_stb_i & pipe_ack_o) begin 
  pipe_stb_o <= 1'b1; 
  dx_f <= dx; 
  dy_f <= dy; 
  tx_m <= tx & tex_hmask; 
  ty_m <= ty & tex_vmask; 
  end 
  end 
 end 
 assign pipe_ack_o = ~pipe_stb_o | pipe_ack_i; 
 assign busy = pipe_stb_o; 
 endmodule