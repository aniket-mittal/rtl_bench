// Hidden tests: 5000 cycles of seeded random inputs (seed 4272679778); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 203;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [63:0] i_6;
  reg [63:0] i_7;
  reg [0:0] i_8;
  reg [63:0] i_9;
  reg [4:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_116038 dut (
    .clk(clk),
    .reset(i_0),
    .Branch(i_1),
    .MemRead(i_2),
    .MemWrite(i_3),
    .RegWrite(i_4),
    .MemtoReg(i_5),
    .mux_ForwardB(i_6),
    .mux_ALU(i_7),
    .ALUzero(i_8),
    .adder2out(i_9),
    .rd(i_10),
    .EX_MEM_Branch(out_dut[202:202]),
    .EX_MEM_MemRead(out_dut[201:201]),
    .EX_MEM_MemWrite(out_dut[200:200]),
    .EX_MEM_RegWrite(out_dut[199:199]),
    .EX_MEM_MemtoReg(out_dut[198:198]),
    .EX_MEM_mux_ForwardB(out_dut[197:134]),
    .EX_MEM_mux_ALU(out_dut[133:70]),
    .EX_MEM_ALUzero(out_dut[69:69]),
    .EX_MEM_adder2out(out_dut[68:5]),
    .EX_MEM_rd(out_dut[4:0])
  );
  origen_116038__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .Branch(i_1),
    .MemRead(i_2),
    .MemWrite(i_3),
    .RegWrite(i_4),
    .MemtoReg(i_5),
    .mux_ForwardB(i_6),
    .mux_ALU(i_7),
    .ALUzero(i_8),
    .adder2out(i_9),
    .rd(i_10),
    .EX_MEM_Branch(out_ref[202:202]),
    .EX_MEM_MemRead(out_ref[201:201]),
    .EX_MEM_MemWrite(out_ref[200:200]),
    .EX_MEM_RegWrite(out_ref[199:199]),
    .EX_MEM_MemtoReg(out_ref[198:198]),
    .EX_MEM_mux_ForwardB(out_ref[197:134]),
    .EX_MEM_mux_ALU(out_ref[133:70]),
    .EX_MEM_ALUzero(out_ref[69:69]),
    .EX_MEM_adder2out(out_ref[68:5]),
    .EX_MEM_rd(out_ref[4:0])
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
    seed = 4272679778;
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
      i_6 = {$random(seed), $random(seed)};
      i_7 = {$random(seed), $random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed), $random(seed)};
      i_10 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
