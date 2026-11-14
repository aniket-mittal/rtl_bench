module mg_05098(input idle_NormaliseProd,input [32:0] zout_NormaliseProd,input [49:0] productout_NormaliseProd,input clock,output reg [31:0] FinalProduct);
parameter no_idle = 1'b0, 
  put_idle = 1'b1; 
 wire z_sign; 
 wire [7:0] z_exponent; 
 wire [26:0] z_mantissa; 
 assign z_sign = zout_NormaliseProd[32]; 
 assign z_exponent = zout_NormaliseProd[31:24]; 
 assign z_mantissa = {zout_NormaliseProd[23:0]}; 
 [MASKED] 
 endmodule