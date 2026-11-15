module mg_00142(output [15 : 0] data_out,input [4 : 0] ctrl,input [15 : 0] data_in_A,input [15 : 0] data_in_B);
wire [1 : 0] sign_union; 
  assign sign_union = {data_in_A[15], data_in_B[15]}; 
  [MASKED] 
 endmodule