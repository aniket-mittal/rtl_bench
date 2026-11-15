module oh_dffq #(parameter DW = 1) // array width
   (
    input [DW-1:0] 	d,
    input [DW-1:0] 	clk,
    output reg [DW-1:0] q
    );
   
   always @ (posedge clk)
     q <= d;
   
endmodule