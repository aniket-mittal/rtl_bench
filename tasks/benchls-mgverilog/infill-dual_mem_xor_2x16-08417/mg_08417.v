module mg_08417 (out0, out1,clk, wr0a, wr0b, wr1a, wr1b, inData);
input clk; 
  input wr0a; 
  input wr0b; 
  input wr1a; 
  input wr1b; 
  input [15:0] inData; 
  output [15:0] out0; 
  output [15:0] out1; 
  reg [15:0] mem [1:0]; 
  reg [15:0] memtemp2 [1:0]; 
  reg [15:0] memtemp3 [1:0]; 
  assign out0 = {mem[0] ^ memtemp2[0]}; 
  assign out1 = {mem[1] ^ memtemp3[1]}; 
  [MASKED] 
 endmodule