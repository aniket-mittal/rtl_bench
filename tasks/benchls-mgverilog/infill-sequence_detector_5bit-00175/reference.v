module mg_00175(input rst_n,input clk,input clken,input d,output valid);
reg[4:0] r; 
 reg[4:0] next; 
 wire top = r[4]; 
 assign valid = (next == 5'b01100); 
 always @(*) begin 
  if (top == d) 
  next = { r[3], r[2], r[1], r[0], 1'b0 }; 
  else 
  next = { r[3], r[2], !r[1], r[0], 1'b1 }; 
 end 
 always @(posedge clk or negedge rst_n) begin 
  if (!rst_n) begin 
  r <= 5'b11111; 
  end else if (clken) begin 
  r <= next; 
  end 
 end 
 endmodule