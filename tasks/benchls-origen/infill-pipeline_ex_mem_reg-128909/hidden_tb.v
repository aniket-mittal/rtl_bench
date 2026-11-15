// Hidden tests: 5000 cycles of seeded random inputs (seed 306931861); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 170;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [1:0] i_3;
  reg [1:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [4:0] i_7;
  reg [31:0] i_8;
  reg [4:0] i_9;
  reg [31:0] i_10;
  reg [31:0] i_11;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_128909 dut (
    .clk(clk),
    .rst(i_0),
    .cpu_stall(i_1),
    .ex_c_rfw(i_2),
    .ex_c_wbsource(i_3),
    .ex_c_drw(i_4),
    .ex_alu_r(i_5),
    .ex_rfb(i_6),
    .ex_rf_waddr(i_7),
    .ex_jalra(i_8),
    .ex_rt(i_9),
    .wb_wdata(i_10),
    .dmem_in(i_11),
    .p_c_rfw(out_dut[169:169]),
    .p_c_wbsource(out_dut[168:167]),
    .p_alu_r(out_dut[166:135]),
    .dmem_data(out_dut[134:103]),
    .p_rf_waddr(out_dut[102:98]),
    .p_jalra(out_dut[97:66]),
    .dmem_addr(out_dut[65:34]),
    .dmem_drw(out_dut[33:32]),
    .p_dout(out_dut[31:0])
  );
  origen_128909__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .cpu_stall(i_1),
    .ex_c_rfw(i_2),
    .ex_c_wbsource(i_3),
    .ex_c_drw(i_4),
    .ex_alu_r(i_5),
    .ex_rfb(i_6),
    .ex_rf_waddr(i_7),
    .ex_jalra(i_8),
    .ex_rt(i_9),
    .wb_wdata(i_10),
    .dmem_in(i_11),
    .p_c_rfw(out_ref[169:169]),
    .p_c_wbsource(out_ref[168:167]),
    .p_alu_r(out_ref[166:135]),
    .dmem_data(out_ref[134:103]),
    .p_rf_waddr(out_ref[102:98]),
    .p_jalra(out_ref[97:66]),
    .dmem_addr(out_ref[65:34]),
    .dmem_drw(out_ref[33:32]),
    .p_dout(out_ref[31:0])
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
    seed = 306931861;
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
