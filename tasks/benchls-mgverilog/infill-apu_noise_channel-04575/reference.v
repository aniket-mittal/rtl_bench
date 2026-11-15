module mg_04575(input clk, input ce, input reset,input [1:0] Addr,input [7:0] DIN,input MW,input LenCtr_Clock,input Env_Clock,input Enabled,input [7:0] LenCtr_In,output [3:0] Sample,output IsNonZero);
reg EnvLoop, EnvDisable, EnvDoReset; 
  reg [3:0] Volume, Envelope, EnvDivider; 
  wire LenCtrHalt = EnvLoop; 
  reg [7:0] LenCtr; 
  reg ShortMode; 
  reg [14:0] Shift = 1; 
  assign IsNonZero = (LenCtr != 0); 
  reg [3:0] Period; 
  reg [11:0] NoisePeriod, TimerCtr; 
  always @* begin 
  case (Period) 
  0: NoisePeriod = 12'h004; 
  1: NoisePeriod = 12'h008; 
  2: NoisePeriod = 12'h010; 
  3: NoisePeriod = 12'h020; 
  4: NoisePeriod = 12'h040; 
  5: NoisePeriod = 12'h060; 
  6: NoisePeriod = 12'h080; 
  7: NoisePeriod = 12'h0A0; 
  8: NoisePeriod = 12'h0CA; 
  9: NoisePeriod = 12'h0FE; 
  10: NoisePeriod = 12'h17C; 
  11: NoisePeriod = 12'h1FC; 
  12: NoisePeriod = 12'h2FA; 
  13: NoisePeriod = 12'h3F8; 
  14: NoisePeriod = 12'h7F2; 
  15: NoisePeriod = 12'hFE4; 
  endcase 
  end 
  always @(posedge clk) if (reset) begin 
  EnvLoop <= 0; 
  EnvDisable <= 0; 
  EnvDoReset <= 0; 
  Volume <= 0; 
  Envelope <= 0; 
  EnvDivider <= 0; 
  LenCtr <= 0; 
  ShortMode <= 0; 
  Shift <= 1; 
  Period <= 0; 
  TimerCtr <= 0; 
  end else if (ce) begin 
  if (MW) begin 
  case (Addr) 
  0: begin 
  EnvLoop <= DIN[5]; 
  EnvDisable <= DIN[4]; 
  Volume <= DIN[3:0]; 
  end 
  2: begin 
  ShortMode <= DIN[7]; 
  Period <= DIN[3:0]; 
  end 
  3: begin 
  LenCtr <= LenCtr_In; 
  EnvDoReset <= 1; 
  end 
  endcase 
  end 
  if (TimerCtr == 0) begin 
  TimerCtr <= NoisePeriod; 
  Shift <= { 
  Shift[0] ^ (ShortMode ? Shift[6] : Shift[1]), 
  Shift[14:1]}; 
  end else begin 
  TimerCtr <= TimerCtr - 1; 
  end 
  if (LenCtr_Clock && LenCtr != 0 && !LenCtrHalt) begin 
  LenCtr <= LenCtr - 1; 
  end 
  if (Env_Clock) begin 
  if (EnvDoReset) begin 
  EnvDivider <= Volume; 
  Envelope <= 15; 
  EnvDoReset <= 0; 
  end else if (EnvDivider == 0) begin 
  EnvDivider <= Volume; 
  if (Envelope != 0) 
  Envelope <= Envelope - 1; 
  else if (EnvLoop) 
  Envelope <= 15; 
  end else 
  EnvDivider <= EnvDivider - 1; 
  end 
  if (!Enabled) 
  LenCtr <= 0; 
  end 
  assign Sample = 
  (LenCtr == 0 || Shift[0]) ? 
  0 : 
  (EnvDisable ? Volume : Envelope); 
 endmodule