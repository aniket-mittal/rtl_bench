module mg_00609( clock, resetn, enable, valid_in, valid_out, stall_in, stall_out, dataa, result_fr, result_exp);
parameter WIDTH = 32; 
  parameter HIGH_CAPACITY = 1; 
  input clock, resetn; 
  input enable, valid_in, stall_in; 
  output valid_out, stall_out; 
  input [WIDTH-1:0] dataa; 
  output [WIDTH-1:0] result_fr; 
  output [31:0] result_exp; 
  reg c1_valid; 
  wire c1_stall; 
  wire c1_enable = (HIGH_CAPACITY == 1) ? (~c1_valid | ~c1_stall) : enable; 
  assign stall_out = c1_valid & c1_stall; 
  reg [WIDTH-1:0] c1_fraction; 
  reg [31:0] c1_exponent; 
  [MASKED] 
  assign c1_stall = stall_in; 
  assign valid_out = c1_valid; 
  assign result_fr = c1_fraction; 
  assign result_exp = c1_exponent; 
 endmodule