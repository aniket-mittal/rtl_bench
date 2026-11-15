// Hidden tests: 5000 cycles of seeded random inputs (seed 852341101); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 73;
  reg clk;
  reg [31:0] i_0;
  reg [0:0] i_1;
  reg [1:0] i_2;
  reg [2:0] i_3;
  reg [2:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [0:0] i_7;
  reg [1:0] i_8;
  reg [2:0] i_9;
  reg [2:0] i_10;
  reg [31:0] i_11;
  reg [31:0] i_12;
  reg [0:0] i_13;
  reg [1:0] i_14;
  reg [2:0] i_15;
  reg [2:0] i_16;
  reg [31:0] i_17;
  reg [31:0] i_18;
  reg [0:0] i_19;
  reg [1:0] i_20;
  reg [2:0] i_21;
  reg [2:0] i_22;
  reg [31:0] i_23;
  reg [3:0] i_24;
  reg [3:0] i_25;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_004434 dut (
    .HADDRx0(i_0),
    .HWRITEx0(i_1),
    .HTRANSx0(i_2),
    .HSIZEx0(i_3),
    .HBURSTx0(i_4),
    .HWDATAx0(i_5),
    .HADDRx1(i_6),
    .HWRITEx1(i_7),
    .HTRANSx1(i_8),
    .HSIZEx1(i_9),
    .HBURSTx1(i_10),
    .HWDATAx1(i_11),
    .HADDRx2(i_12),
    .HWRITEx2(i_13),
    .HTRANSx2(i_14),
    .HSIZEx2(i_15),
    .HBURSTx2(i_16),
    .HWDATAx2(i_17),
    .HADDRx3(i_18),
    .HWRITEx3(i_19),
    .HTRANSx3(i_20),
    .HSIZEx3(i_21),
    .HBURSTx3(i_22),
    .HWDATAx3(i_23),
    .HMASTER(i_24),
    .HMASTERD(i_25),
    .HADDR(out_dut[72:41]),
    .HWRITE(out_dut[40:40]),
    .HTRANS(out_dut[39:38]),
    .HSIZE(out_dut[37:35]),
    .HBURST(out_dut[34:32]),
    .HWDATA(out_dut[31:0])
  );
  autovcoder_004434__ref ref_i (
    .HADDRx0(i_0),
    .HWRITEx0(i_1),
    .HTRANSx0(i_2),
    .HSIZEx0(i_3),
    .HBURSTx0(i_4),
    .HWDATAx0(i_5),
    .HADDRx1(i_6),
    .HWRITEx1(i_7),
    .HTRANSx1(i_8),
    .HSIZEx1(i_9),
    .HBURSTx1(i_10),
    .HWDATAx1(i_11),
    .HADDRx2(i_12),
    .HWRITEx2(i_13),
    .HTRANSx2(i_14),
    .HSIZEx2(i_15),
    .HBURSTx2(i_16),
    .HWDATAx2(i_17),
    .HADDRx3(i_18),
    .HWRITEx3(i_19),
    .HTRANSx3(i_20),
    .HSIZEx3(i_21),
    .HBURSTx3(i_22),
    .HWDATAx3(i_23),
    .HMASTER(i_24),
    .HMASTERD(i_25),
    .HADDR(out_ref[72:41]),
    .HWRITE(out_ref[40:40]),
    .HTRANS(out_ref[39:38]),
    .HSIZE(out_ref[37:35]),
    .HBURST(out_ref[34:32]),
    .HWDATA(out_ref[31:0])
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
    seed = 852341101;
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
      i_22 = {$random(seed)};
      i_23 = {$random(seed)};
      i_24 = {$random(seed)};
      i_25 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
