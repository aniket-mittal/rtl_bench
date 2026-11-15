// Hidden tests: 5000 cycles of seeded random inputs (seed 3187797963); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 70;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [31:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_01479 dut (
    .CLK_3M(i_0),
    .DECODE_DATA(i_1),
    .ENCODE_READ_EN(i_2),
    .DECODE_CLK_3M(i_3),
    .DECODE_WRITE_EN(i_4),
    .FSL_Clk(i_5),
    .FSL_Rst(i_6),
    .FSL_S_Data(i_7),
    .FSL_S_Exists(i_8),
    .FSL_M_Full(i_9),
    .ENCODE_DATA(out_dut[69:38]),
    .FSL_S_Clk(out_dut[37:37]),
    .FSL_S_Read(out_dut[36:36]),
    .FSL_S_Control(out_dut[35:35]),
    .FSL_M_Clk(out_dut[34:34]),
    .FSL_M_Write(out_dut[33:33]),
    .FSL_M_Data(out_dut[32:1]),
    .FSL_M_Control(out_dut[0:0])
  );
  rtlpp_01479__ref ref_i (
    .CLK_3M(i_0),
    .DECODE_DATA(i_1),
    .ENCODE_READ_EN(i_2),
    .DECODE_CLK_3M(i_3),
    .DECODE_WRITE_EN(i_4),
    .FSL_Clk(i_5),
    .FSL_Rst(i_6),
    .FSL_S_Data(i_7),
    .FSL_S_Exists(i_8),
    .FSL_M_Full(i_9),
    .ENCODE_DATA(out_ref[69:38]),
    .FSL_S_Clk(out_ref[37:37]),
    .FSL_S_Read(out_ref[36:36]),
    .FSL_S_Control(out_ref[35:35]),
    .FSL_M_Clk(out_ref[34:34]),
    .FSL_M_Write(out_ref[33:33]),
    .FSL_M_Data(out_ref[32:1]),
    .FSL_M_Control(out_ref[0:0])
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
    seed = 3187797963;
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
      i_6 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
