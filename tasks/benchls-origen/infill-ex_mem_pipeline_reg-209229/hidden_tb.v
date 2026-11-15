// Hidden tests: 5000 cycles of seeded random inputs (seed 3552840949); the submission must match reference.v
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
  reg [0:0] i_6;
  reg [4:0] i_7;
  reg [63:0] i_8;
  reg [63:0] i_9;
  reg [63:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_209229 dut (
    .clk(clk),
    .EX_MEM_Branch(i_0),
    .EX_MEM_RegWrite(i_1),
    .EX_MEM_MemToReg(i_2),
    .EX_MEM_MemRead(i_3),
    .EX_MEM_MemWrite(i_4),
    .EX_MEM_Zero(i_5),
    .reset(i_6),
    .EX_MEM_Rd(i_7),
    .EX_MEM_Lower_Forwarding_MUX_out(i_8),
    .EX_MEM_ALU_result(i_9),
    .EX_MEM_Adder(i_10),
    .EX_MEM_output_Branch(out_dut[202:202]),
    .EX_MEM_output_RegWrite(out_dut[201:201]),
    .EX_MEM_output_MemToReg(out_dut[200:200]),
    .EX_MEM_output_MemRead(out_dut[199:199]),
    .EX_MEM_output_MemWrite(out_dut[198:198]),
    .EX_MEM_output_zero(out_dut[197:197]),
    .EX_MEM_Adder_output(out_dut[196:133]),
    .EX_MEM_Lower_Forwarding_MUX_output(out_dut[132:69]),
    .EX_MEM_ALU_result_output(out_dut[68:5]),
    .EX_MEM_output_rd(out_dut[4:0])
  );
  origen_209229__ref ref_i (
    .clk(clk),
    .EX_MEM_Branch(i_0),
    .EX_MEM_RegWrite(i_1),
    .EX_MEM_MemToReg(i_2),
    .EX_MEM_MemRead(i_3),
    .EX_MEM_MemWrite(i_4),
    .EX_MEM_Zero(i_5),
    .reset(i_6),
    .EX_MEM_Rd(i_7),
    .EX_MEM_Lower_Forwarding_MUX_out(i_8),
    .EX_MEM_ALU_result(i_9),
    .EX_MEM_Adder(i_10),
    .EX_MEM_output_Branch(out_ref[202:202]),
    .EX_MEM_output_RegWrite(out_ref[201:201]),
    .EX_MEM_output_MemToReg(out_ref[200:200]),
    .EX_MEM_output_MemRead(out_ref[199:199]),
    .EX_MEM_output_MemWrite(out_ref[198:198]),
    .EX_MEM_output_zero(out_ref[197:197]),
    .EX_MEM_Adder_output(out_ref[196:133]),
    .EX_MEM_Lower_Forwarding_MUX_output(out_ref[132:69]),
    .EX_MEM_ALU_result_output(out_ref[68:5]),
    .EX_MEM_output_rd(out_ref[4:0])
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
    seed = 3552840949;
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
      i_6 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_7 = {$random(seed)};
      i_8 = {$random(seed), $random(seed)};
      i_9 = {$random(seed), $random(seed)};
      i_10 = {$random(seed), $random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
