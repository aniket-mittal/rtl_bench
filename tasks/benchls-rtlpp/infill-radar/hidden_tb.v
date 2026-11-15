// Hidden tests: 5000 cycles of seeded random inputs (seed 3871884378); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 64;
  reg clk;
  reg [6:0] i_0;
  reg [31:0] i_1;
  reg [0:0] i_2;
  reg [15:0] i_3;
  reg [15:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  radar dut (
    .clk_i(clk),
    .saddr_i(i_0),
    .sdata_i(i_1),
    .s_strobe_i(i_2),
    .rx_adc_i_i(i_3),
    .rx_adc_q_i(i_4),
    .tx_side_o(out_dut[63:63]),
    .tx_strobe_o(out_dut[62:62]),
    .tx_dac_i_o(out_dut[61:48]),
    .tx_dac_q_o(out_dut[47:34]),
    .io_tx_ena_o(out_dut[33:33]),
    .rx_strobe_o(out_dut[32:32]),
    .rx_ech_i_o(out_dut[31:16]),
    .rx_ech_q_o(out_dut[15:0])
  );
  radar__ref ref_i (
    .clk_i(clk),
    .saddr_i(i_0),
    .sdata_i(i_1),
    .s_strobe_i(i_2),
    .rx_adc_i_i(i_3),
    .rx_adc_q_i(i_4),
    .tx_side_o(out_ref[63:63]),
    .tx_strobe_o(out_ref[62:62]),
    .tx_dac_i_o(out_ref[61:48]),
    .tx_dac_q_o(out_ref[47:34]),
    .io_tx_ena_o(out_ref[33:33]),
    .rx_strobe_o(out_ref[32:32]),
    .rx_ech_i_o(out_ref[31:16]),
    .rx_ech_q_o(out_ref[15:0])
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
    seed = 3871884378;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
