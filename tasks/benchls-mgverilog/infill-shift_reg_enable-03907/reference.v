module mg_03907(clk, en, in,out);
parameter integer LEN = 16; 
  input clk, en, in; 
  output out; 
  reg [LEN:1] store; 
  assign out = store & 1; 
  always @(posedge clk) 
  if (en) 
  store <= {in,store[LEN:2]}; 
 endmodule