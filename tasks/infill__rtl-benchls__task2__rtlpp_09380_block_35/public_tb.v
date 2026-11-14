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

  rtlpp_09380 dut (
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
    stim[0] = 122'h1f7abf75a1965dd57e9e68fe516f3f6;
    stim[1] = 122'h074e508c297665479ea5a780ae53a62;
    stim[2] = 122'h12e7d0487c7dc0c2af501a09e0b8cb3;
    stim[3] = 122'h3a8d1f9934cd56805730af398d0ea91;
    stim[4] = 122'h3d57950302b5bee8f8feec5f8800e33;
    stim[5] = 122'h16e4994b073ef9e5c4dc67beab3ba19;
    stim[6] = 122'h3a4c21339271d1a825790655de4fad8;
    stim[7] = 122'h28f93849aa6ced964ae9f3b150e2a5a;
    stim[8] = 122'h21eeb861c3d6d5c9743deb08c7e6b98;
    stim[9] = 122'h003bd9389e2432bec24f98c82dbdc26;
    stim[10] = 122'h37d7b751d39b4961964b5bb10dc0a65;
    stim[11] = 122'h1772eaafa2787411b6c23e106bffbe0;
    stim[12] = 122'h34f5c6bc72cfabb19cf6d1280ea97f1;
    stim[13] = 122'h3d5c1bb92d5ddb34e9ce0fdd4208cf3;
    stim[14] = 122'h345a9b881924affed85d1bbf8e5b8bb;
    stim[15] = 122'h13b653302036a9ee49e9e49324fc2a6;
    stim[16] = 122'h2a122e15c7a7530c5d7bd1753ceb4ec;
    stim[17] = 122'h1c8694a1a7c681b77f73f7d4231f38d;
    stim[18] = 122'h1203cea2638f7dfa53706cf9ff99a4c;
    stim[19] = 122'h0a5704a4c07a99aadcf52d6b371cf83;
    stim[20] = 122'h2d654e210a813a73d2435d98724c78c;
    stim[21] = 122'h149462a29c8bf09f49777b84e3535ad;
    stim[22] = 122'h1c0186537a13018d2fe421bda83873c;
    stim[23] = 122'h2f67c797d832abfa46720e9526dc186;
    stim[24] = 122'h365843f65cbfd9cae463b5405cee9c8;
    stim[25] = 122'h2557ce2ffe1cb36217e4d3e4520ce64;
    stim[26] = 122'h373b70c072259ffca1d323037a5bccb;
    stim[27] = 122'h0ad1f557c6786cb4f573f8ee28c8cb9;
    stim[28] = 122'h0b7d9b7ee0c269e421ec64f79fe19f6;
    stim[29] = 122'h3c405a27d6c71933ee73e3aa78c93cb;
    stim[30] = 122'h382e9fd6c786bb73596ef39b47d5774;
    stim[31] = 122'h00351c0da01f5d37e3fcf7065b09a0e;
    stim[32] = 122'h1386eb4070cd9e6886e04f8abec76c8;
    stim[33] = 122'h03bb135f9a5473c776c8f2a262a9807;
    stim[34] = 122'h0a544173dcf8510552d64d14f08f71f;
    stim[35] = 122'h1697595847824419b5dccc45c536f39;
    stim[36] = 122'h0455472f9f0d600e93edfafdc7f9b71;
    stim[37] = 122'h25ed2953dd9d3e0b1deabac17b7e32b;
    stim[38] = 122'h2a438c3b642acf38407b71a3057335d;
    stim[39] = 122'h0e95c61782006c3482f0690a3a06501;
    stim[40] = 122'h1f11e64c5b8269893ce3e0800079fa6;
    stim[41] = 122'h05b9821bf20cd88fd8c57b9316468ca;
    stim[42] = 122'h0baf4bdad1b8dd6957fcb41cf56bbf7;
    stim[43] = 122'h36f736c37cc0132a55e5a5ad9f20426;
    stim[44] = 122'h3f47d7a7325b159d7253031fe8c0afb;
    stim[45] = 122'h0b3ca2db6e3d6b601cd3ad9f4ef397c;
    stim[46] = 122'h07b3bf3c6c59265939fc48995011485;
    stim[47] = 122'h25fbf2c94c562132f16101df6a64129;
    stim[48] = 122'h1eea91274fccf3d635d526f33d0a759;
    stim[49] = 122'h353ff7c5cdb0d4219f5b6a9ac5f2b96;
    stim[50] = 122'h1294ea616d31ba54a1d9c7e361c806c;
    stim[51] = 122'h01efdd2a09d6df53cef8435996f3cfa;
    stim[52] = 122'h299cc35912c49e383be01e9e6c88d38;
    stim[53] = 122'h039fcbf8fe3def75d76836a3c71ae6b;
    stim[54] = 122'h2a3cd4e8a8073267d259ae943c4f4a0;
    stim[55] = 122'h1f688d80fd0e24a4b266cd43c07669d;
    stim[56] = 122'h2ea1c4d06ae6c16c29e1c206cdb3685;
    stim[57] = 122'h3df8ddac1c3753529374c373f5ebafd;
    stim[58] = 122'h2063dd78c99bb79dbbc6720b4e88f22;
    stim[59] = 122'h0291a35bab0c25c450696ef529405bf;
    stim[60] = 122'h3070352e5e1f0e5524ca1ab1f71f332;
    stim[61] = 122'h1430c3435ac526396d59dfed8205c3e;
    stim[62] = 122'h24954a8d8467ea464cdc5856f32dc1c;
    stim[63] = 122'h108daf6871798003e5496f4598e8ef2;
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
      expv[0] = 53'h0000000000xxxx;
      expv[1] = 53'h0000000000xxxx;
      expv[2] = 53'h0000000000xxxx;
      expv[3] = 53'h0000000000xxxx;
      expv[4] = 53'h0000000000xxxx;
      expv[5] = 53'hxxxxxxxxxxxxxx;
      expv[6] = 53'hxxxxxxxxxxxxxx;
      expv[7] = 53'hxxxxxxxxxxxxxx;
      expv[8] = 53'h0000000000xxxx;
      expv[9] = 53'h0000000000xxxx;
      expv[10] = 53'hxxxxxxxxxxxxxx;
      expv[11] = 53'hxxxxxxxxxxxxxx;
      expv[12] = 53'hxxxxxxxxxxxxxx;
      expv[13] = 53'hxxxxxxxxxxxxxx;
      expv[14] = 53'hxxxxxxxxxxxxxx;
      expv[15] = 53'hxxxxxxxxxxxxxx;
      expv[16] = 53'hxxxxxxxxxxxxxx;
      expv[17] = 53'hxxxxxxxxxxxxxx;
      expv[18] = 53'hxxxxxxxxxxxxxx;
      expv[19] = 53'hxxxxxxxxxxxxxx;
      expv[20] = 53'hxxxxxxxxxxxxxx;
      expv[21] = 53'hxxxxxxxxxxxxxx;
      expv[22] = 53'hxxxxxxxxxxxxxx;
      expv[23] = 53'hxxxxxxxxxxxxxx;
      expv[24] = 53'hxxxxxxxxxxxxxx;
      expv[25] = 53'hxxxxxxxxxxxxxx;
      expv[26] = 53'hxxxxxxxxxxxxxx;
      expv[27] = 53'hxxxxxxxxxxxxxx;
      expv[28] = 53'hxxxxxxxxxxxxxx;
      expv[29] = 53'hxxxxxxxxxxxxxx;
      expv[30] = 53'hxxxxxxxxxxxxxx;
      expv[31] = 53'hxxxxxxxxxxxxxx;
      expv[32] = 53'hxxxxxxxxxxxxxx;
      expv[33] = 53'hxxxxxxxxxxxxxx;
      expv[34] = 53'hxxxxxxxxxxxxxx;
      expv[35] = 53'hxxxxxxxxxxxxxx;
      expv[36] = 53'hxxxxxxxxxxxxxx;
      expv[37] = 53'hxxxxxxxxxxxxxx;
      expv[38] = 53'hxxxxxxxxxxxxxx;
      expv[39] = 53'hxxxxxxxxxxxxxx;
      expv[40] = 53'hxxxxxxxxxxxxxx;
      expv[41] = 53'hxxxxxxxxxxxxxx;
      expv[42] = 53'hxxxxxxxxxxxxxx;
      expv[43] = 53'hxxxxxxxxxxxxxx;
      expv[44] = 53'hxxxxxxxxxxxxxx;
      expv[45] = 53'hxxxxxxxxxxxxxx;
      expv[46] = 53'hxxxxxxxxxxxxxx;
      expv[47] = 53'hxxxxxxxxxxxxxx;
      expv[48] = 53'hxxxxxxxxxxxxxx;
      expv[49] = 53'hxxxxxxxxxxxxxx;
      expv[50] = 53'hxxxxxxxxxxxxxx;
      expv[51] = 53'hxxxxxxxxxxxxxx;
      expv[52] = 53'hxxxxxxxxxxxxxx;
      expv[53] = 53'hxxxxxxxxxxxxxx;
      expv[54] = 53'hxxxxxxxxxxxxxx;
      expv[55] = 53'hxxxxxxxxxxxxxx;
      expv[56] = 53'hxxxxxxxxxxxxxx;
      expv[57] = 53'hxxxxxxxxxxxxxx;
      expv[58] = 53'hxxxxxxxxxxxxxx;
      expv[59] = 53'hxxxxxxxxxxxxxx;
      expv[60] = 53'hxxxxxxxxxxxxxx;
      expv[61] = 53'hxxxxxxxxxxxxxx;
      expv[62] = 53'hxxxxxxxxxxxxxx;
      expv[63] = 53'hxxxxxxxxxxxxxx;
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
