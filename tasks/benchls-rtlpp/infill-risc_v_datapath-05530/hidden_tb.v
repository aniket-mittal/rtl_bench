// Hidden tests: 5000 cycles of seeded random inputs (seed 1191321999); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 1248;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [31:0] i_2;
  reg [1:0] i_3;
  reg [0:0] i_4;
  reg [1:0] i_5;
  reg [31:0] i_6;
  reg [2:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_05530 dut (
    .clk(clk),
    .Branch(i_0),
    .Jump(i_1),
    .Data_in(i_2),
    .MemtoReg(i_3),
    .ALUSrc_B(i_4),
    .ImmSel(i_5),
    .inst_field(i_6),
    .ALU_operation(i_7),
    .rst(i_8),
    .RegWrite(i_9),
    .ALU_out(out_dut[1247:1216]),
    .Data_out(out_dut[1215:1184]),
    .PC_out(out_dut[1183:1152]),
    .x0(out_dut[1151:1120]),
    .x1(out_dut[1119:1088]),
    .x2(out_dut[1087:1056]),
    .x3(out_dut[1055:1024]),
    .x4(out_dut[1023:992]),
    .x5(out_dut[991:960]),
    .x6(out_dut[959:928]),
    .x7(out_dut[927:896]),
    .x8(out_dut[895:864]),
    .x9(out_dut[863:832]),
    .x10(out_dut[831:800]),
    .x11(out_dut[799:768]),
    .x12(out_dut[767:736]),
    .x13(out_dut[735:704]),
    .x14(out_dut[703:672]),
    .x15(out_dut[671:640]),
    .x16(out_dut[639:608]),
    .x17(out_dut[607:576]),
    .x18(out_dut[575:544]),
    .x19(out_dut[543:512]),
    .x20(out_dut[511:480]),
    .x21(out_dut[479:448]),
    .x22(out_dut[447:416]),
    .x23(out_dut[415:384]),
    .x24(out_dut[383:352]),
    .x25(out_dut[351:320]),
    .x26(out_dut[319:288]),
    .x27(out_dut[287:256]),
    .x28(out_dut[255:224]),
    .x29(out_dut[223:192]),
    .x30(out_dut[191:160]),
    .x31(out_dut[159:128]),
    .Imm_out(out_dut[127:96]),
    .pc_branch(out_dut[95:64]),
    .a_val(out_dut[63:32]),
    .b_val(out_dut[31:0])
  );
  rtlpp_05530__ref ref_i (
    .clk(clk),
    .Branch(i_0),
    .Jump(i_1),
    .Data_in(i_2),
    .MemtoReg(i_3),
    .ALUSrc_B(i_4),
    .ImmSel(i_5),
    .inst_field(i_6),
    .ALU_operation(i_7),
    .rst(i_8),
    .RegWrite(i_9),
    .ALU_out(out_ref[1247:1216]),
    .Data_out(out_ref[1215:1184]),
    .PC_out(out_ref[1183:1152]),
    .x0(out_ref[1151:1120]),
    .x1(out_ref[1119:1088]),
    .x2(out_ref[1087:1056]),
    .x3(out_ref[1055:1024]),
    .x4(out_ref[1023:992]),
    .x5(out_ref[991:960]),
    .x6(out_ref[959:928]),
    .x7(out_ref[927:896]),
    .x8(out_ref[895:864]),
    .x9(out_ref[863:832]),
    .x10(out_ref[831:800]),
    .x11(out_ref[799:768]),
    .x12(out_ref[767:736]),
    .x13(out_ref[735:704]),
    .x14(out_ref[703:672]),
    .x15(out_ref[671:640]),
    .x16(out_ref[639:608]),
    .x17(out_ref[607:576]),
    .x18(out_ref[575:544]),
    .x19(out_ref[543:512]),
    .x20(out_ref[511:480]),
    .x21(out_ref[479:448]),
    .x22(out_ref[447:416]),
    .x23(out_ref[415:384]),
    .x24(out_ref[383:352]),
    .x25(out_ref[351:320]),
    .x26(out_ref[319:288]),
    .x27(out_ref[287:256]),
    .x28(out_ref[255:224]),
    .x29(out_ref[223:192]),
    .x30(out_ref[191:160]),
    .x31(out_ref[159:128]),
    .Imm_out(out_ref[127:96]),
    .pc_branch(out_ref[95:64]),
    .a_val(out_ref[63:32]),
    .b_val(out_ref[31:0])
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
    seed = 1191321999;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
