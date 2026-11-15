module mg_02478(clock,reset,button,button_pressed);
parameter Wait = 40000; 
  parameter Size = 16; 
  input wire clock; 
  input wire reset; 
  input wire button; 
  output wire button_pressed; 
  reg [Size-1:0] s_Counter; 
  reg s_DoneCount; 
  reg s_ButtonPressed; 
  assign button_pressed = s_ButtonPressed; 
  [MASKED] 
 endmodule