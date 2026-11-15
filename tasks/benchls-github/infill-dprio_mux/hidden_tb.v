// Hidden tests: 5000 cycles of seeded random inputs (seed 1986639696); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 30;
  reg clk;
  reg [5:0] i_0;
  reg [0:0] i_1;
  reg [1:0] i_2;
  reg [0:0] i_3;
  reg [15:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [5:0] i_10;
  reg [0:0] i_11;
  reg [1:0] i_12;
  reg [0:0] i_13;
  reg [15:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [0:0] i_17;
  reg [0:0] i_18;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  dprio_mux dut (
    .init_dprio_address(i_0),
    .init_dprio_read(i_1),
    .init_dprio_byteen(i_2),
    .init_dprio_write(i_3),
    .init_dprio_writedata(i_4),
    .init_atpgmode(i_5),
    .init_mdio_dis(i_6),
    .init_scanen(i_7),
    .init_ser_shift_load(i_8),
    .dprio_init_done(i_9),
    .avmm_dprio_address(i_10),
    .avmm_dprio_read(i_11),
    .avmm_dprio_byteen(i_12),
    .avmm_dprio_write(i_13),
    .avmm_dprio_writedata(i_14),
    .avmm_atpgmode(i_15),
    .avmm_mdio_dis(i_16),
    .avmm_scanen(i_17),
    .avmm_ser_shift_load(i_18),
    .dprio_address(out_dut[29:24]),
    .dprio_read(out_dut[23:23]),
    .dprio_byteen(out_dut[22:21]),
    .dprio_write(out_dut[20:20]),
    .dprio_writedata(out_dut[19:4]),
    .atpgmode(out_dut[3:3]),
    .mdio_dis(out_dut[2:2]),
    .scanen(out_dut[1:1]),
    .ser_shift_load(out_dut[0:0])
  );
  dprio_mux__ref ref_i (
    .init_dprio_address(i_0),
    .init_dprio_read(i_1),
    .init_dprio_byteen(i_2),
    .init_dprio_write(i_3),
    .init_dprio_writedata(i_4),
    .init_atpgmode(i_5),
    .init_mdio_dis(i_6),
    .init_scanen(i_7),
    .init_ser_shift_load(i_8),
    .dprio_init_done(i_9),
    .avmm_dprio_address(i_10),
    .avmm_dprio_read(i_11),
    .avmm_dprio_byteen(i_12),
    .avmm_dprio_write(i_13),
    .avmm_dprio_writedata(i_14),
    .avmm_atpgmode(i_15),
    .avmm_mdio_dis(i_16),
    .avmm_scanen(i_17),
    .avmm_ser_shift_load(i_18),
    .dprio_address(out_ref[29:24]),
    .dprio_read(out_ref[23:23]),
    .dprio_byteen(out_ref[22:21]),
    .dprio_write(out_ref[20:20]),
    .dprio_writedata(out_ref[19:4]),
    .atpgmode(out_ref[3:3]),
    .mdio_dis(out_ref[2:2]),
    .scanen(out_ref[1:1]),
    .ser_shift_load(out_ref[0:0])
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
    seed = 1986639696;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
