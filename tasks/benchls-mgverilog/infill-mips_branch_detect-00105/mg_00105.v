module mg_00105(opcode, func, is_branch);
input [5:0] opcode; 
 input [5:0] func; 
 output is_branch; 
 wire is_special; 
 assign is_special=!(|opcode); 
 [MASKED] 
 endmodule