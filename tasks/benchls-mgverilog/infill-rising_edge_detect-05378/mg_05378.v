module mg_05378 (input io_in,output io_q,input clk,input resetn);
reg old_in; 
  assign io_q = (io_in && (! old_in)); 
  [MASKED] 
 endmodule