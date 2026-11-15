module mg_00945 (extend_temp1_V_read,extend_temp2_V_read,extend_temp1_V_write,ap_return_0,ap_return_1,ap_return_2);
input [121:0] extend_temp1_V_read; 
 input [121:0] extend_temp2_V_read; 
 input [121:0] extend_temp1_V_write; 
 output [121:0] ap_return_0; 
 output [121:0] ap_return_1; 
 output [121:0] ap_return_2; 
 wire [121:0] tmp_fu_44_p2; 
 wire [121:0] r_V_fu_50_p2; 
 assign ap_return_0 = r_V_fu_50_p2; 
 assign ap_return_1 = extend_temp1_V_write; 
 assign ap_return_2 = extend_temp1_V_read; 
 assign r_V_fu_50_p2 = (tmp_fu_44_p2 | extend_temp1_V_read); 
 assign tmp_fu_44_p2 = (extend_temp1_V_write | extend_temp2_V_read); 
 endmodule