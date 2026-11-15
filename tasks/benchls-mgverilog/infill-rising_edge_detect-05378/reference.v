module mg_05378 (input io_in,output io_q,input clk,input resetn);
reg old_in; 
  assign io_q = (io_in && (! old_in)); 
  always @ (posedge clk or negedge resetn) begin 
  if (!resetn) begin 
  old_in <= 1'b0; 
  end else begin 
  old_in <= io_in; 
  end 
  end 
 endmodule