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

  rtlpp_11587 dut (
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
    stim[0] = 122'h36669fb01a67dfc3970064b17f19a4f;
    stim[1] = 122'h1921d9818cdf389d263de1b0ccf18bc;
    stim[2] = 122'h201e8a3102852e091a70c1df8dd24f6;
    stim[3] = 122'h34216853a958b6c0b7c68a864a7aa30;
    stim[4] = 122'h3c41a056f0281a428067158b4926f7f;
    stim[5] = 122'h0925ff42c91bc484ceebfaf5f946461;
    stim[6] = 122'h2add94ce6a89e67c944dacf4938ec1d;
    stim[7] = 122'h22d1ae8317f371250d5b10634f94c1d;
    stim[8] = 122'h0f257cb82c7e8d2818fe1ba689cabd6;
    stim[9] = 122'h0dea4cd24c78cefeafc899a12aec10a;
    stim[10] = 122'h0f15a9a531dfd674d5e1c0e60918b47;
    stim[11] = 122'h0d2dd5190f9a2f89ea7f3c5182305e3;
    stim[12] = 122'h2f72d4df33b7970fa7f5f59a80aaa18;
    stim[13] = 122'h17bf127e75a544f593d2d7dc4f1e027;
    stim[14] = 122'h03bd4b7838dd2c588ef9bc63d7477b1;
    stim[15] = 122'h3e6d46362773af2cb6489edc008f2b0;
    stim[16] = 122'h1ea0c7167c4acd6301637238b7a603c;
    stim[17] = 122'h2f2e03891b1e53d259f7d611e3f80a1;
    stim[18] = 122'h28697966d8b51a62d0e469577173757;
    stim[19] = 122'h32b0254ff7d09083aeebf9fe0972229;
    stim[20] = 122'h3b9df468475df838d2449fd58209171;
    stim[21] = 122'h36b0d610c41198ec5947319502a6910;
    stim[22] = 122'h2db29e9b33e9ae862e6f2f12d76895f;
    stim[23] = 122'h0b43a26a8338674650c021dc67fe6f9;
    stim[24] = 122'h3884e4b7619e6f7c22c823290d74f3c;
    stim[25] = 122'h1465c6a49a4fe1980dc46b218d72904;
    stim[26] = 122'h107ec4c02d57880d446152c5a0ec40a;
    stim[27] = 122'h22bf6f3b729f90e383ebad059b0ef9e;
    stim[28] = 122'h3a19b82a79a9e1ada37634073a74cbc;
    stim[29] = 122'h216218a57c2ecd4fb1e51510ef49e48;
    stim[30] = 122'h315d55401876e93363780a5e70f8b32;
    stim[31] = 122'h365db3001263f123f6e236208e78c65;
    stim[32] = 122'h2e4a94083c3216695d508b9c06574fa;
    stim[33] = 122'h06acae2ecb2fb20ebbf08c9be52caf9;
    stim[34] = 122'h160f444c1af3d0a4ee6d3662d44f1d0;
    stim[35] = 122'h223ef44b7eac5309f2ed4bec575e965;
    stim[36] = 122'h3e78c14a6afe1cf0fa573931c16f7d9;
    stim[37] = 122'h36b590cf394d88b5ea64c87144e14a6;
    stim[38] = 122'h0a8701e4180f713085446a82c8a8d2c;
    stim[39] = 122'h12f42c70bbb9586da1eca1d27377edb;
    stim[40] = 122'h283d370b3057fd44cee5456266a273a;
    stim[41] = 122'h236f15995cf3b456e2ccc2565b90c96;
    stim[42] = 122'h13f13b14e489efece7628578f561238;
    stim[43] = 122'h1e27c98d548618796dd02f7e72bbb9c;
    stim[44] = 122'h1d9ff344df099cd432d2c58a3bd2458;
    stim[45] = 122'h2ebde5b49c3da92edbd31a2b924784e;
    stim[46] = 122'h25cce0c1efe7d3a5ccc078fb45ae6e4;
    stim[47] = 122'h155bd5cb76008904294b933529df2b2;
    stim[48] = 122'h307a0855a0cb26ed07c69245783d9dd;
    stim[49] = 122'h156274eebd3d44433ac0da57958f4ed;
    stim[50] = 122'h19a818bd8c0f682d86eb27b58c5a2e4;
    stim[51] = 122'h0421979857091c283f757f6305672e1;
    stim[52] = 122'h2273acc644d299caec4df83508e8525;
    stim[53] = 122'h1baeee64ea755c89cdea2278bbe7abc;
    stim[54] = 122'h28d467e7e3ede7450af61bca2020242;
    stim[55] = 122'h3a2de02869741355d05d1465d0c4f13;
    stim[56] = 122'h1acfb058e23fb79994fe02cd72272dc;
    stim[57] = 122'h1394c9efed01f8f9de2fc0badb9ca10;
    stim[58] = 122'h0250324ae738c2f1a7d72edcd65bd43;
    stim[59] = 122'h20f970135097f24be7569a4c3e74ecb;
    stim[60] = 122'h200d5d7641647d33a2dff95fd5e63d0;
    stim[61] = 122'h36b02fd5e76655d7bec7a35431f8e43;
    stim[62] = 122'h1006a98c076c72cc08fe92b70dd363a;
    stim[63] = 122'h14cbd75876c59ccbe040265e2826816;
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
      expv[0] = 50'hxxxxxxxxxx111;
      expv[1] = 50'hxxxxxxxxxx056;
      expv[2] = 50'hxxxxxxxxxx1a1;
      expv[3] = 50'hxxxxxxxxxx803;
      expv[4] = 50'hxxxxxxxxxx011;
      expv[5] = 50'hxxxxxxxxxx00d;
      expv[6] = 50'hxxxxxxxxxx81b;
      expv[7] = 50'hxxxxxxxxxx85c;
      expv[8] = 50'hxxxxxxxxxx5c0;
      expv[9] = 50'hxxxxxxxxxxa91;
      expv[10] = 50'hxxxxxxxxxx101;
      expv[11] = 50'hxxxxxxxxxx2a1;
      expv[12] = 50'hxxxxxxxxxx056;
      expv[13] = 50'hxxxxxxxxxx921;
      expv[14] = 50'hxxxxxxxxxx02d;
      expv[15] = 50'hxxxxxxxxxx803;
      expv[16] = 50'hxxxxxxxxxx01f;
      expv[17] = 50'hxxxxxxxxxx029;
      expv[18] = 50'hxxxxxxxxxx501;
      expv[19] = 50'hxxxxxxxxxx015;
      expv[20] = 50'hxxxxxxxxxx80b;
      expv[21] = 50'hxxxxxxxxxx809;
      expv[22] = 50'hxxxxxxxxxx291;
      expv[23] = 50'hxxxxxxxxxxc1b;
      expv[24] = 50'hxxxxxxxxxx817;
      expv[25] = 50'hxxxxxxxxxx80d;
      expv[26] = 50'hxxxxxxxxxx011;
      expv[27] = 50'hxxxxxxxxxx011;
      expv[28] = 50'hxxxxxxxxxx056;
      expv[29] = 50'hxxxxxxxxxx013;
      expv[30] = 50'hxxxxxxxxxx240;
      expv[31] = 50'hxxxxxxxxxx003;
      expv[32] = 50'hxxxxxxxxxx9b1;
      expv[33] = 50'hxxxxxxxxxx050;
      expv[34] = 50'hxxxxxxxxxx005;
      expv[35] = 50'hxxxxxxxxxx003;
      expv[36] = 50'hxxxxxxxxxx831;
      expv[37] = 50'hxxxxxxxxxx281;
      expv[38] = 50'hxxxxxxxxxx81f;
      expv[39] = 50'hxxxxxxxxxx211;
      expv[40] = 50'hxxxxxxxxxx091;
      expv[41] = 50'hxxxxxxxxxxa01;
      expv[42] = 50'hxxxxxxxxxx017;
      expv[43] = 50'hxxxxxxxxxx854;
      expv[44] = 50'hxxxxxxxxxx833;
      expv[45] = 50'hxxxxxxxxxx9d0;
      expv[46] = 50'hxxxxxxxxxxc0d;
      expv[47] = 50'hxxxxxxxxxxa81;
      expv[48] = 50'hxxxxxxxxxx81f;
      expv[49] = 50'hxxxxxxxxxx811;
      expv[50] = 50'hxxxxxxxxxx00f;
      expv[51] = 50'hxxxxxxxxxx021;
      expv[52] = 50'hxxxxxxxxxx805;
      expv[53] = 50'hxxxxxxxxxx01d;
      expv[54] = 50'hxxxxxxxxxx0a1;
      expv[55] = 50'hxxxxxxxxxx940;
      expv[56] = 50'hxxxxxxxxxx43b;
      expv[57] = 50'hxxxxxxxxxx009;
      expv[58] = 50'hxxxxxxxxxxa40;
      expv[59] = 50'hxxxxxxxxxxa50;
      expv[60] = 50'hxxxxxxxxxx827;
      expv[61] = 50'hxxxxxxxxxxb81;
      expv[62] = 50'hxxxxxxxxxx4b1;
      expv[63] = 50'hxxxxxxxxxxa01;
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
