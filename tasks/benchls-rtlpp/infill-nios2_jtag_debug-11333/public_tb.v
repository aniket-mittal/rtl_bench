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

  rtlpp_11333 dut (
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
    stim[0] = 122'h24cf946d38bb74c8edbcb57ffbd386a;
    stim[1] = 122'h0a58d71ba684864d949d07907763b77;
    stim[2] = 122'h05c3746f72e59d6126e78637b36142b;
    stim[3] = 122'h0ea286a91002f59ce3cc5efb47eba28;
    stim[4] = 122'h0a5d5e5a7f480a3448efd9190d5cc98;
    stim[5] = 122'h0c920ab10dcb10bb1d553de15d7afdc;
    stim[6] = 122'h116b03272f41c3f6ccf107392f9a27b;
    stim[7] = 122'h3efa419d9167787eb4c56663317a0b6;
    stim[8] = 122'h2f0777b88b208f8816da15118499a10;
    stim[9] = 122'h27a44899db99b81838606fe13400c60;
    stim[10] = 122'h06261aacead3721f30e10e9d76b6c9f;
    stim[11] = 122'h0cc4d303add23f7e024d7de03224431;
    stim[12] = 122'h2ef105ce39c635b3af7814e2b8ea8d6;
    stim[13] = 122'h1d859a25816e24914b4c3e6025cd675;
    stim[14] = 122'h1c29755c0d83f76a47727161ef08f1f;
    stim[15] = 122'h0ce2779f0ee13c8478438034276aa4b;
    stim[16] = 122'h1225515fbd8686a8f7c6d64eee33dbc;
    stim[17] = 122'h0e10052460aa62e82b5a11aa374f94b;
    stim[18] = 122'h319c497a2081119740ffdd27884e52c;
    stim[19] = 122'h1dccdfc77da9650daed82c5c72d627f;
    stim[20] = 122'h25a13e18f100100128eaa0e6d7864de;
    stim[21] = 122'h35f37507e24ab41ba564557260a61e0;
    stim[22] = 122'h1f70767b5ea30293224a1e6ee6ba5aa;
    stim[23] = 122'h08c94839a58627e5a265c88f7814ed2;
    stim[24] = 122'h21935b1b28562deebb5d82841d6b009;
    stim[25] = 122'h24fcf9dfb2c683fd6f575750423ee83;
    stim[26] = 122'h310ebcde372553e5c2ead0dc88698c6;
    stim[27] = 122'h2ee873d27dc4f5054ddcf0747a98126;
    stim[28] = 122'h28a7dffc2c20708b70ed039d937c7a0;
    stim[29] = 122'h0229b03718d7ac5535f105a0b3ab8d0;
    stim[30] = 122'h320f3f8a969a5561b8f645fdec34607;
    stim[31] = 122'h092a0f17c4c38c3607cc6296a8035c2;
    stim[32] = 122'h37f2bb7c7647a05ec0f6b500b88539d;
    stim[33] = 122'h1ca210b00e126c4f7de115fae7ce1d3;
    stim[34] = 122'h3b9ad184f5c50baf58edfc6438b2861;
    stim[35] = 122'h3112ce18b028217359569e23f6a6a1a;
    stim[36] = 122'h1953c1cf796c7a007564e1a2e5fc2c7;
    stim[37] = 122'h2c61ecba89df80825756aa6e90afec2;
    stim[38] = 122'h00e823891d22c57ef4c9382a7a6f996;
    stim[39] = 122'h381917a9715802a2117e908b3bbdf0c;
    stim[40] = 122'h3d495138795f48d261544fc2e508656;
    stim[41] = 122'h2251f07198b05926ecf54b2bc57c063;
    stim[42] = 122'h0724e729f45d9a18026382ce66d3852;
    stim[43] = 122'h3dd44c826fad3bd1d5686915b30ec40;
    stim[44] = 122'h1134e681359667af03d2e9456dc3866;
    stim[45] = 122'h0e33e28fdc6684d245e3d3a6fb34481;
    stim[46] = 122'h35b1d41a6b7e9e840dd2498383b3a41;
    stim[47] = 122'h0ee86ed6b3f671c369c61dd9f8b57cf;
    stim[48] = 122'h3abe4d88a10ff3012f46eff6aba6ba9;
    stim[49] = 122'h1e40cedad7a7ba5c0a6f032ce6c63df;
    stim[50] = 122'h0e6d2e0fd82dbf54e9ff55bcc1c1806;
    stim[51] = 122'h3f79a60aa3db3bdf94f9ae4a1493d38;
    stim[52] = 122'h10bc3887fb69f794cb4eaabd76fdc99;
    stim[53] = 122'h33932839c762e672c0ca62a073405ef;
    stim[54] = 122'h006d2cc9727323756440e3955c32155;
    stim[55] = 122'h1018535e0e25c57d7eed59bf62b7825;
    stim[56] = 122'h0fc5645d781d90e95cc404d7b884225;
    stim[57] = 122'h3d7875697b76dc29f563980ff477971;
    stim[58] = 122'h29ab665cb0f74ed092c89e0687d045e;
    stim[59] = 122'h3fe9861a25edb07665d2ef40a49d7cd;
    stim[60] = 122'h32744d60e3f63cb857f06cdeab442bb;
    stim[61] = 122'h34b074a47a7c5f4b5a415cb5edfec25;
    stim[62] = 122'h091d62334c8b1e811d56023fb3a4d1a;
    stim[63] = 122'h081b090f28703eb93ad2f8c5116d944;
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
      expv[0] = 53'h1a7176e991801f;
      expv[1] = 53'h174d090c9b201f;
      expv[2] = 53'h1ee5cb3ac2201f;
      expv[3] = 53'h122005eb39c01f;
      expv[4] = 53'h14fe901468a01f;
      expv[5] = 53'h021b962176401f;
      expv[6] = 53'h0e5e8387eda01f;
      expv[7] = 53'h1b22cef0fd601f;
      expv[8] = 53'h1116411f10601f;
      expv[9] = 53'h13b7337030001f;
      expv[10] = 53'h19d5a6e43e201f;
      expv[11] = 53'h075ba47efc401f;
      expv[12] = 53'h1c738c6b67001f;
      expv[13] = 53'h0b02dc4922c01f;
      expv[14] = 53'h181b07eed4801f;
      expv[15] = 53'h1e1dc27908c01f;
      expv[16] = 53'h1f7b0d0d51c01f;
      expv[17] = 53'h08c154c5d0401f;
      expv[18] = 53'h144102232ea01f;
      expv[19] = 53'h0efb52ca1b601f;
      expv[20] = 53'h11e2002002201f;
      expv[21] = 53'h0fc4956837001f;
      expv[22] = 53'h16bd460526401f;
      expv[23] = 53'h134b0c4fcb001f;
      expv[24] = 53'h1650ac5bdd401f;
      expv[25] = 53'h1f658d07fac01f;
      expv[26] = 53'h1c6e4aa7cba01f;
      expv[27] = 53'h04fb89ea0ac01f;
      expv[28] = 53'h185840e116a01f;
      expv[29] = 53'h0e31af58aa001f;
      expv[30] = 53'h152d34aac3201f;
      expv[31] = 53'h0f8987186c401f;
      expv[32] = 53'h18ec8f40bda01f;
      expv[33] = 53'h001c24d89e801f;
      expv[34] = 53'h09eb8a175ea01f;
      expv[35] = 53'h11605042e6c01f;
      expv[36] = 53'h1ef2d8f400801f;
      expv[37] = 53'h1513bf0104c01f;
      expv[38] = 53'h123a458afde01f;
      expv[39] = 53'h12e2b00544001f;
      expv[40] = 53'h10f2be91a4c01f;
      expv[41] = 53'h033160b24da01f;
      expv[42] = 53'h13e8bb3430001f;
      expv[43] = 53'h04df5a77a3801f;
      expv[44] = 53'h026b2ccf5e401f;
      expv[45] = 53'h1fb8cd09a4801f;
      expv[46] = 53'h14d6fd3d08401f;
      expv[47] = 53'h0d67ece386c01f;
      expv[48] = 53'h11421fe602401f;
      expv[49] = 53'h15af4f74b8001f;
      expv[50] = 53'h1fb05b7ea9801f;
      expv[51] = 53'h1547b677bf201f;
      expv[52] = 53'h0ff6d3ef29c01f;
      expv[53] = 53'h138ec5cce5e01f;
      expv[54] = 53'h12e4e646eac01f;
      expv[55] = 53'h1c1c4b8afaa01f;
      expv[56] = 53'h1af03b21d2e01f;
      expv[57] = 53'h12f6edb853801f;
      expv[58] = 53'h1961ee9da1601f;
      expv[59] = 53'h144bdb60ecc01f;
      expv[60] = 53'h01c7ec7970801f;
      expv[61] = 53'h08f4f8be96c01f;
      expv[62] = 53'h0699163d02401f;
      expv[63] = 53'h1e50e07d72601f;
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
