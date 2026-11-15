module mg_06064 (parity_out, data_in);
parameter WIDTH = 8 ; 
 parameter NUM = 16 ; 
 input [WIDTH * NUM - 1 : 0] data_in ; 
 output [NUM - 1 : 0] parity_out ; 
 reg [NUM - 1 : 0] parity ; 
 integer i ; 
 integer j ; 
 [MASKED] 
 assign parity_out[NUM - 1 : 0] = parity[NUM - 1 : 0]; 
 endmodule