// Hidden tests: 5000 cycles of seeded random inputs (seed 3313970724); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 16;
  reg clk;
  reg [3:0] i_0;
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
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_134645 dut (
    .qspi_ui_dq_i(i_0),
    .dut_io_pads_qspi_cs_0_o_oval(i_1),
    .dut_io_pads_qspi_dq_3_o_oval(i_2),
    .dut_io_pads_qspi_dq_2_o_oval(i_3),
    .dut_io_pads_qspi_dq_1_o_oval(i_4),
    .dut_io_pads_qspi_dq_0_o_oval(i_5),
    .dut_io_pads_qspi_dq_3_o_oe(i_6),
    .dut_io_pads_qspi_dq_2_o_oe(i_7),
    .dut_io_pads_qspi_dq_1_o_oe(i_8),
    .dut_io_pads_qspi_dq_0_o_oe(i_9),
    .dut_io_pads_qspi_sck_o_oval(i_10),
    .reset_periph(out_dut[15:15]),
    .slowclk(out_dut[14:14]),
    .qspi_cs(out_dut[13:13]),
    .qspi_ui_dq_o(out_dut[12:9]),
    .qspi_ui_dq_oe(out_dut[8:5]),
    .dut_io_pads_qspi_dq_0_i_ival(out_dut[4:4]),
    .dut_io_pads_qspi_dq_1_i_ival(out_dut[3:3]),
    .dut_io_pads_qspi_dq_2_i_ival(out_dut[2:2]),
    .dut_io_pads_qspi_dq_3_i_ival(out_dut[1:1]),
    .qspi_sck(out_dut[0:0])
  );
  origen_134645__ref ref_i (
    .qspi_ui_dq_i(i_0),
    .dut_io_pads_qspi_cs_0_o_oval(i_1),
    .dut_io_pads_qspi_dq_3_o_oval(i_2),
    .dut_io_pads_qspi_dq_2_o_oval(i_3),
    .dut_io_pads_qspi_dq_1_o_oval(i_4),
    .dut_io_pads_qspi_dq_0_o_oval(i_5),
    .dut_io_pads_qspi_dq_3_o_oe(i_6),
    .dut_io_pads_qspi_dq_2_o_oe(i_7),
    .dut_io_pads_qspi_dq_1_o_oe(i_8),
    .dut_io_pads_qspi_dq_0_o_oe(i_9),
    .dut_io_pads_qspi_sck_o_oval(i_10),
    .reset_periph(out_ref[15:15]),
    .slowclk(out_ref[14:14]),
    .qspi_cs(out_ref[13:13]),
    .qspi_ui_dq_o(out_ref[12:9]),
    .qspi_ui_dq_oe(out_ref[8:5]),
    .dut_io_pads_qspi_dq_0_i_ival(out_ref[4:4]),
    .dut_io_pads_qspi_dq_1_i_ival(out_ref[3:3]),
    .dut_io_pads_qspi_dq_2_i_ival(out_ref[2:2]),
    .dut_io_pads_qspi_dq_3_i_ival(out_ref[1:1]),
    .qspi_sck(out_ref[0:0])
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
    seed = 3313970724;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
