// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 139;
  localparam OW = 138;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_096194 dut (
    .clk(clk),
    .rst(in_vec[138:138]),
    .main_rcn_in(in_vec[137:69]),
    .sub_rcn_in(in_vec[68:0]),
    .main_rcn_out(out_vec[137:69]),
    .sub_rcn_out(out_vec[68:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 139'h535b4f3b0cf98777292261b41e85aeae36b;
    stim[1] = 139'h757deb87d70341bd2b0d412b0b26a7996ab;
    stim[2] = 139'h3142367315130d6b9b6870a76aad683a8cf;
    stim[3] = 139'h304585569c32acb38413063df8e64222a9d;
    stim[4] = 139'h007520dca324fb96806b5220be8a2b5815a;
    stim[5] = 139'h14cd923783239ad9dd4d6c9cc86054e0d46;
    stim[6] = 139'h0bd68b3b4bf6ed6909299e827e074373a58;
    stim[7] = 139'h10d86fc741b82d134c7aadc533dedc5c7a8;
    stim[8] = 139'h2bceebd0398417f9ce295236f668d37f82d;
    stim[9] = 139'h170880de2631f063ec3368d0d020d243882;
    stim[10] = 139'h25151f8210aef557cfa90f94f796da4be2d;
    stim[11] = 139'h1bf9d2424cb70120b11c7f1a6e55707b0d4;
    stim[12] = 139'h326064e143648f14fb97e51489f283eac8d;
    stim[13] = 139'h11beb3248abf5375e88439c7c6a3b26ec22;
    stim[14] = 139'h38991a87d227077785b38270e050dd0d32d;
    stim[15] = 139'h05bce86ceaa6e79bfce6b4a72d2f06072d6;
    stim[16] = 139'h2fb5c465c30d6ed365c7fcf59e659331b67;
    stim[17] = 139'h316f0c03507f21d78bf2253f6f9b9df57d0;
    stim[18] = 139'h1dbd7f2cc0fe767906697efb2089aae1cdb;
    stim[19] = 139'h21ba65bedaf5b9b344fdc5df940693e3715;
    stim[20] = 139'h36c66ee3dde206bd7fb8e5ed87eca7c8624;
    stim[21] = 139'h082c3c5e8df4d8bd2206ce6ad600beac90e;
    stim[22] = 139'h32b5ccb48fad12576b57526e5def7bcb26d;
    stim[23] = 139'h0f2fe8a8be80576a30c32f92ada44a57b2b;
    stim[24] = 139'h2530e23010ba474b4a8bf1abbadf4ab6e81;
    stim[25] = 139'h2515a947820644cc15b73afea7d16c416f9;
    stim[26] = 139'h1171d98e3e553d3637f3b5de35ff70351ae;
    stim[27] = 139'h35e4d71b7eb1ffa57fcfc466cc3ef09c547;
    stim[28] = 139'h15d19ab1872132b7a80647308eb6af7b4ce;
    stim[29] = 139'h0ffa97013856a73a7acb0d1bffff79b7054;
    stim[30] = 139'h20ece3945848de5946866271ca5971100f7;
    stim[31] = 139'h2ae3003b68c0dfd3cedf33e9a7246785853;
    stim[32] = 139'h0dac78ec92acab850eae07e8380dafb7499;
    stim[33] = 139'h350327bedfadba6a8e51f0d0515ba71c4ff;
    stim[34] = 139'h2cb03ba5bea2cbaef6890cb131e7e68a666;
    stim[35] = 139'h1fe15cb9a6582e1aee9b1301828a69e9853;
    stim[36] = 139'h0c26f0d768d7c9d6349c21a1778c695a407;
    stim[37] = 139'h1f77ef9b23b4338f74ebbb12214a16e32ab;
    stim[38] = 139'h0046b81fe2328692530df4985d7d0c0b58e;
    stim[39] = 139'h384120e6bf3015554548b5241fa1e1d2652;
    stim[40] = 139'h1e9dd273494d2a32daa042ee1ef314c5161;
    stim[41] = 139'h25b0ee4e2af5b4a850a25b69a134c238efd;
    stim[42] = 139'h39b866c13aacf825b689f916e34ca88eecd;
    stim[43] = 139'h2460882418fadcc6c72c2f1ffb101d5066a;
    stim[44] = 139'h3108e787998cbd3949992ef056b0d877ce5;
    stim[45] = 139'h3926fd41244a6eaa31c4527a3e6e71a88d0;
    stim[46] = 139'h3f8ebdc76f751866c5876e755b824c0a6e8;
    stim[47] = 139'h168bf24a90f7cc490f3df4cc0766c5309cc;
    stim[48] = 139'h00155078c1123fef14f908a3d8d382e91e2;
    stim[49] = 139'h1336b6dc586cb778ed6b1b5487d0762d4cc;
    stim[50] = 139'h3cecacf911e50750c6aa0e02fb0ef0d50aa;
    stim[51] = 139'h379a5c219487faf81248f6a631d07b21519;
    stim[52] = 139'h3c8a03b465c9a397d11cfd1f37f686490ff;
    stim[53] = 139'h3719d25b39e81f34506fa0591afd2b6900e;
    stim[54] = 139'h0cb10a2f9106886d92e67042743f51128b2;
    stim[55] = 139'h274fe96e03324ce74a4f0aa5826c6c0edc4;
    stim[56] = 139'h35001b1c6d1def8260b16ebb78c6c1a0c98;
    stim[57] = 139'h3a4032fcba0c462c76d39318beb5238aae2;
    stim[58] = 139'h113fc631e77875de7d8100a14244255a255;
    stim[59] = 139'h3369658528712ca280dd4ee5054f446f6d2;
    stim[60] = 139'h12ba315a50a4be2bb2cb31f82fcf2e2654e;
    stim[61] = 139'h026303444688cb91ec9aff9cddba41b156e;
    stim[62] = 139'h15d0bf1dd39c6f1b8b0ec654ab9804a99ce;
    stim[63] = 139'h086488c94c3c9b4ceafd341c2a16d7c5369;
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
      expv[0] = 138'h00000000000000000000000000000000000;
      expv[1] = 138'h00000000000000000000000000000000000;
      expv[2] = 138'h00000000000000000000000000000000000;
      expv[3] = 138'h00000000000000000000000000000000000;
      expv[4] = 138'h2d0e14ed55ad07519f8a11b398a8986b5cd;
      expv[5] = 138'h000000000000000001822c2ab4e195659c2;
      expv[6] = 138'h007520dca324fb96806b5220be8a2b5815a;
      expv[7] = 138'h29ad93990c0a9c1a8c00000000000000000;
      expv[8] = 138'h2533d04fc0e86e74b000000000000000000;
      expv[9] = 138'h10d86fc741b82d134c7aadc533dedc5c7a8;
      expv[10] = 138'h2bceebd0398417f9ce295236f668d37f82d;
      expv[11] = 138'h170880de2631f063ec3368d0d020d243882;
      expv[12] = 138'h25151f8210aef557cfa90f94f796da4be2d;
      expv[13] = 138'h238fe34dcaae0f61a800000000000000000;
      expv[14] = 138'h326064e143648f14fb97e51489f283eac8d;
      expv[15] = 138'h11beb3248abf5375e88439c7c6a3b26ec22;
      expv[16] = 138'h38991a87d227077785b38270e050dd0d32d;
      expv[17] = 138'h05bce86ceaa6e79bfce6b4a72d2f06072d6;
      expv[18] = 138'h2fb5c465c30d6ed365c7fcf59e659331b67;
      expv[19] = 138'h316f0c03507f21d78bf2253f6f9b9df57d0;
      expv[20] = 138'h1dbd7f2cc0fe767906697efb2089aae1cdb;
      expv[21] = 138'h21ba65bedaf5b9b344fdc5df940693e3715;
      expv[22] = 138'h36c66ee3dde206bd7fb8e5ed87eca7c8624;
      expv[23] = 138'h082c3c5e8df4d8bd2206ce6ad600beac90e;
      expv[24] = 138'h2aea4dcbbdef7964db95ae65a47d6892bb5;
      expv[25] = 138'h0f2fe8a8be80576a30c32f92ada44a57b2b;
      expv[26] = 138'h2530e23010ba474b4a8bf1abbadf4ab6e81;
      expv[27] = 138'h2515a947820644cc15b73afea7d16c416f9;
      expv[28] = 138'h1171d98e3e553d3637f3b5de35ff70351ae;
      expv[29] = 138'h35e4d71b7eb1ffa57fcfc466cc3ef09c547;
      expv[30] = 138'h15d19ab1872132b7a80647308eb6af7b4ce;
      expv[31] = 138'h0ffa97013856a73a7acb0d1bffff79b7054;
      expv[32] = 138'h20ece3945848de5946866271ca5971100f7;
      expv[33] = 138'h2ae3003b68c0dfd3cedf33e9a7246785853;
      expv[34] = 138'h0dac78ec92acab850eae07e8380dafb7499;
      expv[35] = 138'h000000000000000001a8193df6fd6dd3547;
      expv[36] = 138'h2cb03ba5bea2cbaef6890cb131e7e68a666;
      expv[37] = 138'h1fe15cb9a6582e1aee9b1301828a69e9853;
      expv[38] = 138'h0c26f0d768d7c9d6349c21a1778c695a407;
      expv[39] = 138'h1f77ef9b23b4338f74ebbb12214a16e32ab;
      expv[40] = 138'h21be930bafa1816b1c00000000000000000;
      expv[41] = 138'h2916a483f43c3a4ca5c2090735f980aaaa2;
      expv[42] = 138'h1e9dd273494d2a32daa042ee1ef314c5161;
      expv[43] = 138'h25b0ee4e2af5b4a850a25b69a134c238efd;
      expv[44] = 138'h000000000000000001cdc33609d567c12db;
      expv[45] = 138'h2460882418fadcc6c72c2f1ffb101d5066a;
      expv[46] = 138'h3108e787998cbd3949992ef056b0d877ce5;
      expv[47] = 138'h3926fd41244a6eaa31c4527a3e6e71a88d0;
      expv[48] = 138'h3f8ebdc76f751866c5876e755b824c0a6e8;
      expv[49] = 138'h27be9980ecd8a6139800000000000000000;
      expv[50] = 138'h00155078c1123fef14f908a3d8d382e91e2;
      expv[51] = 138'h2d636a90fa0ec5a99800000000000000000;
      expv[52] = 138'h000000000000000001e76567c88f283a863;
      expv[53] = 138'h000000000000000001bcd2e10ca43fd7c09;
      expv[54] = 138'h239fa3e6fed0c921ffe4501da32e4d1cbe8;
      expv[55] = 138'h000000000000000001b8ce92d9cf40f9a28;
      expv[56] = 138'h0cb10a2f9106886d92e67042743f51128b2;
      expv[57] = 138'h274fe96e03324ce74a4f0aa5826c6c0edc4;
      expv[58] = 138'h000000000000000001a800d8e368ef7c130;
      expv[59] = 138'h000000000000000001d20197e5d0623163b;
      expv[60] = 138'h113fc631e77875de7d8100a14244255a255;
      expv[61] = 138'h0000000000000000019b4b2c29438965140;
      expv[62] = 138'h12ba315a50a4be2bb2cb31f82fcf2e2654e;
      expv[63] = 138'h026303444688cb91ec9aff9cddba41b156e;
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
