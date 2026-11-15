module mg_04544(clk_vga, CurrentX, CurrentY, mapData, wall);
input clk_vga; 
  input [9:0]CurrentX; 
  input [8:0]CurrentY; 
  input [7:0]wall; 
  output [7:0]mapData; 
  reg [7:0]mColor; 
  [MASKED] 
  assign mapData = mColor; 
 endmodule