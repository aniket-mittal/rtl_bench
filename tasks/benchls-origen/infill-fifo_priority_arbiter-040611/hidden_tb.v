// Hidden tests: 5000 cycles of seeded random inputs (seed 453624931); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 14;
  reg clk;
  reg [0:0] i_0;
  reg [7:0] i_1;
  reg [7:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [7:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_040611 dut (
    .clk_fsm(clk),
    .sending_clk_sync(i_0),
    .data_fifo_xcvr(i_1),
    .data_fifo_uart(i_2),
    .fifo_empty_xcvr(i_3),
    .fifo_empty_uart(i_4),
    .padding_char(i_5),
    .fifo_read_xcvr(out_dut[13:13]),
    .fifo_read_uart(out_dut[12:12]),
    .data_8b10(out_dut[11:4]),
    .is_control_char(out_dut[3:3]),
    .is_padding_char(out_dut[2:2]),
    .enable_data_out(out_dut[1:1]),
    .busy(out_dut[0:0])
  );
  origen_040611__ref ref_i (
    .clk_fsm(clk),
    .sending_clk_sync(i_0),
    .data_fifo_xcvr(i_1),
    .data_fifo_uart(i_2),
    .fifo_empty_xcvr(i_3),
    .fifo_empty_uart(i_4),
    .padding_char(i_5),
    .fifo_read_xcvr(out_ref[13:13]),
    .fifo_read_uart(out_ref[12:12]),
    .data_8b10(out_ref[11:4]),
    .is_control_char(out_ref[3:3]),
    .is_padding_char(out_ref[2:2]),
    .enable_data_out(out_ref[1:1]),
    .busy(out_ref[0:0])
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
    seed = 453624931;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
