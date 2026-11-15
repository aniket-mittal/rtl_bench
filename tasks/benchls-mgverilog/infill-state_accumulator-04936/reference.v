module mg_04936(clk, arst, a, b, c, d, e, f, out1);
input clk, arst, a, b, c, d, e, f; 
 output reg [3:0] out1; 
 always @(posedge clk, posedge arst) begin 
  if (arst) 
  out1 = 0; 
  else begin 
  if (a) begin 
  case ({b, c}) 
  2'b00: 
  out1 = out1 + 9; 
  2'b01, 2'b10: 
  out1 = out1 + 13; 
  endcase 
  if (d) begin 
  out1 = out1 + 2; 
  out1 = out1 + 1; 
  end 
  case ({e, f}) 
  2'b11: 
  out1 = out1 + 8; 
 2'b00:; 
  default: 
  out1 = out1 + 10; 
  endcase 
  out1 = out1 ^ 7; 
  end 
  out1 = out1 + 14; 
  end 
 end 
 endmodule