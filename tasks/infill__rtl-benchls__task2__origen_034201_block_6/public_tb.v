// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 78;
  localparam OW = 96;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_034201 dut (
    .clk(clk),
    .rst(in_vec[77:77]),
    .mfc0(in_vec[76:76]),
    .addr(in_vec[75:71]),
    .mtc0(in_vec[70:70]),
    .data(in_vec[69:38]),
    .exception(in_vec[37:37]),
    .eret(in_vec[36:36]),
    .pc(in_vec[35:4]),
    .cause(in_vec[3:0]),
    .CP0_out(out_vec[95:64]),
    .status(out_vec[63:32]),
    .epc_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 78'h2cf00118ed2e5e0957ed;
    stim[1] = 78'h360e1f587b33620ecc37;
    stim[2] = 78'h07df3a465757e0838cfb;
    stim[3] = 78'h0c29557e1b7ca1f38700;
    stim[4] = 78'h174f11c1b5d991561d46;
    stim[5] = 78'h1a098e4b9d2e7b4b4087;
    stim[6] = 78'h0a679466e27e0eb3d4cc;
    stim[7] = 78'h1a572da8bbd959453c35;
    stim[8] = 78'h0df3bf72e666b8344451;
    stim[9] = 78'h014aaf158e57285fd03a;
    stim[10] = 78'h06766b1ae7b0b2d2d7d3;
    stim[11] = 78'h1a8ae9796abd6fd4c5d7;
    stim[12] = 78'h1e99baedb1b1a59a0ffa;
    stim[13] = 78'h1bc06e49c45cae86a8c5;
    stim[14] = 78'h0170daceaf1863a0ae18;
    stim[15] = 78'h075c8b6e4a12a641b4fc;
    stim[16] = 78'h10568d5fa708c7509b13;
    stim[17] = 78'h09ea7d20710c88a3102e;
    stim[18] = 78'h0ff4629d799fa050a1a6;
    stim[19] = 78'h1fc5426669f56d5e9dde;
    stim[20] = 78'h0781321f03e82ae73850;
    stim[21] = 78'h013735ae3affc0aa2696;
    stim[22] = 78'h38f8e78cccdc755f77c4;
    stim[23] = 78'h006ce3d2b512962e06cc;
    stim[24] = 78'h3c3c7540df759d8f1626;
    stim[25] = 78'h06e6b51135da22ee6824;
    stim[26] = 78'h08187c5a4a9495f481a3;
    stim[27] = 78'h04197ec9a0a58683dafc;
    stim[28] = 78'h132f3a8846b7bbec98f6;
    stim[29] = 78'h3cca513b6b2b75ecabb3;
    stim[30] = 78'h1cd639dff94703d1c7cc;
    stim[31] = 78'h16614eef09bf4483709c;
    stim[32] = 78'h0dbdf301d3f2a7376709;
    stim[33] = 78'h02f0be94b988ff552e63;
    stim[34] = 78'h074c9ca3e6ec43e3b06a;
    stim[35] = 78'h0d0601ca13b4df7941e9;
    stim[36] = 78'h18e0affd8f2201ec1be2;
    stim[37] = 78'h09b6e38484bfe748cb2b;
    stim[38] = 78'h0d27f476445840066628;
    stim[39] = 78'h196145e7f6ffecd0f04a;
    stim[40] = 78'h10ae2de8ae9a1f5d8bd4;
    stim[41] = 78'h11fd09dc3d0653e3631e;
    stim[42] = 78'h1fbc7f0e92ca110437cc;
    stim[43] = 78'h0570d26fac3a2968fd3e;
    stim[44] = 78'h08e35d5a40cb04895ef0;
    stim[45] = 78'h2fdfa2f70f77dd48aa46;
    stim[46] = 78'h12c27d499900020b758d;
    stim[47] = 78'h089be13bd2605a33ec76;
    stim[48] = 78'h1abeb5d9b54e9ab7fc20;
    stim[49] = 78'h1463084db4f995059955;
    stim[50] = 78'h121188c573428dc6c3c5;
    stim[51] = 78'h06afb720f7217d5793ad;
    stim[52] = 78'h00748cf21b9ebbce0036;
    stim[53] = 78'h0502ad52df1419074339;
    stim[54] = 78'h0774b986e22c83f31446;
    stim[55] = 78'h1a87b7941e056f9d1c46;
    stim[56] = 78'h1c7d366f24c5bee77e5c;
    stim[57] = 78'h0c05e1a0add1e5ba25c3;
    stim[58] = 78'h123cb2f4e8ec070ceebe;
    stim[59] = 78'h0a09ad3793dbd3eb35cf;
    stim[60] = 78'h1c90bd00fda52d959fd2;
    stim[61] = 78'h0030ccdfcd10b79017d6;
    stim[62] = 78'h01739badfd7f98ea4a58;
    stim[63] = 78'h125d520691b95469cdec;
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
      expv[0] = 96'hxxxxxxxx0000000f00000000;
      expv[1] = 96'hxxxxxxxx0000000f00000000;
      expv[2] = 96'hxxxxxxxx0000000f00000000;
      expv[3] = 96'hxxxxxxxx0000000000000000;
      expv[4] = 96'hxxxxxxxx0000000000000000;
      expv[5] = 96'h00000000000000003c4706d7;
      expv[6] = 96'hxxxxxxxx000000003c4706d7;
      expv[7] = 96'hxxxxxxxx000000003c4706d7;
      expv[8] = 96'h9e519b89000000003c4706d7;
      expv[9] = 96'h9e519b89000000003c4706d7;
      expv[10] = 96'h9e519b89000000003c4706d7;
      expv[11] = 96'h9e519b89d9ac6b9e3c4706d7;
      expv[12] = 96'hxxxxxxxx06cd635c3c4706d7;
      expv[13] = 96'hxxxxxxxx00366b1a3c4706d7;
      expv[14] = 96'hxxxxxxxx0001b3583c4706d7;
      expv[15] = 96'hxxxxxxxx00000d9a3c4706d7;
      expv[16] = 96'hxxxxxxxx0000006c722db928;
      expv[17] = 96'hxxxxxxxx0000006c722db928;
      expv[18] = 96'hxxxxxxxx0000006c722db928;
      expv[19] = 96'hxxxxxxxx00000003722db928;
      expv[20] = 96'hd18a75e600000000722db928;
      expv[21] = 96'hd18a75e600000000722db928;
      expv[22] = 96'hd18a75e60000000f00000000;
      expv[23] = 96'hd18a75e60000000f00000000;
      expv[24] = 96'hd18a75e60000000f00000000;
      expv[25] = 96'hd18a75e60000000f00000000;
      expv[26] = 96'hd18a75e60000000000000000;
      expv[27] = 96'hd18a75e60000000000000000;
      expv[28] = 96'hd18a75e60000000000000000;
      expv[29] = 96'hxxxxxxxx0000000f00000000;
      expv[30] = 96'hxxxxxxxx0000000f00000000;
      expv[31] = 96'hxxxxxxxx0000000f00000000;
      expv[32] = 96'h0000000f853bbc2600000000;
      expv[33] = 96'h0000000fa77784c02a73766c;
      expv[34] = 96'h0000000fa77784c02a73766c;
      expv[35] = 96'h0000000fa77784c032728f9b;
      expv[36] = 96'h0000000f053bbc2632728f9b;
      expv[37] = 96'hxxxxxxxx053bbc2632728f9b;
      expv[38] = 96'hxxxxxxxx0029dde132728f9b;
      expv[39] = 96'hxxxxxxxx00014eef32728f9b;
      expv[40] = 96'hxxxxxxxx00000a7732728f9b;
      expv[41] = 96'hxxxxxxxx0000005332728f9b;
      expv[42] = 96'hxxxxxxxx0000005332728f9b;
      expv[43] = 96'h150999a70000005332728f9b;
      expv[44] = 96'h150999a70000000232728f9b;
      expv[45] = 96'h150999a70000000f00000000;
      expv[46] = 96'h150999a70000000f00000000;
      expv[47] = 96'hc2fa52e60000000f00000000;
      expv[48] = 96'hc2fa52e60000000f00000000;
      expv[49] = 96'hxxxxxxxx0000000f00000000;
      expv[50] = 96'hxxxxxxxx0000000000000000;
      expv[51] = 96'hxxxxxxxx0000000000000000;
      expv[52] = 96'hxxxxxxxx0000000000000000;
      expv[53] = 96'hxxxxxxxx0000000000000000;
      expv[54] = 96'hxxxxxxxx0000000000000000;
      expv[55] = 96'hxxxxxxxx00000000d2e61b88;
      expv[56] = 96'hxxxxxxxx00000000d2e61b88;
      expv[57] = 96'hxxxxxxxx00000000d2e61b88;
      expv[58] = 96'hxxxxxxxx00000000d2e61b88;
      expv[59] = 96'hxxxxxxxx00000000d2e61b88;
      expv[60] = 96'hxxxxxxxx00000000d2e61b88;
      expv[61] = 96'h58e77fe500000000d2e61b88;
      expv[62] = 96'h58e77fe500000000d2e61b88;
      expv[63] = 96'h58e77fe500000000d2e61b88;
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
