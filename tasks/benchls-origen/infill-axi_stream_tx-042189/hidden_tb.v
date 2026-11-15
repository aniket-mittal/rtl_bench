// Hidden tests: 5000 cycles of seeded random inputs (seed 3516439176); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 37;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [15:0] i_2;
  reg [1:0] i_3;
  reg [31:0] i_4;
  reg [0:0] i_5;
  reg [31:0] i_6;
  reg [0:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_042189 dut (
    .i_clk(clk),
    .i_aresetn(i_0),
    .i_enable(i_1),
    .i_data_to_transmit(i_2),
    .i_tkeep(i_3),
    .i_tdest(i_4),
    .i_tlast(i_5),
    .i_core_TID(i_6),
    .i_tready(i_7),
    .o_idle(out_dut[36:36]),
    .o_tvalid(out_dut[35:35]),
    .o_tdata(out_dut[34:19]),
    .o_tkeep(out_dut[18:17]),
    .o_tdest(out_dut[16:9]),
    .o_tid(out_dut[8:1]),
    .o_tlast(out_dut[0:0])
  );
  origen_042189__ref ref_i (
    .i_clk(clk),
    .i_aresetn(i_0),
    .i_enable(i_1),
    .i_data_to_transmit(i_2),
    .i_tkeep(i_3),
    .i_tdest(i_4),
    .i_tlast(i_5),
    .i_core_TID(i_6),
    .i_tready(i_7),
    .o_idle(out_ref[36:36]),
    .o_tvalid(out_ref[35:35]),
    .o_tdata(out_ref[34:19]),
    .o_tkeep(out_ref[18:17]),
    .o_tdest(out_ref[16:9]),
    .o_tid(out_ref[8:1]),
    .o_tlast(out_ref[0:0])
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
    seed = 3516439176;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
