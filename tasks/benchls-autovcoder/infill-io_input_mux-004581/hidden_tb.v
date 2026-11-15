// Hidden tests: 5000 cycles of seeded random inputs (seed 344359768); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 24;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
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
  reg [2:0] i_18;
  reg [2:0] i_19;
  reg [0:0] i_20;
  reg [0:0] i_21;
  reg [0:0] i_22;
  reg [0:0] i_23;
  reg [1:0] i_24;
  reg [1:0] i_25;
  reg [1:0] i_26;
  reg [1:0] i_27;
  reg [0:0] i_28;
  reg [0:0] i_29;
  reg [0:0] i_30;
  reg [0:0] i_31;
  reg [0:0] i_32;
  reg [0:0] i_33;
  reg [0:0] i_34;
  reg [0:0] i_35;
  reg [0:0] i_36;
  reg [0:0] i_37;
  reg [0:0] i_38;
  reg [0:0] i_39;
  reg [0:0] i_40;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_004581 dut (
    .pd_data_in1(i_0),
    .pd_data_in0(i_1),
    .iclkin_dist_in1(i_2),
    .iclkin_dist_in0(i_3),
    .idata0_in1(i_4),
    .idata0_in0(i_5),
    .idata1_in1(i_6),
    .idata1_in0(i_7),
    .idataselb_in1(i_8),
    .idataselb_in0(i_9),
    .iddren_in1(i_10),
    .iddren_in0(i_11),
    .ilaunch_clk_in1(i_12),
    .ilaunch_clk_in0(i_13),
    .ilpbk_dat_in1(i_14),
    .ilpbk_dat_in0(i_15),
    .ilpbk_en_in1(i_16),
    .ilpbk_en_in0(i_17),
    .irxen_in1(i_18),
    .irxen_in0(i_19),
    .istrbclk_in1(i_20),
    .istrbclk_in0(i_21),
    .itxen_in1(i_22),
    .itxen_in0(i_23),
    .indrv_in1(i_24),
    .indrv_in0(i_25),
    .ipdrv_in1(i_26),
    .ipdrv_in0(i_27),
    .async_dat_in1(i_28),
    .async_dat_in0(i_29),
    .oclkb_in1(i_30),
    .oclkb_in0(i_31),
    .oclk_in1(i_32),
    .oclk_in0(i_33),
    .odat0_in1(i_34),
    .odat0_in0(i_35),
    .odat1_in1(i_36),
    .odat1_in0(i_37),
    .odat_async_in1(i_38),
    .odat_async_in0(i_39),
    .shift_en(i_40),
    .iclkin_dist_out(out_dut[23:23]),
    .idata0_out(out_dut[22:22]),
    .idata1_out(out_dut[21:21]),
    .idataselb_out(out_dut[20:20]),
    .iddren_out(out_dut[19:19]),
    .ilaunch_clk_out(out_dut[18:18]),
    .ilpbk_dat_out(out_dut[17:17]),
    .ilpbk_en_out(out_dut[16:16]),
    .irxen_out(out_dut[15:13]),
    .istrbclk_out(out_dut[12:12]),
    .itxen_out(out_dut[11:11]),
    .indrv_out(out_dut[10:9]),
    .ipdrv_out(out_dut[8:7]),
    .async_dat_out(out_dut[6:6]),
    .pd_data_out(out_dut[5:5]),
    .oclkb_out(out_dut[4:4]),
    .oclk_out(out_dut[3:3]),
    .odat0_out(out_dut[2:2]),
    .odat1_out(out_dut[1:1]),
    .odat_async_out(out_dut[0:0])
  );
  autovcoder_004581__ref ref_i (
    .pd_data_in1(i_0),
    .pd_data_in0(i_1),
    .iclkin_dist_in1(i_2),
    .iclkin_dist_in0(i_3),
    .idata0_in1(i_4),
    .idata0_in0(i_5),
    .idata1_in1(i_6),
    .idata1_in0(i_7),
    .idataselb_in1(i_8),
    .idataselb_in0(i_9),
    .iddren_in1(i_10),
    .iddren_in0(i_11),
    .ilaunch_clk_in1(i_12),
    .ilaunch_clk_in0(i_13),
    .ilpbk_dat_in1(i_14),
    .ilpbk_dat_in0(i_15),
    .ilpbk_en_in1(i_16),
    .ilpbk_en_in0(i_17),
    .irxen_in1(i_18),
    .irxen_in0(i_19),
    .istrbclk_in1(i_20),
    .istrbclk_in0(i_21),
    .itxen_in1(i_22),
    .itxen_in0(i_23),
    .indrv_in1(i_24),
    .indrv_in0(i_25),
    .ipdrv_in1(i_26),
    .ipdrv_in0(i_27),
    .async_dat_in1(i_28),
    .async_dat_in0(i_29),
    .oclkb_in1(i_30),
    .oclkb_in0(i_31),
    .oclk_in1(i_32),
    .oclk_in0(i_33),
    .odat0_in1(i_34),
    .odat0_in0(i_35),
    .odat1_in1(i_36),
    .odat1_in0(i_37),
    .odat_async_in1(i_38),
    .odat_async_in0(i_39),
    .shift_en(i_40),
    .iclkin_dist_out(out_ref[23:23]),
    .idata0_out(out_ref[22:22]),
    .idata1_out(out_ref[21:21]),
    .idataselb_out(out_ref[20:20]),
    .iddren_out(out_ref[19:19]),
    .ilaunch_clk_out(out_ref[18:18]),
    .ilpbk_dat_out(out_ref[17:17]),
    .ilpbk_en_out(out_ref[16:16]),
    .irxen_out(out_ref[15:13]),
    .istrbclk_out(out_ref[12:12]),
    .itxen_out(out_ref[11:11]),
    .indrv_out(out_ref[10:9]),
    .ipdrv_out(out_ref[8:7]),
    .async_dat_out(out_ref[6:6]),
    .pd_data_out(out_ref[5:5]),
    .oclkb_out(out_ref[4:4]),
    .oclk_out(out_ref[3:3]),
    .odat0_out(out_ref[2:2]),
    .odat1_out(out_ref[1:1]),
    .odat_async_out(out_ref[0:0])
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
    seed = 344359768;
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
      i_26 = {$random(seed)};
      i_27 = {$random(seed)};
      i_28 = {$random(seed)};
      i_29 = {$random(seed)};
      i_30 = {$random(seed)};
      i_31 = {$random(seed)};
      i_32 = {$random(seed)};
      i_33 = {$random(seed)};
      i_34 = {$random(seed)};
      i_35 = {$random(seed)};
      i_36 = {$random(seed)};
      i_37 = {$random(seed)};
      i_38 = {$random(seed)};
      i_39 = {$random(seed)};
      i_40 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
