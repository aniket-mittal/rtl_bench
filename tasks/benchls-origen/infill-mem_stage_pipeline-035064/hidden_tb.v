// Hidden tests: 5000 cycles of seeded random inputs (seed 2833480910); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 167;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [0:0] i_5;
  reg [1:0] i_6;
  reg [4:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_035064 dut (
    .clk(clk),
    .rst_n(i_0),
    .memory_stall(i_1),
    .ALU_result_3(i_2),
    .writedata_3(i_3),
    .D_readData(i_4),
    .WriteBack_3(i_5),
    .Mem_3(i_6),
    .Rd_3(i_7),
    .memory_result_4(out_dut[166:135]),
    .ALU_result_4(out_dut[134:103]),
    .forward_result_4(out_dut[102:71]),
    .Rd_4(out_dut[70:66]),
    .WriteBack_4(out_dut[65:65]),
    .Mem2Reg(out_dut[64:64]),
    .D_addr(out_dut[63:34]),
    .D_wen(out_dut[33:33]),
    .D_ren(out_dut[32:32]),
    .D_writeData(out_dut[31:0])
  );
  origen_035064__ref ref_i (
    .clk(clk),
    .rst_n(i_0),
    .memory_stall(i_1),
    .ALU_result_3(i_2),
    .writedata_3(i_3),
    .D_readData(i_4),
    .WriteBack_3(i_5),
    .Mem_3(i_6),
    .Rd_3(i_7),
    .memory_result_4(out_ref[166:135]),
    .ALU_result_4(out_ref[134:103]),
    .forward_result_4(out_ref[102:71]),
    .Rd_4(out_ref[70:66]),
    .WriteBack_4(out_ref[65:65]),
    .Mem2Reg(out_ref[64:64]),
    .D_addr(out_ref[63:34]),
    .D_wen(out_ref[33:33]),
    .D_ren(out_ref[32:32]),
    .D_writeData(out_ref[31:0])
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
    seed = 2833480910;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
