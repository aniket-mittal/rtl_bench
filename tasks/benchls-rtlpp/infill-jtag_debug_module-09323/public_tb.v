// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 122;
  localparam OW = 53;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09323 dut (
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
    .jdo(out_vec[52:15]),
    .jrst_n(out_vec[14:14]),
    .st_ready_test_idle(out_vec[13:13]),
    .take_action_break_a(out_vec[12:12]),
    .take_action_break_b(out_vec[11:11]),
    .take_action_break_c(out_vec[10:10]),
    .take_action_ocimem_a(out_vec[9:9]),
    .take_action_ocimem_b(out_vec[8:8]),
    .take_action_tracectrl(out_vec[7:7]),
    .take_action_tracemem_a(out_vec[6:6]),
    .take_action_tracemem_b(out_vec[5:5]),
    .take_no_action_break_a(out_vec[4:4]),
    .take_no_action_break_b(out_vec[3:3]),
    .take_no_action_break_c(out_vec[2:2]),
    .take_no_action_ocimem_a(out_vec[1:1]),
    .take_no_action_tracemem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 122'h2560ddc282f28a5a9c305d75ecb1f45;
    stim[1] = 122'h353468141a6e499d820c1cf3d9738c1;
    stim[2] = 122'h057a74def2eff1802f749bbe1b450f8;
    stim[3] = 122'h3706de380d10d0ce77ff130d187e4da;
    stim[4] = 122'h365880c78618c37c456a8cb129d536c;
    stim[5] = 122'h3b82677deba10581b94573f68cb1d78;
    stim[6] = 122'h25e781312e45093f51e6f6a51220b8d;
    stim[7] = 122'h3aa5ec29ff853944776f91ca874c8dc;
    stim[8] = 122'h33a0480438d18f2eee727a75a70f589;
    stim[9] = 122'h0e7338d5f1a1030ecec7249c32b1a3c;
    stim[10] = 122'h04f44636c078ed353be85af7f32ac46;
    stim[11] = 122'h38c7d3d8b3730f4f0d7435adb9e7f18;
    stim[12] = 122'h1b8394cc50da5a79506acc918ff732c;
    stim[13] = 122'h330ebc3b7d931cd96dc1f2ef419d5cb;
    stim[14] = 122'h006f6d027a9ced9908438ad9cec5f16;
    stim[15] = 122'h14f4983ac9d86aaeed77e1b42c59afe;
    stim[16] = 122'h010213c370a9c69bdd74c76988688f7;
    stim[17] = 122'h0055455e211ac98436f2d8e4c33ad24;
    stim[18] = 122'h0b8f2777d2ddb93f2664058897af1c3;
    stim[19] = 122'h379e5fb24e1e391f86c3e10fd1ecc9a;
    stim[20] = 122'h2b1d5403af06e90040eb02bdb991489;
    stim[21] = 122'h2ee10e5252ef71e05dfadbabc522ad4;
    stim[22] = 122'h18a8b40e50a8b2488944baec824c2a2;
    stim[23] = 122'h1afb0a44c60e36c3d7c3284cf532233;
    stim[24] = 122'h003fa62ee7dc533ea9f0fdf07574399;
    stim[25] = 122'h3a8700bf91c6ab34f37c518c6ac4b8e;
    stim[26] = 122'h2671647c5f96306d9ff11b66aad3ef7;
    stim[27] = 122'h341ac0b9a5a99e3ff5f93d102e46851;
    stim[28] = 122'h2fefa64e9582f11c18f519622a7d5de;
    stim[29] = 122'h2794bff6677436f6f4c49486847c505;
    stim[30] = 122'h09a157c997cc8b02a57421c854c0f1c;
    stim[31] = 122'h33a49a6f71d3c6994f60d1f31fd185d;
    stim[32] = 122'h11dc9fa510c7af1415e845002fa1d45;
    stim[33] = 122'h06b8bef99825b62d44c80d855200bf3;
    stim[34] = 122'h20c243555b2d4048a2442988afd26b4;
    stim[35] = 122'h154a4fecf124f0186f75c54d01b7a75;
    stim[36] = 122'h3e2b6006eced94e66be4839e06c84aa;
    stim[37] = 122'h0e00fbb6075be33305c08761fc12fce;
    stim[38] = 122'h20aaa314e0a3b88f0ac071bea306e63;
    stim[39] = 122'h11054fa40093503161da41c33d09940;
    stim[40] = 122'h0d72f3b14a161f12055adf60b3327a7;
    stim[41] = 122'h1c8b6a41ed000c319cd95b51743d0c3;
    stim[42] = 122'h31d143b217c3df48c6dfc3f01cecac0;
    stim[43] = 122'h16e71aee920303351c6aca72a9d8446;
    stim[44] = 122'h376d1f5122ab251d054e3b45f510f90;
    stim[45] = 122'h27e7b16d80c91398a57b4432a4b0b97;
    stim[46] = 122'h1de9263013ff2fccf448b7db9b99f81;
    stim[47] = 122'h2b93059a7ef09b65f3df2d4c013f122;
    stim[48] = 122'h3faa871823aba06f49c2da841768c29;
    stim[49] = 122'h10d14c164e18fd3de55b698edf0d2c6;
    stim[50] = 122'h18deff17c709903ff25d0e110bef748;
    stim[51] = 122'h22cea459d5f79c232d6f0e70edef905;
    stim[52] = 122'h142f5e725e1072692766f868a9e31f4;
    stim[53] = 122'h3de89239c8bf4303a9eb2f029b004ac;
    stim[54] = 122'h32eae18eb754f6c7a2d221cf3137dc9;
    stim[55] = 122'h14fa32a9204ea550df782b06daaef54;
    stim[56] = 122'h28e9e538940101012b6129dd6ce23cd;
    stim[57] = 122'h1388c286a50bdd3d8761fd055dc866c;
    stim[58] = 122'h35f496e07d5255b22b7eb3e81631360;
    stim[59] = 122'h0aef3601dfc76a88156714f703df242;
    stim[60] = 122'h3bd8d95f7feae9f9b1ccbb4d9ee2b9c;
    stim[61] = 122'h1a95cb988f1b2b98c5e4de17ee63d2b;
    stim[62] = 122'h1094fff6f1a76dd8e6c3373960dfdd4;
    stim[63] = 122'h052e2f73040cc23d58753fe891d0abc;
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
      expv[0] = 53'h1b2c7d14xx0xx2;
      expv[1] = 53'h165ce304xx0xx2;
      expv[2] = 53'h06d143e0xx0xx0;
      expv[3] = 53'h061f9368xx0xx1;
      expv[4] = 53'h0a754db0xx0xx0;
      expv[5] = 53'h032c75e0xx4xx0;
      expv[6] = 53'h04882e34xx0xx2;
      expv[7] = 53'h01d32370xx0xx0;
      expv[8] = 53'h09c3d624xx0xx2;
      expv[9] = 53'h0cac68f0xx6xx0;
      expv[10] = 53'h1ccab118xx0xx1;
      expv[11] = 53'h0e79fc60xx0xx0;
      expv[12] = 53'h03fdccb0xx0xx0;
      expv[13] = 53'h1067572cxx4xx3;
      expv[14] = 53'h13b17c58xx4xx1;
      expv[15] = 53'h0b166bf8xx0xx1;
      expv[16] = 53'h021a23dcxx0xx3;
      expv[17] = 53'h10ceb490xx2xx0;
      expv[18] = 53'h05ebc70cxx0xx3;
      expv[19] = 53'h147b3268xx6xx1;
      expv[20] = 53'h0e645224xx2xx2;
      expv[21] = 53'h1148ab50xx0xx0;
      expv[22] = 53'h00930a88xx4xx1;
      expv[23] = 53'h1d4c88ccxx4xx3;
      expv[24] = 53'h1d5d0e64xx0xx2;
      expv[25] = 53'h1ab12e38xx0xx1;
      expv[26] = 53'h0ab4fbdcxx0xx3;
      expv[27] = 53'h0b91a144xx0xx2;
      expv[28] = 53'h0a9f5778xx2xx1;
      expv[29] = 53'h011f1414xx6xx2;
      expv[30] = 53'h15303c70xx0xx0;
      expv[31] = 53'h07f46174xx0xx2;
      expv[32] = 53'h0be87514xx0xx2;
      expv[33] = 53'h14802fccxx6xx3;
      expv[34] = 53'h0bf49ad0xx4xx0;
      expv[35] = 53'h006de9d4xx0xx2;
      expv[36] = 53'h01b212a8xx0xx1;
      expv[37] = 53'h1f04bf38xx4xx1;
      expv[38] = 53'h08c1b98cxx6xx3;
      expv[39] = 53'h0f426500xx4xx0;
      expv[40] = 53'h0ccc9e9cxx4xx3;
      expv[41] = 53'h1d0f430cxx6xx3;
      expv[42] = 53'h073b2b00xx6xx0;
      expv[43] = 53'h0a761118xx0xx1;
      expv[44] = 53'h1d443e40xx4xx0;
      expv[45] = 53'h092c2e5cxx0xx3;
      expv[46] = 53'h06e67e04xx4xx2;
      expv[47] = 53'h004fc488xx4xx1;
      expv[48] = 53'h05da30a4xx4xx2;
      expv[49] = 53'h17c34b18xx4xx1;
      expv[50] = 53'h02fbdd20xx4xx0;
      expv[51] = 53'h1b7be414xx0xx2;
      expv[52] = 53'h0a78c7d0xx0xx0;
      expv[53] = 53'h06c012b0xx0xx0;
      expv[54] = 53'h0c4df724xx6xx2;
      expv[55] = 53'h16abbd50xx0xx0;
      expv[56] = 53'h1b388f34xx0xx2;
      expv[57] = 53'h177219b0xx0xx0;
      expv[58] = 53'h058c4d80xx0xx0;
      expv[59] = 53'h00f7c908xx0xx1;
      expv[60] = 53'h07b8ae70xx4xx0;
      expv[61] = 53'h1b98f4acxx0xx3;
      expv[62] = 53'h1837f750xx6xx0;
      expv[63] = 53'h04742af0xx0xx0;
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
