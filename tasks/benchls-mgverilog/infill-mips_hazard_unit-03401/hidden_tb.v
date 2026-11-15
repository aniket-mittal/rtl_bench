// Hidden tests: 5000 cycles of seeded random inputs (seed 3178908157); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 4;
  reg clk;
  reg [0:0] i_0;
  reg [4:0] i_1;
  reg [4:0] i_2;
  reg [4:0] i_3;
  reg [4:0] i_4;
  reg [0:0] i_5;
  reg [5:0] i_6;
  reg [5:0] i_7;
  reg [5:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_03401 dut (
    .clk(clk),
    .rst(i_0),
    .ex_dst_reg(i_1),
    .mem_dst_reg(i_2),
    .id_rs(i_3),
    .id_rt(i_4),
    .wb_done_i(i_5),
    .mem_opcode(i_6),
    .ex_opcode(i_7),
    .id_opcode(i_8),
    .id_rt_is_source(i_9),
    .ex_reg_write(i_10),
    .mem_reg_write(i_11),
    .pstop_o(out_dut[3:3]),
    .pc_write(out_dut[2:2]),
    .if_id_write_en(out_dut[1:1]),
    .hazard_detected_o(out_dut[0:0])
  );
  mg_03401__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .ex_dst_reg(i_1),
    .mem_dst_reg(i_2),
    .id_rs(i_3),
    .id_rt(i_4),
    .wb_done_i(i_5),
    .mem_opcode(i_6),
    .ex_opcode(i_7),
    .id_opcode(i_8),
    .id_rt_is_source(i_9),
    .ex_reg_write(i_10),
    .mem_reg_write(i_11),
    .pstop_o(out_ref[3:3]),
    .pc_write(out_ref[2:2]),
    .if_id_write_en(out_ref[1:1]),
    .hazard_detected_o(out_ref[0:0])
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
    seed = 3178908157;
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
