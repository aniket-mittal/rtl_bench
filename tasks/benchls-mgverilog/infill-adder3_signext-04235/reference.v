module mg_04235 (a,b,c,o);
parameter WIDTH=8; 
 parameter SIGN_EXT = 1'b0; 
 input [WIDTH-1:0] a,b,c; 
 output [WIDTH+1:0] o; 
 wire [WIDTH+1:0] o; 
 generate 
 if (!SIGN_EXT) 
  assign o = a+b+c; 
 else 
  assign o = {a[WIDTH-1],a[WIDTH-1],a} + 
  {b[WIDTH-1],b[WIDTH-1],b} + 
  {c[WIDTH-1],c[WIDTH-1],c}; 
 endgenerate 
 endmodule