// Hidden tests: 5000 cycles of seeded random inputs (seed 3881102434); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 72;
  reg clk;
  reg [7:0] i_0;
  reg [15:0] i_1;
  reg [15:0] i_2;
  reg [15:0] i_3;
  reg [15:0] i_4;
  reg [15:0] i_5;
  reg [15:0] i_6;
  reg [15:0] i_7;
  reg [15:0] i_8;
  reg [15:0] i_9;
  reg [15:0] i_10;
  reg [15:0] i_11;
  reg [15:0] i_12;
  reg [15:0] i_13;
  reg [15:0] i_14;
  reg [15:0] i_15;
  reg [15:0] i_16;
  reg [15:0] i_17;
  reg [15:0] i_18;
  reg [15:0] i_19;
  reg [15:0] i_20;
  reg [15:0] i_21;
  reg [15:0] i_22;
  reg [15:0] i_23;
  reg [15:0] i_24;
  reg [15:0] i_25;
  reg [15:0] i_26;
  reg [15:0] i_27;
  reg [15:0] i_28;
  reg [15:0] i_29;
  reg [15:0] i_30;
  reg [0:0] i_31;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_025439 dut (
    .clk(clk),
    .selector(i_0),
    .data_300_1(i_1),
    .data_301_1(i_2),
    .data_302_1(i_3),
    .data_303_1(i_4),
    .data_304_1(i_5),
    .data_305_1(i_6),
    .data_306_1(i_7),
    .data_307_1(i_8),
    .data_308_1(i_9),
    .data_309_1(i_10),
    .data_310_1(i_11),
    .data_311_1(i_12),
    .data_312_1(i_13),
    .data_313_1(i_14),
    .data_314_1(i_15),
    .data_315_1(i_16),
    .data_316_1(i_17),
    .data_317_1(i_18),
    .data_318_1(i_19),
    .data_319_1(i_20),
    .data_320_1(i_21),
    .data_321_1(i_22),
    .data_322_1(i_23),
    .data_323_1(i_24),
    .data_324_1(i_25),
    .data_325_1(i_26),
    .data_326_1(i_27),
    .data_327_1(i_28),
    .data_328_1(i_29),
    .data_329_1(i_30),
    .reset(i_31),
    .adr(out_dut[71:64]),
    .adr_first_reg_tx(out_dut[63:48]),
    .num_reg_tx(out_dut[47:40]),
    .adr_first_reg_rx(out_dut[39:24]),
    .num_reg_rx(out_dut[23:16]),
    .data_out(out_dut[15:0])
  );
  autovcoder_025439__ref ref_i (
    .clk(clk),
    .selector(i_0),
    .data_300_1(i_1),
    .data_301_1(i_2),
    .data_302_1(i_3),
    .data_303_1(i_4),
    .data_304_1(i_5),
    .data_305_1(i_6),
    .data_306_1(i_7),
    .data_307_1(i_8),
    .data_308_1(i_9),
    .data_309_1(i_10),
    .data_310_1(i_11),
    .data_311_1(i_12),
    .data_312_1(i_13),
    .data_313_1(i_14),
    .data_314_1(i_15),
    .data_315_1(i_16),
    .data_316_1(i_17),
    .data_317_1(i_18),
    .data_318_1(i_19),
    .data_319_1(i_20),
    .data_320_1(i_21),
    .data_321_1(i_22),
    .data_322_1(i_23),
    .data_323_1(i_24),
    .data_324_1(i_25),
    .data_325_1(i_26),
    .data_326_1(i_27),
    .data_327_1(i_28),
    .data_328_1(i_29),
    .data_329_1(i_30),
    .reset(i_31),
    .adr(out_ref[71:64]),
    .adr_first_reg_tx(out_ref[63:48]),
    .num_reg_tx(out_ref[47:40]),
    .adr_first_reg_rx(out_ref[39:24]),
    .num_reg_rx(out_ref[23:16]),
    .data_out(out_ref[15:0])
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
    seed = 3881102434;
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
      i_31 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
