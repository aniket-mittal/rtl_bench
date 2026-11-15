module mg_00170( CLK, COP_GO, COP_OP, COP_INP, COP_DONE, COP_OUTP);
input CLK; 
 input COP_GO; 
 input [23:0] COP_OP; 
 input [127:0] COP_INP; 
 output reg COP_DONE; 
 output reg [63:0] COP_OUTP; 
  always @(posedge CLK) 
  COP_OUTP <= COP_OP[8] ? {COP_INP[71:64],COP_INP[79:72],COP_INP[87:80],COP_INP[95:88],32'd0} 
  : {COP_INP[7:0],COP_INP[15:8],COP_INP[23:16],COP_INP[31:24],COP_INP[71:64],COP_INP[79:72],COP_INP[87:80],COP_INP[95:88]}; 
  always @(posedge CLK) COP_DONE <= COP_GO; 
 endmodule