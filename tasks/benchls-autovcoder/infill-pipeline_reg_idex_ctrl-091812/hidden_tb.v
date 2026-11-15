// Hidden tests: 5000 cycles of seeded random inputs (seed 2339230210); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 132;
  reg clk;
  reg [9:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_091812 dut (
    .clk(clk),
    .control_signal(i_0),
    .Read_Data1(i_1),
    .Read_Data2(i_2),
    .Sign_Ext(i_3),
    .IF_Inst(i_4),
    .Reg_Write(out_dut[131:131]),
    .Mem_to_Reg(out_dut[130:130]),
    .Mem_Write(out_dut[129:129]),
    .Mem_Read(out_dut[128:128]),
    .ALU_Src(out_dut[127:127]),
    .Reg_Dst(out_dut[126:126]),
    .ALU_Op(out_dut[125:122]),
    .Read_Data1_Out(out_dut[121:90]),
    .Read_Data2_Out(out_dut[89:58]),
    .shift_amount_out(out_dut[57:53]),
    .Sign_Ext_out(out_dut[52:21]),
    .rs(out_dut[20:16]),
    .rt(out_dut[15:11]),
    .rd(out_dut[10:6]),
    .func_field(out_dut[5:0])
  );
  autovcoder_091812__ref ref_i (
    .clk(clk),
    .control_signal(i_0),
    .Read_Data1(i_1),
    .Read_Data2(i_2),
    .Sign_Ext(i_3),
    .IF_Inst(i_4),
    .Reg_Write(out_ref[131:131]),
    .Mem_to_Reg(out_ref[130:130]),
    .Mem_Write(out_ref[129:129]),
    .Mem_Read(out_ref[128:128]),
    .ALU_Src(out_ref[127:127]),
    .Reg_Dst(out_ref[126:126]),
    .ALU_Op(out_ref[125:122]),
    .Read_Data1_Out(out_ref[121:90]),
    .Read_Data2_Out(out_ref[89:58]),
    .shift_amount_out(out_ref[57:53]),
    .Sign_Ext_out(out_ref[52:21]),
    .rs(out_ref[20:16]),
    .rt(out_ref[15:11]),
    .rd(out_ref[10:6]),
    .func_field(out_ref[5:0])
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
    seed = 2339230210;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
