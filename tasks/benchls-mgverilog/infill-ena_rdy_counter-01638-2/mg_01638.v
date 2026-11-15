module mg_01638 (input wire CLK, input wire nRST,input wire request$say__ENA,input wire [31:0]request$say$va,output wire request$say__RDY);
reg [31:0]a; 
  reg [31:0]offset; 
  reg [31:0]outA; 
  reg [31:0]outB; 
  reg running; 
  assign request$say__RDY = !running; 
  [MASKED] 
 endmodule