// Hidden tests: 5000 cycles of seeded random inputs (seed 196967152); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 148;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [4:0] i_7;
  reg [1:0] i_8;
  reg [1:0] i_9;
  reg [31:0] i_10;
  reg [31:0] i_11;
  reg [31:0] i_12;
  reg [31:0] i_13;
  reg [4:0] i_14;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_006450 dut (
    .clk(clk),
    .clrn(i_0),
    .dwreg(i_1),
    .dm2reg(i_2),
    .dwmem(i_3),
    .djal(i_4),
    .D_WZ(i_5),
    .D_BRANCH(i_6),
    .daluc(i_7),
    .D_BDEPEND(i_8),
    .D_ADEPEND(i_9),
    .da(i_10),
    .db(i_11),
    .dimm(i_12),
    .dpc4(i_13),
    .drn(i_14),
    .ewreg(out_dut[147:147]),
    .em2reg(out_dut[146:146]),
    .ewmem(out_dut[145:145]),
    .ejal(out_dut[144:144]),
    .E_WZ(out_dut[143:143]),
    .DE_BRANCH(out_dut[142:142]),
    .ealuc(out_dut[141:137]),
    .E_BDEPEND(out_dut[136:135]),
    .E_ADEPEND(out_dut[134:133]),
    .ea(out_dut[132:101]),
    .eb(out_dut[100:69]),
    .eimm(out_dut[68:37]),
    .epc4(out_dut[36:5]),
    .ern(out_dut[4:0])
  );
  origen_006450__ref ref_i (
    .clk(clk),
    .clrn(i_0),
    .dwreg(i_1),
    .dm2reg(i_2),
    .dwmem(i_3),
    .djal(i_4),
    .D_WZ(i_5),
    .D_BRANCH(i_6),
    .daluc(i_7),
    .D_BDEPEND(i_8),
    .D_ADEPEND(i_9),
    .da(i_10),
    .db(i_11),
    .dimm(i_12),
    .dpc4(i_13),
    .drn(i_14),
    .ewreg(out_ref[147:147]),
    .em2reg(out_ref[146:146]),
    .ewmem(out_ref[145:145]),
    .ejal(out_ref[144:144]),
    .E_WZ(out_ref[143:143]),
    .DE_BRANCH(out_ref[142:142]),
    .ealuc(out_ref[141:137]),
    .E_BDEPEND(out_ref[136:135]),
    .E_ADEPEND(out_ref[134:133]),
    .ea(out_ref[132:101]),
    .eb(out_ref[100:69]),
    .eimm(out_ref[68:37]),
    .epc4(out_ref[36:5]),
    .ern(out_ref[4:0])
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
    seed = 196967152;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
