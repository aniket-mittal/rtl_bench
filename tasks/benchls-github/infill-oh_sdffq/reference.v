module oh_sdffq #(parameter DW = 1) // array width
   (
    input [DW-1:0] 	d,
    input [DW-1:0] 	si,
    input [DW-1:0] 	se,
    input [DW-1:0] 	clk,
    output reg [DW-1:0] q
    );

   always @ (posedge clk)
       q <= se ? si : d;
   
endmodule