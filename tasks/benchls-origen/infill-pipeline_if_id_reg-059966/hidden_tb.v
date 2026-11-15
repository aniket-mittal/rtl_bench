// Hidden tests: 5000 cycles of seeded random inputs (seed 4021519842); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 154;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [31:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_059966 dut (
    .clock(clk),
    .reset(i_0),
    .en(i_1),
    .flush(i_2),
    .ins(i_3),
    .PC8F(i_4),
    .PCF(i_5),
    .eret(i_6),
    .Likely(i_7),
    .npc(i_8),
    .jumpD(i_9),
    .GeneralFlush(i_10),
    .reg_ins(out_dut[153:122]),
    .rs(out_dut[121:117]),
    .rt(out_dut[116:112]),
    .rd(out_dut[111:107]),
    .imm16(out_dut[106:91]),
    .imm26(out_dut[90:65]),
    .PC8D(out_dut[64:33]),
    .PCD(out_dut[32:1]),
    .DelaySlotD(out_dut[0:0])
  );
  origen_059966__ref ref_i (
    .clock(clk),
    .reset(i_0),
    .en(i_1),
    .flush(i_2),
    .ins(i_3),
    .PC8F(i_4),
    .PCF(i_5),
    .eret(i_6),
    .Likely(i_7),
    .npc(i_8),
    .jumpD(i_9),
    .GeneralFlush(i_10),
    .reg_ins(out_ref[153:122]),
    .rs(out_ref[121:117]),
    .rt(out_ref[116:112]),
    .rd(out_ref[111:107]),
    .imm16(out_ref[106:91]),
    .imm26(out_ref[90:65]),
    .PC8D(out_ref[64:33]),
    .PCD(out_ref[32:1]),
    .DelaySlotD(out_ref[0:0])
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
    seed = 4021519842;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
