module mg_01576(input [35:0] cout_Multiply,input [35:0] zout_Multiply,input [31:0] sout_Multiply,input [49:0] productout_Multiply,input [1:0] modeout_Multiply,input operationout_Multiply,input NatLogFlagout_Multiply,input [7:0] InsTag_Multiply,input clock,input [1:0] idle_Multiply,output reg [1:0] idle_NormaliseProd,output reg [35:0] cout_NormaliseProd,output reg [35:0] zout_NormaliseProd,output reg [31:0] sout_NormaliseProd,output reg [1:0] modeout_NormaliseProd,output reg operationout_NormaliseProd,output reg NatLogFlagout_NormaliseProd,output reg [49:0] productout_NormaliseProd,output reg [7:0] InsTag_NormaliseProd);
parameter mode_circular =2'b01, 
  mode_linear =2'b00, 
  mode_hyperbolic=2'b11; 
 parameter no_idle = 2'b00, 
  allign_idle = 2'b01, 
  put_idle = 2'b10; 
 wire z_sign; 
 wire [7:0] z_exponent; 
 wire [26:0] z_mantissa; 
 assign z_sign = zout_Multiply[35]; 
 assign z_exponent = zout_Multiply[34:27]; 
 assign z_mantissa = {zout_Multiply[26:0]}; 
 [MASKED] 
 endmodule