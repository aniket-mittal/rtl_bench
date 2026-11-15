module mg_03114(clk, D, Q);
input clk, D; 
  output Q; 
  reg Q; 
  always @(posedge clk) begin 
  Q <= D; 
  end 
 endmodule