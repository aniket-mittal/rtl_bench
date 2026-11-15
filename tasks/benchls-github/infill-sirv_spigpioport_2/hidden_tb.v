// Hidden tests: 5000 cycles of seeded random inputs (seed 2667030782); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 34;
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
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  sirv_spigpioport_2 dut (
    .clock(clk),
    .reset(i_0),
    .io_spi_sck(i_1),
    .io_spi_dq_0_o(i_2),
    .io_spi_dq_0_oe(i_3),
    .io_spi_dq_1_o(i_4),
    .io_spi_dq_1_oe(i_5),
    .io_spi_dq_2_o(i_6),
    .io_spi_dq_2_oe(i_7),
    .io_spi_dq_3_o(i_8),
    .io_spi_dq_3_oe(i_9),
    .io_spi_cs_0(i_10),
    .io_pins_sck_i_ival(i_11),
    .io_pins_dq_0_i_ival(i_12),
    .io_pins_dq_1_i_ival(i_13),
    .io_pins_dq_2_i_ival(i_14),
    .io_pins_dq_3_i_ival(i_15),
    .io_pins_cs_0_i_ival(i_16),
    .io_spi_dq_0_i(out_dut[33:33]),
    .io_spi_dq_1_i(out_dut[32:32]),
    .io_spi_dq_2_i(out_dut[31:31]),
    .io_spi_dq_3_i(out_dut[30:30]),
    .io_pins_sck_o_oval(out_dut[29:29]),
    .io_pins_sck_o_oe(out_dut[28:28]),
    .io_pins_sck_o_ie(out_dut[27:27]),
    .io_pins_sck_o_pue(out_dut[26:26]),
    .io_pins_sck_o_ds(out_dut[25:25]),
    .io_pins_dq_0_o_oval(out_dut[24:24]),
    .io_pins_dq_0_o_oe(out_dut[23:23]),
    .io_pins_dq_0_o_ie(out_dut[22:22]),
    .io_pins_dq_0_o_pue(out_dut[21:21]),
    .io_pins_dq_0_o_ds(out_dut[20:20]),
    .io_pins_dq_1_o_oval(out_dut[19:19]),
    .io_pins_dq_1_o_oe(out_dut[18:18]),
    .io_pins_dq_1_o_ie(out_dut[17:17]),
    .io_pins_dq_1_o_pue(out_dut[16:16]),
    .io_pins_dq_1_o_ds(out_dut[15:15]),
    .io_pins_dq_2_o_oval(out_dut[14:14]),
    .io_pins_dq_2_o_oe(out_dut[13:13]),
    .io_pins_dq_2_o_ie(out_dut[12:12]),
    .io_pins_dq_2_o_pue(out_dut[11:11]),
    .io_pins_dq_2_o_ds(out_dut[10:10]),
    .io_pins_dq_3_o_oval(out_dut[9:9]),
    .io_pins_dq_3_o_oe(out_dut[8:8]),
    .io_pins_dq_3_o_ie(out_dut[7:7]),
    .io_pins_dq_3_o_pue(out_dut[6:6]),
    .io_pins_dq_3_o_ds(out_dut[5:5]),
    .io_pins_cs_0_o_oval(out_dut[4:4]),
    .io_pins_cs_0_o_oe(out_dut[3:3]),
    .io_pins_cs_0_o_ie(out_dut[2:2]),
    .io_pins_cs_0_o_pue(out_dut[1:1]),
    .io_pins_cs_0_o_ds(out_dut[0:0])
  );
  sirv_spigpioport_2__ref ref_i (
    .clock(clk),
    .reset(i_0),
    .io_spi_sck(i_1),
    .io_spi_dq_0_o(i_2),
    .io_spi_dq_0_oe(i_3),
    .io_spi_dq_1_o(i_4),
    .io_spi_dq_1_oe(i_5),
    .io_spi_dq_2_o(i_6),
    .io_spi_dq_2_oe(i_7),
    .io_spi_dq_3_o(i_8),
    .io_spi_dq_3_oe(i_9),
    .io_spi_cs_0(i_10),
    .io_pins_sck_i_ival(i_11),
    .io_pins_dq_0_i_ival(i_12),
    .io_pins_dq_1_i_ival(i_13),
    .io_pins_dq_2_i_ival(i_14),
    .io_pins_dq_3_i_ival(i_15),
    .io_pins_cs_0_i_ival(i_16),
    .io_spi_dq_0_i(out_ref[33:33]),
    .io_spi_dq_1_i(out_ref[32:32]),
    .io_spi_dq_2_i(out_ref[31:31]),
    .io_spi_dq_3_i(out_ref[30:30]),
    .io_pins_sck_o_oval(out_ref[29:29]),
    .io_pins_sck_o_oe(out_ref[28:28]),
    .io_pins_sck_o_ie(out_ref[27:27]),
    .io_pins_sck_o_pue(out_ref[26:26]),
    .io_pins_sck_o_ds(out_ref[25:25]),
    .io_pins_dq_0_o_oval(out_ref[24:24]),
    .io_pins_dq_0_o_oe(out_ref[23:23]),
    .io_pins_dq_0_o_ie(out_ref[22:22]),
    .io_pins_dq_0_o_pue(out_ref[21:21]),
    .io_pins_dq_0_o_ds(out_ref[20:20]),
    .io_pins_dq_1_o_oval(out_ref[19:19]),
    .io_pins_dq_1_o_oe(out_ref[18:18]),
    .io_pins_dq_1_o_ie(out_ref[17:17]),
    .io_pins_dq_1_o_pue(out_ref[16:16]),
    .io_pins_dq_1_o_ds(out_ref[15:15]),
    .io_pins_dq_2_o_oval(out_ref[14:14]),
    .io_pins_dq_2_o_oe(out_ref[13:13]),
    .io_pins_dq_2_o_ie(out_ref[12:12]),
    .io_pins_dq_2_o_pue(out_ref[11:11]),
    .io_pins_dq_2_o_ds(out_ref[10:10]),
    .io_pins_dq_3_o_oval(out_ref[9:9]),
    .io_pins_dq_3_o_oe(out_ref[8:8]),
    .io_pins_dq_3_o_ie(out_ref[7:7]),
    .io_pins_dq_3_o_pue(out_ref[6:6]),
    .io_pins_dq_3_o_ds(out_ref[5:5]),
    .io_pins_cs_0_o_oval(out_ref[4:4]),
    .io_pins_cs_0_o_oe(out_ref[3:3]),
    .io_pins_cs_0_o_ie(out_ref[2:2]),
    .io_pins_cs_0_o_pue(out_ref[1:1]),
    .io_pins_cs_0_o_ds(out_ref[0:0])
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
    seed = 2667030782;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
