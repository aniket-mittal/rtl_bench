// Hidden tests: 5000 cycles of seeded random inputs (seed 3445662697); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 513;
  reg clk;
  reg [0:0] i_0;
  reg [15:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  Deserializer dut (
    .clk(clk),
    .reset(i_0),
    .datain(i_1),
    .dataout0(out_dut[512:497]),
    .dataout1(out_dut[496:481]),
    .dataout2(out_dut[480:465]),
    .dataout3(out_dut[464:449]),
    .dataout4(out_dut[448:433]),
    .dataout5(out_dut[432:417]),
    .dataout6(out_dut[416:401]),
    .dataout7(out_dut[400:385]),
    .dataout8(out_dut[384:369]),
    .dataout9(out_dut[368:353]),
    .dataout10(out_dut[352:337]),
    .dataout11(out_dut[336:321]),
    .dataout12(out_dut[320:305]),
    .dataout13(out_dut[304:289]),
    .dataout14(out_dut[288:273]),
    .dataout15(out_dut[272:257]),
    .dataout16(out_dut[256:241]),
    .dataout17(out_dut[240:225]),
    .dataout18(out_dut[224:209]),
    .dataout19(out_dut[208:193]),
    .dataout20(out_dut[192:177]),
    .dataout21(out_dut[176:161]),
    .dataout22(out_dut[160:145]),
    .dataout23(out_dut[144:129]),
    .dataout24(out_dut[128:113]),
    .dataout25(out_dut[112:97]),
    .dataout26(out_dut[96:81]),
    .dataout27(out_dut[80:65]),
    .dataout28(out_dut[64:49]),
    .dataout29(out_dut[48:33]),
    .dataout30(out_dut[32:17]),
    .dataout31(out_dut[16:1]),
    .finish(out_dut[0:0])
  );
  Deserializer__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .datain(i_1),
    .dataout0(out_ref[512:497]),
    .dataout1(out_ref[496:481]),
    .dataout2(out_ref[480:465]),
    .dataout3(out_ref[464:449]),
    .dataout4(out_ref[448:433]),
    .dataout5(out_ref[432:417]),
    .dataout6(out_ref[416:401]),
    .dataout7(out_ref[400:385]),
    .dataout8(out_ref[384:369]),
    .dataout9(out_ref[368:353]),
    .dataout10(out_ref[352:337]),
    .dataout11(out_ref[336:321]),
    .dataout12(out_ref[320:305]),
    .dataout13(out_ref[304:289]),
    .dataout14(out_ref[288:273]),
    .dataout15(out_ref[272:257]),
    .dataout16(out_ref[256:241]),
    .dataout17(out_ref[240:225]),
    .dataout18(out_ref[224:209]),
    .dataout19(out_ref[208:193]),
    .dataout20(out_ref[192:177]),
    .dataout21(out_ref[176:161]),
    .dataout22(out_ref[160:145]),
    .dataout23(out_ref[144:129]),
    .dataout24(out_ref[128:113]),
    .dataout25(out_ref[112:97]),
    .dataout26(out_ref[96:81]),
    .dataout27(out_ref[80:65]),
    .dataout28(out_ref[64:49]),
    .dataout29(out_ref[48:33]),
    .dataout30(out_ref[32:17]),
    .dataout31(out_ref[16:1]),
    .finish(out_ref[0:0])
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
    seed = 3445662697;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
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
