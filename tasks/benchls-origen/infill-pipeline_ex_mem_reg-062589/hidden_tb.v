// Hidden tests: 5000 cycles of seeded random inputs (seed 3978892406); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 138;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [1:0] i_2;
  reg [0:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [4:0] i_7;
  reg [31:0] i_8;
  reg [0:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_062589 dut (
    .clk(clk),
    .rst_n(i_0),
    .EX_rf_we(i_1),
    .EX_wd_sel(i_2),
    .EX_dram_we(i_3),
    .EX_ALUC(i_4),
    .EX_rD2(i_5),
    .EX_pc4(i_6),
    .EX_wR(i_7),
    .EX_PC(i_8),
    .ex_have_inst(i_9),
    .MEM_rf_we(out_dut[137:137]),
    .MEM_wd_sel(out_dut[136:135]),
    .MEM_dram_we(out_dut[134:134]),
    .MEM_ALUC(out_dut[133:102]),
    .MEM_rD2(out_dut[101:70]),
    .MEM_pc4(out_dut[69:38]),
    .MEM_wR(out_dut[37:33]),
    .MEM_PC(out_dut[32:1]),
    .mem_have_inst(out_dut[0:0])
  );
  origen_062589__ref ref_i (
    .clk(clk),
    .rst_n(i_0),
    .EX_rf_we(i_1),
    .EX_wd_sel(i_2),
    .EX_dram_we(i_3),
    .EX_ALUC(i_4),
    .EX_rD2(i_5),
    .EX_pc4(i_6),
    .EX_wR(i_7),
    .EX_PC(i_8),
    .ex_have_inst(i_9),
    .MEM_rf_we(out_ref[137:137]),
    .MEM_wd_sel(out_ref[136:135]),
    .MEM_dram_we(out_ref[134:134]),
    .MEM_ALUC(out_ref[133:102]),
    .MEM_rD2(out_ref[101:70]),
    .MEM_pc4(out_ref[69:38]),
    .MEM_wR(out_ref[37:33]),
    .MEM_PC(out_ref[32:1]),
    .mem_have_inst(out_ref[0:0])
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
    seed = 3978892406;
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
