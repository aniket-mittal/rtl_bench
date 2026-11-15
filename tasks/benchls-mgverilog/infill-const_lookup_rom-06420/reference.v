module mg_06420(o1, o2, o3, o4, o5, o6, o7, o8, o9, yay1, nay1, yay2, nay2);
output wire [3:0] o1, o2, o3, o4, o5, o6, o7, o8, o9; 
  assign o1 = 4'b0001; 
  assign o2 = 4'b0001; 
  assign o3 = 4'b1111; 
  assign o4 = 4'b1111; 
  assign o5 = 4'b1110; 
  assign o6 = 4'b1100; 
  assign o7 = 4'b1100; 
  assign o8 = 4'b1101; 
  assign o9 = 4'b1111; 
  output wire [2:0] yay1, nay1; 
  assign yay1 = 3'b111; 
  assign nay1 = 3'b001; 
  output wire [2:0] yay2, nay2; 
  assign yay2 = 3'b110; 
  assign nay2 = 3'b010; 
 endmodule