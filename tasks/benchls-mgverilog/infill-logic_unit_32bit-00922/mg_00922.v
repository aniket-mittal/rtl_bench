module mg_00922 (opB, opA,op,result);
input [31:0] opA; 
 input [31:0] opB; 
 input [1:0] op; 
 output [31:0] result; 
 reg [31:0] logic_result; 
 [MASKED] 
 assign result=logic_result; 
 endmodule