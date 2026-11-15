// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 201;
  localparam OW = 101;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_133962 dut (
    .a(in_vec[200:101]),
    .b(in_vec[100:1]),
    .cin(in_vec[0:0]),
    .sum(out_vec[100:1]),
    .cout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 201'h05e1c78d49fd6c56a55e81336387f11b8c08d0b2adae138fcc7;
    stim[1] = 201'h0ad2c57edf303db70e8b57a3a1c05c05005f751b8f096f178fe;
    stim[2] = 201'h1b2ae298390b0e3c9c7ab54d2558df38cdf5579e72f8f9696a3;
    stim[3] = 201'h16b64e81488516c1d9a13834b7e8bf304dc8099cf2c7288462c;
    stim[4] = 201'h18e9ee357b21e65083ddc5d0d5bac0fd275dff1ea1fa52f8fdc;
    stim[5] = 201'h10235495495b9570ca5236e626ccda0183ad7fba217510ca307;
    stim[6] = 201'h0004b5d9c41070333812a54ad5e6e47afa363279b9ebcba403b;
    stim[7] = 201'h08647fd066b71f975aa7a535d0ab2fe094aa3ec66e31c4b5248;
    stim[8] = 201'h123f2d27a4d758ec9e232be628d93881be066e12c0dbbfabd1d;
    stim[9] = 201'h08d69610e0406e5b36474e1f5cf745354063758eb5c7fec5f19;
    stim[10] = 201'h084b32e3a824041f82ec03633e5e2b96dac58f707d947611531;
    stim[11] = 201'h13c2b376b850ae4f1c03c7999ad2a13be8501d788656b1eba5a;
    stim[12] = 201'h050aa3d55737ce6b944731e23db8a0dd78b4fe55d5307ff2dc5;
    stim[13] = 201'h1939aa8e583f9d579ba35aae864e115b7fb33b868cc5a7f85e9;
    stim[14] = 201'h039f17d7ca60a9af8b98f8409f4974c388ed4d436904daebe4c;
    stim[15] = 201'h010de62afd85d26d56c3e6a8aaebb21cd441a8fa4029d520afc;
    stim[16] = 201'h1cec1ac9939f86679031ff98c8a272e1a36171b1667bae3cc03;
    stim[17] = 201'h0ebf7bc714d511148206bbacf1e04ef5afbdd3836b0090bfcc6;
    stim[18] = 201'h1f02ebfffd62aea49a9406221f385570f71c39d408b40b97b78;
    stim[19] = 201'h057e65110e7100a4465d27a50d09a6ed82ac57b858259f2e96a;
    stim[20] = 201'h00e9fc6158067d9535ff0eafa3addd80ab6e29485c064be4b1f;
    stim[21] = 201'h1ff444fdc46843798bd70c222f61c07b1f5f0e603dceddfa72c;
    stim[22] = 201'h0743858206400f36e693464322a028bb431aad171e8b42d1fe3;
    stim[23] = 201'h1830f0d222035ca50c261b8951c1ec993459f4273539e9e2287;
    stim[24] = 201'h005a7d731835532551c8e6b1fa76ca7aba9350b689dab441628;
    stim[25] = 201'h073c98dd7f839d612607a14fd7398d995a53f149167053a5d28;
    stim[26] = 201'h16f6703ef9e269c5676f041d4ab81a482825e6f909bad8ddc94;
    stim[27] = 201'h044fd152cf13827a0c0dc376a1e90bdb1b5d0ee6f9fddf154c2;
    stim[28] = 201'h19eee0994e9c0c2c03a9c2a852cc4cb36b2a6d4f97b4db69b26;
    stim[29] = 201'h153bdb2137a5d276ba76e4982b5f4ee959ec6d6c62aba4337c0;
    stim[30] = 201'h0e9b8775fc2c45cc0365950156cfc26b1e6a592c3228c623d10;
    stim[31] = 201'h19572920da2b041943d329c39e1c342a485393e6a4a56a424b6;
    stim[32] = 201'h0fefb2888bc4839ddb8d76c02e2cefb35aa7d2527fca3be1962;
    stim[33] = 201'h0407f5c3b9b7f29cc26b00dfb9d2a0e0f333152ddd1d367ac6e;
    stim[34] = 201'h0616995607b329aa0bce212692b43f88932ae450a8c514c4429;
    stim[35] = 201'h0b0fee524f9e90a6706f34a403cd334d0370078e3524d603ade;
    stim[36] = 201'h11f258589be6ca1da38c0b90950a1383ac76aae327423e5ffe8;
    stim[37] = 201'h0a99046959d49c9419f1a0e7c87de500a2fcf9e1b1524abe9c8;
    stim[38] = 201'h14752cf9819d2108e9d033720dcef4a2e0c92e8d22aaf6f76a1;
    stim[39] = 201'h0d8d43f178bf10bf6491338058ba1fb429fc62ca635b20f7c4c;
    stim[40] = 201'h142ae53f45b467aa851c9b25b91e81100baebb516d570f32a3c;
    stim[41] = 201'h1f14cf341463ce607c0bf3ee1d870241567628359d9244015be;
    stim[42] = 201'h05deff661f08b41c421ee76d0a8fe437d1fc87eaa8a6419f85d;
    stim[43] = 201'h18d86fe42065ab1c37e9066abd8aac57b07a96998079bb4dfbb;
    stim[44] = 201'h02aadf48b2388d609258250821308641dae7129b223f305d970;
    stim[45] = 201'h053997a5a30aee3812033f6c61579b5572857926706907ad8f2;
    stim[46] = 201'h18165a62a6863076d1cf3a52227fa3f937b982d02d3d7f4b9cf;
    stim[47] = 201'h1f68b7547196ebccaef091f8fa87cc0567c69a6754eafdf148d;
    stim[48] = 201'h1666d0e5feeeca674758c5a3cb098647fd85b9a261fd37e73a8;
    stim[49] = 201'h179b8f61fa0f9be15a797faf4946a0cf3c47cf6b876ff9ad795;
    stim[50] = 201'h05b6f4e5292a67ad20ce5244478a1324fb9e9d7ba1cb3eb94d1;
    stim[51] = 201'h03445fa16b425e00e35578f7c40a00d1840a06cdcb23a8801e9;
    stim[52] = 201'h00f91c961872339edebd2d502075c498338db1436e2b2729afe;
    stim[53] = 201'h0933161737583bc2ad76338d69713b4f2fa91a84d6bbc3ae98b;
    stim[54] = 201'h0fa0d1deed62b7a25c5189de80db21f28621a59501dbddd0773;
    stim[55] = 201'h0b3a88c88e5ee47ea8bb8f1e25da7bc70f29808fa25c2c2beb7;
    stim[56] = 201'h163fd3293ca28219daf1efe690834e2ae0e54d423f90a1b0b7b;
    stim[57] = 201'h0063933a87099005ff55a623877f38e4609878594ab16049ec4;
    stim[58] = 201'h00f0b3d6cc6e2c10c3516cf411bee479f589c8e7aef010080ca;
    stim[59] = 201'h1558dd6ba33b985f7b643f9e61cf21cbef5a0a7e590a3088269;
    stim[60] = 201'h18eadcde649694a04f07cbbe52386dac702946d028573a51bf8;
    stim[61] = 201'h0908666d0e81f6311d94628fcfcf868611143c8bce2330d03fc;
    stim[62] = 201'h014c07ae44d38a4dad34caddcc1ad491bde8cd200b925f06e10;
    stim[63] = 201'h090b407c51d1ee1d8509bc6ec58968a8da013b621201182100b;
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
      expv[0] = 101'h1e60d9460a8a7781803fba302a;
      expv[1] = 101'h06d885cee5278f6fff22491c9f;
      expv[2] = 101'h10b8d62518608823cc0a4be3c9;
      expv[3] = 101'h154241862505b0910613c07ae3;
      expv[4] = 101'h1495fe07f101d83aa382f560b1;
      expv[5] = 101'h1cf0f4ad84339112e1a343892e;
      expv[6] = 101'h1e72fd89677397ced6cf5f8b10;
      expv[7] = 101'h13177dd9b15b0bfe3dc3f08818;
      expv[8] = 101'h1fd2b543853e3a18abdf26a346;
      expv[9] = 101'h184ae964e677c74692c73a7e76;
      expv[10] = 101'h0e2dec51547cfb275c33647870;
      expv[11] = 101'h00ecc7353d5285d7816ee653f5;
      expv[12] = 101'h0094b1ace287b3c8e74f311003;
      expv[13] = 101'h1e1ac046537355c067fdda3470;
      expv[14] = 101'h1836641059357de61be6a6feea;
      expv[15] = 101'h0fc907f841a06211596138b3a6;
      expv[16] = 101'h071348e3c9b6a17df7ece364cd;
      expv[17] = 101'h0cc46b2210b2494b320fc7a9b7;
      expv[18] = 101'h1288430f6f264be525d4bf9d97;
      expv[19] = 101'h1618d3e939367c29c8b71a8e76;
      expv[20] = 101'h1bc7d46c0ee9121af663ccfac2;
      expv[21] = 101'h16104cafba59297d68c4ebc95b;
      expv[22] = 101'h1146113637eae0a8cf47736306;
      expv[23] = 101'h144fba6567a29f185fc4b9abd9;
      expv[24] = 101'h07c7251ec16a5e8def742ac822;
      expv[25] = 101'h1ad5727324c2b1f28d0cdbacfe;
      expv[26] = 101'h027814c17c40d956031c91f9df;
      expv[27] = 101'h02e08f0484e470e9abebb4cb63;
      expv[28] = 101'h06b3abd00142e1257ef7794379;
      expv[29] = 101'h0b30c9b6d66ca93ce53127cfeb;
      expv[30] = 101'h1b97ae27e2d1d88f25f1f73e66;
      expv[31] = 101'h1b1a6bc55f6442838e29cde854;
      expv[32] = 101'h12beadbe3641a8c5d83134d990;
      expv[33] = 101'h013203d2ece9457a943e688c27;
      expv[34] = 101'h115a91df3a616eb4981f6d6abc;
      expv[35] = 101'h07e32322869f0989c2bc94dee1;
      expv[36] = 101'h029390936351785017aff1907d;
      expv[37] = 101'h1277547389a43aaf2f164cd190;
      expv[38] = 101'h116477278e3009db147fa2e8af;
      expv[39] = 101'h192f3f3418853d659a4342fca4;
      expv[40] = 101'h0612f64000a01cc15a8d8e4ff5;
      expv[41] = 101'h1784f3497bc651ba55303403db;
      expv[42] = 101'h0edd42e33ed132c6cc83016568;
      expv[43] = 101'h1183355f280f14b43f84bb4a79;
      expv[44] = 101'h15b3436660a9b712b64b2ae190;
      expv[45] = 101'h1ab34cfccb62809f1893ba4552;
      expv[46] = 101'h001099f6221e5d79a5a72f0bf3;
      expv[47] = 101'h07e577aaee009241fda0710d89;
      expv[48] = 101'h06ff3565d74a648d672c441773;
      expv[49] = 101'h0c059c55be8c9299d1791a86df;
      expv[50] = 101'h1e582734e3143f673d823dd918;
      expv[51] = 101'h03e46cb9abe2cadd959000f9ae;
      expv[52] = 101'h08556619514d47d5c16f9feb1e;
      expv[53] = 101'h0046cb0a31e9e41019326e76f5;
      expv[54] = 101'h1d52f1074f7d10f27a0f66e5f4;
      expv[55] = 101'h08e2453980f6ed78ce7e51dcdd;
      expv[56] = 101'h1e74b5d74af7563dd3fc0af20c;
      expv[57] = 101'h185721809091159aaa6baac24a;
      expv[58] = 101'h1cdefb76250aba8bb2526d74da;
      expv[59] = 101'h124afa2a98dc40450c074820cb;
      expv[60] = 101'h1c71b7a5672b01a2d47b70da4a;
      expv[61] = 101'h0600cece1fc5beedffc76f93cb;
      expv[62] = 101'h02f950ca23605c4e665abb4bdc;
      expv[63] = 101'h01a1cb09f1e5a43ea51b3e7ed1;
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
