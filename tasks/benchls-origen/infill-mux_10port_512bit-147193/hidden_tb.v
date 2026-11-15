// Hidden tests: 5000 cycles of seeded random inputs (seed 156399628); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 609;
  reg clk;
  reg [15:0] i_0;
  reg [0:0] i_1;
  reg [31:0] i_2;
  reg [511:0] i_3;
  reg [63:0] i_4;
  reg [0:0] i_5;
  reg [31:0] i_6;
  reg [511:0] i_7;
  reg [63:0] i_8;
  reg [0:0] i_9;
  reg [31:0] i_10;
  reg [511:0] i_11;
  reg [63:0] i_12;
  reg [0:0] i_13;
  reg [31:0] i_14;
  reg [511:0] i_15;
  reg [63:0] i_16;
  reg [0:0] i_17;
  reg [31:0] i_18;
  reg [511:0] i_19;
  reg [63:0] i_20;
  reg [0:0] i_21;
  reg [31:0] i_22;
  reg [511:0] i_23;
  reg [63:0] i_24;
  reg [0:0] i_25;
  reg [31:0] i_26;
  reg [511:0] i_27;
  reg [63:0] i_28;
  reg [0:0] i_29;
  reg [31:0] i_30;
  reg [511:0] i_31;
  reg [63:0] i_32;
  reg [0:0] i_33;
  reg [31:0] i_34;
  reg [511:0] i_35;
  reg [63:0] i_36;
  reg [0:0] i_37;
  reg [31:0] i_38;
  reg [511:0] i_39;
  reg [63:0] i_40;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_147193 dut (
    .wr_port_select(i_0),
    .port0_wr_en(i_1),
    .port0_wr_addr(i_2),
    .port0_wr_data(i_3),
    .port0_wr_mask(i_4),
    .port1_wr_en(i_5),
    .port1_wr_addr(i_6),
    .port1_wr_data(i_7),
    .port1_wr_mask(i_8),
    .port2_wr_en(i_9),
    .port2_wr_addr(i_10),
    .port2_wr_data(i_11),
    .port2_wr_mask(i_12),
    .port3_wr_en(i_13),
    .port3_wr_addr(i_14),
    .port3_wr_data(i_15),
    .port3_wr_mask(i_16),
    .port4_wr_en(i_17),
    .port4_wr_addr(i_18),
    .port4_wr_data(i_19),
    .port4_wr_mask(i_20),
    .port5_wr_en(i_21),
    .port5_wr_addr(i_22),
    .port5_wr_data(i_23),
    .port5_wr_mask(i_24),
    .port6_wr_en(i_25),
    .port6_wr_addr(i_26),
    .port6_wr_data(i_27),
    .port6_wr_mask(i_28),
    .port7_wr_en(i_29),
    .port7_wr_addr(i_30),
    .port7_wr_data(i_31),
    .port7_wr_mask(i_32),
    .port8_wr_en(i_33),
    .port8_wr_addr(i_34),
    .port8_wr_data(i_35),
    .port8_wr_mask(i_36),
    .port9_wr_en(i_37),
    .port9_wr_addr(i_38),
    .port9_wr_data(i_39),
    .port9_wr_mask(i_40),
    .muxed_port_wr_en(out_dut[608:608]),
    .muxed_port_wr_addr(out_dut[607:576]),
    .muxed_port_wr_data(out_dut[575:64]),
    .muxed_port_wr_mask(out_dut[63:0])
  );
  origen_147193__ref ref_i (
    .wr_port_select(i_0),
    .port0_wr_en(i_1),
    .port0_wr_addr(i_2),
    .port0_wr_data(i_3),
    .port0_wr_mask(i_4),
    .port1_wr_en(i_5),
    .port1_wr_addr(i_6),
    .port1_wr_data(i_7),
    .port1_wr_mask(i_8),
    .port2_wr_en(i_9),
    .port2_wr_addr(i_10),
    .port2_wr_data(i_11),
    .port2_wr_mask(i_12),
    .port3_wr_en(i_13),
    .port3_wr_addr(i_14),
    .port3_wr_data(i_15),
    .port3_wr_mask(i_16),
    .port4_wr_en(i_17),
    .port4_wr_addr(i_18),
    .port4_wr_data(i_19),
    .port4_wr_mask(i_20),
    .port5_wr_en(i_21),
    .port5_wr_addr(i_22),
    .port5_wr_data(i_23),
    .port5_wr_mask(i_24),
    .port6_wr_en(i_25),
    .port6_wr_addr(i_26),
    .port6_wr_data(i_27),
    .port6_wr_mask(i_28),
    .port7_wr_en(i_29),
    .port7_wr_addr(i_30),
    .port7_wr_data(i_31),
    .port7_wr_mask(i_32),
    .port8_wr_en(i_33),
    .port8_wr_addr(i_34),
    .port8_wr_data(i_35),
    .port8_wr_mask(i_36),
    .port9_wr_en(i_37),
    .port9_wr_addr(i_38),
    .port9_wr_data(i_39),
    .port9_wr_mask(i_40),
    .muxed_port_wr_en(out_ref[608:608]),
    .muxed_port_wr_addr(out_ref[607:576]),
    .muxed_port_wr_data(out_ref[575:64]),
    .muxed_port_wr_mask(out_ref[63:0])
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
    seed = 156399628;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_4 = {$random(seed), $random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_8 = {$random(seed), $random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_12 = {$random(seed), $random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_16 = {$random(seed), $random(seed)};
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_20 = {$random(seed), $random(seed)};
      i_21 = {$random(seed)};
      i_22 = {$random(seed)};
      i_23 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_24 = {$random(seed), $random(seed)};
      i_25 = {$random(seed)};
      i_26 = {$random(seed)};
      i_27 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_28 = {$random(seed), $random(seed)};
      i_29 = {$random(seed)};
      i_30 = {$random(seed)};
      i_31 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_32 = {$random(seed), $random(seed)};
      i_33 = {$random(seed)};
      i_34 = {$random(seed)};
      i_35 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_36 = {$random(seed), $random(seed)};
      i_37 = {$random(seed)};
      i_38 = {$random(seed)};
      i_39 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_40 = {$random(seed), $random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
