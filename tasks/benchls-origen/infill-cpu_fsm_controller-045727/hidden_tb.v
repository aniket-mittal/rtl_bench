// Hidden tests: 5000 cycles of seeded random inputs (seed 2404306737); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 44;
  reg clk;
  reg [0:0] i_0;
  reg [15:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_045727 dut (
    .CLKSLOW(clk),
    .CLK100MHZ(i_0),
    .ir_inst(i_1),
    .pc_load(out_dut[43:43]),
    .pc_clear(out_dut[42:42]),
    .pc_inc(out_dut[41:41]),
    .ir_load(out_dut[40:40]),
    .mb_sel(out_dut[39:39]),
    .mb_addr(out_dut[38:31]),
    .mb_read(out_dut[30:30]),
    .mb_write(out_dut[29:29]),
    .dp_imm(out_dut[28:21]),
    .dp_sel(out_dut[20:19]),
    .dp_write_addr(out_dut[18:15]),
    .dp_write(out_dut[14:14]),
    .dp_a_addr(out_dut[13:10]),
    .dp_a_read(out_dut[9:9]),
    .dp_b_addr(out_dut[8:5]),
    .dp_b_read(out_dut[4:4]),
    .dp_alu_sel(out_dut[3:0])
  );
  origen_045727__ref ref_i (
    .CLKSLOW(clk),
    .CLK100MHZ(i_0),
    .ir_inst(i_1),
    .pc_load(out_ref[43:43]),
    .pc_clear(out_ref[42:42]),
    .pc_inc(out_ref[41:41]),
    .ir_load(out_ref[40:40]),
    .mb_sel(out_ref[39:39]),
    .mb_addr(out_ref[38:31]),
    .mb_read(out_ref[30:30]),
    .mb_write(out_ref[29:29]),
    .dp_imm(out_ref[28:21]),
    .dp_sel(out_ref[20:19]),
    .dp_write_addr(out_ref[18:15]),
    .dp_write(out_ref[14:14]),
    .dp_a_addr(out_ref[13:10]),
    .dp_a_read(out_ref[9:9]),
    .dp_b_addr(out_ref[8:5]),
    .dp_b_read(out_ref[4:4]),
    .dp_alu_sel(out_ref[3:0])
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
    seed = 2404306737;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
