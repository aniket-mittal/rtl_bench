module mg_05434(collide, ball_y, paddle_y, deflect);
input collide; 
  input [9:0] ball_y; 
  input [9:0] paddle_y; 
  output reg[9:0] deflect; 
  always @(posedge collide) begin 
  deflect = ball_y - paddle_y; 
  if (deflect[9]) 
  deflect[8:0] = ~deflect[8:0] + 1; 
  end 
 endmodule