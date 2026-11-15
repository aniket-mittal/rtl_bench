module mg_05106 (input wire CLK, input wire nRST,input wire request$say__ENA,input wire [31:0]request$say$v,output wire request$say__RDY,output wire indication$heard__ENA,output wire [31:0]indication$heard$v,input wire indication$heard__RDY);
reg busy; 
  reg [1:0]busy_delay; 
  reg [31:0]v_delay; 
  reg [31:0]v_temp; 
  wire RULE$delay_rule__ENA; 
  wire RULE$delay_rule__RDY; 
  assign indication$heard$v = v_delay; 
  assign indication$heard__ENA = busy_delay == 2'd2; 
  assign request$say__RDY = !busy; 
  assign RULE$delay_rule__ENA = ( busy && ( busy_delay == 2'd0 ) ) != 0; 
  assign RULE$delay_rule__RDY = ( busy && ( busy_delay == 2'd0 ) ) != 0; 
  [MASKED] 
 endmodule