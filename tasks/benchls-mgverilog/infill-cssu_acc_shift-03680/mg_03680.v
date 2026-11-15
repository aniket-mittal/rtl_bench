module mg_03680 (clk, ena,sel_acc, is_cssu,a, b, s,tco,trn, result);
input clk; 
 input ena; 
 input sel_acc; 
 input is_cssu; 
 input [39:0] a, b, s; 
 output tco; 
 output [15:0] trn, result; 
 reg tco; 
 reg [15:0] trn, result; 
 wire [31:0] acc; 
 wire acc_cmp; 
 assign acc = sel_acc ? b[39:0] : a[39:0]; 
 assign acc_cmp = acc[31:16] > acc[15:0]; 
 [MASKED] 
 endmodule