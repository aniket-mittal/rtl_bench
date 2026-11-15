// Hidden tests: 5000 cycles of seeded random inputs (seed 4051770663); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 92;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [31:0] i_7;
  reg [31:0] i_8;
  reg [17:0] i_9;
  reg [4:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_060581 dut (
    .clk(clk),
    .rst(i_0),
    .EX_MWrite(i_1),
    .EX_MemtoReg(i_2),
    .EX_RegWrite(i_3),
    .EX_MemWrite(i_4),
    .EX_Jal(i_5),
    .EX_Half(i_6),
    .EX_ALU_result(i_7),
    .EX_Rt_data(i_8),
    .EX_PCplus8(i_9),
    .EX_WR_out(i_10),
    .M_MemtoReg(out_dut[91:91]),
    .M_RegWrite(out_dut[90:90]),
    .M_MemWrite(out_dut[89:89]),
    .M_Jal(out_dut[88:88]),
    .M_Half(out_dut[87:87]),
    .M_ALU_result(out_dut[86:55]),
    .M_Rt_data(out_dut[54:23]),
    .M_PCplus8(out_dut[22:5]),
    .M_WR_out(out_dut[4:0])
  );
  origen_060581__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .EX_MWrite(i_1),
    .EX_MemtoReg(i_2),
    .EX_RegWrite(i_3),
    .EX_MemWrite(i_4),
    .EX_Jal(i_5),
    .EX_Half(i_6),
    .EX_ALU_result(i_7),
    .EX_Rt_data(i_8),
    .EX_PCplus8(i_9),
    .EX_WR_out(i_10),
    .M_MemtoReg(out_ref[91:91]),
    .M_RegWrite(out_ref[90:90]),
    .M_MemWrite(out_ref[89:89]),
    .M_Jal(out_ref[88:88]),
    .M_Half(out_ref[87:87]),
    .M_ALU_result(out_ref[86:55]),
    .M_Rt_data(out_ref[54:23]),
    .M_PCplus8(out_ref[22:5]),
    .M_WR_out(out_ref[4:0])
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
    seed = 4051770663;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
