module mg_08758(LATCH,DATA,PULSE,CLOCK,BUTTONS);
input DATA; 
 input CLOCK; 
 output LATCH; 
 output PULSE; 
 output [7:0] BUTTONS; 
 reg [7:0] buttons; 
 reg latch; 
 reg pulse; 
 reg nes_clock; 
 reg [17:0] prescaler; 
 reg [5:0] states; 
 parameter NES_Init = 1; 
 parameter Latch_ON_1 = 2; 
 parameter Latch_ON_2 = 3; 
 parameter Latch_OFF = 4; 
 parameter ButtonB_ON = 5; 
 parameter ButtonB_OFF = 6; 
 parameter ButtonSelect_ON = 7; 
 parameter ButtonSelect_OFF = 8; 
 parameter ButtonStart_ON = 9; 
 parameter ButtonStart_OFF = 10; 
 parameter ButtonUp_ON = 11; 
 parameter ButtonUp_OFF = 12; 
 parameter ButtonDown_ON = 13; 
 parameter ButtonDown_OFF = 14; 
 parameter ButtonLeft_ON = 15; 
 parameter ButtonLeft_OFF = 16; 
 parameter ButtonRight_ON = 17; 
 parameter ButtonRight_OFF = 18; 
 parameter To_Tick = 12'h0A2; 
 assign LATCH = latch; 
 assign PULSE = pulse; 
 assign BUTTONS = buttons; 
 initial begin 
  prescaler <= 0; 
  nes_clock <= 0; 
  latch <= 0; 
  pulse <= 0; 
  states <= NES_Init; 
 end 
 always @ (posedge CLOCK) 
 begin 
  if(prescaler < To_Tick) 
  prescaler <= prescaler + 1; 
  else 
  prescaler <= 0; 
  if(prescaler == 0) 
  begin 
  nes_clock <= ~nes_clock; 
  end 
 end 
 [MASKED] 
 endmodule