// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 96;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02817 dut (
    .di_PC(in_vec[65:34]),
    .icache_hit(in_vec[33:33]),
    .icache_should_stall(in_vec[32:32]),
    .icache_data(in_vec[31:0]),
    .do_IR(out_vec[95:64]),
    .do_NextPC(out_vec[63:32]),
    .icache_address(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h38744a12440ad4d80;
    stim[1] = 66'h1c6690129f718df5e;
    stim[2] = 66'h3640f30d7133470b6;
    stim[3] = 66'h2501d2327996675bc;
    stim[4] = 66'h01ee93fc23ea5dd34;
    stim[5] = 66'h0dcd3c1bfe7f5a210;
    stim[6] = 66'h17c61492e75dd5865;
    stim[7] = 66'h28afd418941a4cc49;
    stim[8] = 66'h3ea9a28243c81c2be;
    stim[9] = 66'h27246af51b37a7454;
    stim[10] = 66'h0fa1f8832d1f772c6;
    stim[11] = 66'h0bf69fa78f0c78fe2;
    stim[12] = 66'h25f9d52c612cc8e07;
    stim[13] = 66'h130e090504519a8f9;
    stim[14] = 66'h14745bc37c472d033;
    stim[15] = 66'h16fb1b698a0f67dea;
    stim[16] = 66'h207c76a7f8c29f8ff;
    stim[17] = 66'h04e10bddb3d34be78;
    stim[18] = 66'h1d1b7243eb4bf81bc;
    stim[19] = 66'h23a088eb729d78193;
    stim[20] = 66'h0bca24ef45520ef6c;
    stim[21] = 66'h3684ed5755a77cf53;
    stim[22] = 66'h2c9afa0ef40ed6a22;
    stim[23] = 66'h21d7b9e005c01c96f;
    stim[24] = 66'h0b0a879826619f790;
    stim[25] = 66'h221450bac7d2ca5f0;
    stim[26] = 66'h1a6a548927d228dc2;
    stim[27] = 66'h377e0593ea2201d3c;
    stim[28] = 66'h2038b2dce0615af47;
    stim[29] = 66'h1a023aef7574aef37;
    stim[30] = 66'h0e90c72d16d80f5dc;
    stim[31] = 66'h273c672e180f82a10;
    stim[32] = 66'h27c8a14cdabc02d60;
    stim[33] = 66'h09367a4941509f9c2;
    stim[34] = 66'h30a143d51a08a8561;
    stim[35] = 66'h1d6597a95b613cb69;
    stim[36] = 66'h1e99e9415ec620fbe;
    stim[37] = 66'h00f23010398e4d5ea;
    stim[38] = 66'h150ae3a1b63ce4cdf;
    stim[39] = 66'h12a9a89a7c3813e84;
    stim[40] = 66'h3c601a7e7b8bdb3a3;
    stim[41] = 66'h0cb84502058d396be;
    stim[42] = 66'h13d182decf739b3c6;
    stim[43] = 66'h337f63dc27be9bf6a;
    stim[44] = 66'h393d89fa3158ea6bf;
    stim[45] = 66'h2ea916d8f95d59fe8;
    stim[46] = 66'h000c9bbcdcaeb74cd;
    stim[47] = 66'h3618ed1344b59fe84;
    stim[48] = 66'h22ffd064a5e6b9cf7;
    stim[49] = 66'h0d8b165513cc4e18d;
    stim[50] = 66'h19850a2b7c97b4263;
    stim[51] = 66'h34be9179c1fc14526;
    stim[52] = 66'h20b17b3d310fcc513;
    stim[53] = 66'h2399b8bde2532583e;
    stim[54] = 66'h156f8bdd8fc11d3af;
    stim[55] = 66'h26cdc8365ffcc9d9a;
    stim[56] = 66'h1145678752f65a33d;
    stim[57] = 66'h1cf04c7ac2bb931f3;
    stim[58] = 66'h1efb5c238d0f52219;
    stim[59] = 66'h1ca5de9e2ebb8bcf4;
    stim[60] = 66'h1adcc87ec07db88a2;
    stim[61] = 66'h15a86a0832005a596;
    stim[62] = 66'h3efc708e6e82ac137;
    stim[63] = 66'h0bfca21dc6159fe9b;
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
      expv[0] = 96'h40ad4d80e1d1284de1d12849;
      expv[1] = 96'h00000000719a404a719a404a;
      expv[2] = 96'h133470b6d903cc39d903cc35;
      expv[3] = 96'h996675bc940748cd940748c9;
      expv[4] = 96'h3ea5dd3407ba4ff407ba4ff0;
      expv[5] = 96'he7f5a2103734f0733734f06f;
      expv[6] = 96'h75dd58655f18524f5f18524b;
      expv[7] = 96'h00000000a2bf5062a2bf5062;
      expv[8] = 96'h3c81c2befaa68a0dfaa68a09;
      expv[9] = 96'h000000009c91abd49c91abd4;
      expv[10] = 96'hd1f772c63e87e2103e87e20c;
      expv[11] = 96'hf0c78fe22fda7ea22fda7e9e;
      expv[12] = 96'h12cc8e0797e754b597e754b1;
      expv[13] = 96'h4519a8f94c3824184c382414;
      expv[14] = 96'hc472d03351d16f1151d16f0d;
      expv[15] = 96'ha0f67dea5bec6daa5bec6da6;
      expv[16] = 96'h8c29f8ff81f1daa381f1da9f;
      expv[17] = 96'h3d34be7813842f7a13842f76;
      expv[18] = 96'hb4bf81bc746dc913746dc90f;
      expv[19] = 96'h29d781938e8223b18e8223ad;
      expv[20] = 96'h5520ef6c2f2893c12f2893bd;
      expv[21] = 96'h00000000da13b55dda13b55d;
      expv[22] = 96'h40ed6a22b26be83fb26be83b;
      expv[23] = 96'h5c01c96f875ee784875ee780;
      expv[24] = 96'h6619f7902c2a1e642c2a1e60;
      expv[25] = 96'h7d2ca5f0885142ef885142eb;
      expv[26] = 96'h7d228dc269a9522869a95224;
      expv[27] = 96'ha2201d3cddf81653ddf8164f;
      expv[28] = 96'h0615af4780e2cb7780e2cb73;
      expv[29] = 96'h574aef376808ebc16808ebbd;
      expv[30] = 96'h000000003a431cb43a431cb4;
      expv[31] = 96'h000000009cf19cb89cf19cb8;
      expv[32] = 96'h000000009f2285339f228533;
      expv[33] = 96'h1509f9c224d9e92924d9e925;
      expv[34] = 96'h00000000c2850f54c2850f54;
      expv[35] = 96'h0000000075965ea575965ea5;
      expv[36] = 96'h000000007a67a5057a67a505;
      expv[37] = 96'h98e4d5ea03c8c04403c8c040;
      expv[38] = 96'h63ce4cdf542b8e8a542b8e86;
      expv[39] = 96'hc3813e844aa6a26d4aa6a269;
      expv[40] = 96'hb8bdb3a3f18069fdf18069f9;
      expv[41] = 96'h58d396be32e1140c32e11408;
      expv[42] = 96'hf739b3c64f460b7f4f460b7b;
      expv[43] = 96'h7be9bf6acdfd8f74cdfd8f70;
      expv[44] = 96'h158ea6bfe4f627ece4f627e8;
      expv[45] = 96'h95d59fe8baa45b67baa45b63;
      expv[46] = 96'h0000000000326ef300326ef3;
      expv[47] = 96'h4b59fe84d863b451d863b44d;
      expv[48] = 96'h5e6b9cf78bff41968bff4192;
      expv[49] = 96'h00000000362c5954362c5954;
      expv[50] = 96'hc97b4263661428b1661428ad;
      expv[51] = 96'h1fc14526d2fa45ebd2fa45e7;
      expv[52] = 96'h10fcc51382c5ecf882c5ecf4;
      expv[53] = 96'h2532583e8e66e2fb8e66e2f7;
      expv[54] = 96'hfc11d3af55be2f7a55be2f76;
      expv[55] = 96'h000000009b3720d99b3720d9;
      expv[56] = 96'h0000000045159e1d45159e1d;
      expv[57] = 96'h2bb931f373c131ef73c131eb;
      expv[58] = 96'hd0f522197bed70927bed708e;
      expv[59] = 96'hebb8bcf472977a7c72977a78;
      expv[60] = 96'h07db88a26b7321ff6b7321fb;
      expv[61] = 96'h2005a59656a1a82456a1a820;
      expv[62] = 96'he82ac137fbf1c23dfbf1c239;
      expv[63] = 96'h6159fe9b2ff2887b2ff28877;
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
