module mg_02698(input clk, input reset,input io_out_ready,output io_out_valid,output io_out_bits_centeroidsFinished,output io_out_bits_pointsFinished,output[15:0] io_out_bits_centeroidIndex,output[63:0] io_out_bits_point_x,output[63:0] io_out_bits_point_y,output[63:0] io_out_bits_point_z,output[4:0] io_out_tag,output io_in_0_ready,input io_in_0_valid,input io_in_0_bits_centeroidsFinished,input io_in_0_bits_pointsFinished,input [15:0] io_in_0_bits_centeroidIndex,input [63:0] io_in_0_bits_point_x,input [63:0] io_in_0_bits_point_y,input [63:0] io_in_0_bits_point_z,input [4:0] io_in_0_tag,output io_chosen);
wire T0; 
  wire T1; 
  wire T2; 
  wire T3; 
  wire T4; 
  reg[0:0] last_grant; 
  wire T5; 
  wire T6; 
  wire T7; 
  wire[15:0] T8; 
  wire[15:0] dvec_0_centeroidIndex; 
  wire[4:0] T9; 
  wire[6:0] T10; 
  wire[6:0] tvec_0; 
  wire[6:0] T11; 
  assign io_out_valid = io_in_0_valid; 
  assign io_in_0_ready = T0; 
  assign T0 = T1 && io_out_ready; 
  assign T1 = T7 || T2; 
  assign T2 = ! T3; 
  assign T3 = io_in_0_valid && T4; 
  assign T4 = 1'h0 > last_grant; 
  assign T5 = io_out_valid && io_out_ready; 
  assign T6 = T5 ? 1'h0 : last_grant; 
  assign T7 = 1'h0 > last_grant; 
  assign io_out_bits_centeroidIndex = T8; 
  assign T8 = dvec_0_centeroidIndex & 16'hffff; 
  assign dvec_0_centeroidIndex = io_in_0_bits_centeroidIndex; 
  assign io_out_tag = T9; 
  assign T9 = T10[3'h4:1'h0]; 
  assign T10 = tvec_0 & 7'h7f; 
  assign tvec_0 = T11; 
  assign T11 = {2'h0, io_in_0_tag}; 
  always @(posedge clk) begin 
  if(reset) begin 
  last_grant <= 1'h0; 
  end else if(T5) begin 
  last_grant <= T6; 
  end 
  end 
 endmodule