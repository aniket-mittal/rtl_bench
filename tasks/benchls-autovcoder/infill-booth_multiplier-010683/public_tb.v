// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_010683 dut (
    .clk(clk),
    .sync_rst(in_vec[65:65]),
    .valid(in_vec[64:64]),
    .A(in_vec[63:32]),
    .B(in_vec[31:0]),
    .R(out_vec[64:1]),
    .ready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h21f0005397b4c375b;
    stim[1] = 66'h2d3deb6c7ddbaf9ba;
    stim[2] = 66'h0f4c325544b7239c0;
    stim[3] = 66'h122914525c5c2be1a;
    stim[4] = 66'h196acae797ceaba82;
    stim[5] = 66'h0d8953f40ff2e9087;
    stim[6] = 66'h05394f6cb68968730;
    stim[7] = 66'h0e63c0a4b04faa2d5;
    stim[8] = 66'h0cb550a8588ba253d;
    stim[9] = 66'h002f3ea7f9d897dc9;
    stim[10] = 66'h150278a046c8003fa;
    stim[11] = 66'h0328f2aba4513e288;
    stim[12] = 66'h0362a51661fc30235;
    stim[13] = 66'h10a38a2f5fbb6a286;
    stim[14] = 66'h13e01cf690c2904fd;
    stim[15] = 66'h1f66f73fb554769a0;
    stim[16] = 66'h0b129a2e3c5c6fd40;
    stim[17] = 66'h02c8d891f77c0c6fa;
    stim[18] = 66'h01f7de187f48fe0aa;
    stim[19] = 66'h0a29b205d6e7eaf8f;
    stim[20] = 66'h05fecf75876b2c10e;
    stim[21] = 66'h02c2743d7541691a7;
    stim[22] = 66'h0143ea6bdc78dd98c;
    stim[23] = 66'h0023d87168865e8d1;
    stim[24] = 66'h17a1db4d230c6fd9d;
    stim[25] = 66'h021d4548a6e47a2a8;
    stim[26] = 66'h026a4b42acf075e34;
    stim[27] = 66'h0057f68cd6e920746;
    stim[28] = 66'h1cd35c6cf943645fb;
    stim[29] = 66'h1c2266824a0da5b9f;
    stim[30] = 66'h02b76e8bc1fff79d3;
    stim[31] = 66'h0fb30039fb2c268e2;
    stim[32] = 66'h08cd149f418d31e78;
    stim[33] = 66'h089278c9be41b3d94;
    stim[34] = 66'h03ef28918850d095b;
    stim[35] = 66'h03cd276cea68823ea;
    stim[36] = 66'h0caad817b9916c783;
    stim[37] = 66'h0665260971be96507;
    stim[38] = 66'h05b5c2aae1aeab11d;
    stim[39] = 66'h0265785ae3c2d54aa;
    stim[40] = 66'h1a224fd01c44b0e11;
    stim[41] = 66'h0f1ac945a4e686d8a;
    stim[42] = 66'h03a179f37880b9b19;
    stim[43] = 66'h1d45f99e2fabb52e6;
    stim[44] = 66'h15642d3bd39372cb8;
    stim[45] = 66'h173c01e8dac6fb4ea;
    stim[46] = 66'h171d8ba7ba615339a;
    stim[47] = 66'h17827f216470503f2;
    stim[48] = 66'h06f4ae8cf84f322bd;
    stim[49] = 66'h14b39884fcd3140a0;
    stim[50] = 66'h038e697f473fa00f7;
    stim[51] = 66'h1412bb4dff96f0cdd;
    stim[52] = 66'h05c882cb09ff869e3;
    stim[53] = 66'h069c476c98547ffc3;
    stim[54] = 66'h0f49691a13724a944;
    stim[55] = 66'h0c8c213da73f93c1e;
    stim[56] = 66'h09f0c40a82ef05a6b;
    stim[57] = 66'h161dae275033ebe64;
    stim[58] = 66'h03c9c1075ab8a4a3b;
    stim[59] = 66'h1f4bc1215b618287f;
    stim[60] = 66'h188ce362b75674b33;
    stim[61] = 66'h1b3048323a4aa308f;
    stim[62] = 66'h10b72d655f5115d34;
    stim[63] = 66'h1907c3a7a8a35ee3f;
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
      expv[0] = 65'hxxxxxxxxxxxxxxxxx;
      expv[1] = 65'h00000000000000001;
      expv[2] = 65'h00000000000000001;
      expv[3] = 65'h00000000000000001;
      expv[4] = 65'h0000000018b857c34;
      expv[5] = 65'h1dd6ebadb62e15f0c;
      expv[6] = 65'h1e6130c2458b857c2;
      expv[7] = 65'h01c16082e162e15f0;
      expv[8] = 65'h00705820b858b857c;
      expv[9] = 65'h1df301b5de162e15e;
      expv[10] = 65'h1f7cc06d77858b856;
      expv[11] = 65'h1fdf301b5de162e14;
      expv[12] = 65'h1ee341ddaf7858b84;
      expv[13] = 65'h1ea4464e43de162e0;
      expv[14] = 65'h00bd9bbcb8f7858b8;
      expv[15] = 65'h002f66ef2e3de162e;
      expv[16] = 65'h1ef74f92a38f7858a;
      expv[17] = 65'h01e6e836f8e3de162;
      expv[18] = 65'h018e4436e638f7858;
      expv[19] = 65'h0063910db98e3de16;
      expv[20] = 65'h1f045a1a46638f785;
      expv[21] = 65'h1f045a1a46638f785;
      expv[22] = 65'h1f045a1a46638f785;
      expv[23] = 65'h1f045a1a46638f785;
      expv[24] = 65'h1f045a1a46638f785;
      expv[25] = 65'h000000000618dfb3a;
      expv[26] = 65'h03d0eda6918637ece;
      expv[27] = 65'h1d234dc314618dfb2;
      expv[28] = 65'h06eaaebde518637ec;
      expv[29] = 65'h1a18d062594618dfa;
      expv[30] = 65'h06280f65b6518637e;
      expv[31] = 65'h1db91632dd94618de;
      expv[32] = 65'h1f6e458cb76518636;
      expv[33] = 65'h1fdb91632dd94618c;
      expv[34] = 65'h1c25f6b23b7651862;
      expv[35] = 65'h06ab58f9aedd94618;
      expv[36] = 65'h01aad63e6bb765186;
      expv[37] = 65'h1c99c7e90aedd9460;
      expv[38] = 65'h02f75fa0d2bb76518;
      expv[39] = 65'h00bdd7e834aedd946;
      expv[40] = 65'h1c5e88537d2bb7650;
      expv[41] = 65'h02e88fbb6f4aedd95;
      expv[42] = 65'h02e88fbb6f4aedd95;
      expv[43] = 65'h02e88fbb6f4aedd95;
      expv[44] = 65'h000000001f576a5cc;
      expv[45] = 65'h02ba0661e7d5da972;
      expv[46] = 65'h1df47b3699f576a5c;
      expv[47] = 65'h0237252f867d5da96;
      expv[48] = 65'h008dc94be19f576a4;
      expv[49] = 65'h01807583e867d5da8;
      expv[50] = 65'h1f031a300a19f576a;
      expv[51] = 65'h1e63c35b12867d5da;
      expv[52] = 65'h1e3beda5d4a19f576;
      expv[53] = 65'h00ebfe9a652867d5c;
      expv[54] = 65'h019802d7894a19f56;
      expv[55] = 65'h006600b5e252867d4;
      expv[56] = 65'h0176835e6894a19f4;
      expv[57] = 65'h01baa4088a252867c;
      expv[58] = 65'h01cbac3312894a19e;
      expv[59] = 65'h0072eb0cc4a252866;
      expv[60] = 65'h001cbac3312894a19;
      expv[61] = 65'h000000000eace9666;
      expv[62] = 65'h03b98e4eabab3a598;
      expv[63] = 65'h1d34d54502eace966;
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
