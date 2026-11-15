// Hidden tests: 5000 cycles of seeded random inputs (seed 652060309); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 273;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [0:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [15:0] i_7;
  reg [31:0] i_8;
  reg [31:0] i_9;
  reg [31:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_084347 dut (
    .clk(clk),
    .rst(i_0),
    .ALU_R_in(i_1),
    .ALU_R2_in(i_2),
    .ALU_equal_in(i_3),
    .instr_in(i_4),
    .ctrl_in(i_5),
    .b_equal_res_in(i_6),
    .PC0_in(i_7),
    .jump_res_in(i_8),
    .RF_R2_in(i_9),
    .RF_R1_in(i_10),
    .ALU_R_out(out_dut[272:241]),
    .ALU_R2_out(out_dut[240:209]),
    .ALU_equal_out(out_dut[208:208]),
    .instr_out(out_dut[207:176]),
    .ctrl_out(out_dut[175:144]),
    .b_equal_res_out(out_dut[143:112]),
    .PC0_out(out_dut[111:96]),
    .jump_res_out(out_dut[95:64]),
    .RF_R2_out(out_dut[63:32]),
    .RF_R1_out(out_dut[31:0])
  );
  origen_084347__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .ALU_R_in(i_1),
    .ALU_R2_in(i_2),
    .ALU_equal_in(i_3),
    .instr_in(i_4),
    .ctrl_in(i_5),
    .b_equal_res_in(i_6),
    .PC0_in(i_7),
    .jump_res_in(i_8),
    .RF_R2_in(i_9),
    .RF_R1_in(i_10),
    .ALU_R_out(out_ref[272:241]),
    .ALU_R2_out(out_ref[240:209]),
    .ALU_equal_out(out_ref[208:208]),
    .instr_out(out_ref[207:176]),
    .ctrl_out(out_ref[175:144]),
    .b_equal_res_out(out_ref[143:112]),
    .PC0_out(out_ref[111:96]),
    .jump_res_out(out_ref[95:64]),
    .RF_R2_out(out_ref[63:32]),
    .RF_R1_out(out_ref[31:0])
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
    seed = 652060309;
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
