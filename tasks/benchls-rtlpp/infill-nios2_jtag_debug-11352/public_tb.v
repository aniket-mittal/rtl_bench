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

  rtlpp_11352 dut (
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
    stim[0] = 122'h295c1d812beb84cd5126bafb357982f;
    stim[1] = 122'h2f92a2c51efe8f223ea587e871a307f;
    stim[2] = 122'h34f700630a33037e894266cddef59b4;
    stim[3] = 122'h0628380d0d9216b13cd012a53fa3a95;
    stim[4] = 122'h3da9bd4fd3243fbf8ce4c44b7744b36;
    stim[5] = 122'h110967640474617da0f6f7c850bf1ef;
    stim[6] = 122'h11b1c746aa22b7862ce97ba668f1c2d;
    stim[7] = 122'h19d61498348b2d9da1ef23ab7457f90;
    stim[8] = 122'h3c731590a834199e72cb54407f17c29;
    stim[9] = 122'h0ab623a723afd4ad4ddcf4557beed63;
    stim[10] = 122'h2be570b17736ad3a58d4010a64d29c2;
    stim[11] = 122'h14b5d934a80cd0faee4ba3c6ffd45ed;
    stim[12] = 122'h30ea60104586c5f9b5db047d541423a;
    stim[13] = 122'h3960d53438c9f275414128d6dd5c0fb;
    stim[14] = 122'h1737c9ddbd8f1613d163cc587aae356;
    stim[15] = 122'h35785880b2614f1d20c8351a95f6c86;
    stim[16] = 122'h2d9343adec2ac3abb0577495e9aa738;
    stim[17] = 122'h3d3af5a1a0d4c88ef6fcdfe3fb8a868;
    stim[18] = 122'h03aae8a4d29c7b1805d4e3e3028f537;
    stim[19] = 122'h0e6d20ad5d32555286d0fa83603ac20;
    stim[20] = 122'h0bf96eace56f671e73e778f614a671d;
    stim[21] = 122'h062ce1799290c14563dad67d5aec781;
    stim[22] = 122'h1e56586b7bd86ff98065cf4427f2440;
    stim[23] = 122'h2bf91421d682819451507287da103e2;
    stim[24] = 122'h1711068919cfe1270355f7b8211ff5d;
    stim[25] = 122'h22456d6405f9d92d50e7a81dcdae58a;
    stim[26] = 122'h1dcb0200121df131ead9523ba4874c2;
    stim[27] = 122'h064df19bdf4ddb86dec9a547ba4eca7;
    stim[28] = 122'h0fd7ffe556959cc55c78a8781883a80;
    stim[29] = 122'h2275855baf0dd6440bfc90553e0d7e3;
    stim[30] = 122'h11fd37136e5786b150d41a6a34c38b4;
    stim[31] = 122'h3bb8fa60fd3b79daf3edd50863c4569;
    stim[32] = 122'h10b12a74d1954d60ec521775558142c;
    stim[33] = 122'h11c363a197807cdb71f25cce4b7b6e8;
    stim[34] = 122'h03cbfc626ba0a26645d83171bc60038;
    stim[35] = 122'h0fa67e82a9c4a28927d3481cad16178;
    stim[36] = 122'h019505f774663fb1857c4af5b556cb2;
    stim[37] = 122'h27465b155fa7d61e93c104a6f512ca1;
    stim[38] = 122'h304477451d02707d8cd77d98df1d9bb;
    stim[39] = 122'h21b4ca9672f55d6880e998ca3fce81f;
    stim[40] = 122'h19ad31317869a383b1ee2efe78f2ad8;
    stim[41] = 122'h268b8f52cf874cdceaf52a57f490ce2;
    stim[42] = 122'h05b2b79925e58eda2163fb17313a529;
    stim[43] = 122'h2df64979404c0fd287458de85ca4e90;
    stim[44] = 122'h2d6b46b3dfa77b60d653c4bb7b3689f;
    stim[45] = 122'h3d032892f3c7c608d7d531a9a128fab;
    stim[46] = 122'h11fde3257821e8730dfd9527eaf1ee7;
    stim[47] = 122'h21e1c4c40a1683b3fecc964411dd69c;
    stim[48] = 122'h04239db542b4541c5edb828fb556ac2;
    stim[49] = 122'h390275bb9919585214f6b133a151468;
    stim[50] = 122'h0e9324463d4393f567e9bc704352592;
    stim[51] = 122'h085e02ce102c9b0615576bdd3ab7528;
    stim[52] = 122'h19d35fb220aa9864386b03bcec823c8;
    stim[53] = 122'h148da8487f341f1dcd4fb29f6a263e7;
    stim[54] = 122'h228f5681242afd687e404da39a4d28e;
    stim[55] = 122'h1758c079ef3dd955ac4da1bd1797cc9;
    stim[56] = 122'h1ff26d39cf34777757456f9fe71daa8;
    stim[57] = 122'h3400f8af882b5d3c0bd543eb24bd817;
    stim[58] = 122'h04bab130e91843727a62bec4c0ad189;
    stim[59] = 122'h1e51fcbc8e901d4fcdfc2dacce5dc50;
    stim[60] = 122'h01639cfbb0d2f284a8e409ab5a0635a;
    stim[61] = 122'h2c5c9ff5c528f60c8174bd17deb16ca;
    stim[62] = 122'h3fceb151675e97c8eb723df4a4e640b;
    stim[63] = 122'h2ded0a71009cda4b14f3d0966cb2a17;
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
      expv[0] = 53'h17d9abcc179e83;
      expv[1] = 53'h1f438d183fbfc1;
      expv[2] = 53'h166ef7acda45b3;
      expv[3] = 53'h1529fd1d4af52b;
      expv[4] = 53'h025bba259b6d9a;
      expv[5] = 53'h1e4285f8f7fef1;
      expv[6] = 53'h1d33478e16f687;
      expv[7] = 53'h1d5ba2bfc8613f;
      expv[8] = 53'h0203f8be14f287;
      expv[9] = 53'h02abdf76b1f8d6;
      expv[10] = 53'h08532694e16872;
      expv[11] = 53'h1e37fea2f6d6f4;
      expv[12] = 53'h03eaa0a11d6b88;
      expv[13] = 53'h06b6eae07ddbe0;
      expv[14] = 53'h02c3d571ab4d58;
      expv[15] = 53'h08d4afb6436c26;
      expv[16] = 53'h04af4d539c439c;
      expv[17] = 53'h1f1fdc543462c2;
      expv[18] = 53'h1f18147a9bfd95;
      expv[19] = 53'h141b01d6106086;
      expv[20] = 53'h07b0a5338ef71c;
      expv[21] = 53'h13ead763c0f03c;
      expv[22] = 53'h1a213f92204044;
      expv[23] = 53'h143ed081f148f8;
      expv[24] = 53'h1dc108ffaed75f;
      expv[25] = 53'h00ee6d72c56a34;
      expv[26] = 53'h11dd243a616865;
      expv[27] = 53'h0a3dd27653fca6;
      expv[28] = 53'h03c0c41d40402b;
      expv[29] = 53'h02a9f06bf1f8fd;
      expv[30] = 53'h1351a61c5a65a3;
      expv[31] = 53'h08431e22b4f2d4;
      expv[32] = 53'h1baaac0a164685;
      expv[33] = 53'h06725bdb7462ed;
      expv[34] = 53'h0b8de3001c6380;
      expv[35] = 53'h00e568b0bc63d0;
      expv[36] = 53'h17adaab65949a6;
      expv[37] = 53'h0537a89650f0a6;
      expv[38] = 53'h0cc6f8ecddfbb3;
      expv[39] = 53'h0651fe740fff02;
      expv[40] = 53'h17f3c7956c636a;
      expv[41] = 53'h12bfa4867168e6;
      expv[42] = 53'h18b989d294d294;
      expv[43] = 53'h0f42e52748412e;
      expv[44] = 53'h05dbd9b44fdf22;
      expv[45] = 53'h0d4d0947d5fabe;
      expv[46] = 53'h093f578f73fcef;
      expv[47] = 53'h12208eeb4e672d;
      expv[48] = 53'h147daab561686a;
      expv[49] = 53'h099d0a8a3462c5;
      expv[50] = 53'h03821a92c96934;
      expv[51] = 53'h1ee9d5ba944295;
      expv[52] = 53'h1de76411e44278;
      expv[53] = 53'h14fb5131f3dcf8;
      expv[54] = 53'h0d1cd269474e29;
      expv[55] = 53'h0de8bcbe64d267;
      expv[56] = 53'h1cff38ed5442ab;
      expv[57] = 53'h1f5925ec0bfd03;
      expv[58] = 53'h16260568c4d231;
      expv[59] = 53'h0d6672ee286147;
      expv[60] = 53'h0d5ad031ad6b58;
      expv[61] = 53'h08bef58b654a6d;
      expv[62] = 53'h0fa5273205da04;
      expv[63] = 53'h04b365950bfd0a;
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
