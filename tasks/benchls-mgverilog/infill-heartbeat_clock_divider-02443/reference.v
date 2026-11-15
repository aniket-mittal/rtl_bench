module mg_02443(input clk_i,input nreset_i,output heartbeat_o);
reg [26:0] cntr; 
 reg heartbeat; 
 assign heartbeat_o = heartbeat; 
 always @(posedge clk_i) 
 begin 
  if (!nreset_i) 
  begin 
  cntr = 0; 
  heartbeat = 0; 
  end else begin 
  cntr = cntr + 1'b1; 
  if( cntr == 27'd100000000 ) 
  begin 
  cntr = 0; 
  heartbeat = !heartbeat; 
  end 
  end 
 end 
 endmodule