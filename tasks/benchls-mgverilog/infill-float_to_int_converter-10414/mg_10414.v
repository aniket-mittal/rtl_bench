module mg_10414(input sys_clk,input alu_rst,input [31:0] a,input valid_i,output reg [31:0] r,output reg valid_o);
wire a_sign = a[31]; 
 wire [7:0] a_expn = a[30:23]; 
 wire [23:0] a_mant = {1'b1, a[22:0]}; 
 reg [30:0] shifted; 
 always @(*) begin 
  if(a_expn >= 8'd150) 
  shifted = a_mant << (a_expn - 8'd150); 
  else 
  shifted = a_mant >> (8'd150 - a_expn); 
 end 
 [MASKED] 
 endmodule