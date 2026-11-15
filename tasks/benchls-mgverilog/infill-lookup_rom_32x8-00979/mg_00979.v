module mg_00979(input [4:0] X, output [7:0] Yout);
reg [6:0] Y; 
 [MASKED] 
 assign Yout = {Y, 1'b0}; 
 endmodule