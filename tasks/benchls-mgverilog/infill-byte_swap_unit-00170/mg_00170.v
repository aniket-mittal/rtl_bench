module mg_00170( CLK, COP_GO, COP_OP, COP_INP, COP_DONE, COP_OUTP);
input CLK; 
 input COP_GO; 
 input [23:0] COP_OP; 
 input [127:0] COP_INP; 
 output reg COP_DONE; 
 output reg [63:0] COP_OUTP; 
  [MASKED] 
  always @(posedge CLK) COP_DONE <= COP_GO; 
 endmodule