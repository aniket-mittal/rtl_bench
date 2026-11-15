module oh_sdffrq #(parameter DW = 1) // array width
   (
    input [DW-1:0] 	d,
    input [DW-1:0] 	si,
    input [DW-1:0] 	se,
    input [DW-1:0] 	clk,
    input [DW-1:0] 	nreset,
    output reg [DW-1:0] q
    );
   
   always @ (posedge clk or negedge nreset)
     if(!nreset)
       q <= 'b0;
     else
       q <= se ? si : d;
      
endmodule