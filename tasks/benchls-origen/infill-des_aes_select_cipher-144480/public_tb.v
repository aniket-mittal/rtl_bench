// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 195;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_144480 dut (
    .clk(clk),
    .rst(in_vec[194:194]),
    .algorithm_select(in_vec[193:192]),
    .key(in_vec[191:64]),
    .data_in(in_vec[63:0]),
    .encrypted_out(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 195'h7a2a290e037d770c14d7a380ac2e012c95c121d2ea53d07d3;
    stim[1] = 195'h496042aebb8e1de5ca84367089506cf3e176c4969f3023c16;
    stim[2] = 195'h3a0dfc8246cae72ab7fd7360b2e961f12815946885b26def0;
    stim[3] = 195'h0e9f626d9d8cfc1dedb3eb156f7b2f197b4ff986ed41760e6;
    stim[4] = 195'h122b0efc9a2ddd02cd8f39164489826d23923739829eadad9;
    stim[5] = 195'h0ab1f5f78d92d796f81ac9644b0dc8205b3325b4f7b5f8d8d;
    stim[6] = 195'h0d507a4a98a46ffaaf8173a7cbca5b87b2d281e5a5a25d38e;
    stim[7] = 195'h26161fffacdc9e0f6119839e8faddbfa2dca8c210288497e9;
    stim[8] = 195'h2c53db3f2ac9699543b4bc72767d15f9b5adc64776554c411;
    stim[9] = 195'h1fc71b94bc7df94225cdf4a9b4df3711142028e59c1a7fb42;
    stim[10] = 195'h217059f0b371515f1bfbf0f7546eab315fca38903711e65b7;
    stim[11] = 195'h03f48c5b2efbbb67fc898f5205d484473206cf3cc545b7b14;
    stim[12] = 195'h116957e32c81840bcf7967981029d7054ee7da91f6744fa71;
    stim[13] = 195'h03aac2dbb3fd55c80c609f990edbe53afef6afa84be1e1316;
    stim[14] = 195'h06603957148b51d16b48b80d723c5ffde32300649a26026c4;
    stim[15] = 195'h261612a483f7dced0722ac8afc46232e4b348d94d472b6e74;
    stim[16] = 195'h0e6eceb81355548c3a8a8b95f12533497157d265641adffe3;
    stim[17] = 195'h2c87a9966ed05cba9046639ca37baa058ccad7d7164929b48;
    stim[18] = 195'h022a2513c0e54895cf4de0a99557169a5d18e3316dfba221b;
    stim[19] = 195'h2b269d6bbf5b8af4cdc831faba92809add828c6374b11d6f5;
    stim[20] = 195'h1d46461d13807f487aca6d1d23a1741c85c04b439b5ae5724;
    stim[21] = 195'h0af9292272c94e8370071a024d2b3bebb24196c0efc610c80;
    stim[22] = 195'h1e1466fcb14e3448feffcb8d9bebab68ebc97000911d90bfa;
    stim[23] = 195'h18e7c8cd3c26197ffa6b0bfe57232b9399dea2ca11d18cb72;
    stim[24] = 195'h07a078c98057476eeb1959c7ee53c7c5da5b96da300096bd6;
    stim[25] = 195'h28ebc0791b81d1fe80a82d017c4f8cecc2613d4d9f96283a2;
    stim[26] = 195'h2baa39df35577f9e572cb9a66437dd4b591cfe0ee4bfc2db9;
    stim[27] = 195'h0e0860e0ed23619279bee8bea483d471a4cf68b760daddee3;
    stim[28] = 195'h3f723058b3b81f3636ccb72a13da1d862c63fc595f7dff63c;
    stim[29] = 195'h2c7b1e17dd33173511f59415a6e0e0c96c746004ee25da34d;
    stim[30] = 195'h3a1adf3fc5a1d61f79dca51b2c55c1532c26647af57d6e4eb;
    stim[31] = 195'h01f555e0315f0e7281f1bacd48ae8de757a312f9ab364390e;
    stim[32] = 195'h1892b488a678f066cd7f9ca8f0cf8f4b0cad4ba8085660539;
    stim[33] = 195'h178ed71587c0564cad6a4c25d51b7e47ba96c4ff93268fbe1;
    stim[34] = 195'h1b2457c63fda3654aad8692775fdc1a563bcd97e45f8b0565;
    stim[35] = 195'h371b3cf7c0cb3ecc4eece1faa60a2efd99571051a2b2cf14d;
    stim[36] = 195'h3ff1b0a8c6f16313f02be5eb70436353a08a73edaa6fe437a;
    stim[37] = 195'h2403708cf7f2a68376ede5eaa0007b7bba3db6cc5ffac098a;
    stim[38] = 195'h30159ccb55c0f64bb4e7f4c373738891cca87ef164b4daa3c;
    stim[39] = 195'h079d8c9298ecf8c8c9d4a991b966102a3c38a908fdfa4f636;
    stim[40] = 195'h2c2e33f8c05c695f2d7d26d877b73b1dffbe20649734a8c69;
    stim[41] = 195'h01e6a1f4e324403e7da3b4dc1c9a39eb9ec6fb76dcf6160a5;
    stim[42] = 195'h12e3e1b1e01edea202b966734fdd6f842f8091eebfb76a058;
    stim[43] = 195'h33d8e14d699d12fa1e177fea5943eabe3b2c7f6f40aa65b94;
    stim[44] = 195'h10244b417301940f633992a1c4574e7d3bfa2a3a7c670f50d;
    stim[45] = 195'h01db79d00dc3b1c0ed7979de5880dce574325c4828165ad00;
    stim[46] = 195'h012a3c34381eabeb8c76e7046212328960386ba4fc47a2f4b;
    stim[47] = 195'h12f1ff6829e83e92fb9ad748f76c5e59f81e01b6c6ff21df0;
    stim[48] = 195'h091d65df2ff321527ca39ca1f157833a5e8a6ccf73051216b;
    stim[49] = 195'h17a6a32e1c28e350d9a8798a15495630df3b28b752ebd9014;
    stim[50] = 195'h2fe3e914317c19d791fbcf16beb60f5f1b0a77d4ba843e1bb;
    stim[51] = 195'h3f90b2596d81980aa3594c8692d669205a1be69a27ef3ee3d;
    stim[52] = 195'h12f68f6cfa9b45a3b779bcecbbafe5b9e6632d47ccb7698f2;
    stim[53] = 195'h000e27dec2399d6f6a62b763b3a1011fc50c8c1449ea22acd;
    stim[54] = 195'h079d5be2d4ee9c7280a866540b8deb7d042469438a05d3b0c;
    stim[55] = 195'h188f8cb3462e7686ba921a9ae4de2634506ab5a1fe6091969;
    stim[56] = 195'h2ae4fa1aa94877993e712c017798969a821fc792629ab457b;
    stim[57] = 195'h241f036bf7c4c229ed96b5947a3e129dc7b2d82a70078e6c6;
    stim[58] = 195'h1b2eb00349589629592020bc6657c45654cf10de789e6a89f;
    stim[59] = 195'h343191f967a7c2ae787c1fe1a02530c2e5a250f0eb7384c69;
    stim[60] = 195'h327386e2ac9e9316ee0360dca1b8dc712122755e49f7aa958;
    stim[61] = 195'h20c1a9fe572b784f71a33628ea8d8f8262e9c701815ba0894;
    stim[62] = 195'h3d19701f8909382fbf7202e3a1795c82cf6b06af70275ad23;
    stim[63] = 195'h2f736bcdd5276d2c8c7c04b2f752a4a2bcaf178e6bce1c35f;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'h0000000075b0c1e2;
      expv[5] = 64'h6fc1293823a59171;
      expv[6] = 64'h000000006172fc0b;
      expv[7] = 64'h00000000cb830f88;
      expv[8] = 64'h0000000000000000;
      expv[9] = 64'h0000000000000000;
      expv[10] = 64'h6197a35002859b8a;
      expv[11] = 64'h0000000000000000;
      expv[12] = 64'h0000000037f4d6a2;
      expv[13] = 64'he8f406ec09133f67;
      expv[14] = 64'h0000000065d98a25;
      expv[15] = 64'h0000000053a040b9;
      expv[16] = 64'h0000000000000000;
      expv[17] = 64'h0000000083495c90;
      expv[18] = 64'h0000000000000000;
      expv[19] = 64'h0000000053283b10;
      expv[20] = 64'h0000000000000000;
      expv[21] = 64'h04abd99ce239df58;
      expv[22] = 64'h000000008fb916ec;
      expv[23] = 64'h2468cc2a2ed2b23b;
      expv[24] = 64'h536bb8d0af63bd74;
      expv[25] = 64'h000000006f2a724b;
      expv[26] = 64'h0000000000000000;
      expv[27] = 64'h0000000000000000;
      expv[28] = 64'h000000000881f90c;
      expv[29] = 64'h0000000000000000;
      expv[30] = 64'h0000000000000000;
      expv[31] = 64'h0000000000000000;
      expv[32] = 64'h00000000928af1d9;
      expv[33] = 64'h652a834e398ce77b;
      expv[34] = 64'h1d2d700f899ef189;
      expv[35] = 64'h7fc88da463df1f9a;
      expv[36] = 64'h0000000000000000;
      expv[37] = 64'h0000000000000000;
      expv[38] = 64'h0000000000000000;
      expv[39] = 64'h0000000000000000;
      expv[40] = 64'h000000007c752320;
      expv[41] = 64'h0000000000000000;
      expv[42] = 64'h0000000008393db6;
      expv[43] = 64'h3654faac06c2fe1c;
      expv[44] = 64'h0000000000000000;
      expv[45] = 64'h53b008519e98f077;
      expv[46] = 64'h00000000830412de;
      expv[47] = 64'h0000000009686357;
      expv[48] = 64'hc4e8ca09e55907dd;
      expv[49] = 64'h000000001937f86f;
      expv[50] = 64'h229f06e8252912ce;
      expv[51] = 64'h0000000000000000;
      expv[52] = 64'h0000000000000000;
      expv[53] = 64'h942aa1cb53957c38;
      expv[54] = 64'h000000007188c36c;
      expv[55] = 64'h00000000a4b23b31;
      expv[56] = 64'h48c0f17818838cdc;
      expv[57] = 64'h0000000000000000;
      expv[58] = 64'h0000000000000000;
      expv[59] = 64'ha246dbe0a399cf1a;
      expv[60] = 64'h0000000000000000;
      expv[61] = 64'h0000000000000000;
      expv[62] = 64'h0000000000000000;
      expv[63] = 64'h0000000000000000;
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
