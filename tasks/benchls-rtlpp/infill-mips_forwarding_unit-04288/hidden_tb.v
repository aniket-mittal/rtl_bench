// Hidden tests: 5000 cycles of seeded random inputs (seed 1371561523); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 14;
  reg clk;
  reg [7:0] i_0;
  reg [4:0] i_1;
  reg [4:0] i_2;
  reg [4:0] i_3;
  reg [4:0] i_4;
  reg [4:0] i_5;
  reg [4:0] i_6;
  reg [4:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [0:0] i_17;
  reg [0:0] i_18;
  reg [0:0] i_19;
  reg [0:0] i_20;
  reg [0:0] i_21;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_04288 dut (
    .DP_Hazards(i_0),
    .ID_Rs(i_1),
    .ID_Rt(i_2),
    .EX_Rs(i_3),
    .EX_Rt(i_4),
    .EX_RtRd(i_5),
    .MEM_RtRd(i_6),
    .WB_RtRd(i_7),
    .EX_Link(i_8),
    .EX_RegWrite(i_9),
    .MEM_RegWrite(i_10),
    .WB_RegWrite(i_11),
    .MEM_MemRead(i_12),
    .MEM_MemWrite(i_13),
    .InstMem_Read(i_14),
    .InstMem_Ready(i_15),
    .Mfc0(i_16),
    .IF_Exception_Stall(i_17),
    .ID_Exception_Stall(i_18),
    .EX_Exception_Stall(i_19),
    .EX_ALU_Stall(i_20),
    .M_Stall_Controller(i_21),
    .IF_Stall(out_dut[13:13]),
    .ID_Stall(out_dut[12:12]),
    .EX_Stall(out_dut[11:11]),
    .M_Stall(out_dut[10:10]),
    .WB_Stall(out_dut[9:9]),
    .ID_RsFwdSel(out_dut[8:7]),
    .ID_RtFwdSel(out_dut[6:5]),
    .EX_RsFwdSel(out_dut[4:3]),
    .EX_RtFwdSel(out_dut[2:1]),
    .M_WriteDataFwdSel(out_dut[0:0])
  );
  rtlpp_04288__ref ref_i (
    .DP_Hazards(i_0),
    .ID_Rs(i_1),
    .ID_Rt(i_2),
    .EX_Rs(i_3),
    .EX_Rt(i_4),
    .EX_RtRd(i_5),
    .MEM_RtRd(i_6),
    .WB_RtRd(i_7),
    .EX_Link(i_8),
    .EX_RegWrite(i_9),
    .MEM_RegWrite(i_10),
    .WB_RegWrite(i_11),
    .MEM_MemRead(i_12),
    .MEM_MemWrite(i_13),
    .InstMem_Read(i_14),
    .InstMem_Ready(i_15),
    .Mfc0(i_16),
    .IF_Exception_Stall(i_17),
    .ID_Exception_Stall(i_18),
    .EX_Exception_Stall(i_19),
    .EX_ALU_Stall(i_20),
    .M_Stall_Controller(i_21),
    .IF_Stall(out_ref[13:13]),
    .ID_Stall(out_ref[12:12]),
    .EX_Stall(out_ref[11:11]),
    .M_Stall(out_ref[10:10]),
    .WB_Stall(out_ref[9:9]),
    .ID_RsFwdSel(out_ref[8:7]),
    .ID_RtFwdSel(out_ref[6:5]),
    .EX_RsFwdSel(out_ref[4:3]),
    .EX_RtFwdSel(out_ref[2:1]),
    .M_WriteDataFwdSel(out_ref[0:0])
  );

  task check;
    begin
      bad = 0;
      for (b = 0; b < OW; b = b + 1)
        if (out_ref[b] !== 1'bx && out_dut[b] !== out_ref[b]) bad = 1;
      if (bad) begin
        mismatches = mismatches + 1;
        if (shown < 10) begin
          $display("MISMATCH cycle %0d: expected=%h got=%h", c, out_ref, out_dut);
          shown = shown + 1;
        end
      end
    end
  endtask

  initial begin
    seed = 1371561523;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      i_20 = {$random(seed)};
      i_21 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
