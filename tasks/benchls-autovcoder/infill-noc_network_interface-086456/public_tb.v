// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 136;
  localparam OW = 130;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_086456 dut (
    .clk(clk),
    .reset(in_vec[135:135]),
    .addr(in_vec[134:133]),
    .d_in(in_vec[132:69]),
    .nicEN(in_vec[68:68]),
    .nicWrEn(in_vec[67:67]),
    .net_ro(in_vec[66:66]),
    .net_polarity(in_vec[65:65]),
    .net_si(in_vec[64:64]),
    .net_di(in_vec[63:0]),
    .d_out(out_vec[129:66]),
    .net_so(out_vec[65:65]),
    .net_do(out_vec[64:1]),
    .net_ri(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 136'h9168856794ba75df39cc601f54e5051bae;
    stim[1] = 136'hb0c4d5702f208184dbd55afd197a713b16;
    stim[2] = 136'h2383837d18d503c7d354923734d3b9bfae;
    stim[3] = 136'h51ee65035a61313636819d67e186076864;
    stim[4] = 136'h7ff2999f164595596c7f5c88612531daa7;
    stim[5] = 136'h2d988b89bf47db9cc70d39bb2efec96df1;
    stim[6] = 136'h06479b00b9d011ebc8575ec333e8a44efd;
    stim[7] = 136'h5e4458a6f87fde8c36d40daba45f8d367e;
    stim[8] = 136'h46ad876e5804b4052244d2738e458f3452;
    stim[9] = 136'hf3109af023f6c7700cda4cf00434101789;
    stim[10] = 136'h1e258d4ab418640f84b97c71cf4fbe5042;
    stim[11] = 136'h7616790f7351d657e1d61ca5a9988ddd74;
    stim[12] = 136'h6365e7d30fd0b925d69499b9f0a8b9c62c;
    stim[13] = 136'h7bc46469e8f4a2d715cb4861eb79abacd8;
    stim[14] = 136'h7a13f8dd7a28c6146bc9e3dc4f31716ea4;
    stim[15] = 136'h61408b803e8cd3396c96948e1a652340d8;
    stim[16] = 136'h36e252a07f51b8a6bbf8b24106c3c5dfc1;
    stim[17] = 136'h7894b11c81bdec798b428d62ba5ee555f3;
    stim[18] = 136'h50b37541cd4fb1632d9ca0059f7b8d5fac;
    stim[19] = 136'h00c76951685373fa095335025295989715;
    stim[20] = 136'h7e278e4ca3247b80a1fcdfc6323f60f39c;
    stim[21] = 136'h673f1983a8f42d0c3e3a786ae16dfcd696;
    stim[22] = 136'h77f47a6eb3e018bca8bb26bef934fbaf82;
    stim[23] = 136'h3f8d569f6e2d2d6d46b81174e5ff86e8d1;
    stim[24] = 136'h03dd2dbf31208bfd6408fe12668dfdbab6;
    stim[25] = 136'h2326263dc981db99741efa34088af17e8f;
    stim[26] = 136'h0408ecb65474ebd9185cbd4b0e14b57576;
    stim[27] = 136'h77f4cd2b78cfbefea36395220959cbd0d5;
    stim[28] = 136'h28371c77ad53c3ab356a9d57c01dc3ee97;
    stim[29] = 136'h0d17c3f37b4c724409b6194fd29ee1c375;
    stim[30] = 136'h418e269d77f61d4c8b161cd247e1a1f15c;
    stim[31] = 136'h11dff67580aa747c8be1d6a881bf0ff236;
    stim[32] = 136'h39fc29b722ab1e0679f3094218f507b25e;
    stim[33] = 136'h1197b6a35a80fcbbb8641ba4e023a89f88;
    stim[34] = 136'h0d88ebcfa01692ecbaf3bd7c5678cf3efa;
    stim[35] = 136'h2be2c1b57c7e1af80f0a07383598c8df47;
    stim[36] = 136'hc7b860e3182a72612dc8f73f853717fc22;
    stim[37] = 136'h757f2f9d8d10f8698d4f7f52d06a49b4c4;
    stim[38] = 136'h73b9a0bceb8090305aef80374c5d46fadb;
    stim[39] = 136'h2e1684cfe6366a07a8172ad7e1454a7d81;
    stim[40] = 136'h4e798d7b00ead56abb315a3a637a606446;
    stim[41] = 136'h441d5948245e06faf7acc3bd1a8cbe56c4;
    stim[42] = 136'h564fac21b8ba42742a2eb80ce08a718504;
    stim[43] = 136'h3e0e067589bfd8dd4cf1b44c72c8cf8793;
    stim[44] = 136'h21a12769d9995fb66452f1255ebc6d29f7;
    stim[45] = 136'h6fa392bd2803279ccbd5f93858625ea847;
    stim[46] = 136'h7da4bf06405137bb9cc082e40684669e23;
    stim[47] = 136'h39b0f0d63b96c6c8e4a89896da9489cb0d;
    stim[48] = 136'h775cdf6496b4ae0ddb06e044d8f72987d0;
    stim[49] = 136'h17158c0ccf09d83caa53bdadc24a1a85b5;
    stim[50] = 136'h3e979d951571a8ce46edba91a17253e9c1;
    stim[51] = 136'h704061a13efc6ad50e26061e67b1ab7ed0;
    stim[52] = 136'h3df4478f4d7e5f8f330931018d26c39bb7;
    stim[53] = 136'h023c471b3a0c3c273a7672f120696cda4c;
    stim[54] = 136'h3b610f0a7e1d9c9577f0bce933aac2050c;
    stim[55] = 136'h4f571f236d22c660f476d0804b51c70ec3;
    stim[56] = 136'h09ef51a3ca513166ec690f6e5795844235;
    stim[57] = 136'h757a60f227a4b0c551cf28787214a918ff;
    stim[58] = 136'h64f437ca52efb0002f6eac026b23048898;
    stim[59] = 136'h11ece670a3d3b29b56a505a3b0f780180f;
    stim[60] = 136'h0a181dfdb4889b07d6f9bfdab2574e9e24;
    stim[61] = 136'h7cf7cb66c5b4106c73f0a6d4686854ae99;
    stim[62] = 136'h96b1ba227b5662f2661d51b518a5b3c7f2;
    stim[63] = 136'h757a535fafa446bcca767e6db97f9e6f92;
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
      expv[0] = 130'hxxxxxxxxxxxxxxxxx000000000000000x;
      expv[1] = 130'h000000000000000000000000000000001;
      expv[2] = 130'h000000000000000000000000000000001;
      expv[3] = 130'h000000000000000000000000000000000;
      expv[4] = 130'h000000000000000000000000000000000;
      expv[5] = 130'h000000000000000000000000000000000;
      expv[6] = 130'h000000000000000000000000000000000;
      expv[7] = 130'h000000000000000000000000000000000;
      expv[8] = 130'h000000000000000000000000000000000;
      expv[9] = 130'h000000000000000000000000000000000;
      expv[10] = 130'h000000000000000000000000000000001;
      expv[11] = 130'h000000000000000000000000000000001;
      expv[12] = 130'h000000000000000000000000000000000;
      expv[13] = 130'h000000000000000000000000000000000;
      expv[14] = 130'h000000000000000000000000000000000;
      expv[15] = 130'h000000000000000000000000000000000;
      expv[16] = 130'h000000000000000000000000000000000;
      expv[17] = 130'h000000000000000000000000000000000;
      expv[18] = 130'h000000000000000000000000000000000;
      expv[19] = 130'h000000000000000000000000000000000;
      expv[20] = 130'h000000000000000000000000000000000;
      expv[21] = 130'h000000000000000000000000000000000;
      expv[22] = 130'h000000000000000000000000000000000;
      expv[23] = 130'h000000000000000000000000000000000;
      expv[24] = 130'h000000000000000000000000000000000;
      expv[25] = 130'h000000000000000000000000000000000;
      expv[26] = 130'h200000000000000000000000000000000;
      expv[27] = 130'h200000000000000000000000000000000;
      expv[28] = 130'h000000000000000000000000000000000;
      expv[29] = 130'h200000000000000000000000000000000;
      expv[30] = 130'h000000000000000000000000000000000;
      expv[31] = 130'h000000000000000000000000000000000;
      expv[32] = 130'h000000000000000000000000000000000;
      expv[33] = 130'h000000000000000000000000000000000;
      expv[34] = 130'h000000000000000000000000000000000;
      expv[35] = 130'h000000000000000000000000000000000;
      expv[36] = 130'h000000000000000000000000000000000;
      expv[37] = 130'h000000000000000000000000000000001;
      expv[38] = 130'h000000000000000000000000000000000;
      expv[39] = 130'h000000000000000000000000000000000;
      expv[40] = 130'h000000000000000000000000000000000;
      expv[41] = 130'h000000000000000000000000000000000;
      expv[42] = 130'h000000000000000000000000000000000;
      expv[43] = 130'h00000000000000002e798d7b00ead56aa;
      expv[44] = 130'h000000000000000000000000000000000;
      expv[45] = 130'h000000000000000000000000000000000;
      expv[46] = 130'h000000000000000000000000000000000;
      expv[47] = 130'h000000000000000000000000000000000;
      expv[48] = 130'h000000000000000000000000000000000;
      expv[49] = 130'h000000000000000000000000000000000;
      expv[50] = 130'h000000000000000000000000000000000;
      expv[51] = 130'h000000000000000000000000000000000;
      expv[52] = 130'h000000000000000000000000000000000;
      expv[53] = 130'h200000000000000000000000000000000;
      expv[54] = 130'h200000000000000000000000000000000;
      expv[55] = 130'h200000000000000000000000000000000;
      expv[56] = 130'h200000000000000000000000000000000;
      expv[57] = 130'h000000000000000000000000000000000;
      expv[58] = 130'h000000000000000000000000000000000;
      expv[59] = 130'h000000000000000000000000000000000;
      expv[60] = 130'h13dfd4b41a926d3100000000000000000;
      expv[61] = 130'h13dfd4b41a926d3100000000000000001;
      expv[62] = 130'h000000000000000000000000000000000;
      expv[63] = 130'h000000000000000000000000000000001;
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
