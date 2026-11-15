// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  big_sigma_1_512 dut (
    .x(in_vec[63:0]),
    .result(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h45583d103aa1776a;
    stim[1] = 64'ha122218237102c5d;
    stim[2] = 64'h5bc3913cd1a95cdd;
    stim[3] = 64'hd9acefe7752d700f;
    stim[4] = 64'h16b78a27d10aebe9;
    stim[5] = 64'h980341e050b92874;
    stim[6] = 64'h0c14ca96100ab664;
    stim[7] = 64'h4a329c61b9c02cea;
    stim[8] = 64'h2c3309bcb9b06457;
    stim[9] = 64'hf4e782705f3d7f69;
    stim[10] = 64'he95ee733212e448b;
    stim[11] = 64'h59d292048da5b558;
    stim[12] = 64'hd050b62d3c93ae53;
    stim[13] = 64'h0a5a97b754f3e9de;
    stim[14] = 64'hf8003603f687904e;
    stim[15] = 64'h751131ed1af47f21;
    stim[16] = 64'hfd45e051b0dac34a;
    stim[17] = 64'he4b1cf050c35b084;
    stim[18] = 64'hdcc8586c1cdf34e8;
    stim[19] = 64'hde00643db9223e9a;
    stim[20] = 64'h45df27ccb06fb5d3;
    stim[21] = 64'h679c859d8694fa18;
    stim[22] = 64'h82ba7403933c406f;
    stim[23] = 64'h7a9f3a20eb0aa89b;
    stim[24] = 64'h2dc44b6750431bce;
    stim[25] = 64'h0036d505a8fe70b1;
    stim[26] = 64'hc7184717c0e38a5f;
    stim[27] = 64'h648a6f15b032d4c4;
    stim[28] = 64'h17986db756a78a75;
    stim[29] = 64'h7f7cfd79bcb88951;
    stim[30] = 64'h6af4ee395bef91eb;
    stim[31] = 64'h57571b068f57450b;
    stim[32] = 64'h6f82532a2c5816f8;
    stim[33] = 64'h4338dcbf89f85ddc;
    stim[34] = 64'h9dcb7ea2e1d8865c;
    stim[35] = 64'hd9ad305ea6cf83bf;
    stim[36] = 64'h9fd096f967bd2557;
    stim[37] = 64'hc740b80b64e80da6;
    stim[38] = 64'h1efec8389d7fffd0;
    stim[39] = 64'h5f5ae97134fba272;
    stim[40] = 64'h70ac63b1cb580a55;
    stim[41] = 64'h33cb57ea7da96df7;
    stim[42] = 64'h64455cb51afea439;
    stim[43] = 64'h26c9b71086c05081;
    stim[44] = 64'hde43f7c20163dba1;
    stim[45] = 64'h454a4cd67a83bf74;
    stim[46] = 64'hd15d47ed868f857c;
    stim[47] = 64'hdb3dbbdb768f7948;
    stim[48] = 64'hbc1d59f5d573b932;
    stim[49] = 64'he18ecc916f37fd21;
    stim[50] = 64'h97e13d723aec655d;
    stim[51] = 64'h1d1323fad55082c2;
    stim[52] = 64'h24f4cad33082fac4;
    stim[53] = 64'h6762d55ee3ab0d42;
    stim[54] = 64'h3c68d79c9e1703ad;
    stim[55] = 64'ha662eb2ea18f1dbd;
    stim[56] = 64'hb87c8d644deb65eb;
    stim[57] = 64'h5f5c3370d5f9a651;
    stim[58] = 64'h386e11bb7de8b7a1;
    stim[59] = 64'h1a61438be592afb7;
    stim[60] = 64'haecfd8c7daad9d64;
    stim[61] = 64'h80e8f363357dbe1f;
    stim[62] = 64'h127ec99aefd873be;
    stim[63] = 64'hccf10e82472cf4ed;
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
      expv[0] = 64'h086ed48d4e264833;
      expv[1] = 64'h7b7a64d620b8c094;
      expv[2] = 64'hba2aed50ce119307;
      expv[3] = 64'h6f8606608388df89;
      expv[4] = 64'h06b69a063e9debac;
      expv[5] = 64'h1be71a99edb5576a;
      expv[6] = 64'h3f01360d2afbce4d;
      expv[7] = 64'h884f5a50a3bb903e;
      expv[8] = 64'h5615a3f2cf0bd129;
      expv[9] = 64'h9a5230185da718fb;
      expv[10] = 64'h1a9dc80e60f4e381;
      expv[11] = 64'hba71a3e440bffcb6;
      expv[12] = 64'h4445fc81dcd79531;
      expv[13] = 64'h86a5d2081435abb8;
      expv[14] = 64'ha4d31dc8f2f327a4;
      expv[15] = 64'h15c0f33f1b75a5f4;
      expv[16] = 64'h952127275c2c0dad;
      expv[17] = 64'h2cb4b1330da72b3c;
      expv[18] = 64'h28972b8903c51067;
      expv[19] = 64'h6b115e9ec4968af2;
      expv[20] = 64'hdc61f1d1bf630236;
      expv[21] = 64'h1824cde83b22b5b4;
      expv[22] = 64'h106c74677acff504;
      expv[23] = 64'h183eb18f6bb6d975;
      expv[24] = 64'h1a631dedd8527739;
      expv[25] = 64'hdc3c3feeb9d7d2ac;
      expv[26] = 64'h40089c6222797f95;
      expv[27] = 64'h6cf8926145a1e9f0;
      expv[28] = 64'h10e24842973b4301;
      expv[29] = 64'hbbcffe68620723b2;
      expv[30] = 64'hbf7a86a676de4332;
      expv[31] = 64'h4628232b2f703505;
      expv[32] = 64'hcb4989e2a455fb5f;
      expv[33] = 64'h3fc2e003abf059f1;
      expv[34] = 64'h6995bc1c0b6ddaab;
      expv[35] = 64'hc143f71e5281e415;
      expv[36] = 64'ha0b84624d5942f50;
      expv[37] = 64'h3040d8d41d4ceac6;
      expv[38] = 64'h1cfac3bb7ae32dc4;
      expv[39] = 64'hd9cf976c26b733a4;
      expv[40] = 64'hf325329fbc930987;
      expv[41] = 64'h199fd76971ca8c64;
      expv[42] = 64'h6366b756394b0feb;
      expv[43] = 64'hde67b2bcf1155e6a;
      expv[44] = 64'h796fbf72f217a42c;
      expv[45] = 64'h793145a41a4ed188;
      expv[46] = 64'h026f36e0f025d53e;
      expv[47] = 64'hd6ca1d8525f69943;
      expv[48] = 64'hf06ce6aea8f42e3e;
      expv[49] = 64'h437865a611912074;
      expv[50] = 64'h353c4c4e145f9594;
      expv[51] = 64'hd6d25b49261b6987;
      expv[52] = 64'h3c39db937bea744e;
      expv[53] = 64'h5928d1d5411f872c;
      expv[54] = 64'h0010b538bd0b6bb2;
      expv[55] = 64'h26c9379dc8a21f2a;
      expv[56] = 64'hfcf2fa5fe3141a91;
      expv[57] = 64'h48bbd674e9b0cc81;
      expv[58] = 64'h2ed25bf8121f1fd0;
      expv[59] = 64'hd0c3664a85405f8f;
      expv[60] = 64'h7126c6422779fbf1;
      expv[61] = 64'h26635d46fe946cd0;
      expv[62] = 64'h1f60215d4b043bf3;
      expv[63] = 64'hafafd6820f4ff5ff;
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
