module mg_02360 (clk,rst,is_sticky,delay_valid,delay_cycles,pred_valid,pred_match,pred_index,act_input,act_output,act_index);
input clk; 
  input rst; 
  input is_sticky; 
  input pred_valid; 
  input pred_match; 
  input [15:0] pred_index; 
  input delay_valid; 
  input [3:0] delay_cycles; 
  input act_input; 
  output reg act_output; 
  output reg [15:0] act_index; 
  reg activated; 
  reg [3:0] delay_cycles_reg; 
  reg [2+15:0] delay_shift; 
  [MASKED] 
 endmodule