module mg_07431( _clk_, start_i, restart_i, t_expired_o);
input _clk_, start_i, restart_i; 
  output t_expired_o; 
  reg[3:0] contador = 4'b0; 
  localparam contador_max=7; 
  reg t_expired_o=0; 
  always @(posedge _clk_) begin 
  t_expired_o<=0; 
  if(restart_i) 
  contador <=0; 
  else begin 
  if (start_i) begin 
  if(contador==contador_max-1) begin 
  t_expired_o<=1'b1; 
  contador <=0; 
  end 
  else begin 
  contador <= contador+1; 
  end 
  end 
  end 
  end 
 endmodule