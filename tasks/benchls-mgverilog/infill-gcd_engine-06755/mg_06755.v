module mg_06755 (input wire CLK, input wire nRST,input wire request$say__ENA,input wire [31:0]request$say$va,input wire [31:0]request$say$vb,output wire request$say__RDY,output wire indication$gcd__ENA,output wire [31:0]indication$gcd$v,input wire indication$gcd__RDY);
reg [31:0]a; 
  reg [31:0]b; 
  reg running; 
  wire RULE$respond_rule__ENA; 
  wire RULE$respond_rule__RDY; 
  assign indication$gcd$v = a; 
  assign indication$gcd__ENA = running & ( b == 32'd0 ); 
  assign request$say__RDY = !running; 
  assign RULE$respond_rule__ENA = ( b != 32'd0 ) | indication$gcd__RDY | ( !running ); 
  assign RULE$respond_rule__RDY = ( b != 32'd0 ) | indication$gcd__RDY | ( !running ); 
  [MASKED] 
 endmodule