// Hidden tests: 5000 cycles of seeded random inputs (seed 3654393847); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 54;
  reg clk;
  reg [11:0] i_0;
  reg [11:0] i_1;
  reg [11:0] i_2;
  reg [11:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_009440 dut (
    .clk(clk),
    .pixel_in(i_0),
    .predic_in(i_1),
    .pixel_in$1(i_2),
    .predic_in$2(i_3),
    .end_in(i_4),
    .rst(i_5),
    .valid_in(i_6),
    .val_out(out_dut[53:41]),
    .val_out$3(out_dut[40:28]),
    .val_out$4(out_dut[27:15]),
    .val_out$5(out_dut[14:2]),
    .valid_out(out_dut[1:1]),
    .end_out(out_dut[0:0])
  );
  autovcoder_009440__ref ref_i (
    .clk(clk),
    .pixel_in(i_0),
    .predic_in(i_1),
    .pixel_in$1(i_2),
    .predic_in$2(i_3),
    .end_in(i_4),
    .rst(i_5),
    .valid_in(i_6),
    .val_out(out_ref[53:41]),
    .val_out$3(out_ref[40:28]),
    .val_out$4(out_ref[27:15]),
    .val_out$5(out_ref[14:2]),
    .valid_out(out_ref[1:1]),
    .end_out(out_ref[0:0])
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
    seed = 3654393847;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
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
