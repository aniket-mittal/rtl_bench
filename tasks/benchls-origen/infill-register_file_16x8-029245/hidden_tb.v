// Hidden tests: 5000 cycles of seeded random inputs (seed 4093919307); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 136;
  reg clk;
  reg [3:0] i_0;
  reg [3:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [7:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_029245 dut (
    .Clk(clk),
    .R_Addr(i_0),
    .W_Addr(i_1),
    .Rst(i_2),
    .R_en(i_3),
    .W_en(i_4),
    .W_Data(i_5),
    .R_Data(out_dut[135:128]),
    .debug_Reg0(out_dut[127:120]),
    .debug_Reg1(out_dut[119:112]),
    .debug_Reg2(out_dut[111:104]),
    .debug_Reg3(out_dut[103:96]),
    .debug_Reg4(out_dut[95:88]),
    .debug_Reg5(out_dut[87:80]),
    .debug_Reg6(out_dut[79:72]),
    .debug_Reg7(out_dut[71:64]),
    .debug_Reg8(out_dut[63:56]),
    .debug_Reg9(out_dut[55:48]),
    .debug_Reg10(out_dut[47:40]),
    .debug_Reg11(out_dut[39:32]),
    .debug_Reg12(out_dut[31:24]),
    .debug_Reg13(out_dut[23:16]),
    .debug_Reg14(out_dut[15:8]),
    .debug_Reg15(out_dut[7:0])
  );
  origen_029245__ref ref_i (
    .Clk(clk),
    .R_Addr(i_0),
    .W_Addr(i_1),
    .Rst(i_2),
    .R_en(i_3),
    .W_en(i_4),
    .W_Data(i_5),
    .R_Data(out_ref[135:128]),
    .debug_Reg0(out_ref[127:120]),
    .debug_Reg1(out_ref[119:112]),
    .debug_Reg2(out_ref[111:104]),
    .debug_Reg3(out_ref[103:96]),
    .debug_Reg4(out_ref[95:88]),
    .debug_Reg5(out_ref[87:80]),
    .debug_Reg6(out_ref[79:72]),
    .debug_Reg7(out_ref[71:64]),
    .debug_Reg8(out_ref[63:56]),
    .debug_Reg9(out_ref[55:48]),
    .debug_Reg10(out_ref[47:40]),
    .debug_Reg11(out_ref[39:32]),
    .debug_Reg12(out_ref[31:24]),
    .debug_Reg13(out_ref[23:16]),
    .debug_Reg14(out_ref[15:8]),
    .debug_Reg15(out_ref[7:0])
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
    seed = 4093919307;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
