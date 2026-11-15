module mg_07584(input [9 - 1:0] in0,input [23 - 1:0] in1,input [31 - 1:0] in2,output [32 - 1:0] dout);
wire signed [25 - 1:0] a; 
 wire signed [18 - 1:0] b; 
 wire signed [48 - 1:0] c; 
 wire signed [43 - 1:0] m; 
 wire signed [48 - 1:0] p; 
 assign a = $unsigned(in1); 
 assign b = $signed(in0); 
 assign c = $unsigned(in2); 
 assign m = a * b; 
 assign p = m + c; 
 assign dout = p; 
 endmodule