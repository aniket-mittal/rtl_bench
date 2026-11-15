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

  rtlpp_05360 dut (
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
    stim[0] = 122'h1834b8438b9e8c2553247cf93d1631b;
    stim[1] = 122'h1b5797cf95d3d2ddc3009f2ad6b5be2;
    stim[2] = 122'h3c6a921962de194514e4998bdce4632;
    stim[3] = 122'h0793c57b1924fa69f1718145b74714d;
    stim[4] = 122'h38b9292a2df69293c445f4aa25e6e6d;
    stim[5] = 122'h283e523c40d0606f8b7e9636ca1d940;
    stim[6] = 122'h330527754fa4125806692a4f5741d61;
    stim[7] = 122'h272fd8a15665bdcdc0ca19bfcf9af8b;
    stim[8] = 122'h373e99e26c45d7e77153a1c104efa7f;
    stim[9] = 122'h387ce00d39a5bad37cf8db4e9c952e8;
    stim[10] = 122'h2eed0ae5223f20519765a4440dafc37;
    stim[11] = 122'h3437f9cb7a586fe5304cd9fc8be76bf;
    stim[12] = 122'h23eac58d1a5549ab1ae23ab31ccb626;
    stim[13] = 122'h0bd86d4b97df07c1d362fb03e4266de;
    stim[14] = 122'h3997f634213fde298ace10824adaa08;
    stim[15] = 122'h3c386fddb3a65292f072e58004e49e1;
    stim[16] = 122'h27501864e61bd4dfebf0da69b863bff;
    stim[17] = 122'h08d07154b622cdb517507bac090a6ea;
    stim[18] = 122'h183bae71f9c0945d31ccfe3876fbfea;
    stim[19] = 122'h2b7d0d7013b1e6f51253d79eefff846;
    stim[20] = 122'h1b375c489b8011ade551e4d3a36e59a;
    stim[21] = 122'h01366f98e1a36a40e0e3c74a134f90e;
    stim[22] = 122'h2dee3c93d7da7c00f05c5df46214824;
    stim[23] = 122'h24e65f15c902b047886cd84e18de53d;
    stim[24] = 122'h02739db4e89b7741fde657ac953097f;
    stim[25] = 122'h184b3a9bfc3acf828869769c00776ba;
    stim[26] = 122'h1881587c3559fb40d55a7d024dc374f;
    stim[27] = 122'h34639740ff5c1aa218f6c07223d12f6;
    stim[28] = 122'h2ad37002c287d1a23248dc89506c15c;
    stim[29] = 122'h23cd36912ede7c8810fc5e2b54f0e84;
    stim[30] = 122'h0be15bb2b4de800975658fe9b11f2de;
    stim[31] = 122'h38cc545151e33fdf63ea45e6d030a90;
    stim[32] = 122'h0323b7773165e3e5f9ec3f3f4d46c0c;
    stim[33] = 122'h165fa651d69be4c39cf491b01084d7d;
    stim[34] = 122'h037c18666ba24a4fe1f39680c519416;
    stim[35] = 122'h13d5893bee3c41ecc4f1d73c976d0b9;
    stim[36] = 122'h0d3507a000f6325661dbcfadda4bc7b;
    stim[37] = 122'h3076423ae4b7b6c35a54e3d7f598397;
    stim[38] = 122'h27cd8d7e7dd03790ae5eaabbfe6a61d;
    stim[39] = 122'h36321d3b5fc5ff673c53f3c63f1ac63;
    stim[40] = 122'h3d20717e39c62f460a784f2cdea81a6;
    stim[41] = 122'h0467a578e34e4983254e283c7b3378c;
    stim[42] = 122'h1aade67f057634308ace5d6431a604a;
    stim[43] = 122'h30b1a2ebcd8e9429d7fff3992e8feb2;
    stim[44] = 122'h34df49e88d52fafd8fd7795bd313c4a;
    stim[45] = 122'h3ce60c3129385079f9f8fb6d0cd0b9c;
    stim[46] = 122'h01b12f9d4b1b9ea43f6f99d3a22f157;
    stim[47] = 122'h20415ee34d66e5af9ed1674c5d95f54;
    stim[48] = 122'h304cbcc9cb0af347d06947586c43c7d;
    stim[49] = 122'h188ab93242d39fedfd531344d012d14;
    stim[50] = 122'h165ea7a8026aad61b8d0a32c13dfa82;
    stim[51] = 122'h2865dee4e5c91b8224cc8786f1a440a;
    stim[52] = 122'h38fb6a4f4eb1ef156cbcd0f26565049;
    stim[53] = 122'h00477a9a74c9cc1db4dcde87af1691a;
    stim[54] = 122'h1b7f77d8935a9f4e227aa67aeceddf5;
    stim[55] = 122'h30d0a64d7023fa53cfe7f40f91f0753;
    stim[56] = 122'h0220d2fc13c4960746f3a724d16d29e;
    stim[57] = 122'h1d4fba92a45326215c70e1713d424eb;
    stim[58] = 122'h00de70dc1032da9c386ee087174e86b;
    stim[59] = 122'h34915448e7d32a14c462c97c2d5c9dd;
    stim[60] = 122'h04770a959db96d1adb7007bad225b86;
    stim[61] = 122'h01b938bb0f738278c66319b8656481b;
    stim[62] = 122'h35d0c13751bdc205eb75c867e50d908;
    stim[63] = 122'h3e82d0f40435e175194baf53d5dae7a;
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
      expv[0] = 53'h034b84398a0837;
      expv[1] = 53'h15797cf9f0013f;
      expv[2] = 53'h06a921971a0837;
      expv[3] = 53'h193c57b0a08ad4;
      expv[4] = 53'h0b9292a332c1de;
      expv[5] = 53'h03e523c4a7045a;
      expv[6] = 53'h10527756b4815e;
      expv[7] = 53'h12fd8a17c5413f;
      expv[8] = 53'h13e99e2539c8b7;
      expv[9] = 53'h07ce00d174025c;
      expv[10] = 53'h0ed0ae521a8937;
      expv[11] = 53'h037f9cb75e48b7;
      expv[12] = 53'h1eac58d311243b;
      expv[13] = 53'h1d86d4bb6908b7;
      expv[14] = 53'h197f634107655a;
      expv[15] = 53'h0386fdd8f10856;
      expv[16] = 53'h1501864df834ab;
      expv[17] = 53'h0d07154b704a35;
      expv[18] = 53'h03bae71ff64937;
      expv[19] = 53'h17d0d70021c837;
      expv[20] = 53'h1375c48ac8d22d;
      expv[21] = 53'h1366f98c8191af;
      expv[22] = 53'h1ee3c93c164856;
      expv[23] = 53'h0e65f15e9e04da;
      expv[24] = 53'h0739db4cbb01bf;
      expv[25] = 53'h04b3a9bf5c843b;
      expv[26] = 53'h081587c3a54ab5;
      expv[27] = 53'h0639740d7b0639;
      expv[28] = 53'h0d37002cac48d6;
      expv[29] = 53'h1cd36913460856;
      expv[30] = 53'h1e15bb296a88b7;
      expv[31] = 53'h0cc545154d314e;
      expv[32] = 53'h123b77720605da;
      expv[33] = 53'h05fa651eba00de;
      expv[34] = 53'h17c1866609922d;
      expv[35] = 53'h1d5893bc58825c;
      expv[36] = 53'h13507a023dd02f;
      expv[37] = 53'h076423adca4639;
      expv[38] = 53'h1cd8d7e70f52cc;
      expv[39] = 53'h0321d3b631c03f;
      expv[40] = 53'h120717e0d40639;
      expv[41] = 53'h067a578fc750ce;
      expv[42] = 53'h0ade67f027643b;
      expv[43] = 53'h0b1a2ebf5fa837;
      expv[44] = 53'h0df49e8a23e03f;
      expv[45] = 53'h0e60c311cc04da;
      expv[46] = 53'h1b12f9d4af803f;
      expv[47] = 53'h0415ee37a8e05e;
      expv[48] = 53'h04cbcc9e3c89d6;
      expv[49] = 53'h08ab932689c05e;
      expv[50] = 53'h05ea7a8140443b;
      expv[51] = 53'h065dee4e06502f;
      expv[52] = 53'h0fb6a4f426124c;
      expv[53] = 53'h0477a9a48e4837;
      expv[54] = 53'h17f77d8afd104e;
      expv[55] = 53'h0d0a64d7aba03f;
      expv[56] = 53'h020d2fc149a2bd;
      expv[57] = 53'h14fba92a70023d;
      expv[58] = 53'h0de70dc037053b;
      expv[59] = 53'h0915448ce901de;
      expv[60] = 53'h0770a959c0043b;
      expv[61] = 53'h1b938bb009813f;
      expv[62] = 53'h1d0c137482944a;
      expv[63] = 53'h082d0f433dc53b;
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
