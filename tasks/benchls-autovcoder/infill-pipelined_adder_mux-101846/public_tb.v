// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 99;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_101846 dut (
    .clk(clk),
    .reset(in_vec[65:65]),
    .to2_aValid(in_vec[64:64]),
    .to2_a(in_vec[63:32]),
    .to2_b(in_vec[31:0]),
    .to1_aValid(out_vec[98:98]),
    .to1_a(out_vec[97:66]),
    .to2_eValid(out_vec[65:65]),
    .to2_e(out_vec[64:33]),
    .to3_dValid(out_vec[32:32]),
    .to3_d(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h205f6084c2421ad4b;
    stim[1] = 66'h2f8de0047bfb5d88a;
    stim[2] = 66'h0bc2c060c4f931601;
    stim[3] = 66'h04f9165533133f014;
    stim[4] = 66'h056fe9019d69de7a1;
    stim[5] = 66'h1d209bcce882fc243;
    stim[6] = 66'h1f29876b97824e3f0;
    stim[7] = 66'h16cb62b2bc1f71318;
    stim[8] = 66'h01ec33e306fbff7a0;
    stim[9] = 66'h1def5022c2d3e7942;
    stim[10] = 66'h13b199a0ce7d8fa0c;
    stim[11] = 66'h0b7b220a42c4e5fc3;
    stim[12] = 66'h0f1717c6385e2fe7a;
    stim[13] = 66'h03edff5abd723d8ae;
    stim[14] = 66'h1630d2c4fd04196d7;
    stim[15] = 66'h0e69bfa3832d12f7e;
    stim[16] = 66'h188bd7252c314a39d;
    stim[17] = 66'h025bf022a93072bf9;
    stim[18] = 66'h11ace63bcf02a1ed1;
    stim[19] = 66'h18aa81b4e2f9c37f4;
    stim[20] = 66'h01a0785a6db82d3be;
    stim[21] = 66'h0c0e81022c6f640bd;
    stim[22] = 66'h02a5769918d61eafb;
    stim[23] = 66'h1d8efe9ced1ac1aaa;
    stim[24] = 66'h0b2315d9869fafe22;
    stim[25] = 66'h02244e5cfe7ffe455;
    stim[26] = 66'h1c920b01c1dc6fcd6;
    stim[27] = 66'h0c9d0f5d2111caf7b;
    stim[28] = 66'h16fa4e4a168713d89;
    stim[29] = 66'h140e7a5be12c5b4bb;
    stim[30] = 66'h081873f7882b4f979;
    stim[31] = 66'h0a61eb075621259fe;
    stim[32] = 66'h01a7d35b143f490df;
    stim[33] = 66'h18b78d94952d3d094;
    stim[34] = 66'h0b79a26c26f11f414;
    stim[35] = 66'h16d15f5a503f72f7f;
    stim[36] = 66'h1580e9a2c67833e09;
    stim[37] = 66'h15d0b0778872fc1d7;
    stim[38] = 66'h00ecd176f1fc92a2c;
    stim[39] = 66'h13ac39d6084674253;
    stim[40] = 66'h0a12ad62a79ae2e87;
    stim[41] = 66'h1e778efe2e8085828;
    stim[42] = 66'h1daacac4c959d4b9c;
    stim[43] = 66'h06f4a643adbd5afb0;
    stim[44] = 66'h169c25b1f721cffc1;
    stim[45] = 66'h0bfd9f3eb611499e0;
    stim[46] = 66'h05d21e4cca9f98afe;
    stim[47] = 66'h05e93399c4644d021;
    stim[48] = 66'h1a007f47c502faf55;
    stim[49] = 66'h323429017b10cbcf0;
    stim[50] = 66'h0dc7b8834d59be4ee;
    stim[51] = 66'h1f7f601c0b72620bd;
    stim[52] = 66'h047fc3322f5762a1a;
    stim[53] = 66'h177cc3d8bfa718271;
    stim[54] = 66'h148a2caf89393c086;
    stim[55] = 66'h03b9f36f9ea95bcb7;
    stim[56] = 66'h07106d830a4213ba1;
    stim[57] = 66'h0567ba8a73e4bf97f;
    stim[58] = 66'h09799a0d39d796a35;
    stim[59] = 66'h0c7af7c8581de8d8e;
    stim[60] = 66'h16254ff5a090c17a3;
    stim[61] = 66'h1167053bfb48880d4;
    stim[62] = 66'h04be09851c503f386;
    stim[63] = 66'h0845c68eeac25553e;
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
      expv[0] = 99'hxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 99'hxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 99'hxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 99'h00000001xxxxxxxxx4f931602;
      expv[4] = 99'h4000000449f22cacb3133f022;
      expv[5] = 99'h400000078adfd208ad69de7bc;
      expv[6] = 99'h0000000ada4137a29882fc26b;
      expv[7] = 99'h0000000e1e530ee327824e425;
      expv[8] = 99'h400000114d96c574bc1f7135a;
      expv[9] = 99'h4000001483d867d886fbff7ef;
      expv[10] = 99'h00000017dbdea05b52d3e799e;
      expv[11] = 99'h0000001b0763335a8e7d8fa75;
      expv[12] = 99'h4000001e56f64430d2c4e6039;
      expv[13] = 99'h400000219e2e2fabe85e2fefd;
      expv[14] = 99'h00000024c7dbfed83d723d93e;
      expv[15] = 99'h000000280c61a5afed0419774;
      expv[16] = 99'h4000002b5cd37f70532d13028;
      expv[17] = 99'h4000002eb117ae76cc314a454;
      expv[18] = 99'h00000031c4b7e075193072cbd;
      expv[19] = 99'h000000350359ccaa8f02a1fa2;
      expv[20] = 99'h40000038515503a012f9c38d2;
      expv[21] = 99'h4000003b8340f0ee4db82d4a9;
      expv[22] = 99'h0000003ed81d02411c6f641b5;
      expv[23] = 99'h00000042054aed7228d61ec00;
      expv[24] = 99'h400000455b1dfd7d1d1ac1bbc;
      expv[25] = 99'h4000004896462bf9869faff41;
      expv[26] = 99'h0000004bc4489d03be7ffe581;
      expv[27] = 99'h0000004f1924165081dc6fe0f;
      expv[28] = 99'h40000052593a1f0a9111cb0c1;
      expv[29] = 99'h40000055adf49ce7a68713edc;
      expv[30] = 99'h00000058c81cf50e912c5b61b;
      expv[31] = 99'h0000005c1030e849082b4fae6;
      expv[32] = 99'h4000005f54c3d66bf62125b78;
      expv[33] = 99'h40000062834fa716a43f49266;
      expv[34] = 99'h00000065d16f1b8cf52d3d228;
      expv[35] = 99'h0000006916f3453f46f11f5b5;
      expv[36] = 99'h4000006c4da2bf1ef03f7312d;
      expv[37] = 99'h4000006fab01d3b3067833fc4;
      expv[38] = 99'h00000072cba1615fd872fc39f;
      expv[39] = 99'h0000007601d9a361e1fc92c01;
      expv[40] = 99'h4000007947587423584674435;
      expv[41] = 99'h4000007c94255b3fc79ae3076;
      expv[42] = 99'h0000007fdcef1e7a1e8085a24;
      expv[43] = 99'h000000831b55960a8959d4da5;
      expv[44] = 99'h400000864de94d0b9dbd5b1c6;
      expv[45] = 99'h40000089ad384beb6721d01e4;
      expv[46] = 99'h0000008cd7fb3f08361149c10;
      expv[47] = 99'h000000900ba43d278a9f98d3b;
      expv[48] = 99'h400000934bd267c4d4644d26b;
      expv[49] = 99'h40000096b400ff240502fb1ac;
      expv[50] = 99'h000000969400ff240502fb1ac;
      expv[51] = 99'h000000011b8f7151ed59be4ef;
      expv[52] = 99'h400000045efec03a5b72620cb;
      expv[53] = 99'h4000000788ff8669cf5762a35;
      expv[54] = 99'h0000000acef987ba3fa718299;
      expv[55] = 99'h0000000e0914596b09393c0bb;
      expv[56] = 99'h400000114773e6ee7ea95bcf9;
      expv[57] = 99'h400000148e20db188a4213bf0;
      expv[58] = 99'h00000017cacf752ab3e4bf9db;
      expv[59] = 99'h0000001b12f3343369d796a9e;
      expv[60] = 99'h4000001e58f5efacf81de8e04;
      expv[61] = 99'h40000021ac4aa00ac090c1826;
      expv[62] = 99'h00000024c2ce0a9abb4888164;
      expv[63] = 99'h00000028097c13302c503f423;
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
