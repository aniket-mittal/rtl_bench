module autovcoder_061170 (
    wb_pr_CCR_write,
    wb_pr_op,
    wb_pr_regC,
    mem_wb_op,
    mem_wb_regA,
    mem_wb_regC,
    ex_mem_op,
    ex_mem_regA,
    F3,
    mem_wb_CCR_write,
    ex_mem_CCR_write
);


  parameter ADD = 6'b000000;
  parameter NDU = 6'b001000;
  parameter ADC = 6'b000010;
  parameter ADZ = 6'b000001;
  parameter ADI = 4'b0001;
  parameter NDC = 6'b001010;
  parameter NDZ = 6'b001001;
  parameter LHI = 4'b0011;
  parameter LW = 4'b0100;
  parameter SW = 4'b0101;
  parameter LM = 4'b0110;
  parameter SM = 4'b0111;
  parameter BEQ = 4'b1100;
  parameter JAL = 4'b1000;
  parameter JLR = 4'b1001;

  input [2:0] mem_wb_regA, mem_wb_regC, ex_mem_regA, wb_pr_regC;
  input [5:0] mem_wb_op, ex_mem_op, wb_pr_op;
  input mem_wb_CCR_write, ex_mem_CCR_write, wb_pr_CCR_write;
  output reg [1:0] F3;

  [MASKED]

endmodule

