// Hidden tests: 5000 cycles of seeded random inputs (seed 4232861165); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 79;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [31:0] i_8;
  reg [31:0] i_9;
  reg [4:0] i_10;
  reg [4:0] i_11;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_078230 dut (
    .clockIn(clk),
    .reset(i_0),
    .stall(i_1),
    .memStall(i_2),
    .haltIn(i_3),
    .regWriteIn(i_4),
    .mem2RegIn(i_5),
    .memWriteIn(i_6),
    .memReadIn(i_7),
    .data1In(i_8),
    .data2In(i_9),
    .regIn(i_10),
    .reg2In(i_11),
    .haltOut(out_dut[78:78]),
    .regWriteOut(out_dut[77:77]),
    .mem2RegOut(out_dut[76:76]),
    .memWriteOut(out_dut[75:75]),
    .memReadOut(out_dut[74:74]),
    .data1Out(out_dut[73:42]),
    .data2Out(out_dut[41:10]),
    .regOut(out_dut[9:5]),
    .reg2Out(out_dut[4:0])
  );
  origen_078230__ref ref_i (
    .clockIn(clk),
    .reset(i_0),
    .stall(i_1),
    .memStall(i_2),
    .haltIn(i_3),
    .regWriteIn(i_4),
    .mem2RegIn(i_5),
    .memWriteIn(i_6),
    .memReadIn(i_7),
    .data1In(i_8),
    .data2In(i_9),
    .regIn(i_10),
    .reg2In(i_11),
    .haltOut(out_ref[78:78]),
    .regWriteOut(out_ref[77:77]),
    .mem2RegOut(out_ref[76:76]),
    .memWriteOut(out_ref[75:75]),
    .memReadOut(out_ref[74:74]),
    .data1Out(out_ref[73:42]),
    .data2Out(out_ref[41:10]),
    .regOut(out_ref[9:5]),
    .reg2Out(out_ref[4:0])
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
    seed = 4232861165;
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
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
