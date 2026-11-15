module mg_04047 (in0, in1, in2, in3, d0, d1, d2, d3,out0, out1, out2, out3, clk, reset);
output out0, out1, out2, out3; 
  input in0, in1, in2, in3; 
  input d0, d1, d2, d3; 
  input clk, reset; 
  reg w0, w1, w2, w3; 
  reg out0, out1, out2, out3; 
  always @ (d0 or d1 or d2 or d3 or in0 or in1 or in2 or in3) 
  begin 
  w0 <= d0?in1:in0; 
  w1 <= d1?in3:in2; 
  w2 <= d2?in1:in0; 
  w3 <= d3?in3:in2; 
  end 
  [MASKED] 
 endmodule