module mg_05795 (SSLED, LEDSEL, inClk, reset);
output reg [6:0] SSLED; 
  output reg [3:0] LEDSEL; 
  input inClk, reset; 
  always @(posedge inClk or posedge reset) begin 
  if (reset) begin 
  SSLED = 7'b1110111; 
  LEDSEL = 3'b0111; 
  end 
  else begin 
  case (SSLED) 
  7'b0111111: SSLED = 7'b1111101; 
  7'b1111101: SSLED = 7'b1111011; 
  7'b1111011: SSLED = 7'b1110111; 
  7'b1110111: SSLED = 7'b1101111; 
  7'b1101111: SSLED = 7'b1011111; 
  7'b1011111: SSLED = 7'b0111111; 
  default: SSLED = 7'b0111111; 
  endcase 
  end 
  end 
 endmodule