// Hidden tests: 5000 cycles of seeded random inputs (seed 1877622652); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 413;
  reg clk;
  reg [255:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_00160 dut (
    .read_command_data_in(i_0),
    .read_stop(i_1),
    .read_sw_reset(i_2),
    .read_command_data_out(out_dut[412:157]),
    .read_address(out_dut[156:93]),
    .read_length(out_dut[92:61]),
    .read_transmit_channel(out_dut[60:53]),
    .read_generate_sop(out_dut[52:52]),
    .read_generate_eop(out_dut[51:51]),
    .read_park(out_dut[50:50]),
    .read_transfer_complete_IRQ_mask(out_dut[49:49]),
    .read_burst_count(out_dut[48:41]),
    .read_stride(out_dut[40:25]),
    .read_sequence_number(out_dut[24:9]),
    .read_transmit_error(out_dut[8:1]),
    .read_early_done_enable(out_dut[0:0])
  );
  rtlpp_00160__ref ref_i (
    .read_command_data_in(i_0),
    .read_stop(i_1),
    .read_sw_reset(i_2),
    .read_command_data_out(out_ref[412:157]),
    .read_address(out_ref[156:93]),
    .read_length(out_ref[92:61]),
    .read_transmit_channel(out_ref[60:53]),
    .read_generate_sop(out_ref[52:52]),
    .read_generate_eop(out_ref[51:51]),
    .read_park(out_ref[50:50]),
    .read_transfer_complete_IRQ_mask(out_ref[49:49]),
    .read_burst_count(out_ref[48:41]),
    .read_stride(out_ref[40:25]),
    .read_sequence_number(out_ref[24:9]),
    .read_transmit_error(out_ref[8:1]),
    .read_early_done_enable(out_ref[0:0])
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
    seed = 1877622652;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_1 = {$random(seed)};
      i_2 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
