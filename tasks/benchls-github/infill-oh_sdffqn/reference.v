module oh_sdffqn #(parameter DW = 1) // array width
   (
    input [DW-1:0] 	d,
    input [DW-1:0] 	si,
    input [DW-1:0] 	se,
    input [DW-1:0] 	clk, 
    output reg [DW-1:0] qn
    );
   
   always @ (posedge clk)
     qn <= se ? ~si : ~d;
      
endmodule