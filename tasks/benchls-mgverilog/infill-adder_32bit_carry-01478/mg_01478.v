module mg_01478 (dataa, datab, overflow, result);
input [31:0] dataa; 
  input [31:0] datab; 
  output overflow; 
  output [31:0] result; 
  wire [32:0]computation; 
  assign computation = dataa + datab; 
  [MASKED] 
  assign result = computation[31:0]; 
 endmodule