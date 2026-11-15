// Hidden tests: 5000 cycles of seeded random inputs (seed 407447154); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 27;
  reg clk;
  reg [15:0] i_0;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_05965 dut (
    .cmd_in(i_0),
    .cmd_write(out_dut[26:26]),
    .cmd_write_stop(out_dut[25:25]),
    .cmd_read(out_dut[24:24]),
    .cmd_atomic_add(out_dut[23:23]),
    .cmd_atomic_and(out_dut[22:22]),
    .cmd_atomic_or(out_dut[21:21]),
    .cmd_atomic_xor(out_dut[20:20]),
    .cmd_cas(out_dut[19:19]),
    .cmd_opcode(out_dut[18:15]),
    .cmd_length(out_dut[14:11]),
    .cmd_size(out_dut[10:8]),
    .cmd_user(out_dut[7:0])
  );
  mg_05965__ref ref_i (
    .cmd_in(i_0),
    .cmd_write(out_ref[26:26]),
    .cmd_write_stop(out_ref[25:25]),
    .cmd_read(out_ref[24:24]),
    .cmd_atomic_add(out_ref[23:23]),
    .cmd_atomic_and(out_ref[22:22]),
    .cmd_atomic_or(out_ref[21:21]),
    .cmd_atomic_xor(out_ref[20:20]),
    .cmd_cas(out_ref[19:19]),
    .cmd_opcode(out_ref[18:15]),
    .cmd_length(out_ref[14:11]),
    .cmd_size(out_ref[10:8]),
    .cmd_user(out_ref[7:0])
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
    seed = 407447154;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
