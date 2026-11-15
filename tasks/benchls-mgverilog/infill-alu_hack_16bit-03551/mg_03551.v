module mg_03551 (input [15:0] x,input [15:0] y,input zx, nx, zy, ny, f, no,output [15:0] out,output zr,output ng);
reg [15:0] r_x_a; 
  reg [15:0] r_x; 
  reg [15:0] r_y_a; 
  reg [15:0] r_y; 
  reg [15:0] r_out = 16'b0; 
  reg r_zr; 
  reg r_ng; 
  [MASKED] 
  assign out = r_out; 
  assign zr = r_zr; 
  assign ng = r_ng; 
 endmodule