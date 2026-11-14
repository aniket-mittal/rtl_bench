// Hidden tests: 5000 cycles of seeded random inputs (seed 3679026889); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 73;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [5:0] i_4;
  reg [31:0] i_5;
  reg [2:0] i_6;
  reg [2:0] i_7;
  reg [0:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_125355 dut (
    .clk(clk),
    .rstn(i_0),
    .id_ex_rdy(i_1),
    .id_ex_op1(i_2),
    .id_ex_op2(i_3),
    .id_ex_funct(i_4),
    .id_ex_mem_st_data(i_5),
    .id_ex_mem_st_funct(i_6),
    .id_ex_mem_ld_funct(i_7),
    .ex_mem_ack(i_8),
    .id_ex_ack(out_dut[72:72]),
    .ex_mem_rdy(out_dut[71:71]),
    .ex_mem_alu_op(out_dut[70:70]),
    .ex_mem_st_data(out_dut[69:38]),
    .ex_mem_st_funct(out_dut[37:35]),
    .ex_mem_ld_funct(out_dut[34:32]),
    .ex_mem_data(out_dut[31:0])
  );
  origen_125355__ref ref_i (
    .clk(clk),
    .rstn(i_0),
    .id_ex_rdy(i_1),
    .id_ex_op1(i_2),
    .id_ex_op2(i_3),
    .id_ex_funct(i_4),
    .id_ex_mem_st_data(i_5),
    .id_ex_mem_st_funct(i_6),
    .id_ex_mem_ld_funct(i_7),
    .ex_mem_ack(i_8),
    .id_ex_ack(out_ref[72:72]),
    .ex_mem_rdy(out_ref[71:71]),
    .ex_mem_alu_op(out_ref[70:70]),
    .ex_mem_st_data(out_ref[69:38]),
    .ex_mem_st_funct(out_ref[37:35]),
    .ex_mem_ld_funct(out_ref[34:32]),
    .ex_mem_data(out_ref[31:0])
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
    seed = 3679026889;
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
      i_8 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
