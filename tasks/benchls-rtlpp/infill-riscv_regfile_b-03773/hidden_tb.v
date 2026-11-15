// Hidden tests: 5000 cycles of seeded random inputs (seed 1580860204); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 1088;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [4:0] i_2;
  reg [4:0] i_3;
  reg [4:0] i_4;
  reg [31:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_03773 dut (
    .clk(clk),
    .rst(i_0),
    .RegWrite(i_1),
    .Rs1_addr(i_2),
    .Rs2_addr(i_3),
    .Wt_addr(i_4),
    .Wt_data(i_5),
    .Rs1_data(out_dut[1087:1056]),
    .Rs2_data(out_dut[1055:1024]),
    .x0(out_dut[1023:992]),
    .ra(out_dut[991:960]),
    .sp(out_dut[959:928]),
    .gp(out_dut[927:896]),
    .tp(out_dut[895:864]),
    .t0(out_dut[863:832]),
    .t1(out_dut[831:800]),
    .t2(out_dut[799:768]),
    .s0(out_dut[767:736]),
    .s1(out_dut[735:704]),
    .a0(out_dut[703:672]),
    .a1(out_dut[671:640]),
    .a2(out_dut[639:608]),
    .a3(out_dut[607:576]),
    .a4(out_dut[575:544]),
    .a5(out_dut[543:512]),
    .a6(out_dut[511:480]),
    .a7(out_dut[479:448]),
    .s2(out_dut[447:416]),
    .s3(out_dut[415:384]),
    .s4(out_dut[383:352]),
    .s5(out_dut[351:320]),
    .s6(out_dut[319:288]),
    .s7(out_dut[287:256]),
    .s8(out_dut[255:224]),
    .s9(out_dut[223:192]),
    .s10(out_dut[191:160]),
    .s11(out_dut[159:128]),
    .t3(out_dut[127:96]),
    .t4(out_dut[95:64]),
    .t5(out_dut[63:32]),
    .t6(out_dut[31:0])
  );
  rtlpp_03773__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .RegWrite(i_1),
    .Rs1_addr(i_2),
    .Rs2_addr(i_3),
    .Wt_addr(i_4),
    .Wt_data(i_5),
    .Rs1_data(out_ref[1087:1056]),
    .Rs2_data(out_ref[1055:1024]),
    .x0(out_ref[1023:992]),
    .ra(out_ref[991:960]),
    .sp(out_ref[959:928]),
    .gp(out_ref[927:896]),
    .tp(out_ref[895:864]),
    .t0(out_ref[863:832]),
    .t1(out_ref[831:800]),
    .t2(out_ref[799:768]),
    .s0(out_ref[767:736]),
    .s1(out_ref[735:704]),
    .a0(out_ref[703:672]),
    .a1(out_ref[671:640]),
    .a2(out_ref[639:608]),
    .a3(out_ref[607:576]),
    .a4(out_ref[575:544]),
    .a5(out_ref[543:512]),
    .a6(out_ref[511:480]),
    .a7(out_ref[479:448]),
    .s2(out_ref[447:416]),
    .s3(out_ref[415:384]),
    .s4(out_ref[383:352]),
    .s5(out_ref[351:320]),
    .s6(out_ref[319:288]),
    .s7(out_ref[287:256]),
    .s8(out_ref[255:224]),
    .s9(out_ref[223:192]),
    .s10(out_ref[191:160]),
    .s11(out_ref[159:128]),
    .t3(out_ref[127:96]),
    .t4(out_ref[95:64]),
    .t5(out_ref[63:32]),
    .t6(out_ref[31:0])
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
    seed = 1580860204;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
