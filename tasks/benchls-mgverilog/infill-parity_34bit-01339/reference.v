module mg_01339 (out,in);
input [33:0] in; 
  output out; 
  assign out = (^in[33:0]); 
 endmodule