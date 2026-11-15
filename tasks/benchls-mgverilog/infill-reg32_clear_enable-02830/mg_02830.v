module mg_02830(datain, dataout, clk, clr, WE);
input [31:0] datain; 
  output [31:0] dataout; 
  input clk, clr, WE; 
  reg [31:0] register; 
 [MASKED] 
  assign dataout = register; 
 endmodule