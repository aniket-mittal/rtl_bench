module mg_03239(clk ,rst_n ,cbf_4x4_i ,cbf_u_4x4_i ,cbf_v_4x4_i ,qp_left_i ,qp_flag_o);
input clk ; 
 input rst_n ; 
 input cbf_4x4_i ; 
 input cbf_u_4x4_i ; 
 input cbf_v_4x4_i ; 
 input qp_left_i ; 
 output qp_flag_o ; 
 reg qp_flag_o ; 
 wire modified_flag = !(cbf_4x4_i ||cbf_u_4x4_i ||cbf_v_4x4_i ); 
 [MASKED] 
 endmodule