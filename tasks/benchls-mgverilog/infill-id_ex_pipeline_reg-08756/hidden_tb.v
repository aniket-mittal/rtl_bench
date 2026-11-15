// Hidden tests: 5000 cycles of seeded random inputs (seed 723282041); the submission must match reference.v
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
  reg [4:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [31:0] i_7;
  reg [20:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [31:0] i_12;
  reg [8:0] i_13;
  reg [5:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_08756 dut (
    .clk(clk),
    .rst(i_0),
    .ID_stall(i_1),
    .ID_flush(i_2),
    .EX_stall(i_3),
    .ID_reg_dst(i_4),
    .ID_data_a(i_5),
    .ID_data_b(i_6),
    .ID_data_c(i_7),
    .ID_aluc(i_8),
    .ID_sign(i_9),
    .ID_memread(i_10),
    .ID_memwrite(i_11),
    .ID_memaddr(i_12),
    .ID_load_op(i_13),
    .ID_store_op(i_14),
    .ID_memtoreg(i_15),
    .ID_regwrite(i_16),
    .EX_data_a(out_dut[168:137]),
    .EX_data_b(out_dut[136:105]),
    .EX_data_c(out_dut[104:73]),
    .EX_aluc(out_dut[72:52]),
    .EX_sign(out_dut[51:51]),
    .EX_memread(out_dut[50:50]),
    .EX_memwrite(out_dut[49:49]),
    .EX_memaddr(out_dut[48:17]),
    .EX_load_op(out_dut[16:8]),
    .EX_store_op(out_dut[7:2]),
    .EX_memtoreg(out_dut[1:1]),
    .EX_regwrite(out_dut[0:0])
  );
  mg_08756__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .ID_stall(i_1),
    .ID_flush(i_2),
    .EX_stall(i_3),
    .ID_reg_dst(i_4),
    .ID_data_a(i_5),
    .ID_data_b(i_6),
    .ID_data_c(i_7),
    .ID_aluc(i_8),
    .ID_sign(i_9),
    .ID_memread(i_10),
    .ID_memwrite(i_11),
    .ID_memaddr(i_12),
    .ID_load_op(i_13),
    .ID_store_op(i_14),
    .ID_memtoreg(i_15),
    .ID_regwrite(i_16),
    .EX_data_a(out_ref[168:137]),
    .EX_data_b(out_ref[136:105]),
    .EX_data_c(out_ref[104:73]),
    .EX_aluc(out_ref[72:52]),
    .EX_sign(out_ref[51:51]),
    .EX_memread(out_ref[50:50]),
    .EX_memwrite(out_ref[49:49]),
    .EX_memaddr(out_ref[48:17]),
    .EX_load_op(out_ref[16:8]),
    .EX_store_op(out_ref[7:2]),
    .EX_memtoreg(out_ref[1:1]),
    .EX_regwrite(out_ref[0:0])
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
    seed = 723282041;
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
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
