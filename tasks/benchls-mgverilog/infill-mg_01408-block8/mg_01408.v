module mg_01408(input [32:0] aout_Special,input [32:0] bout_Special,input [35:0] cout_Special,input [35:0] zout_Special,input [31:0] sout_Special,input [1:0] modeout_Special,input operationout_Special,input NatLogFlagout_Special,input [7:0] InsTag_Special,input clock,input [1:0] idle_Special,output reg [1:0] idle_Multiply,output reg [35:0] cout_Multiply,output reg [35:0] zout_Multiply,output reg [31:0] sout_Multiply,output reg [1:0] modeout_Multiply,output reg operationout_Multiply,output reg NatLogFlagout_Multiply,output reg [49:0] productout_Multiply,output reg [7:0] InsTag_Multiply);
parameter mode_circular =2'b01, 
  mode_linear =2'b00, 
  mode_hyperbolic=2'b11; 
 parameter no_idle = 2'b00, 
  allign_idle = 2'b01, 
  put_idle = 2'b10; 
 wire a_sign; 
 wire [7:0] a_exponent; 
 wire [23:0] a_mantissa; 
 wire b_sign; 
 wire [7:0] b_exponent; 
 wire [23:0] b_mantissa; 
 assign a_sign = aout_Special[32]; 
 assign a_exponent = aout_Special[31:24] - 127; 
 assign a_mantissa = {aout_Special[23:0]}; 
 assign b_sign = bout_Special[32]; 
 assign b_exponent = bout_Special[31:24] - 127; 
 assign b_mantissa = {bout_Special[23:0]}; 
 [MASKED] 
 endmodule