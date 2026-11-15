module mg_02900 (input rst,input tx_clk,input tx_pause_en,input [15:0] pause_quanta,input pause_quanta_val,output pause_apply,input paused);
reg [15+6:0] pause_quanta_counter; 
  reg pqval_d1, pqval_d2; 
  always @(posedge tx_clk) pqval_d1 <= pause_quanta_val; 
  always @(posedge tx_clk) pqval_d2 <= pqval_d1; 
  always @ (posedge tx_clk or posedge rst) 
  if (rst) 
  pause_quanta_counter <= 0; 
  else if (pqval_d1 & ~pqval_d2) 
  pause_quanta_counter <= {pause_quanta, 6'b0}; 
  else if((pause_quanta_counter!=0) & paused) 
  pause_quanta_counter <= pause_quanta_counter - 1; 
  assign pause_apply = tx_pause_en & (pause_quanta_counter != 0); 
 endmodule