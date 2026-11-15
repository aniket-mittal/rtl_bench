module rtlpp_09016 (
   input                 clk_i           ,  
   input                 rstn_i          ,  
   
   output reg [23:0]     dac_a_o         ,  
   output reg [23:0]     dac_b_o         ,  
   output reg [23:0]     dac_c_o         ,  
   output reg [23:0]     dac_d_o         ,  
   input      [13:0]     pwm0_i          ,  
   input      [13:0]     pwm1_i          , 
   
   input      [31:0]     sys_addr        ,  
   input      [31:0]     sys_wdata       ,  
   input      [ 3:0]     sys_sel         ,  
   input                 sys_wen         ,  
   input                 sys_ren         ,  
   output reg [31:0]     sys_rdata       ,  
   output reg            sys_err         ,  
   output reg            sys_ack         
);

reg [23:0] cfg;
reg [23:0] cfg_b;

wire bit3;
wire bit2;
wire bit1;
wire bit0;
assign {bit3, bit2, bit1, bit0} = pwm0_i[5:2];

wire bit3_b;
wire bit2_b;
wire bit1_b;
wire bit0_b;
assign {bit3_b, bit2_b, bit1_b, bit0_b} = pwm1_i[5:2];

[MASKED]

endmodule