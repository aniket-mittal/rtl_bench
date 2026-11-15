// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 122;
  localparam OW = 50;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05195 dut (
    .clk(clk),
    .MonDReg(in_vec[121:90]),
    .break_readreg(in_vec[89:58]),
    .dbrk_hit0_latch(in_vec[57:57]),
    .dbrk_hit1_latch(in_vec[56:56]),
    .dbrk_hit2_latch(in_vec[55:55]),
    .dbrk_hit3_latch(in_vec[54:54]),
    .debugack(in_vec[53:53]),
    .monitor_error(in_vec[52:52]),
    .monitor_ready(in_vec[51:51]),
    .reset_n(in_vec[50:50]),
    .resetlatch(in_vec[49:49]),
    .tracemem_on(in_vec[48:48]),
    .tracemem_trcdata(in_vec[47:12]),
    .tracemem_tw(in_vec[11:11]),
    .trc_im_addr(in_vec[10:4]),
    .trc_on(in_vec[3:3]),
    .trc_wrap(in_vec[2:2]),
    .trigbrktype(in_vec[1:1]),
    .trigger_state_1(in_vec[0:0]),
    .jdo(out_vec[49:12]),
    .jrst_n(out_vec[11:11]),
    .st_ready_test_idle(out_vec[10:10]),
    .take_action_break_a(out_vec[9:9]),
    .take_action_break_b(out_vec[8:8]),
    .take_action_break_c(out_vec[7:7]),
    .take_action_ocimem_a(out_vec[6:6]),
    .take_action_ocimem_b(out_vec[5:5]),
    .take_action_tracectrl(out_vec[4:4]),
    .take_no_action_break_a(out_vec[3:3]),
    .take_no_action_break_b(out_vec[2:2]),
    .take_no_action_break_c(out_vec[1:1]),
    .take_no_action_ocimem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 122'h0d6f4c3002c8506e938feb4d70f34f6;
    stim[1] = 122'h1dda11d893eb72b42124df8b95344ed;
    stim[2] = 122'h090c1aacf4a2fc164c5708972933e23;
    stim[3] = 122'h1732865fd267cdc8ac5fcf40267f12d;
    stim[4] = 122'h3a6ea1c32af253eb1f4a5684f062629;
    stim[5] = 122'h0497475eb60ef5ba037109a38702933;
    stim[6] = 122'h192c085cd0003a43afceed5b5382b33;
    stim[7] = 122'h0dd33027c15502cd196038dd127ef3c;
    stim[8] = 122'h342c49d1b016f5fe1ccbd2db04b00c7;
    stim[9] = 122'h135e36c0912c7dff4feee3f29638091;
    stim[10] = 122'h38213d708cb55fcbab73014b107066e;
    stim[11] = 122'h32f1d1b3ddb8a816fbdaeac9fc2e374;
    stim[12] = 122'h34c8c5c87fdd8c9e66595c42b6670d2;
    stim[13] = 122'h0e794b21b1222fe4e1dd3cbad5eb16e;
    stim[14] = 122'h06c6a58f8bbd942f54da95be61cf60f;
    stim[15] = 122'h39daa7cd7c967999ccfe91148ed260a;
    stim[16] = 122'h10b7ed45d271bbe1357f53f9010a797;
    stim[17] = 122'h3a0d509556d57fa1afe23bc1817ac45;
    stim[18] = 122'h1f4bd6c972389471d86daeff2a97022;
    stim[19] = 122'h179a9b8fd7271eacf16ca45036a4a12;
    stim[20] = 122'h2fe0f169d8dd86a5cf79fd2f6eeb655;
    stim[21] = 122'h0127801e2f13bee94444e111f58a29d;
    stim[22] = 122'h040e163c89cbff29b7cb235f5a93e75;
    stim[23] = 122'h1af19a9109fe8814c6fd171cf6d11bd;
    stim[24] = 122'h36c8c7b4a8eba1f952c1364c76ba664;
    stim[25] = 122'h1746b3a071cc50d004649d7a7f1e19a;
    stim[26] = 122'h2946e69c360f4879c964c9e90e4b3ae;
    stim[27] = 122'h1f41103ab38910fb9bf63076697ec0c;
    stim[28] = 122'h310d02ca929ccd092f7f77a8ed0e023;
    stim[29] = 122'h347cf0dd8016b92cd4f1762cc4bd042;
    stim[30] = 122'h208bca238e848c7967fec772a532938;
    stim[31] = 122'h1ac7b657ab1197fd55e6b1fa6746894;
    stim[32] = 122'h184c90e15d80dc4eaecd96f50bc8493;
    stim[33] = 122'h0329e18474122abcd8fc9257be1b002;
    stim[34] = 122'h3722f1906f2983408e76f2d529a47af;
    stim[35] = 122'h37a9ef897d3f49591c524106257cf07;
    stim[36] = 122'h23ab208f15582cda7de9c05fa0a0663;
    stim[37] = 122'h0de3765ebb75cb9071fd578d6c4f908;
    stim[38] = 122'h31c55eb9e31108491d651ae1ae795fe;
    stim[39] = 122'h0896f5841432f6dcd86de496c3b5f6d;
    stim[40] = 122'h311313849ee5bf4b9c793d00b480f6f;
    stim[41] = 122'h110aa7c5889fd1c362f2cdf079c48d2;
    stim[42] = 122'h08dca46ceeaac3801bdafd977ad6a0f;
    stim[43] = 122'h37b3b1b87e92e29193dd8af0243434f;
    stim[44] = 122'h33213a9b69ac978ce6c67b24daa07cc;
    stim[45] = 122'h36ea606d4d15feccc5cea01180e3a59;
    stim[46] = 122'h2838ccc70d0c1a7ffb77161943c8af0;
    stim[47] = 122'h3211f261684ce554b2fe9af8e40380b;
    stim[48] = 122'h3f5b09e87a52cac2b36af4b594c9ec4;
    stim[49] = 122'h3bb64d8f68a6cef282f083ed820af08;
    stim[50] = 122'h30747527afbd328730ecf373d235b69;
    stim[51] = 122'h07db6e22f36b6584c64b66cd634751c;
    stim[52] = 122'h15a223f3638381c98f50c6e8794829e;
    stim[53] = 122'h0780ade335fd5ca6596ac3a0bb333fd;
    stim[54] = 122'h02468c95735715c58fcbea58fe4d901;
    stim[55] = 122'h18a4053a168e42acd07cd02518bd352;
    stim[56] = 122'h04b14d5eb258a59c497679ddb28c7f7;
    stim[57] = 122'h1089652e5c60921536cce9236b95f8c;
    stim[58] = 122'h0ef30dde05d5584381c3ceed9290aa3;
    stim[59] = 122'h0ecb1069de8066f4ade8fc42aae6626;
    stim[60] = 122'h38584a133d434ade9e4a401cc964156;
    stim[61] = 122'h131973c5855450a131e0244880e0e9b;
    stim[62] = 122'h36fa69cb5557cefd71cef807479e0c2;
    stim[63] = 122'h343ccc62b8318d8c86d93d6d599004d;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 50'h0000000000000;
      expv[1] = 50'h0000000000000;
      expv[2] = 50'h0000000000000;
      expv[3] = 50'h0000000000000;
      expv[4] = 50'h0000000000000;
      expv[5] = 50'h0000000000000;
      expv[6] = 50'h0000000000000;
      expv[7] = 50'h0000000000000;
      expv[8] = 50'h0000000000000;
      expv[9] = 50'h0000000000000;
      expv[10] = 50'h0000000000000;
      expv[11] = 50'h0000000000000;
      expv[12] = 50'h0000000000000;
      expv[13] = 50'h0000000000000;
      expv[14] = 50'h0000000000000;
      expv[15] = 50'h0000000000000;
      expv[16] = 50'h0000000000000;
      expv[17] = 50'h0000000000000;
      expv[18] = 50'h0000000000000;
      expv[19] = 50'h0000000000000;
      expv[20] = 50'h0000000000000;
      expv[21] = 50'h0000000000000;
      expv[22] = 50'h0000000000000;
      expv[23] = 50'h0000000000000;
      expv[24] = 50'h0000000000000;
      expv[25] = 50'h0000000000000;
      expv[26] = 50'h0000000000000;
      expv[27] = 50'h0000000000000;
      expv[28] = 50'h0000000000000;
      expv[29] = 50'h0000000000000;
      expv[30] = 50'h0000000000000;
      expv[31] = 50'h0000000000000;
      expv[32] = 50'h0000000000000;
      expv[33] = 50'h0000000000000;
      expv[34] = 50'h0000000000000;
      expv[35] = 50'h0000000000000;
      expv[36] = 50'h0000000000000;
      expv[37] = 50'h0000000000000;
      expv[38] = 50'h0000000000000;
      expv[39] = 50'h0000000000000;
      expv[40] = 50'h0000000000000;
      expv[41] = 50'h0000000000000;
      expv[42] = 50'h0000000000000;
      expv[43] = 50'h0000000000000;
      expv[44] = 50'h0000000000000;
      expv[45] = 50'h0000000000000;
      expv[46] = 50'h0000000000000;
      expv[47] = 50'h0000000000000;
      expv[48] = 50'h0000000000000;
      expv[49] = 50'h0000000000000;
      expv[50] = 50'h0000000000000;
      expv[51] = 50'h0000000000000;
      expv[52] = 50'h0000000000000;
      expv[53] = 50'h0000000000000;
      expv[54] = 50'h0000000000000;
      expv[55] = 50'h0000000000000;
      expv[56] = 50'h0000000000000;
      expv[57] = 50'h0000000000000;
      expv[58] = 50'h0000000000000;
      expv[59] = 50'h0000000000000;
      expv[60] = 50'h0000000000000;
      expv[61] = 50'h0000000000000;
      expv[62] = 50'h0000000000000;
      expv[63] = 50'h0000000000000;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
