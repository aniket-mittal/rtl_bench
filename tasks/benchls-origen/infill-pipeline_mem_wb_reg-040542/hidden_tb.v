// Hidden tests: 5000 cycles of seeded random inputs (seed 1338825282); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 169;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [4:0] i_6;
  reg [31:0] i_7;
  reg [31:0] i_8;
  reg [31:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_040542 dut (
    .clk(clk),
    .RegWriteM(i_0),
    .MemtoRegM(i_1),
    .JalM(i_2),
    .sysM(i_3),
    .ReadDataM(i_4),
    .ALUOutM(i_5),
    .WriteRegM(i_6),
    .PCPlus4M(i_7),
    .regvM(i_8),
    .regaM(i_9),
    .RegWriteW(out_dut[168:168]),
    .MemtoRegW(out_dut[167:167]),
    .JalW(out_dut[166:166]),
    .sysW(out_dut[165:165]),
    .ReadDataW(out_dut[164:133]),
    .ALUOutW(out_dut[132:101]),
    .WriteRegW(out_dut[100:96]),
    .PCPlus4W(out_dut[95:64]),
    .regvW(out_dut[63:32]),
    .regaW(out_dut[31:0])
  );
  origen_040542__ref ref_i (
    .clk(clk),
    .RegWriteM(i_0),
    .MemtoRegM(i_1),
    .JalM(i_2),
    .sysM(i_3),
    .ReadDataM(i_4),
    .ALUOutM(i_5),
    .WriteRegM(i_6),
    .PCPlus4M(i_7),
    .regvM(i_8),
    .regaM(i_9),
    .RegWriteW(out_ref[168:168]),
    .MemtoRegW(out_ref[167:167]),
    .JalW(out_ref[166:166]),
    .sysW(out_ref[165:165]),
    .ReadDataW(out_ref[164:133]),
    .ALUOutW(out_ref[132:101]),
    .WriteRegW(out_ref[100:96]),
    .PCPlus4W(out_ref[95:64]),
    .regvW(out_ref[63:32]),
    .regaW(out_ref[31:0])
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
    seed = 1338825282;
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
