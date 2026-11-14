// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 128;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  sub_64bit dut (
    .A(in_vec[127:64]),
    .B(in_vec[63:0]),
    .result(out_vec[64:1]),
    .overflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 128'h62ff6e7cbd5b5590b794d3b0bc8c95eb;
    stim[1] = 128'h38d8afcc82a96341acd78606afc3b7e7;
    stim[2] = 128'h9a42e9e85838f5c1b6f17699bb5f0873;
    stim[3] = 128'h40a257e21355fd4703dc1e3341452b86;
    stim[4] = 128'hb9866af9947495f919cccb080a476ae0;
    stim[5] = 128'hfd4be6bfe613dafee56ea9c9dc57fbb4;
    stim[6] = 128'h1fe59e1baa0e64821d841e14f01b96d4;
    stim[7] = 128'h0972f3052b1a3bd231b164080f469a49;
    stim[8] = 128'h84b661986341cc7050d2a6a5a0d05bd7;
    stim[9] = 128'h8075a3099c25d3db57584686e6178dd8;
    stim[10] = 128'h44b08afd02e819dade5bef43aeb166e6;
    stim[11] = 128'h3c7981df470424c70296a97350b06154;
    stim[12] = 128'h715eceace4b6628de537687b9f2c7aec;
    stim[13] = 128'h509e01e5900d61cf2663dcf54d70fd58;
    stim[14] = 128'hbd41b2dad1c944f36b15b3c16762cfe5;
    stim[15] = 128'h9b020d0a3b92450d60629cb4eec86e39;
    stim[16] = 128'h3400c900903c89ff08f817a67f9a8a17;
    stim[17] = 128'h80aa20199f97cdaf6c4f1dc8b4b7c4d0;
    stim[18] = 128'h4452bf71e5ea7a5b6a21db2ce5905be2;
    stim[19] = 128'hc8ef970fa7c8575101a2aae0fbecf004;
    stim[20] = 128'ha74a7f607375ed89c0179f9c84ba7330;
    stim[21] = 128'h37e0f9445524d55f8a5df245c3d23d26;
    stim[22] = 128'hdde3eed24b3387cd4ac81e6cce6c8a57;
    stim[23] = 128'h2d4050ee0c914853f8781caa58134d52;
    stim[24] = 128'h23ebd7c74d20afda2da5e6021cb1a9e1;
    stim[25] = 128'h55890f78e442b2fcfb420a047e8a7cbe;
    stim[26] = 128'hff3fbf97660ac69d2e18337414a0fbe6;
    stim[27] = 128'h3143cfbdb2a721f90a8cc0d65e06d76c;
    stim[28] = 128'h3e38bc1f3247a991940e7a980ae780fb;
    stim[29] = 128'he7b4a2ce304ffc287d60ab24b1bcbce7;
    stim[30] = 128'ha6993485bd4bc13ad01eafe35ff686ce;
    stim[31] = 128'h8e4d7088b630df6a392658e1f146b054;
    stim[32] = 128'ha4adaf9b302120887c9e652d3f84a497;
    stim[33] = 128'h7e20f04709c76deb2712866f8af8f840;
    stim[34] = 128'hd929939ada0c0932e581fa2332cd0024;
    stim[35] = 128'h34071a331fd3b79702ce8a24811f0419;
    stim[36] = 128'h8c8a6d9b1b3631213cdc1b01d8babb98;
    stim[37] = 128'hcf41899d1605fe35e9287d6a80fe1e70;
    stim[38] = 128'ha42400f7def12c13991426c7f50eea88;
    stim[39] = 128'hd9159ef43ba34f1b4553a9d32924e020;
    stim[40] = 128'h38087588ce5995397f36a52ea825f1d0;
    stim[41] = 128'ha416d5b98723900c42099f27939dc875;
    stim[42] = 128'h98ac8a75079c6daab941e5730d7e5f61;
    stim[43] = 128'h6797a7e8718aeec7dc0990c1849e27d5;
    stim[44] = 128'hcf70c6e8de73b79fe0b3c0b852d34171;
    stim[45] = 128'h78aa3e49d2c78d566ac21eeab8be4bd4;
    stim[46] = 128'h21c4d2e6325df6de31fcf52c37d3c2ff;
    stim[47] = 128'hb1e5c0371968865661505c45d8944e0e;
    stim[48] = 128'hfbe3077c1e9b9b2876ba077208f0fec9;
    stim[49] = 128'h5252ec1fade00a45aa4b2d08e696d4b3;
    stim[50] = 128'h3647e6db5e400c6b478bea07cb1a5066;
    stim[51] = 128'heac289e05feec17db143827cbe73ffef;
    stim[52] = 128'ha12772449650dcc78b50292c20d331d9;
    stim[53] = 128'hfa4d067a7c2da536dbed2204489b95cb;
    stim[54] = 128'h27ec30cc25a2660e211606c027502112;
    stim[55] = 128'hea17ba52918b29da49a195a7ae1b5c52;
    stim[56] = 128'hb2b27778d2fe8bcd50e0c899405563ab;
    stim[57] = 128'hb7b1fd0a564667e72d232e7e76b5016b;
    stim[58] = 128'h4e9d5881333cfe0a595b52a45b9fffd5;
    stim[59] = 128'ha835e54d3a4d45f72b5679f712244a0c;
    stim[60] = 128'h340dd999d482c940123715e611a74b8e;
    stim[61] = 128'hb262a4938d62a038033e19fe8e279efa;
    stim[62] = 128'he16d68bdeefb3df86dad0330f82823a6;
    stim[63] = 128'hde6beceb8beba7deb281dfc2cfdad6b5;
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
      expv[0] = 65'h156d53598019d7f4b;
      expv[1] = 65'h11802538ba5cb56b5;
      expv[2] = 65'h1c6a2e69d39b3da9c;
      expv[3] = 65'h0798c735da421a382;
      expv[4] = 65'h13f733fe3145a5632;
      expv[5] = 65'h02fba79ec1377be94;
      expv[6] = 65'h004c3000d73e59b5c;
      expv[7] = 65'h1af831dfa37a74312;
      expv[8] = 65'h067c775e584e2e133;
      expv[9] = 65'h0523ab9056c1c8c07;
      expv[10] = 65'h0cca93772a86d65e8;
      expv[11] = 65'h073c5b0d7eca786e6;
      expv[12] = 65'h1184ecc628b13cf43;
      expv[13] = 65'h0547449e08538c8ee;
      expv[14] = 65'h0a457fe32d4ccea1d;
      expv[15] = 65'h0753ee0aa9993ada9;
      expv[16] = 65'h0561162b42143ffd0;
      expv[17] = 65'h028b604a1d5c011bf;
      expv[18] = 65'h1b461c88a00b43cf2;
      expv[19] = 65'h18e99d85d57b6ce9a;
      expv[20] = 65'h1ce65bf87dd76f4b2;
      expv[21] = 65'h15b060dfd22a53073;
      expv[22] = 65'h12637a0caf98dfaec;
      expv[23] = 65'h06990688768fbf602;
      expv[24] = 65'h1ec8be38a60de0bf2;
      expv[25] = 65'h0b48e0ae8cb706c7c;
      expv[26] = 65'h1a24f1846a2d3956e;
      expv[27] = 65'h04d6e1dcea940951a;
      expv[28] = 65'h15454830e4ec0512d;
      expv[29] = 65'h0d4a7ef52fd267e83;
      expv[30] = 65'h1acf50944baaa74d8;
      expv[31] = 65'h0aa4e2f4d89d45e2d;
      expv[32] = 65'h0501e94dbe138f7e3;
      expv[33] = 65'h0ae1cd3aefd9ceb56;
      expv[34] = 65'h1e74f32ef4e7e121c;
      expv[35] = 65'h06271201d3d6966fc;
      expv[36] = 65'h09f5ca53284f6eb13;
      expv[37] = 65'h1cc3218652a0fbf8a;
      expv[38] = 65'h0161fb45fd3c48316;
      expv[39] = 65'h12783ea4224fcddf6;
      expv[40] = 65'h171a3a0b44c6746d2;
      expv[41] = 65'h0c41a6d23e70b8f2f;
      expv[42] = 65'h1bed54a03f43c1c92;
      expv[43] = 65'h1171c2e4dd9d98de5;
      expv[44] = 65'h1dd7a0c611740ec5c;
      expv[45] = 65'h01bd03ebe34128304;
      expv[46] = 65'h1df8fbb73f51467be;
      expv[47] = 65'h0a12ac7e281a87091;
      expv[48] = 65'h10a5200142b5538be;
      expv[49] = 65'h1500f7e2d8e926b25;
      expv[50] = 65'h1dd77f9a7264b780a;
      expv[51] = 65'h072fe0ec742f5831c;
      expv[52] = 65'h02bae9230eafb55dc;
      expv[53] = 65'h03cbfc8ec67241ed6;
      expv[54] = 65'h00dac5417fca489f8;
      expv[55] = 65'h140ec4955c6df9b10;
      expv[56] = 65'h0c3a35dbf25525045;
      expv[57] = 65'h1151d9d17bf22ccf8;
      expv[58] = 65'h1ea840bb9af39fc6a;
      expv[59] = 65'h0f9bed6ac5051f7d7;
      expv[60] = 65'h043ad876785b6fb64;
      expv[61] = 65'h15e491529fe76027c;
      expv[62] = 65'h0e780cb19eda634a5;
      expv[63] = 65'h057d41a517821a252;
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
