module mg_04570(clock, resetn, dataa, datab, valid_in, valid_out, stall_in, stall_out, result);
input clock, resetn; 
  input [63:0] dataa; 
  input [31:0] datab; 
  input valid_in, stall_in; 
  output valid_out, stall_out; 
  output [63:0] result; 
  wire [10:0] exponent_in = dataa[62:52]; 
  wire [51:0] mantissa_in = dataa[51:0]; 
  wire sign_in = dataa[63]; 
  wire [31:0] shift_in = datab; 
  wire [31:0] intermediate_exp = shift_in + {1'b0, exponent_in}; 
  reg [10:0] exp_stage_1; 
  reg [51:0] man_stage_1; 
  reg sign_stage_1; 
  reg stage_1_valid; 
  wire enable_stage_1; 
  [MASKED] 
  assign enable_stage_1 = ~stage_1_valid | ~stall_in; 
  assign valid_out = stage_1_valid; 
  assign stall_out = stage_1_valid & stall_in; 
  assign result = {sign_stage_1, exp_stage_1, man_stage_1}; 
 endmodule