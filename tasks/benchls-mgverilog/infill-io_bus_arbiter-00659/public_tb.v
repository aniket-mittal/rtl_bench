// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 79;
  localparam OW = 45;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00659 dut (
    .BCLK(clk),
    .BRESET(in_vec[78:78]),
    .I_IOA(in_vec[77:46]),
    .D_IOA(in_vec[45:14]),
    .I_IORD(in_vec[13:13]),
    .D_IORD(in_vec[12:12]),
    .D_IOWR(in_vec[11:11]),
    .IO_READY(in_vec[10:10]),
    .GENSTAT(in_vec[9:7]),
    .D_IOBE(in_vec[6:3]),
    .ILO_SIG(in_vec[2:2]),
    .DCWACC(in_vec[1:0]),
    .IO_A(out_vec[44:13]),
    .IO_RD(out_vec[12:12]),
    .IO_WR(out_vec[11:11]),
    .IO_BE(out_vec[10:7]),
    .I_IORDY(out_vec[6:6]),
    .D_IORDY(out_vec[5:5]),
    .STATUS(out_vec[4:1]),
    .ILO(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 79'h7600c8ed11e4b4c93fca;
    stim[1] = 79'h4c20bd08398a2dd40192;
    stim[2] = 79'h12f6939bbf867f25cb35;
    stim[3] = 79'h3b60c5d9a4c6f363d433;
    stim[4] = 79'h1f4bb29d9fefbd416de2;
    stim[5] = 79'h35f5f0c745602af45f08;
    stim[6] = 79'h0d048fc290ad7f3b43b3;
    stim[7] = 79'h289480b4f430c68839e7;
    stim[8] = 79'h7dd402ab1176e003b684;
    stim[9] = 79'h18fbc20a39a78d0b210f;
    stim[10] = 79'h3fefba244eadfd6ec026;
    stim[11] = 79'h2ef78bc8583ed5a75941;
    stim[12] = 79'h25e99adb1a4b224adce0;
    stim[13] = 79'h28e7b6b4ee15aaa8d6e7;
    stim[14] = 79'h092151086b0c198e1448;
    stim[15] = 79'h1a9e31259fe9140a1351;
    stim[16] = 79'h3e1d3340c1e80bb6874b;
    stim[17] = 79'h0b22701389960dc448f2;
    stim[18] = 79'h12de676514576461f7fb;
    stim[19] = 79'h1d18acd35363cb5a3f8f;
    stim[20] = 79'h30bc29fa22a1cd320e70;
    stim[21] = 79'h32296c3227cdc68d7d1e;
    stim[22] = 79'h0bdc89d56bcce3184867;
    stim[23] = 79'h00c2daa6a82339796b96;
    stim[24] = 79'h120cae22f9898b6db1c1;
    stim[25] = 79'h3704bec101874237cac0;
    stim[26] = 79'h3430f5e29f16dc8cad16;
    stim[27] = 79'h00126d1f592daea1b130;
    stim[28] = 79'h12bb47b1f221d650a22d;
    stim[29] = 79'h2ee41549d3e9fee937cf;
    stim[30] = 79'h34aa67ac0c9c8368e312;
    stim[31] = 79'h1e9da7f8369851b75a7f;
    stim[32] = 79'h3c502a9c946176d1663f;
    stim[33] = 79'h0ee2f010941269c38d23;
    stim[34] = 79'h123928b98d943e8e3320;
    stim[35] = 79'h38e1f8e2e390d8bda1f2;
    stim[36] = 79'h13b56f5d0a91e4124624;
    stim[37] = 79'h156bc8cb7306f5a056f3;
    stim[38] = 79'h173d6498c0da136e1270;
    stim[39] = 79'h33552f251274556d6ba8;
    stim[40] = 79'h268e6624b14da89368c3;
    stim[41] = 79'h01bcf3785f5a2588a56e;
    stim[42] = 79'h2349e32f8b81dc65d09c;
    stim[43] = 79'h00f69d4e422b898422dd;
    stim[44] = 79'h2061811a13dd2e2917cc;
    stim[45] = 79'h2050a97389ecd30f2914;
    stim[46] = 79'h3e137c96bdd320983da3;
    stim[47] = 79'h1d0b0b6f273bf4fc4c72;
    stim[48] = 79'h342495febb117e8c5eea;
    stim[49] = 79'h351491fdf40852ffbca5;
    stim[50] = 79'h079c05100bf05d266c06;
    stim[51] = 79'h35934e4101566312bef2;
    stim[52] = 79'h0348c69bc8fa009f76ff;
    stim[53] = 79'h1646a481cf6551fe1b38;
    stim[54] = 79'h2efd0fc68f85567a192d;
    stim[55] = 79'h055a06d9a9c58349fb08;
    stim[56] = 79'h2d83a17c517b577be8dc;
    stim[57] = 79'h0b8e722f7d500a07b66e;
    stim[58] = 79'h21899548412d0eb38adc;
    stim[59] = 79'h2db64b6f9142ce3695ac;
    stim[60] = 79'h072db3e82d8555c7812a;
    stim[61] = 79'h050d7b15e2c05da52d8d;
    stim[62] = 79'h15e5572712b68482d009;
    stim[63] = 79'h0bbcc3d521a53823aad5;
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
      expv[0] = 45'h08f25a649ca8;
      expv[1] = 45'h06105e840780;
      expv[2] = 45'h1fc33f92eb09;
      expv[3] = 45'h126379b1f334;
      expv[4] = 45'h0ff7dea0ae28;
      expv[5] = 45'h02b0157a38a8;
      expv[6] = 45'h068247e14782;
      expv[7] = 45'h1a1863441e09;
      expv[8] = 45'h08bb7001d02d;
      expv[9] = 45'h0c7de1051791;
      expv[10] = 45'h1ff7dd122781;
      expv[11] = 45'h0c1f6ad3bc08;
      expv[12] = 45'h0d2591257e2c;
      expv[13] = 45'h170ad554762d;
      expv[14] = 45'h15860cc714b4;
      expv[15] = 45'h0ff48a051508;
      expv[16] = 45'h1f0e99a067c2;
      expv[17] = 45'h04cb06e22f0c;
      expv[18] = 45'h0a2bb230f7a8;
      expv[19] = 45'h09b1e5ad18a9;
      expv[20] = 45'h1150e6990f34;
      expv[21] = 45'h13e6e346b9a9;
      expv[22] = 45'h15e6718c2e15;
      expv[23] = 45'h14119cbca909;
      expv[24] = 45'h1cc4c5b6d408;
      expv[25] = 45'h00c3a11bec0c;
      expv[26] = 45'h0f8b6e464929;
      expv[27] = 45'h0c96d750d308;
      expv[28] = 45'h095da3d8f791;
      expv[29] = 45'h09f4ff7494a9;
      expv[30] = 45'h1a5533d61790;
      expv[31] = 45'h1b4c28dbbf95;
      expv[32] = 45'h1e28154e57d1;
      expv[33] = 45'h0a0934e1ca28;
      expv[34] = 45'h06ca1f471208;
      expv[35] = 45'h1c70fc717790;
      expv[36] = 45'h09dab7ae87c2;
      expv[37] = 45'h19837ad0372c;
      expv[38] = 45'h006d09b71714;
      expv[39] = 45'h093a2ab6aa88;
      expv[40] = 45'h18a6d449ac0c;
      expv[41] = 45'h00de79bc37d1;
      expv[42] = 45'h05c0ee32f18d;
      expv[43] = 45'h007b4ea73791;
      expv[44] = 45'h09ee971494a9;
      expv[45] = 45'h04f669878909;
      expv[46] = 45'h1ee9904c1a28;
      expv[47] = 45'h139dfa7e2f34;
      expv[48] = 45'h1d88bf463eac;
      expv[49] = 45'h1a04297fda2d;
      expv[50] = 45'h05f82e932835;
      expv[51] = 45'h00ab31895f2c;
      expv[52] = 45'h047d004fb7ad;
      expv[53] = 45'h07b2a8ff1b88;
      expv[54] = 45'h07c2ab3d1a89;
      expv[55] = 45'h14e2c1a4f888;
      expv[56] = 45'h08bdabbded8d;
      expv[57] = 45'h1ea80503d6b5;
      expv[58] = 45'h00968759cd8d;
      expv[59] = 45'h08a1671b52a9;
      expv[60] = 45'h0396d9f40780;
      expv[61] = 45'h11602ed288a9;
      expv[62] = 45'h095b42417094;
      expv[63] = 45'h10d29c11cd0d;
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
