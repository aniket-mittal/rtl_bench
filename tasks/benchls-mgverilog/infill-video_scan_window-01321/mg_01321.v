module mg_01321(clk, ptop, pbot, x, y, scan);
parameter H = 0; 
  parameter X = 0; 
  input clk; 
  input [9:0] ptop; 
  input [9:0] pbot; 
  input [9:0] x; 
  input [9:0] y; 
  output scan; 
  reg [4:0] scanX; 
  reg scanY; 
  [MASKED] 
  always @(posedge clk) begin 
  if (y == ptop) 
  scanY = 1; 
  if (y >= pbot) 
  scanY = 0; 
  end 
  assign scan = scanX != 0 && scanY; 
 endmodule