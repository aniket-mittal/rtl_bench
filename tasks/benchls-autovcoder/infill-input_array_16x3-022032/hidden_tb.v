// Hidden tests: 5000 cycles of seeded random inputs (seed 434759522); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 385;
  reg clk;
  reg [7:0] i_0;
  reg [7:0] i_1;
  reg [7:0] i_2;
  reg [7:0] i_3;
  reg [7:0] i_4;
  reg [7:0] i_5;
  reg [7:0] i_6;
  reg [7:0] i_7;
  reg [7:0] i_8;
  reg [7:0] i_9;
  reg [7:0] i_10;
  reg [7:0] i_11;
  reg [7:0] i_12;
  reg [7:0] i_13;
  reg [7:0] i_14;
  reg [7:0] i_15;
  reg [7:0] i_16;
  reg [7:0] i_17;
  reg [7:0] i_18;
  reg [7:0] i_19;
  reg [7:0] i_20;
  reg [7:0] i_21;
  reg [7:0] i_22;
  reg [7:0] i_23;
  reg [7:0] i_24;
  reg [7:0] i_25;
  reg [7:0] i_26;
  reg [7:0] i_27;
  reg [7:0] i_28;
  reg [7:0] i_29;
  reg [7:0] i_30;
  reg [7:0] i_31;
  reg [7:0] i_32;
  reg [7:0] i_33;
  reg [7:0] i_34;
  reg [7:0] i_35;
  reg [7:0] i_36;
  reg [7:0] i_37;
  reg [7:0] i_38;
  reg [7:0] i_39;
  reg [7:0] i_40;
  reg [7:0] i_41;
  reg [7:0] i_42;
  reg [7:0] i_43;
  reg [7:0] i_44;
  reg [7:0] i_45;
  reg [7:0] i_46;
  reg [7:0] i_47;
  reg [0:0] i_48;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_022032 dut (
    .clk(clk),
    .I_0_0(i_0),
    .I_0_1(i_1),
    .I_0_2(i_2),
    .I_10_0(i_3),
    .I_10_1(i_4),
    .I_10_2(i_5),
    .I_11_0(i_6),
    .I_11_1(i_7),
    .I_11_2(i_8),
    .I_12_0(i_9),
    .I_12_1(i_10),
    .I_12_2(i_11),
    .I_13_0(i_12),
    .I_13_1(i_13),
    .I_13_2(i_14),
    .I_14_0(i_15),
    .I_14_1(i_16),
    .I_14_2(i_17),
    .I_15_0(i_18),
    .I_15_1(i_19),
    .I_15_2(i_20),
    .I_1_0(i_21),
    .I_1_1(i_22),
    .I_1_2(i_23),
    .I_2_0(i_24),
    .I_2_1(i_25),
    .I_2_2(i_26),
    .I_3_0(i_27),
    .I_3_1(i_28),
    .I_3_2(i_29),
    .I_4_0(i_30),
    .I_4_1(i_31),
    .I_4_2(i_32),
    .I_5_0(i_33),
    .I_5_1(i_34),
    .I_5_2(i_35),
    .I_6_0(i_36),
    .I_6_1(i_37),
    .I_6_2(i_38),
    .I_7_0(i_39),
    .I_7_1(i_40),
    .I_7_2(i_41),
    .I_8_0(i_42),
    .I_8_1(i_43),
    .I_8_2(i_44),
    .I_9_0(i_45),
    .I_9_1(i_46),
    .I_9_2(i_47),
    .valid_up(i_48),
    .O_0_0_0(out_dut[384:377]),
    .O_0_0_1(out_dut[376:369]),
    .O_0_0_2(out_dut[368:361]),
    .O_10_0_0(out_dut[360:353]),
    .O_10_0_1(out_dut[352:345]),
    .O_10_0_2(out_dut[344:337]),
    .O_11_0_0(out_dut[336:329]),
    .O_11_0_1(out_dut[328:321]),
    .O_11_0_2(out_dut[320:313]),
    .O_12_0_0(out_dut[312:305]),
    .O_12_0_1(out_dut[304:297]),
    .O_12_0_2(out_dut[296:289]),
    .O_13_0_0(out_dut[288:281]),
    .O_13_0_1(out_dut[280:273]),
    .O_13_0_2(out_dut[272:265]),
    .O_14_0_0(out_dut[264:257]),
    .O_14_0_1(out_dut[256:249]),
    .O_14_0_2(out_dut[248:241]),
    .O_15_0_0(out_dut[240:233]),
    .O_15_0_1(out_dut[232:225]),
    .O_15_0_2(out_dut[224:217]),
    .O_1_0_0(out_dut[216:209]),
    .O_1_0_1(out_dut[208:201]),
    .O_1_0_2(out_dut[200:193]),
    .O_2_0_0(out_dut[192:185]),
    .O_2_0_1(out_dut[184:177]),
    .O_2_0_2(out_dut[176:169]),
    .O_3_0_0(out_dut[168:161]),
    .O_3_0_1(out_dut[160:153]),
    .O_3_0_2(out_dut[152:145]),
    .O_4_0_0(out_dut[144:137]),
    .O_4_0_1(out_dut[136:129]),
    .O_4_0_2(out_dut[128:121]),
    .O_5_0_0(out_dut[120:113]),
    .O_5_0_1(out_dut[112:105]),
    .O_5_0_2(out_dut[104:97]),
    .O_6_0_0(out_dut[96:89]),
    .O_6_0_1(out_dut[88:81]),
    .O_6_0_2(out_dut[80:73]),
    .O_7_0_0(out_dut[72:65]),
    .O_7_0_1(out_dut[64:57]),
    .O_7_0_2(out_dut[56:49]),
    .O_8_0_0(out_dut[48:41]),
    .O_8_0_1(out_dut[40:33]),
    .O_8_0_2(out_dut[32:25]),
    .O_9_0_0(out_dut[24:17]),
    .O_9_0_1(out_dut[16:9]),
    .O_9_0_2(out_dut[8:1]),
    .valid_down(out_dut[0:0])
  );
  autovcoder_022032__ref ref_i (
    .clk(clk),
    .I_0_0(i_0),
    .I_0_1(i_1),
    .I_0_2(i_2),
    .I_10_0(i_3),
    .I_10_1(i_4),
    .I_10_2(i_5),
    .I_11_0(i_6),
    .I_11_1(i_7),
    .I_11_2(i_8),
    .I_12_0(i_9),
    .I_12_1(i_10),
    .I_12_2(i_11),
    .I_13_0(i_12),
    .I_13_1(i_13),
    .I_13_2(i_14),
    .I_14_0(i_15),
    .I_14_1(i_16),
    .I_14_2(i_17),
    .I_15_0(i_18),
    .I_15_1(i_19),
    .I_15_2(i_20),
    .I_1_0(i_21),
    .I_1_1(i_22),
    .I_1_2(i_23),
    .I_2_0(i_24),
    .I_2_1(i_25),
    .I_2_2(i_26),
    .I_3_0(i_27),
    .I_3_1(i_28),
    .I_3_2(i_29),
    .I_4_0(i_30),
    .I_4_1(i_31),
    .I_4_2(i_32),
    .I_5_0(i_33),
    .I_5_1(i_34),
    .I_5_2(i_35),
    .I_6_0(i_36),
    .I_6_1(i_37),
    .I_6_2(i_38),
    .I_7_0(i_39),
    .I_7_1(i_40),
    .I_7_2(i_41),
    .I_8_0(i_42),
    .I_8_1(i_43),
    .I_8_2(i_44),
    .I_9_0(i_45),
    .I_9_1(i_46),
    .I_9_2(i_47),
    .valid_up(i_48),
    .O_0_0_0(out_ref[384:377]),
    .O_0_0_1(out_ref[376:369]),
    .O_0_0_2(out_ref[368:361]),
    .O_10_0_0(out_ref[360:353]),
    .O_10_0_1(out_ref[352:345]),
    .O_10_0_2(out_ref[344:337]),
    .O_11_0_0(out_ref[336:329]),
    .O_11_0_1(out_ref[328:321]),
    .O_11_0_2(out_ref[320:313]),
    .O_12_0_0(out_ref[312:305]),
    .O_12_0_1(out_ref[304:297]),
    .O_12_0_2(out_ref[296:289]),
    .O_13_0_0(out_ref[288:281]),
    .O_13_0_1(out_ref[280:273]),
    .O_13_0_2(out_ref[272:265]),
    .O_14_0_0(out_ref[264:257]),
    .O_14_0_1(out_ref[256:249]),
    .O_14_0_2(out_ref[248:241]),
    .O_15_0_0(out_ref[240:233]),
    .O_15_0_1(out_ref[232:225]),
    .O_15_0_2(out_ref[224:217]),
    .O_1_0_0(out_ref[216:209]),
    .O_1_0_1(out_ref[208:201]),
    .O_1_0_2(out_ref[200:193]),
    .O_2_0_0(out_ref[192:185]),
    .O_2_0_1(out_ref[184:177]),
    .O_2_0_2(out_ref[176:169]),
    .O_3_0_0(out_ref[168:161]),
    .O_3_0_1(out_ref[160:153]),
    .O_3_0_2(out_ref[152:145]),
    .O_4_0_0(out_ref[144:137]),
    .O_4_0_1(out_ref[136:129]),
    .O_4_0_2(out_ref[128:121]),
    .O_5_0_0(out_ref[120:113]),
    .O_5_0_1(out_ref[112:105]),
    .O_5_0_2(out_ref[104:97]),
    .O_6_0_0(out_ref[96:89]),
    .O_6_0_1(out_ref[88:81]),
    .O_6_0_2(out_ref[80:73]),
    .O_7_0_0(out_ref[72:65]),
    .O_7_0_1(out_ref[64:57]),
    .O_7_0_2(out_ref[56:49]),
    .O_8_0_0(out_ref[48:41]),
    .O_8_0_1(out_ref[40:33]),
    .O_8_0_2(out_ref[32:25]),
    .O_9_0_0(out_ref[24:17]),
    .O_9_0_1(out_ref[16:9]),
    .O_9_0_2(out_ref[8:1]),
    .valid_down(out_ref[0:0])
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
    seed = 434759522;
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
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      i_20 = {$random(seed)};
      i_21 = {$random(seed)};
      i_22 = {$random(seed)};
      i_23 = {$random(seed)};
      i_24 = {$random(seed)};
      i_25 = {$random(seed)};
      i_26 = {$random(seed)};
      i_27 = {$random(seed)};
      i_28 = {$random(seed)};
      i_29 = {$random(seed)};
      i_30 = {$random(seed)};
      i_31 = {$random(seed)};
      i_32 = {$random(seed)};
      i_33 = {$random(seed)};
      i_34 = {$random(seed)};
      i_35 = {$random(seed)};
      i_36 = {$random(seed)};
      i_37 = {$random(seed)};
      i_38 = {$random(seed)};
      i_39 = {$random(seed)};
      i_40 = {$random(seed)};
      i_41 = {$random(seed)};
      i_42 = {$random(seed)};
      i_43 = {$random(seed)};
      i_44 = {$random(seed)};
      i_45 = {$random(seed)};
      i_46 = {$random(seed)};
      i_47 = {$random(seed)};
      i_48 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
