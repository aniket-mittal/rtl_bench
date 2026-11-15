module autovcoder_031867 (
    clk,
    rst,
    memWriteA,
    memWriteB,
    addrA,
    addrB,
    dataInA,
    dataInB,
    dataOutA,
    dataOutB
);

  input clk;
  input rst;
  input memWriteA;
  input memWriteB;
  input [4:0] addrA;
  input [4:0] addrB;
  input [31:0] dataInA;
  input [31:0] dataInB;
  output [31:0] dataOutA;
  output [31:0] dataOutB;

  reg [31:0] mem[31:0];

  [MASKED]

  assign dataOutA = memWriteA ? 0 : mem[addrA];
  assign dataOutB = memWriteB ? 0 : mem[addrB];

endmodule

