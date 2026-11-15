// Hidden tests: 5000 cycles of seeded random inputs (seed 805184389); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 118;
  reg clk;
  reg [2:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [31:0] i_7;
  reg [4:0] i_8;
  reg [4:0] i_9;
  reg [4:0] i_10;
  reg [0:0] i_11;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_216014 dut (
    .clk(clk),
    .aluSig_in(i_0),
    .WB_in(i_1),
    .extendForMem_in(i_2),
    .WMEM_in(i_3),
    .load_in(i_4),
    .R1_in(i_5),
    .R2_in(i_6),
    .wdMem_in(i_7),
    .rd_in(i_8),
    .rs_in(i_9),
    .rt_in(i_10),
    .flush(i_11),
    .aluSig_out(out_dut[117:115]),
    .WB_out(out_dut[114:114]),
    .extendForMem_out(out_dut[113:113]),
    .WMEM_out(out_dut[112:112]),
    .load_out(out_dut[111:111]),
    .R1_out(out_dut[110:79]),
    .R2_out(out_dut[78:47]),
    .wdMem_out(out_dut[46:15]),
    .rd_out(out_dut[14:10]),
    .rs_out(out_dut[9:5]),
    .rt_out(out_dut[4:0])
  );
  origen_216014__ref ref_i (
    .clk(clk),
    .aluSig_in(i_0),
    .WB_in(i_1),
    .extendForMem_in(i_2),
    .WMEM_in(i_3),
    .load_in(i_4),
    .R1_in(i_5),
    .R2_in(i_6),
    .wdMem_in(i_7),
    .rd_in(i_8),
    .rs_in(i_9),
    .rt_in(i_10),
    .flush(i_11),
    .aluSig_out(out_ref[117:115]),
    .WB_out(out_ref[114:114]),
    .extendForMem_out(out_ref[113:113]),
    .WMEM_out(out_ref[112:112]),
    .load_out(out_ref[111:111]),
    .R1_out(out_ref[110:79]),
    .R2_out(out_ref[78:47]),
    .wdMem_out(out_ref[46:15]),
    .rd_out(out_ref[14:10]),
    .rs_out(out_ref[9:5]),
    .rt_out(out_ref[4:0])
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
    seed = 805184389;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
