module oh_fall2pulse
  #( parameter N = 1) //data width
   (
    input 	   clk, // clock
    input 	   nreset, // async active low reset
    input [N-1:0]  in, // edge input
    output [N-1:0] out     // one cycle pulse
    );

   reg [N-1:0] 	   in_reg;

   [MASKED]

   assign out[N-1:0] = ~in[N-1:0] & in_reg[N-1:0] ;

endmodule