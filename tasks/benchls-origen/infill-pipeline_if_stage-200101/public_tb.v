// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 133;
  localparam OW = 97;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_200101 dut (
    .clock(clk),
    .reset(in_vec[132:132]),
    .ex_if_stall(in_vec[131:131]),
    .id_if_selpcsource(in_vec[130:130]),
    .id_if_rega(in_vec[129:98]),
    .id_if_pcimd2ext(in_vec[97:66]),
    .id_if_pcindex(in_vec[65:34]),
    .id_if_selpctype(in_vec[33:32]),
    .mc_if_data(in_vec[31:0]),
    .if_id_nextpc(out_vec[96:65]),
    .if_id_instruc(out_vec[64:33]),
    .if_mc_en(out_vec[32:32]),
    .if_mc_addr(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 133'h1387417d8490afcf8ff451c52d42bea4a4;
    stim[1] = 133'h1b2ce0b63ba7e002b807d6961cbc5585ee;
    stim[2] = 133'h017f28018d352f62b84556e6d02587fc8a;
    stim[3] = 133'h05941e141e76fcba31922956789be034da;
    stim[4] = 133'h0a8198a6d7469def29bc49b620b95c82cb;
    stim[5] = 133'h0a62997d788fff378be2da3e4ac5b7cc43;
    stim[6] = 133'h03d8787cd11c2a91590f01dcc3186e2920;
    stim[7] = 133'h0965d7e8fad571d31a3c847ec6dff25eb0;
    stim[8] = 133'h07495da0e32ae21d23bd08403a8951a118;
    stim[9] = 133'h0263c8b5ed9059f55111fc2913fefb40bb;
    stim[10] = 133'h06467f3d5285cd9ba4f03224dfc489b51c;
    stim[11] = 133'h01293811593da232cf04cceeae9f07ea1f;
    stim[12] = 133'h1d11173fb1d8faeb590f48612335333062;
    stim[13] = 133'h0862e86d3fa73b9de30dfbfe4924e582ef;
    stim[14] = 133'h05bd9caaf442b95ca04d0e67abaa0e9f58;
    stim[15] = 133'h0f14cefc77ae17c95038416e3737d8dcb9;
    stim[16] = 133'h07b67a83e6185e4c207318b39523cd837d;
    stim[17] = 133'h083c03499e53b5e63780d41ca3f1232b80;
    stim[18] = 133'h0114302affeae2e5eb7548bd7bbda25d4a;
    stim[19] = 133'h006fc1911addb48021f52514708d4a1a57;
    stim[20] = 133'h035f2c234d44d0ebb5d983732355cbb15e;
    stim[21] = 133'h07e4ee5a85e733b68b856368feac07df0d;
    stim[22] = 133'h02d9b4d5f421736411253453d5c0b60776;
    stim[23] = 133'h08db68d7bfc9d163967d734878b7b71a7a;
    stim[24] = 133'h06f90b4b275ed4c6c2b5f2f90296c6e783;
    stim[25] = 133'h0cfa0945d1ed86ce0144f96c87b16f23d8;
    stim[26] = 133'h0b830e3f021e5e1b81be838e82259bdabb;
    stim[27] = 133'h0b1fb94a4c784d41993c61b850e1ae86a4;
    stim[28] = 133'h0493015846969535c3ecf84263c5a39209;
    stim[29] = 133'h020fe04fdf4d011d4a56c03c64cf7d8c9f;
    stim[30] = 133'h0a41636654189c92f9b56c3e663f76dd74;
    stim[31] = 133'h0e3371f45571643c329966206bcdd841f5;
    stim[32] = 133'h06722dc4e580d6acef6b170637378e75a5;
    stim[33] = 133'h067e8b03fc69e4bb5cd23407fd634b584e;
    stim[34] = 133'h00a9dfa93b31da0c0f3d04a5acb06062dc;
    stim[35] = 133'h00ea21306519efe935309a9820761172b3;
    stim[36] = 133'h0a90da8c52677fe89da314ea80085774aa;
    stim[37] = 133'h0c6766c59cc4d388377e5ebcf232003e8d;
    stim[38] = 133'h0a7e55e867c1fee35c79015bb5b092c9ad;
    stim[39] = 133'h0ba4816114aa05c6e533e8f7070b5f0996;
    stim[40] = 133'h0f1ae1aadc9c90177b75ea31fde2109b4c;
    stim[41] = 133'h0f737d0e7c19e06d033d2b8c2650f69b41;
    stim[42] = 133'h03713b34f96b9840af8159a9ec8e4f21c9;
    stim[43] = 133'h0764ab8992e4aa5393c8528bd6f6d63ef4;
    stim[44] = 133'h0f6f508ee261720defba91d3b81880e098;
    stim[45] = 133'h0635b8cf9f16b8a3e2f1fcea6fe0964d19;
    stim[46] = 133'h0303e915fd2eee65ba3ffd53ea73ad4626;
    stim[47] = 133'h0348f3e12260c04de81920d642cce425a8;
    stim[48] = 133'h0ae422346e453d6e9a9f4751162c56e84b;
    stim[49] = 133'h0ddde10b1fe6be5ccc5540ab49b1f89109;
    stim[50] = 133'h0c3f6a698f2fb7beab2589064d395f980c;
    stim[51] = 133'h0ece919f3b7ecb6c9b332929732360d7a6;
    stim[52] = 133'h092e12b8f358ce7eedc77a6dc758b09cb8;
    stim[53] = 133'h0703a738ca049718acb1148d67b040d847;
    stim[54] = 133'h048aeb77be97e201fbb9e5917b1fa959d3;
    stim[55] = 133'h08a4b8c247dc6300c0da187c041c73a2f3;
    stim[56] = 133'h09a1501d14da8843674a3fc68ca359db84;
    stim[57] = 133'h0a49921390ea36f6286f1053e6e73d0f69;
    stim[58] = 133'h0f54e0e20aee4085b53e36a185438ee3f3;
    stim[59] = 133'h05fbcd409f0e200673bdfa60cdc72b1e0b;
    stim[60] = 133'h0125f529954e5999a41465e69af0eb9021;
    stim[61] = 133'h0ab224f80663d54fe0aa198b1d52a06172;
    stim[62] = 133'h005ccf7b2da4a6657d02be6121db33a2c3;
    stim[63] = 133'h0da4914ae4c2853ffa179aae18de32c71f;
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
      expv[0] = 97'hxxxxxxxxx0000000000000000;
      expv[1] = 97'h000000008857d4949xxxxxxxx;
      expv[2] = 97'h0000000080000000000000000;
      expv[3] = 97'h0000000080000000000000000;
      expv[4] = 97'h0000000080000000000000000;
      expv[5] = 97'h0000000080000000000000000;
      expv[6] = 97'h0000000080000000000000000;
      expv[7] = 97'h0000000080000000000000000;
      expv[8] = 97'h0000000080000000000000000;
      expv[9] = 97'h0000000080000000000000000;
      expv[10] = 97'h0000000080000000000000000;
      expv[11] = 97'h0000000080000000000000000;
      expv[12] = 97'h0000000080000000000000000;
      expv[13] = 97'h0000000080000000000000000;
      expv[14] = 97'h0000000080000000000000000;
      expv[15] = 97'h0000000080000000000000000;
      expv[16] = 97'h0000000080000000000000000;
      expv[17] = 97'h0000000080000000000000000;
      expv[18] = 97'h0000000080000000000000000;
      expv[19] = 97'h0000000080000000000000000;
      expv[20] = 97'h0000000080000000000000000;
      expv[21] = 97'h0000000080000000000000000;
      expv[22] = 97'h0000000080000000000000000;
      expv[23] = 97'h0000000080000000000000000;
      expv[24] = 97'h0000000080000000000000000;
      expv[25] = 97'h0000000080000000000000000;
      expv[26] = 97'h0000000080000000000000000;
      expv[27] = 97'h0000000080000000000000000;
      expv[28] = 97'h0000000080000000000000000;
      expv[29] = 97'h0000000080000000000000000;
      expv[30] = 97'h0000000080000000000000000;
      expv[31] = 97'h0000000080000000000000000;
      expv[32] = 97'h0000000080000000000000000;
      expv[33] = 97'h0000000080000000000000000;
      expv[34] = 97'h0000000080000000000000000;
      expv[35] = 97'h0000000080000000000000000;
      expv[36] = 97'h0000000080000000000000000;
      expv[37] = 97'h0000000080000000000000000;
      expv[38] = 97'h0000000080000000000000000;
      expv[39] = 97'h0000000080000000000000000;
      expv[40] = 97'h0000000080000000000000000;
      expv[41] = 97'h0000000080000000000000000;
      expv[42] = 97'h0000000080000000000000000;
      expv[43] = 97'h0000000080000000000000000;
      expv[44] = 97'h0000000080000000000000000;
      expv[45] = 97'h0000000080000000000000000;
      expv[46] = 97'h0000000080000000000000000;
      expv[47] = 97'h0000000080000000000000000;
      expv[48] = 97'h0000000080000000000000000;
      expv[49] = 97'h0000000080000000000000000;
      expv[50] = 97'h0000000080000000000000000;
      expv[51] = 97'h0000000080000000000000000;
      expv[52] = 97'h0000000080000000000000000;
      expv[53] = 97'h0000000080000000000000000;
      expv[54] = 97'h0000000080000000000000000;
      expv[55] = 97'h0000000080000000000000000;
      expv[56] = 97'h0000000080000000000000000;
      expv[57] = 97'h0000000080000000000000000;
      expv[58] = 97'h0000000080000000000000000;
      expv[59] = 97'h0000000080000000000000000;
      expv[60] = 97'h0000000080000000000000000;
      expv[61] = 97'h0000000080000000000000000;
      expv[62] = 97'h0000000080000000000000000;
      expv[63] = 97'h0000000080000000000000000;
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
