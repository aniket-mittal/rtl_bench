module mg_09333 (Ax, Ay, Az, Bx, By, Bz, C, clk);
input[16 - 1:0] Ax; 
  input[16 - 1:0] Ay; 
  input[16 - 1:0] Az; 
  input[33 - 1:0] Bx; 
  input[33 - 1:0] By; 
  input[33 - 1:0] Bz; 
  output[16 + 33 + 1:0] C; 
  reg[16 + 33 + 1:0] C; 
  input clk; 
  reg[16 + 33 - 1:0] AxBx; 
  reg[16 + 33 - 1:0] AyBy; 
  reg[16 + 33 - 1:0] AzBz; 
  [MASKED] 
  endmodule