// Hidden tests: 5000 cycles of seeded random inputs (seed 133352129); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 156;
  reg clk;
  reg [0:0] i_0;
  reg [7:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [63:0] i_5;
  reg [63:0] i_6;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_01800 dut (
    .clk(clk),
    .rst(i_0),
    .din(i_1),
    .mvalid(i_2),
    .done(i_3),
    .sready(i_4),
    .ciphered(i_5),
    .odat(i_6),
    .ready(out_dut[155:155]),
    .tx_enable(out_dut[154:154]),
    .svalid(out_dut[153:153]),
    .sdata(out_dut[152:145]),
    .idat(out_dut[144:81]),
    .key(out_dut[80:1]),
    .load(out_dut[0:0])
  );
  rtlpp_01800__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .din(i_1),
    .mvalid(i_2),
    .done(i_3),
    .sready(i_4),
    .ciphered(i_5),
    .odat(i_6),
    .ready(out_ref[155:155]),
    .tx_enable(out_ref[154:154]),
    .svalid(out_ref[153:153]),
    .sdata(out_ref[152:145]),
    .idat(out_ref[144:81]),
    .key(out_ref[80:1]),
    .load(out_ref[0:0])
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
    seed = 133352129;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed), $random(seed)};
      i_6 = {$random(seed), $random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
