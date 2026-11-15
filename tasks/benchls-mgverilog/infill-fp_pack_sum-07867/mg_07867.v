module mg_07867(input idle_NormaliseSum,input [31:0] sout_NormaliseSum,input [27:0] sum_NormaliseSum,input clock,output reg [31:0] sout_PackSum);
parameter no_idle = 1'b0, 
  put_idle = 1'b1; 
 wire s_sign; 
 wire [7:0] s_exponent; 
 assign s_sign = sout_NormaliseSum[31]; 
 assign s_exponent = sout_NormaliseSum[30:23]; 
 [MASKED] 
 endmodule