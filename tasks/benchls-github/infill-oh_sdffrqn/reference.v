module oh_sdffrqn #(parameter DW = 1) // array width
   (
    input [DW-1:0] 	d,
    input [DW-1:0] 	si,
    input [DW-1:0] 	se,
    input [DW-1:0] 	clk,
    input [DW-1:0] 	nreset,
    output reg [DW-1:0] qn
    );
   
   always @ (posedge clk or negedge nreset)
     if(!nreset)
       qn <= {DW{1'b1}};
     else
       qn <=  se ? ~si : ~d;
   
endmodule