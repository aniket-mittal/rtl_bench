module mg_03974(reset,quadA,quadB,count);
input reset, quadA, quadB; 
  output [7:0] count; 
  reg [3:0] combined; 
  reg [7:0] total; 
  reg [2:0] num; 
  [MASKED] 
  assign count = total; 
 endmodule