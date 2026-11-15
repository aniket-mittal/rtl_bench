// Hidden tests: 5000 cycles of seeded random inputs (seed 3342625129); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 288;
  reg clk;
  reg [0:0] i_0;
  reg [4:0] i_1;
  reg [4:0] i_2;
  reg [4:0] i_3;
  reg [31:0] i_4;
  reg [0:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_025919 dut (
    .clock(clk),
    .reset(i_0),
    .addra(i_1),
    .addrb(i_2),
    .addrc(i_3),
    .datac(i_4),
    .enc(i_5),
    .dataa(out_dut[287:256]),
    .datab(out_dut[255:224]),
    .ass_dataa(out_dut[223:192]),
    .ass_datab(out_dut[191:160]),
    .regout$0(out_dut[159:128]),
    .regout$1(out_dut[127:96]),
    .regout$2(out_dut[95:64]),
    .regout$3(out_dut[63:32]),
    .regout$4(out_dut[31:0])
  );
  origen_025919__ref ref_i (
    .clock(clk),
    .reset(i_0),
    .addra(i_1),
    .addrb(i_2),
    .addrc(i_3),
    .datac(i_4),
    .enc(i_5),
    .dataa(out_ref[287:256]),
    .datab(out_ref[255:224]),
    .ass_dataa(out_ref[223:192]),
    .ass_datab(out_ref[191:160]),
    .regout$0(out_ref[159:128]),
    .regout$1(out_ref[127:96]),
    .regout$2(out_ref[95:64]),
    .regout$3(out_ref[63:32]),
    .regout$4(out_ref[31:0])
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
    seed = 3342625129;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
