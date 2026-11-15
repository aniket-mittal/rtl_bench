// Hidden tests: 5000 cycles of seeded random inputs (seed 1468899273); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 36;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [15:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [7:0] i_6;
  reg [0:0] i_7;
  reg [1:0] i_8;
  reg [1:0] i_9;
  reg [6:0] i_10;
  reg [6:0] i_11;
  reg [0:0] i_12;
  reg [7:0] i_13;
  reg [7:0] i_14;
  reg [7:0] i_15;
  reg [7:0] i_16;
  reg [7:0] i_17;
  reg [7:0] i_18;
  reg [3:0] i_19;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_071220 dut (
    .clk(clk),
    .rst(i_0),
    .cpu_cen(i_1),
    .A(i_2),
    .VMA(i_3),
    .RnW(i_4),
    .pal_cs(i_5),
    .rom_data(i_6),
    .rom_ok(i_7),
    .cab_1p(i_8),
    .coin(i_9),
    .joystick1(i_10),
    .joystick2(i_11),
    .service(i_12),
    .cpu_dout(i_13),
    .pal_dout(i_14),
    .gfx1_dout(i_15),
    .ram_dout(i_16),
    .dipsw_a(i_17),
    .dipsw_b(i_18),
    .dipsw_c(i_19),
    .gfx1_cs(out_dut[35:35]),
    .snd_irq(out_dut[34:34]),
    .snd_latch(out_dut[33:26]),
    .rom_addr(out_dut[25:10]),
    .rom_cs(out_dut[9:9]),
    .ram_cs(out_dut[8:8]),
    .cpu_din(out_dut[7:0])
  );
  autovcoder_071220__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .cpu_cen(i_1),
    .A(i_2),
    .VMA(i_3),
    .RnW(i_4),
    .pal_cs(i_5),
    .rom_data(i_6),
    .rom_ok(i_7),
    .cab_1p(i_8),
    .coin(i_9),
    .joystick1(i_10),
    .joystick2(i_11),
    .service(i_12),
    .cpu_dout(i_13),
    .pal_dout(i_14),
    .gfx1_dout(i_15),
    .ram_dout(i_16),
    .dipsw_a(i_17),
    .dipsw_b(i_18),
    .dipsw_c(i_19),
    .gfx1_cs(out_ref[35:35]),
    .snd_irq(out_ref[34:34]),
    .snd_latch(out_ref[33:26]),
    .rom_addr(out_ref[25:10]),
    .rom_cs(out_ref[9:9]),
    .ram_cs(out_ref[8:8]),
    .cpu_din(out_ref[7:0])
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
    seed = 1468899273;
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
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
