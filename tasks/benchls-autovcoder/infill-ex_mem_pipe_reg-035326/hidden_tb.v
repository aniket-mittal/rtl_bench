// Hidden tests: 5000 cycles of seeded random inputs (seed 1166980192); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 21;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [4:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [4:0] i_8;
  reg [4:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_035326 dut (
    .clk(clk),
    .rst(i_0),
    .id_ex_memread(i_1),
    .id_ex_memwrite(i_2),
    .id_ex_mem_to_reg(i_3),
    .id_ex_pc_src(i_4),
    .id_ex_rd(i_5),
    .id_ex_regwrite(i_6),
    .id_ex_ins_valid(i_7),
    .id_ex_rs1(i_8),
    .id_ex_rs2(i_9),
    .ex_mem_memread(out_dut[20:20]),
    .ex_mem_memwrite(out_dut[19:19]),
    .ex_mem_mem_to_reg(out_dut[18:18]),
    .ex_mem_pc_src(out_dut[17:17]),
    .ex_mem_rd(out_dut[16:12]),
    .ex_mem_regwrite(out_dut[11:11]),
    .ex_mem_ins_valid(out_dut[10:10]),
    .ex_mem_rs1(out_dut[9:5]),
    .ex_mem_rs2(out_dut[4:0])
  );
  autovcoder_035326__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .id_ex_memread(i_1),
    .id_ex_memwrite(i_2),
    .id_ex_mem_to_reg(i_3),
    .id_ex_pc_src(i_4),
    .id_ex_rd(i_5),
    .id_ex_regwrite(i_6),
    .id_ex_ins_valid(i_7),
    .id_ex_rs1(i_8),
    .id_ex_rs2(i_9),
    .ex_mem_memread(out_ref[20:20]),
    .ex_mem_memwrite(out_ref[19:19]),
    .ex_mem_mem_to_reg(out_ref[18:18]),
    .ex_mem_pc_src(out_ref[17:17]),
    .ex_mem_rd(out_ref[16:12]),
    .ex_mem_regwrite(out_ref[11:11]),
    .ex_mem_ins_valid(out_ref[10:10]),
    .ex_mem_rs1(out_ref[9:5]),
    .ex_mem_rs2(out_ref[4:0])
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
    seed = 1166980192;
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
