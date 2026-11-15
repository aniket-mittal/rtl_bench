module mg_07431( _clk_, start_i, restart_i, t_expired_o);
input _clk_, start_i, restart_i; 
  output t_expired_o; 
  reg[3:0] contador = 4'b0; 
  localparam contador_max=7; 
  reg t_expired_o=0; 
  [MASKED] 
 endmodule