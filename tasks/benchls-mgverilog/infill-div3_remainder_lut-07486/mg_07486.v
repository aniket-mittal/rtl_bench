module mg_07486(numer, quotient, remain);
input [5:0] numer; 
  output [2:0] quotient; 
  output [3:0] remain; 
  reg [2:0] quotient; 
  reg [3:0] remain_bit3_bit2; 
  assign remain = {remain_bit3_bit2, numer[1:0]}; 
  [MASKED] 
 endmodule