module mg_01939 (x, y);
input [31:0] x; 
  output [31:0] y; 
  assign y = {x[1:0],x[31:2]} ^ {x[12:0],x[31:13]} ^ {x[21:0],x[31:22]}; 
 endmodule