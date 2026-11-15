// Hidden tests: 5000 cycles of seeded random inputs (seed 2962250120); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 60;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [7:0] i_2;
  reg [7:0] i_3;
  reg [7:0] i_4;
  reg [7:0] i_5;
  reg [7:0] i_6;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_153648 dut (
    .clk(clk),
    .rst(i_0),
    .carryout(i_1),
    .result(i_2),
    .read1(i_3),
    .read2(i_4),
    .instruction(i_5),
    .data(i_6),
    .ctrl0(out_dut[59:58]),
    .ctrl1(out_dut[57:57]),
    .clear(out_dut[56:56]),
    .reg1(out_dut[55:55]),
    .reg2(out_dut[54:54]),
    .write(out_dut[53:53]),
    .opcode(out_dut[52:49]),
    .address(out_dut[48:41]),
    .input1(out_dut[40:33]),
    .input2(out_dut[32:25]),
    .datareg(out_dut[24:17]),
    .out(out_dut[16:9]),
    .jump(out_dut[8:8]),
    .jumpaddress(out_dut[7:0])
  );
  origen_153648__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .carryout(i_1),
    .result(i_2),
    .read1(i_3),
    .read2(i_4),
    .instruction(i_5),
    .data(i_6),
    .ctrl0(out_ref[59:58]),
    .ctrl1(out_ref[57:57]),
    .clear(out_ref[56:56]),
    .reg1(out_ref[55:55]),
    .reg2(out_ref[54:54]),
    .write(out_ref[53:53]),
    .opcode(out_ref[52:49]),
    .address(out_ref[48:41]),
    .input1(out_ref[40:33]),
    .input2(out_ref[32:25]),
    .datareg(out_ref[24:17]),
    .out(out_ref[16:9]),
    .jump(out_ref[8:8]),
    .jumpaddress(out_ref[7:0])
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
    seed = 2962250120;
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
