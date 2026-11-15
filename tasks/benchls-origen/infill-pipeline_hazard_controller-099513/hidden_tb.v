// Hidden tests: 5000 cycles of seeded random inputs (seed 439663712); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 8;
  reg clk;
  reg [4:0] i_0;
  reg [4:0] i_1;
  reg [4:0] i_2;
  reg [4:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [3:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_099513 dut (
    .clk(clk),
    .reg_a(i_0),
    .reg_b(i_1),
    .reg_wb(i_2),
    .reg_ex(i_3),
    .reg_wb_en(i_4),
    .reg_ex_en(i_5),
    .instr_type(i_6),
    .branch_taken(i_7),
    .reset(i_8),
    .interrupt(i_9),
    .interrupt_flag(i_10),
    .a_read(i_11),
    .b_read(i_12),
    .imem_addr_mux(out_dut[7:7]),
    .fetch_latch_stall(out_dut[6:6]),
    .dec_nop(out_dut[5:5]),
    .dec_int(out_dut[4:4]),
    .pc_inc(out_dut[3:3]),
    .pc_load(out_dut[2:2]),
    .pc_reset(out_dut[1:1]),
    .pc_mux_override(out_dut[0:0])
  );
  origen_099513__ref ref_i (
    .clk(clk),
    .reg_a(i_0),
    .reg_b(i_1),
    .reg_wb(i_2),
    .reg_ex(i_3),
    .reg_wb_en(i_4),
    .reg_ex_en(i_5),
    .instr_type(i_6),
    .branch_taken(i_7),
    .reset(i_8),
    .interrupt(i_9),
    .interrupt_flag(i_10),
    .a_read(i_11),
    .b_read(i_12),
    .imem_addr_mux(out_ref[7:7]),
    .fetch_latch_stall(out_ref[6:6]),
    .dec_nop(out_ref[5:5]),
    .dec_int(out_ref[4:4]),
    .pc_inc(out_ref[3:3]),
    .pc_load(out_ref[2:2]),
    .pc_reset(out_ref[1:1]),
    .pc_mux_override(out_ref[0:0])
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
    seed = 439663712;
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
      i_8 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
