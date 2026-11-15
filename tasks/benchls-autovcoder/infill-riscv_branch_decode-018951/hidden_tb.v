// Hidden tests: 5000 cycles of seeded random inputs (seed 2151829153); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 52;
  reg clk;
  reg [31:0] i_0;
  reg [39:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_018951 dut (
    .io_inst(i_0),
    .io_pc(i_1),
    .io_out_is_ret(out_dut[51:51]),
    .io_out_is_call(out_dut[50:50]),
    .io_out_target(out_dut[49:10]),
    .io_out_cfi_type(out_dut[9:7]),
    .io_out_sfb_offset_valid(out_dut[6:6]),
    .io_out_sfb_offset_bits(out_dut[5:0])
  );
  autovcoder_018951__ref ref_i (
    .io_inst(i_0),
    .io_pc(i_1),
    .io_out_is_ret(out_ref[51:51]),
    .io_out_is_call(out_ref[50:50]),
    .io_out_target(out_ref[49:10]),
    .io_out_cfi_type(out_ref[9:7]),
    .io_out_sfb_offset_valid(out_ref[6:6]),
    .io_out_sfb_offset_bits(out_ref[5:0])
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
    seed = 2151829153;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed), $random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
