module mg_01465(input [4:0] a, input signed [7:0] b, output signed [15:0] p);
wire signed [12:0] pt; 
 wire signed [5:0] ta; 
 assign ta = a; 
 assign pt = b * ta; 
 assign p=pt; 
 endmodule