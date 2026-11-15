// Hidden tests: 5000 cycles of seeded random inputs (seed 1683853320); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 49;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [1:0] i_3;
  reg [15:0] i_4;
  reg [15:0] i_5;
  reg [15:0] i_6;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_011737 dut (
    .i_Bus_Clk(clk),
    .i_Bus_Rst_L(i_0),
    .i_Bus_CS(i_1),
    .i_Bus_Wr_Rd_n(i_2),
    .i_Bus_Addr8(i_3),
    .i_Bus_Wr_Data(i_4),
    .i_Reg_00(i_5),
    .i_Reg_02(i_6),
    .o_Bus_Rd_Data(out_dut[48:33]),
    .o_Bus_Rd_DV(out_dut[32:32]),
    .o_Reg_00(out_dut[31:16]),
    .o_Reg_02(out_dut[15:0])
  );
  autovcoder_011737__ref ref_i (
    .i_Bus_Clk(clk),
    .i_Bus_Rst_L(i_0),
    .i_Bus_CS(i_1),
    .i_Bus_Wr_Rd_n(i_2),
    .i_Bus_Addr8(i_3),
    .i_Bus_Wr_Data(i_4),
    .i_Reg_00(i_5),
    .i_Reg_02(i_6),
    .o_Bus_Rd_Data(out_ref[48:33]),
    .o_Bus_Rd_DV(out_ref[32:32]),
    .o_Reg_00(out_ref[31:16]),
    .o_Reg_02(out_ref[15:0])
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
    seed = 1683853320;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
