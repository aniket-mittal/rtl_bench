// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 147;
  localparam OW = 51;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09333 dut (
    .clk(clk),
    .Ax(in_vec[146:131]),
    .Ay(in_vec[130:115]),
    .Az(in_vec[114:99]),
    .Bx(in_vec[98:66]),
    .By(in_vec[65:33]),
    .Bz(in_vec[32:0]),
    .C(out_vec[50:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 147'h6a74e2ab476269341d327eabfb2c995dcfcd7;
    stim[1] = 147'h33302e8b723313fec2ea0d4dbad9b31d4e041;
    stim[2] = 147'h5c307a307e7bffdb17d128ca0236a8fbd7330;
    stim[3] = 147'h33ed2cac7ea237ac7b6f96af7409c3526c2ad;
    stim[4] = 147'h5fe895bb8d3abcd0da457e3479218364ed395;
    stim[5] = 147'h6b0df4a062ed067e2955f085a3503f310427a;
    stim[6] = 147'h530b3f5adf9e0fd0e2f257efde64484fe5857;
    stim[7] = 147'h14c1e5b4b32704f4afc53edf0e32190e92f62;
    stim[8] = 147'h0c18ee3d7ce6d4c106cc4f6cf9cd120c68d46;
    stim[9] = 147'h257f34be8f99400baa2cdb06ba2dca7c0c8d5;
    stim[10] = 147'h3ff21c86be7cc09c8eb24f6f92be0c4171dc1;
    stim[11] = 147'h53ecf4133bcb4821b11681211fc8a43f7fdcf;
    stim[12] = 147'h0fdc3d3065049d433b9c16a645d0836d24013;
    stim[13] = 147'h7b8e1a1c03897f9b46ab30bc660555c9e8848;
    stim[14] = 147'h768e416a4a3b47c2506e6143e510add7fabfb;
    stim[15] = 147'h6516189707d791f2d323a997d72dcd698efde;
    stim[16] = 147'h606112282418a178115dc84fa6028f369c558;
    stim[17] = 147'h45e085bad9b406382276986d9211adfef592c;
    stim[18] = 147'h4d55c28e5f64be693a647b30846dc23a84dda;
    stim[19] = 147'h192ca20ecb59567df4ac4f73e5fe48584263e;
    stim[20] = 147'h17e17800d70b276f371e803f7ce0e7d013ed1;
    stim[21] = 147'h2e888a87a507bde86ab9987927ac424f4c24a;
    stim[22] = 147'h47802f5a91d86ecc0fe8c8226f353de3b1e15;
    stim[23] = 147'h44a15bcdb9fb05b104a6956410022eee19424;
    stim[24] = 147'h7d6fe34ae422f4247b8158c588c518ffab02d;
    stim[25] = 147'h673d0628395146f367f745fcfa2d3745c7600;
    stim[26] = 147'h0338702e0d072623ebb2ccc655a748d7f95d9;
    stim[27] = 147'h4d2246565570e248ccee842a6ca6dfe92aa0a;
    stim[28] = 147'h04a4707df42de87f116be69686d85b2f3eab3;
    stim[29] = 147'h7478c47f5dce6fcf87fb695357c80c3d7755a;
    stim[30] = 147'h7724b7b4027b111b52dd8d6aa456c7efb62f6;
    stim[31] = 147'h738ea91fd683200f75d5c030e9d7e198a7573;
    stim[32] = 147'h49737bf9db0f9d9d579c7639e7f186b8c7116;
    stim[33] = 147'h327ff30e545ed09d213cf49fea22f7d8dc263;
    stim[34] = 147'h228af884c5ae20498ddc7db1ecc22657a60fd;
    stim[35] = 147'h257f9eb750ef542ec2a04abbbbe02f26a1392;
    stim[36] = 147'h3fa169009eac2f3182db27672dc92462f4715;
    stim[37] = 147'h0085966585c44c20d5b6930f5bc646ad96e44;
    stim[38] = 147'h073f5c2ae6a950eefd2c8e384b0b875664c3d;
    stim[39] = 147'h1d4d97150261c7c175cc204a1f4ee52e69499;
    stim[40] = 147'h106e3ca1ca2ac654449e83014435bb1c00895;
    stim[41] = 147'h42521c9df43b38a52cb3007f6bbcecc52bb54;
    stim[42] = 147'h2f1aa3daecaf3ae04aa696a0083ca1ff76ee2;
    stim[43] = 147'h1cee2a8bbb1b0aa6bb4649c2d522776467dcc;
    stim[44] = 147'h4ff13477c6b4ad810fd210f153b52d5575e07;
    stim[45] = 147'h1b77feeb1d1e936433cc89d85b5551ea60d89;
    stim[46] = 147'h70ca6cbeb495c61021d2ff2b6dd554b0550f2;
    stim[47] = 147'h4fef0b54c67a46f45086cf80e2316114e2c7e;
    stim[48] = 147'h24349a40cc88b84546592c7da1ebba3ee02e6;
    stim[49] = 147'h49488b740e1aa49a7b90a4c8459a6502a4b3b;
    stim[50] = 147'h7606826c79eb04423985ef06d0521e57beaee;
    stim[51] = 147'h234ca970e6b43e7e11ec6d67c50d2bc31fc81;
    stim[52] = 147'h474e165471c93ebb7a60458190903219a4365;
    stim[53] = 147'h777d1d8527e5172b27853b37e3a31f39d87fa;
    stim[54] = 147'h56cca4ad84b6dcfea69738fa737b5b213450c;
    stim[55] = 147'h57682d1fa65497d3fc8a6a58057b37f7fe70d;
    stim[56] = 147'h66b55e50d85b913db0963b310822c9c09ce2a;
    stim[57] = 147'h750e2330e5dea9b2041ddb5884b32e4ac0314;
    stim[58] = 147'h3e1058e51921ce630afddb12f86b636c38485;
    stim[59] = 147'h3ba54828374aabdd460cf41ceec70b2452695;
    stim[60] = 147'h34637b0537b6d73aaf145cef7affdb3e2da4b;
    stim[61] = 147'h6fc6b774b8c4a0f861c93e45b1c48c6fc197b;
    stim[62] = 147'h05f8687eb6f12fe84ab4234e9e9949da17c15;
    stim[63] = 147'h28d43ccab90791763df3b0112e951c6cae535;
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
      expv[0] = 51'hxxxxxxxxxxxxx;
      expv[1] = 51'hxxxxxxxxxxxxx;
      expv[2] = 51'h7c2ce245e9125;
      expv[3] = 51'h7578a83cd7b84;
      expv[4] = 51'h735dd893124b0;
      expv[5] = 51'h0ce430416cd90;
      expv[6] = 51'h110608edac2d2;
      expv[7] = 51'h6f91b2ed6b151;
      expv[8] = 51'h0eb2c0c6499b4;
      expv[9] = 51'h0331343533b28;
      expv[10] = 51'h7a419a997c0ff;
      expv[11] = 51'h0b8946c3584ea;
      expv[12] = 51'h0fc5bc8818bed;
      expv[13] = 51'h0e51e14615cd2;
      expv[14] = 51'h09062631a88ab;
      expv[15] = 51'h045db61057d10;
      expv[16] = 51'h0124f1382ef12;
      expv[17] = 51'h085c4b5b68eee;
      expv[18] = 51'h0b2e060af4046;
      expv[19] = 51'h0b342fb8b68ab;
      expv[20] = 51'h1a79c4f72300d;
      expv[21] = 51'h0b3873c5e730f;
      expv[22] = 51'h0744af6f96571;
      expv[23] = 51'h074d21226505a;
      expv[24] = 51'h1524dfabeaced;
      expv[25] = 51'h0f325870b6d97;
      expv[26] = 51'h799e46fcba1c4;
      expv[27] = 51'h18df15bf30e22;
      expv[28] = 51'h06bcde0f07786;
      expv[29] = 51'h05405bdab407a;
      expv[30] = 51'h6a93b7368d60f;
      expv[31] = 51'h0d7654b09da75;
      expv[32] = 51'h070dc97122cfa;
      expv[33] = 51'h085873673ec8e;
      expv[34] = 51'h034a6f9c00714;
      expv[35] = 51'h0f520de005da8;
      expv[36] = 51'h02acd28d8d2ca;
      expv[37] = 51'h110872d1d9a89;
      expv[38] = 51'h7713ea69b4659;
      expv[39] = 51'h020bbbbd9df24;
      expv[40] = 51'h0c26598bee6b2;
      expv[41] = 51'h071d4c98a3821;
      expv[42] = 51'h12ad20245b398;
      expv[43] = 51'h12fd2de3146a5;
      expv[44] = 51'h0a481b4afc0c7;
      expv[45] = 51'h0d06916f56339;
      expv[46] = 51'h11f14cd22da36;
      expv[47] = 51'h09ff34b850b6f;
      expv[48] = 51'h12c44c6c22004;
      expv[49] = 51'h0c5bed289ef45;
      expv[50] = 51'h183bee4e8d327;
      expv[51] = 51'h076fcecb05fd1;
      expv[52] = 51'h7e53dcf2f999f;
      expv[53] = 51'h15188ef12467a;
      expv[54] = 51'h794e8e339f7de;
      expv[55] = 51'h15f7c5ff813bc;
      expv[56] = 51'h18ed78a61cf96;
      expv[57] = 51'h12b57d849174c;
      expv[58] = 51'h7fff64f09474c;
      expv[59] = 51'h18aa6dcf7c9c1;
      expv[60] = 51'h1393371b0dc7d;
      expv[61] = 51'h189c819c09ff7;
      expv[62] = 51'h22b003ab08981;
      expv[63] = 51'h1a33edaa28f6b;
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
