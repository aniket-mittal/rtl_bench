module mg_06588 (output reg [3:0] DISPn,output reg [6:0] HEX,input wire [6:0] HEX0,input wire [6:0] HEX1,input wire [6:0] HEX2,input wire [6:0] HEX3,input wire clk);
parameter 
  state0 = 3'b000, 
  state1 = 3'b001, 
  state2 = 3'b010, 
  state3 = 3'b011, 
  state4 = 3'b100, 
  state5 = 3'b101, 
  state6 = 3'b110, 
  state7 = 3'b111; 
  reg [2:0] state = state0; 
  reg [2:0] nextstate; 
  [MASKED] 
  always @(posedge clk) begin 
  state <= nextstate; 
  end 
  always @(posedge clk) begin 
  begin 
  DISPn[3:0] <= "1111"; 
  HEX[6:0] <= "1111111"; 
  case (nextstate) 
  state1: begin 
  DISPn[3:0] <= "1110"; 
  HEX[6:0] <= HEX0[6:0]; 
  end 
  state2: begin 
  DISPn[3:0] <= "1111"; 
  HEX[6:0] <= "1111111"; 
  end 
  state3: begin 
  DISPn[3:0] <= "1101"; 
  HEX[6:0] <= HEX1[6:0]; 
  end 
  state4: begin 
  DISPn[3:0] <= "1111"; 
  HEX[6:0] <= "1111111"; 
  end 
  state5: begin 
  DISPn[3:0] <= "1011"; 
  HEX[6:0] <= HEX2[6:0]; 
  end 
  state6: begin 
  DISPn[3:0] <= "1111"; 
  HEX[6:0] <= "1111111"; 
  end 
  state7: begin 
  DISPn[3:0] <= "0111"; 
  HEX[6:0] <= HEX3[6:0]; 
  end 
  endcase 
 end 
 end 
 endmodule