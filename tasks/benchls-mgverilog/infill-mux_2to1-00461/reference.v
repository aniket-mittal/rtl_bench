module mg_00461(in, s, out);
input wire[1: 0] in; 
  input wire s; 
  output wire out; 
  assign out = s == 1'b0 ? in[0] : s == 1'b1 ? in[1] : 1'b0; 
 endmodule