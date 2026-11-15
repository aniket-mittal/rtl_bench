module mg_10566 (clk,signal_i,signal_o);
input clk; 
 input signal_i; 
 output signal_o; 
 parameter COUNT = 15; 
 parameter s_idle = 1'b0; 
 parameter s_out = 1'b1; 
 reg[15:0] cnt = 0; 
 reg state = 0; 
 [MASKED] 
 assign signal_o = (state == s_out); 
 endmodule