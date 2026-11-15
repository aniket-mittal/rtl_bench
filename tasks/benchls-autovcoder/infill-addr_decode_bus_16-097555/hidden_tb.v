// Hidden tests: 5000 cycles of seeded random inputs (seed 3836114308); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 82;
  reg clk;
  reg [0:0] i_0;
  reg [3:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [15:0] i_4;
  reg [15:0] i_5;
  reg [511:0] i_6;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_097555 dut (
    .req_valid(i_0),
    .req_addr(i_1),
    .write_valid(i_2),
    .read_ack(i_3),
    .slv_req_ready(i_4),
    .slv_read_valid(i_5),
    .slv_read_data(i_6),
    .req_ready(out_dut[81:81]),
    .read_valid(out_dut[80:80]),
    .read_data(out_dut[79:48]),
    .slv_req_valid(out_dut[47:32]),
    .slv_write_valid(out_dut[31:16]),
    .slv_read_ack(out_dut[15:0])
  );
  autovcoder_097555__ref ref_i (
    .req_valid(i_0),
    .req_addr(i_1),
    .write_valid(i_2),
    .read_ack(i_3),
    .slv_req_ready(i_4),
    .slv_read_valid(i_5),
    .slv_read_data(i_6),
    .req_ready(out_ref[81:81]),
    .read_valid(out_ref[80:80]),
    .read_data(out_ref[79:48]),
    .slv_req_valid(out_ref[47:32]),
    .slv_write_valid(out_ref[31:16]),
    .slv_read_ack(out_ref[15:0])
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
    seed = 3836114308;
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
      i_6 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
