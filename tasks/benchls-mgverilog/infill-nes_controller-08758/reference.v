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
 always @ (posedge nes_clock) 
 begin 
  case(states) 
  NES_Init : 
  states <= Latch_ON_1; 
  Latch_ON_1 : 
  states <= Latch_ON_2; 
  Latch_ON_2 : 
  states <= Latch_OFF; 
  Latch_OFF : 
  states <= ButtonB_ON; 
  ButtonB_ON : 
  states <= ButtonB_OFF; 
  ButtonB_OFF : 
  states <= ButtonSelect_ON; 
  ButtonSelect_ON : 
  states <= ButtonSelect_OFF; 
  ButtonSelect_OFF : 
  states <= ButtonStart_ON; 
  ButtonStart_ON : 
  states <= ButtonStart_OFF; 
  ButtonStart_OFF : 
  states <= ButtonUp_ON; 
  ButtonUp_ON : 
  states <= ButtonUp_OFF; 
  ButtonUp_OFF : 
  states <= ButtonDown_ON; 
  ButtonDown_ON : 
  states <= ButtonDown_OFF; 
  ButtonDown_OFF : 
  states <= ButtonLeft_ON; 
  ButtonLeft_ON : 
  states <= ButtonLeft_OFF; 
  ButtonLeft_OFF : 
  states <= ButtonRight_ON; 
  ButtonRight_ON : 
  states <= ButtonRight_OFF; 
  ButtonRight_OFF : 
  states <= Latch_ON_1; 
  endcase 
  case(states) 
  NES_Init : begin 
  latch <= 0; 
  pulse <= 0; 
  end 
  Latch_ON_1 : begin 
  latch <= 1; 
  pulse <= 0; 
  end 
  Latch_ON_2 : begin 
  latch <= 1; 
  pulse <= 0; 
  end 
  Latch_OFF : begin 
  latch <= 0; 
  pulse <= 0; 
  buttons[0] <= ~DATA; 
  end 
  ButtonB_ON : 
  pulse <= 1; 
  ButtonB_OFF : begin 
  pulse <= 0; 
  buttons[1] <= ~DATA; 
  end 
  ButtonSelect_ON : 
  pulse <= 1; 
  ButtonSelect_OFF : begin 
  pulse <= 0; 
  buttons[2] <= ~DATA; 
  end 
  ButtonStart_ON : 
  pulse <= 1; 
  ButtonStart_OFF : begin 
  pulse <= 0; 
  buttons[3] <= ~DATA; 
  end 
  ButtonUp_ON : 
  pulse <= 1; 
  ButtonUp_OFF : begin 
  pulse <= 0; 
  buttons[4] <= ~DATA; 
  end 
  ButtonDown_ON : 
  pulse <= 1; 
  ButtonDown_OFF : begin 
  pulse <= 0; 
  buttons[5] <= ~DATA; 
  end 
  ButtonLeft_ON : 
  pulse <= 1; 
  ButtonLeft_OFF : begin 
  pulse <= 0; 
  buttons[6] <= ~DATA; 
  end 
  ButtonRight_ON : 
  pulse <= 1; 
  ButtonRight_OFF : begin 
  pulse <= 0; 
  buttons[7] <= ~DATA; 
  end 
  endcase 
 end 
 endmodule