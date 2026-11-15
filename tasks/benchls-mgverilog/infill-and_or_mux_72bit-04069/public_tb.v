// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 146;
  localparam OW = 72;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04069 dut (
    .sa(in_vec[145:145]),
    .sb(in_vec[144:144]),
    .a(in_vec[143:72]),
    .b(in_vec[71:0]),
    .muxed(out_vec[71:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 146'h2a8e67acae94dbc62ed12fea6198497a3af9b;
    stim[1] = 146'h1b4b7fe298d5cccd788652964e9da8af595bc;
    stim[2] = 146'h15011a436d8b1821d72659d7b92ded5b483cf;
    stim[3] = 146'h313792fcf5bcdcb353094794b2b1c2a4be8c2;
    stim[4] = 146'h0a8b91288c4d8887983ff7851e5528c673db8;
    stim[5] = 146'h02ec6bbb55f5b7631f6aeb151de54d4e53cc5;
    stim[6] = 146'h1623dd1812ad88195db780513ee5b83d3bc32;
    stim[7] = 146'h1a42fc6e9757bff5c0084aa31fc0667463200;
    stim[8] = 146'h07fbb93a45787669bbebfe787709905db1bdb;
    stim[9] = 146'h211f3108dffb6fe3c95cd9310bfc557c97bd6;
    stim[10] = 146'h1d7b580714aa3ef29ead3af4396d1f367df71;
    stim[11] = 146'h25bf0a1098445311be48298065fc05df16167;
    stim[12] = 146'h3f05e4eae7ab37343dd6f1d8765748508d3a7;
    stim[13] = 146'h0f45469997a3b3fb6b46c4dd98c60fc0f2a10;
    stim[14] = 146'h08c8f869645334adafa3be8037e11e9c70417;
    stim[15] = 146'h12575767e5cce59a0fbbdb09ab7c0125bcc17;
    stim[16] = 146'h066aa38f20bc82e04e946aeb005d293dc5c73;
    stim[17] = 146'h1cc2c44e21f44d3a70df4069afaed3a154ebb;
    stim[18] = 146'h11bbc62e67c16ae3ece7bcaa4c8a12279877e;
    stim[19] = 146'h3f0508c975792295d51f70ef73084ce55ef63;
    stim[20] = 146'h015394ee93176c82fd0f59a09ae70510a6d9b;
    stim[21] = 146'h2c72c4a74675b90391d1082bea5f39166b275;
    stim[22] = 146'h3696e942c956b8982f1cf04fee1cb81499975;
    stim[23] = 146'h02dae854b165287d0acc151de8f3ea2096b0b;
    stim[24] = 146'h0f7f9fe81475c60be18ce704a262a9dd0a36e;
    stim[25] = 146'h3fa66fd0ef1bc83005f430c5972d7af7a4547;
    stim[26] = 146'h1c09340d6d08c59d84194fadda9da8b12b73a;
    stim[27] = 146'h32cf7ce65a3723231ceafd41d2c3cc619303b;
    stim[28] = 146'h0f425efe097b1e082b4f7f35c4e356461d11e;
    stim[29] = 146'h34144c90c1dbb61d22b02068a6904fd8a007c;
    stim[30] = 146'h0f6dd71fc13944a4195b3c661eab82a67b912;
    stim[31] = 146'h2489108efb6e480fc3eed714ec0575f7bc127;
    stim[32] = 146'h00f81386d97b40055f789f65c97ee32e86bb3;
    stim[33] = 146'h01d257220af13334f552016290100123adbad;
    stim[34] = 146'h2c5b1e5d3ffea3940afe25587b37eb00f2167;
    stim[35] = 146'h3b0c784d1d71fa4cbaad00c3b5f1df5020421;
    stim[36] = 146'h24b699e19ddbc05b4765093cc965b6ab5ee9e;
    stim[37] = 146'h131df5dadec2a706554bd1d00def09a579851;
    stim[38] = 146'h37bcb3f62e9004c5325e896b68b3bdc769ebb;
    stim[39] = 146'h184b8774820708a27cc83ca8b8cdea32f66ae;
    stim[40] = 146'h01769ee8d22c07828c1103b33c2d0dddd22dc;
    stim[41] = 146'h38783609710e68aee0af0e7fab4432a549949;
    stim[42] = 146'h369d31bd3e88488cea203a843549bbc1067b8;
    stim[43] = 146'h183e03696b47735c795a9ab22eeecf3e510bc;
    stim[44] = 146'h0b869a3272eb12c4c4c27735ec91893ae8993;
    stim[45] = 146'h15eed04b27d68252b6422b13eb6010d1fe469;
    stim[46] = 146'h36dc77da8bc8d22506cde9349ec0572969357;
    stim[47] = 146'h2333dab94dac2be56520a2b4b29b56f8dfb73;
    stim[48] = 146'h14519d19ce20d0d04cb3814a248ef24e99e6b;
    stim[49] = 146'h172f3acb8d23c5f4ad6612e4e4e3f87982dc8;
    stim[50] = 146'h3182b265090b401ef253e8f2b0c30e20dbfc2;
    stim[51] = 146'h294d8781ff59503ce95a6079852924cc5c5b1;
    stim[52] = 146'h3b0acac4f7668d2c3285aef0c6eebb022b9fe;
    stim[53] = 146'h16e3d57c4573bcc2e1f06f9065b37457a23e6;
    stim[54] = 146'h2abe1790102ab12df98c0fbd00ca285607afe;
    stim[55] = 146'h05ecc06ae5a67f7b89f912b79019fb422cae3;
    stim[56] = 146'h14c4279481c9435d8c12ca9cd67b8b4974ff6;
    stim[57] = 146'h2e50229579b7718092b71eca7c298f5bb3fc4;
    stim[58] = 146'h11dacb38392921aea45d153edad20940b0f79;
    stim[59] = 146'h2d54e61bd2fb943dc83095cb6943a05f24510;
    stim[60] = 146'h2911ef1600dd49ef077b729132d64fc32e0fc;
    stim[61] = 146'h3790e72bee2332bd4c0cc91523e4356c7d016;
    stim[62] = 146'h0a3ce6ac93c578e1374434f68c5bb45e122da;
    stim[63] = 146'h1bdf28afd4e84fc695d1004ffaf39b8f79715;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 72'ha8e67acae94dbc62ed;
      expv[1] = 72'h652964e9da8af595bc;
      expv[2] = 72'h659d7b92ded5b483cf;
      expv[3] = 72'h97796fef5fefcbfdf2;
      expv[4] = 72'h000000000000000000;
      expv[5] = 72'h000000000000000000;
      expv[6] = 72'h780513ee5b83d3bc32;
      expv[7] = 72'h84aa31fc0667463200;
      expv[8] = 72'h000000000000000000;
      expv[9] = 72'h11f3108dffb6fe3c95;
      expv[10] = 72'hd3af4396d1f367df71;
      expv[11] = 72'h5bf0a1098445311be4;
      expv[12] = 72'hff5fcfef7eb77bd3ff;
      expv[13] = 72'h000000000000000000;
      expv[14] = 72'h000000000000000000;
      expv[15] = 72'hbdb09ab7c0125bcc17;
      expv[16] = 72'h000000000000000000;
      expv[17] = 72'hf4069afaed3a154ebb;
      expv[18] = 72'h7bcaa4c8a12279877e;
      expv[19] = 72'hf75effb7d7de7dff73;
      expv[20] = 72'h000000000000000000;
      expv[21] = 72'hc72c4a74675b90391d;
      expv[22] = 72'hef6efeeddfebc99bf5;
      expv[23] = 72'h000000000000000000;
      expv[24] = 72'h000000000000000000;
      expv[25] = 72'hfb6efd7ef7bffb455f;
      expv[26] = 72'h94fadda9da8b12b73a;
      expv[27] = 72'haff7df6dbff63b31ff;
      expv[28] = 72'h000000000000000000;
      expv[29] = 72'h4346cb6d1dffebd27f;
      expv[30] = 72'h000000000000000000;
      expv[31] = 72'h489108efb6e480fc3e;
      expv[32] = 72'h000000000000000000;
      expv[33] = 72'h000000000000000000;
      expv[34] = 72'hc5b1e5d3ffea3940af;
      expv[35] = 72'hf0cfbfdfdfffa6cfab;
      expv[36] = 72'h4b699e19ddbc05b476;
      expv[37] = 72'hbd1d00def09a579851;
      expv[38] = 72'hfbdfbfebfbdc7edfbf;
      expv[39] = 72'h83ca8b8cdea32f66ae;
      expv[40] = 72'h000000000000000000;
      expv[41] = 72'hf7e7fab753eedeff4b;
      expv[42] = 72'h6bfb5bd7fbbc98efba;
      expv[43] = 72'ha9ab22eeecf3e510bc;
      expv[44] = 72'h000000000000000000;
      expv[45] = 72'h22b13eb6010d1fe469;
      expv[46] = 72'hffd77decbdffb6d37f;
      expv[47] = 72'h333dab94dac2be5652;
      expv[48] = 72'h3814a248ef24e99e6b;
      expv[49] = 72'h612e4e4e3f87982dc8;
      expv[50] = 72'h3eaf2f5cb0f60dffe7;
      expv[51] = 72'h94d8781ff59503ce95;
      expv[52] = 72'hfaefac6ffff8f2fbfe;
      expv[53] = 72'h06f9065b37457a23e6;
      expv[54] = 72'habe1790102ab12df98;
      expv[55] = 72'h000000000000000000;
      expv[56] = 72'h2ca9cd67b8b4974ff6;
      expv[57] = 72'he50229579b7718092b;
      expv[58] = 72'hd153edad20940b0f79;
      expv[59] = 72'hd54e61bd2fb943dc83;
      expv[60] = 72'h911ef1600dd49ef077;
      expv[61] = 72'hfd9f72bee377efd4d6;
      expv[62] = 72'h000000000000000000;
      expv[63] = 72'h1004ffaf39b8f79715;
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
