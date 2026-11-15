// Hidden tests: 5000 cycles of seeded random inputs (seed 2298900184); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 95;
  reg clk;
  reg [0:0] i_0;
  reg [7:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [31:0] i_5;
  reg [0:0] i_6;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_01107 dut (
    .clk(clk),
    .rst(i_0),
    .rx_byte(i_1),
    .received(i_2),
    .recv_error(i_3),
    .is_transmitting(i_4),
    .cpu_data_rd(i_5),
    .cpu_active(i_6),
    .leds(out_dut[94:79]),
    .cpu_address(out_dut[78:47]),
    .cpu_start(out_dut[46:46]),
    .cpu_selection(out_dut[45:42]),
    .cpu_write(out_dut[41:41]),
    .cpu_data_wr(out_dut[40:9]),
    .transmit(out_dut[8:8]),
    .tx_byte(out_dut[7:0])
  );
  rtlpp_01107__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .rx_byte(i_1),
    .received(i_2),
    .recv_error(i_3),
    .is_transmitting(i_4),
    .cpu_data_rd(i_5),
    .cpu_active(i_6),
    .leds(out_ref[94:79]),
    .cpu_address(out_ref[78:47]),
    .cpu_start(out_ref[46:46]),
    .cpu_selection(out_ref[45:42]),
    .cpu_write(out_ref[41:41]),
    .cpu_data_wr(out_ref[40:9]),
    .transmit(out_ref[8:8]),
    .tx_byte(out_ref[7:0])
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
    seed = 2298900184;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
