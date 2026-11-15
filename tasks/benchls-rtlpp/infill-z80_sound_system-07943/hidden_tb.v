// Hidden tests: 5000 cycles of seeded random inputs (seed 3698001079); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 69;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [7:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [7:0] i_8;
  reg [0:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_07943 dut (
    .CLK(clk),
    .RESET(i_0),
    .CE_N(i_1),
    .CE_P(i_2),
    .A(i_3),
    .DI(i_4),
    .CS_n(i_5),
    .WR_n(i_6),
    .RD_n(i_7),
    .MEM_DO(i_8),
    .MEM_WAIT(i_9),
    .DO(out_dut[68:61]),
    .MEM_ADDR(out_dut[60:40]),
    .MEM_DI(out_dut[39:32]),
    .MEM_RD(out_dut[31:31]),
    .MEM_WR(out_dut[30:30]),
    .OUTL(out_dut[29:15]),
    .OUTR(out_dut[14:0])
  );
  rtlpp_07943__ref ref_i (
    .CLK(clk),
    .RESET(i_0),
    .CE_N(i_1),
    .CE_P(i_2),
    .A(i_3),
    .DI(i_4),
    .CS_n(i_5),
    .WR_n(i_6),
    .RD_n(i_7),
    .MEM_DO(i_8),
    .MEM_WAIT(i_9),
    .DO(out_ref[68:61]),
    .MEM_ADDR(out_ref[60:40]),
    .MEM_DI(out_ref[39:32]),
    .MEM_RD(out_ref[31:31]),
    .MEM_WR(out_ref[30:30]),
    .OUTL(out_ref[29:15]),
    .OUTR(out_ref[14:0])
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
    seed = 3698001079;
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
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
