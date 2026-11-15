// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 153;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00170 dut (
    .CLK(clk),
    .COP_GO(in_vec[152:152]),
    .COP_OP(in_vec[151:128]),
    .COP_INP(in_vec[127:0]),
    .COP_DONE(out_vec[64:64]),
    .COP_OUTP(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 153'h1fe30423966577be2a07e3951255901486c8cd4;
    stim[1] = 153'h069ef49e1577a7d5275e5371bb90fed761198dd;
    stim[2] = 153'h1b501b14280a8a4b02637b98f7d9be7cc5a2f40;
    stim[3] = 153'h1ac7bf0df4375393816e98276a738b6956a035f;
    stim[4] = 153'h018b9e529b614014821013ddcf86caa7c726349;
    stim[5] = 153'h110497d7b47027e02643c793fa02d359cc43995;
    stim[6] = 153'h1c5308444aa38ed882ba8470f905f20c5413514;
    stim[7] = 153'h03be39439801c884ee4ad5171c4b64686bce946;
    stim[8] = 153'h1f4dcc3c752be78ad0926ad57e42ec737e500a2;
    stim[9] = 153'h1a6b495348b5d201c5441ddec44d91cd3703e8d;
    stim[10] = 153'h0e1469746f72539222274136f2404ecc94bf579;
    stim[11] = 153'h067e9d2982fdcb515882c5eac1f2382516084a1;
    stim[12] = 153'h0e63a78478ec4d7f55d4d75fe1b79d9f656ab3e;
    stim[13] = 153'h0fdb81d1fbde0fa230314c564564612c98a1f2c;
    stim[14] = 153'h1b77bb032930ba4ece391d40269b8f3c8113254;
    stim[15] = 153'h1f2fa355d55b72f486b274292aaa4caca036231;
    stim[16] = 153'h07169b425768d5401db786a8c08e99df1493ef4;
    stim[17] = 153'h04415d5a28a07d30d660255a1c3a94555ce2c50;
    stim[18] = 153'h123df5e832bf0992561a2711c53b5417364356e;
    stim[19] = 153'h0e2ec0e9fb4edc604a2d92a9929395baed110d3;
    stim[20] = 153'h18ca8e35755d467b6fd1f907d2ceabc47ff9adf;
    stim[21] = 153'h1ff94da0aab54b56231d6d888f939d87db6ed88;
    stim[22] = 153'h0dcf8102a35da14cd30be6331617944c8a5dd2c;
    stim[23] = 153'h142554fa7862b2a0a8c7d90551bc0d14103c22b;
    stim[24] = 153'h166f37a0386cbfba4f50e558a610c575df20938;
    stim[25] = 153'h125a337e6b103e5022b8d9b798e2d8c8853ac27;
    stim[26] = 153'h058f3201c577bf6b8ba7dd45edd972bb501d588;
    stim[27] = 153'h07f9e022d0625e8d693bf86e2fa165e11d7e08e;
    stim[28] = 153'h015c5df109c2f1ed8b8b669181290c814426aaa;
    stim[29] = 153'h1873e37a70758ace13cac53f16888847e6fd3eb;
    stim[30] = 153'h086f105e25e164809df5ecab67f7907403d8ff1;
    stim[31] = 153'h19a9fd3f8ff2020a7837b0b73ea9c243a35d84b;
    stim[32] = 153'h00498a5ebd5eef65641288547b2126b66b0d9a7;
    stim[33] = 153'h075efb22119bfc7d59c763377d20ff2b02071ad;
    stim[34] = 153'h044fd8cd5ef03d2d6a7718c1fed0054f1109c00;
    stim[35] = 153'h0d608e52ed61666325a0acd27029262ad674ac4;
    stim[36] = 153'h1367b1f49e55db7c9678c9423d5a8e4a7dc8a04;
    stim[37] = 153'h0ee630e024d407c37ae0929d4c7beacf3669a77;
    stim[38] = 153'h1283ed6657e8c7f0b8d848a466dda616be1f5d5;
    stim[39] = 153'h0d34ded714a5aca4f49a7cebc6801a24409ccd9;
    stim[40] = 153'h10947bf7deed10bdc93fd2823196d3d7ccd33dd;
    stim[41] = 153'h0673b602f9bb511b632c9c671384b924a8bfa5e;
    stim[42] = 153'h18d010b3fc31a6f5d3862488f1eb01cc7bdbb8b;
    stim[43] = 153'h01f2d9acb49b5fb38d505ca160c75e5c487b4a0;
    stim[44] = 153'h1bb6418857f605a7478333d267906caa567b559;
    stim[45] = 153'h079c0b2543d0fe07436b67453280467d687391d;
    stim[46] = 153'h02bd5d6b32942c5e0b9d36b165ed9c16e7c0ecb;
    stim[47] = 153'h1d36390de1be98eb05624e8b34abdc17bbf48f2;
    stim[48] = 153'h09ca6ed36c01cf1bb56d2e11f4df75f44f3d9eb;
    stim[49] = 153'h1fe16fe19b0a66611e418636c9fdcc9e9a47639;
    stim[50] = 153'h15c26ed2f40513739c0c2986e90dce7ae3088c0;
    stim[51] = 153'h172656ca1b310e18699f823e1e1f07ac9442691;
    stim[52] = 153'h1e2fc6af05b6d2432737bff5137e0f2e5659089;
    stim[53] = 153'h19ec3662c79017310b6af85ed5fd2b1a34350ae;
    stim[54] = 153'h12f9f1cfb64e482b9f7708f01c45d87ceb6663a;
    stim[55] = 153'h1671775c1fa9d415124f7b060ae5cdee7169040;
    stim[56] = 153'h1ac3a4ee084056dbd56da002000e3879c4b8998;
    stim[57] = 153'h16e7ae0d063610c1c8cadfde7f48256e7f6e728;
    stim[58] = 153'h158ed47a0f96517a8f4fc7a3825826479da7d91;
    stim[59] = 153'h1fdd79e88ffb3bfc86bf82b01cab5288e2e0639;
    stim[60] = 153'h04812d3dbcdca9e929c5b331e2f17cd515e450e;
    stim[61] = 153'h12bebb6f7968902212dbb933ed82f38733759cb;
    stim[62] = 153'h066317a7708b51c2bdc89068de5defb5236b4a7;
    stim[63] = 153'h0644a9d83fd1802247089bc14ed39c8aa5355e0;
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
      expv[1] = 65'h1d48c6c48397ea0e2;
      expv[2] = 65'h037e5755200000000;
      expv[3] = 65'h1b93726b000000000;
      expv[4] = 65'h182e9163800000000;
      expv[5] = 65'h03d01214800000000;
      expv[6] = 65'h1793c640200000000;
      expv[7] = 65'h1143541c547a82b88;
      expv[8] = 65'h051ade44e00000000;
      expv[9] = 65'h1a200e537ad2609ad;
      expv[10] = 65'h18d3e70d3dd41541c;
      expv[11] = 65'h079f54bc913742222;
      expv[12] = 65'h05e2c881500000000;
      expv[13] = 65'h03eab56f6754d5df5;
      expv[14] = 65'h02c1f8ac9c5140323;
      expv[15] = 65'h1d491e3ec00000000;
      expv[16] = 65'h1316203ca42276b48;
      expv[17] = 65'h06a78db0100000000;
      expv[18] = 65'h05502660d00000000;
      expv[19] = 65'h171a2612500000000;
      expv[20] = 65'h0d310d1ae2ad9a204;
      expv[21] = 65'h1df9aff47901ffdb6;
      expv[22] = 65'h188edb67dd8d63162;
      expv[23] = 65'h02cdda5c863be30cd;
      expv[24] = 65'h1907d8c0a00000000;
      expv[25] = 65'h1550ef5a400000000;
      expv[26] = 65'h19b8d2b0200000000;
      expv[27] = 65'h0d47dbab800000000;
      expv[28] = 65'h08ee0d71186bf93d6;
      expv[29] = 65'h069b6b8d800000000;
      expv[30] = 65'h1ebd36f7e53ac3ce1;
      expv[31] = 65'h0ca5edf0900000000;
      expv[32] = 65'h10b7b83a700000000;
      expv[33] = 65'h0a7d9b06685284156;
      expv[34] = 65'h033769cd500000000;
      expv[35] = 65'h08c71a7d600000000;
      expv[36] = 65'h0c44a67adcd0a5a32;
      expv[37] = 65'h1948c67c900000000;
      expv[38] = 65'h02909ae3700000000;
      expv[39] = 65'h1d5f5e16b8a848d0b;
      expv[40] = 65'h0cea7494f00000000;
      expv[41] = 65'h128fd93dc00000000;
      expv[42] = 65'h0c6c932b600000000;
      expv[43] = 65'h14862385d00000000;
      expv[44] = 65'h0ca05d53800000000;
      expv[45] = 65'h159b567a53d337874;
      expv[46] = 65'h01d3987d674b63674;
      expv[47] = 65'h06bd3b9e000000000;
      expv[48] = 65'h1e82456b000000000;
      expv[49] = 65'h0ebd9f344e1d256bb;
      expv[50] = 65'h13976a4e96318e411;
      expv[51] = 65'h1c08830ae98c2c039;
      expv[52] = 65'h123f8998600000000;
      expv[53] = 65'h1899065e5ff7b7332;
      expv[54] = 65'h185afb61000000000;
      expv[55] = 65'h18f70f7b900000000;
      expv[56] = 65'h1b0f7245100000000;
      expv[57] = 65'h198894b9c00da56bd;
      expv[58] = 65'h128e7f6e7fdad8c1c;
      expv[59] = 65'h17afcf4a800000000;
      expv[60] = 65'h12bf86bc800000000;
      expv[61] = 65'h00e455e51335b9c92;
      expv[62] = 65'h193bb2d2100000000;
      expv[63] = 65'h00689dc2b00000000;
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
