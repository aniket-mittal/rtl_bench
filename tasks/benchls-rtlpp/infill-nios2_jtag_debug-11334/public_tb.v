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

  rtlpp_11334 dut (
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
    stim[0] = 122'h2723d1810715ef6b9f90bc168fc93f6;
    stim[1] = 122'h2204a400091e8cccd188568435966c5;
    stim[2] = 122'h276cd63eac85893ba0f38c90a8b5dcf;
    stim[3] = 122'h38d033b394536ec99ad669f4ef58020;
    stim[4] = 122'h04ab0072f85ea3b2c946bf6af2f9856;
    stim[5] = 122'h236679b8d177f468d7c61f17727e27a;
    stim[6] = 122'h064f7004113ed14329cb02ea164b222;
    stim[7] = 122'h2950248b9be1e04f33d6b569703fe9c;
    stim[8] = 122'h3b867b4fcb574e1f7f7897e0e778d46;
    stim[9] = 122'h00dff2197c810d3013ddd3b56d4d5f6;
    stim[10] = 122'h10fd555c4a475f1ebedf0ec37eed7c0;
    stim[11] = 122'h3c6259528668f4316b50bbc66e8782a;
    stim[12] = 122'h2e85d5c2b2a9a5bf9071e5144edfb22;
    stim[13] = 122'h33c00147101c8132f4f7e82d10beb8a;
    stim[14] = 122'h1219f695d4a15c9ed7f2a91d1c666ed;
    stim[15] = 122'h04cbcf759bc73ddf5a50e61bc7cfd87;
    stim[16] = 122'h1b2ba49e2419f06af1fee0e6f62ac77;
    stim[17] = 122'h1f04179ed58c4fcd936812a2546a166;
    stim[18] = 122'h3683ccabed7ab13db3ff1d5a2db5b7e;
    stim[19] = 122'h3f95835f6bb6197824616c1e0388e8b;
    stim[20] = 122'h0a9c97ac03017daf02c57c4701090c4;
    stim[21] = 122'h22eaf5aa61bd63b6cefe558a650ff1b;
    stim[22] = 122'h216f82399d387820eee34680c2eae4c;
    stim[23] = 122'h24fe54d1c13003404f42a2e986870fa;
    stim[24] = 122'h28a957c59121f25f7763ee77be6dcb0;
    stim[25] = 122'h33d2885451c3b0ecabf0931d5f87ffb;
    stim[26] = 122'h0927859bf5abb6ca74ceae5cd37baf7;
    stim[27] = 122'h37f3c0f32ec841dddc63c436d919b3c;
    stim[28] = 122'h013094ed7608e58af67b81c596ab8fc;
    stim[29] = 122'h2ca00ea01d2b6a82d2dcdf6256a4558;
    stim[30] = 122'h00822b0c28e6b44e1247088466e1fa1;
    stim[31] = 122'h0d49bdfbc6303e7946cbb3352ca1e83;
    stim[32] = 122'h33af29cf52198c93d6f9fb8c21b24ea;
    stim[33] = 122'h3112229a3cbbdb98fa72b3737916388;
    stim[34] = 122'h3060620257c80825c7ed9d1b861f349;
    stim[35] = 122'h01dce612a2e0fe5ccbf3154c43b141e;
    stim[36] = 122'h30b0f8ad0db04e579c41e6fac438b4c;
    stim[37] = 122'h110db1de79e3b41a7777b5e64680e29;
    stim[38] = 122'h22486d06f54d168db9587618de35dfe;
    stim[39] = 122'h0348bfc231d915f42e4a6b3d0511758;
    stim[40] = 122'h1a08d1eeb5f9fd4d16ea35a4dc3cff0;
    stim[41] = 122'h04db47ebcaa2df14c741b0025109761;
    stim[42] = 122'h337b77ff284bfb7198e09a3c2a40d45;
    stim[43] = 122'h32aa19f6619fe72c684126bf2b91a0c;
    stim[44] = 122'h2a348cf5d739a62e04e8339b84b45cc;
    stim[45] = 122'h3ef21b9ca24953daf5ef5c2295cc07f;
    stim[46] = 122'h20f528c39ddf419cd47f6fe3f20d210;
    stim[47] = 122'h01d504aa219c97153f48dd219b4a38b;
    stim[48] = 122'h0613c3fa694a1cf24e5867abf7694d7;
    stim[49] = 122'h20a07403922df0ea9e5294087261495;
    stim[50] = 122'h0c8f257ca9a4135501e38ebec22b97a;
    stim[51] = 122'h30ff1bca6381ec3225c03357bf0434c;
    stim[52] = 122'h1eec9d3ac8d7a779b943b593e468a78;
    stim[53] = 122'h25a21476245483be386c3950d2460bf;
    stim[54] = 122'h0bfaf53ba32cecbb0ddab8cd35eb627;
    stim[55] = 122'h09e69e06d49c651f88419cb9d1d0c27;
    stim[56] = 122'h3c1e6395620efc73754895023168cb0;
    stim[57] = 122'h3bb84894d9a42c17a9ee9741fa1244c;
    stim[58] = 122'h1f091ffb2dfbaa08c8d82fbb7790756;
    stim[59] = 122'h21198b068c6690556751ab52a3ebdc0;
    stim[60] = 122'h1651f5a96716a03bd56c3914bbb0e01;
    stim[61] = 122'h18d63132c8d1fcb87ddbd2e8f6bee38;
    stim[62] = 122'h369c38135fa2403d3eca012a98d037c;
    stim[63] = 122'h04d6d6f3354db28268eadebfd92196a;
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
      expv[0] = 50'h01782d1f93589;
      expv[1] = 50'h10ad086b2c50b;
      expv[2] = 50'h071921516be76;
      expv[3] = 50'h0cd3e9deb1d89;
      expv[4] = 50'h0d7ed5e5f28ec;
      expv[5] = 50'h0c3e2ee4fcd1b;
      expv[6] = 50'h1605d42c96e85;
      expv[7] = 50'h0d6ad2e07ff72;
      expv[8] = 50'h112fc1cef1be0;
      expv[9] = 50'h1ba76ada9bd0b;
      expv[10] = 50'h1e1d86fddbf81;
      expv[11] = 50'h01778cdd0faf4;
      expv[12] = 50'h03ca289dbf96a;
      expv[13] = 50'h0fd05a217df72;
      expv[14] = 50'h05523a38cdd1b;
      expv[15] = 50'h01cc378f9f9e8;
      expv[16] = 50'h1dc1cdec55f62;
      expv[17] = 50'h102544a8d490b;
      expv[18] = 50'h1e3ab45b6bf72;
      expv[19] = 50'h02d83c0710a76;
      expv[20] = 50'h0af88e0212c0f;
      expv[21] = 50'h1cab14ca1fcfc;
      expv[22] = 50'h068d0185d4ef4;
      expv[23] = 50'h0545d30d0e89d;
      expv[24] = 50'h07dcef7cdab62;
      expv[25] = 50'h01263abf0fef4;
      expv[26] = 50'h1d5cb9a6f6f62;
      expv[27] = 50'h07886db2329f8;
      expv[28] = 50'h17038b2d57b72;
      expv[29] = 50'h19bec4ad49d1b;
      expv[30] = 50'h0e1108cdc296a;
      expv[31] = 50'h17666a5942c6e;
      expv[32] = 50'h13f7184365d1b;
      expv[33] = 50'h0566e6f22db91;
      expv[34] = 50'h1b3a370c3ec1f;
      expv[35] = 50'h062a988763c9d;
      expv[36] = 50'h03cdf588709f8;
      expv[37] = 50'h0f6bcc8d01b72;
      expv[38] = 50'h10ec31bc6bbf0;
      expv[39] = 50'h14d67a0a22a95;
      expv[40] = 50'h146b49b878d6a;
      expv[41] = 50'h036004a21280f;
      expv[42] = 50'h0134785480de8;
      expv[43] = 50'h024d7e5722af4;
      expv[44] = 50'h1067370968c1f;
      expv[45] = 50'h1eb8452b98f13;
      expv[46] = 50'h1edfc7e41b90b;
      expv[47] = 50'h11ba433694b91;
      expv[48] = 50'h10cf57eed388d;
      expv[49] = 50'h052810e4c3989;
      expv[50] = 50'h071d7d8456c7e;
      expv[51] = 50'h0066af7e08e17;
      expv[52] = 50'h076b27c8d0bf0;
      expv[53] = 50'h1872a1a48cb91;
      expv[54] = 50'h15719a6bd7c8d;
      expv[55] = 50'h033973a3a08ec;
      expv[56] = 50'h112a0462d0b62;
      expv[57] = 50'h1d2e83f424e95;
      expv[58] = 50'h105f76ef21c8d;
      expv[59] = 50'h0356a547d7a66;
      expv[60] = 50'h187229776096a;
      expv[61] = 50'h17a5d1ed7dff0;
      expv[62] = 50'h14025531a0f91;
      expv[63] = 50'h15bd7fb242ef4;
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
