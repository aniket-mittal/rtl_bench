// Hidden tests: 5000 cycles of seeded random inputs (seed 3268168079); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 76;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [7:0] i_3;
  reg [31:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_04112 dut (
    .clk(clk),
    .reset_n(i_0),
    .cs(i_1),
    .we(i_2),
    .address(i_3),
    .write_data(i_4),
    .discard(i_5),
    .test_mode(i_6),
    .entropy_ack(i_7),
    .debug_update(i_8),
    .read_data(out_dut[75:44]),
    .error(out_dut[43:43]),
    .security_error(out_dut[42:42]),
    .entropy_enabled(out_dut[41:41]),
    .entropy_data(out_dut[40:9]),
    .entropy_valid(out_dut[8:8]),
    .debug(out_dut[7:0])
  );
  mg_04112__ref ref_i (
    .clk(clk),
    .reset_n(i_0),
    .cs(i_1),
    .we(i_2),
    .address(i_3),
    .write_data(i_4),
    .discard(i_5),
    .test_mode(i_6),
    .entropy_ack(i_7),
    .debug_update(i_8),
    .read_data(out_ref[75:44]),
    .error(out_ref[43:43]),
    .security_error(out_ref[42:42]),
    .entropy_enabled(out_ref[41:41]),
    .entropy_data(out_ref[40:9]),
    .entropy_valid(out_ref[8:8]),
    .debug(out_ref[7:0])
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
    seed = 3268168079;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
