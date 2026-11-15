module mg_10355(clk,reset,gmii_rxen,gmii_txen,r_act_sfp);
input clk; 
 input reset; 
 input gmii_rxen; 
 input gmii_txen; 
 output r_act_sfp; 
 reg [23:0] count_led; 
 reg r_act_sfp; 
 reg [1:0]current_state; 
 parameter idle=2'b0, 
  first =2'b01, 
  second=2'b10; 
 [MASKED] 
  endmodule