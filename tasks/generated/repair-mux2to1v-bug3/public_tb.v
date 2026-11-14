// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 201;
  localparam OW = 100;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .a(in_vec[200:101]),
    .b(in_vec[100:1]),
    .sel(in_vec[0:0]),
    .out(out_vec[99:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 201'h1b140bd3f4df44fa44363836b647f8790acea4c9ae6c6cdbd86;
    stim[1] = 201'h15fd32cdbb74439f1babd37a3b2a042e6274aa23c8cc4d1d82a;
    stim[2] = 201'h0968ead63b0bdfe995f58fba34beed45965cc28e9fae5a360e5;
    stim[3] = 201'h1c11034504f833619c0c95dd0dd3a5c60e985274c63ddc6eb9a;
    stim[4] = 201'h0a8fdf34491e239aed9218ab2f777982e54515cd5d01d7b7b52;
    stim[5] = 201'h0a50e118e04733086d20ed4627aef7356dbcf36075e05c8cafe;
    stim[6] = 201'h15663da4de9eb932103743dde69ce5f5d3584fdad2726283e19;
    stim[7] = 201'h0308c813ead36b2aa71737e664a20773aaf2756dfe968ad3bfd;
    stim[8] = 201'h06354b0e4f6e8752342067851952a9fb709c4cc2a167c7f38cf;
    stim[9] = 201'h1ca7f88740a06d188a1a74929d4af88a1dd143553dda84a7b11;
    stim[10] = 201'h1a24221d5cb1f57c56f36683911ceb7f22dc6e9133db59909f4;
    stim[11] = 201'h18d7722bf907df0f50ca7a53c7550fc24711c0826483df3b46f;
    stim[12] = 201'h1b77037c1c541ab4be9f56c83213f7f2b88e29a6e2f29836901;
    stim[13] = 201'h1bc4129c8102c0c6629d3afabb2831478ca58f774918ab87906;
    stim[14] = 201'h14a6d59dd7f97f6234cd25f2f756425807d61b142e2190737fd;
    stim[15] = 201'h14554f43f1ad1d55c06364b327c543952e907042393986e4592;
    stim[16] = 201'h11d4968ca06626cd7a3114b98639152724b2ed535394a8a652e;
    stim[17] = 201'h038f0c4b76a2b0151db1749403cb6fbb960ab74a8c7b47fb482;
    stim[18] = 201'h078a2832219195fd35caf0e6aae3a41ceb3dced82a0a82406e8;
    stim[19] = 201'h0daaeef769bb7fd346973cff5ecee1a0aff75b2c8a4079b59f4;
    stim[20] = 201'h00a778393e009ff77c98758f18cc9b3d398c7989c8844026040;
    stim[21] = 201'h0365e1525166be0b738af89cca394216b3d07deea3133f58aab;
    stim[22] = 201'h10fd130378a42c4186bd036aa000ff5ed03cde83c52c885f36f;
    stim[23] = 201'h043bf4339296c2f433729e47084faee0dda4273489c669e0e89;
    stim[24] = 201'h09cf94c9f70ff64e7869b241b999864497479a034bdf0210d9e;
    stim[25] = 201'h1f413bdf856aae90515e2e4ee829cf2d0567040d82267a06189;
    stim[26] = 201'h14d8f52bf70f2014ad5d41208d2e4771b6f905a3ac1f7ee27e6;
    stim[27] = 201'h014d4c74ff3add091c98813285bda680a3f767998228d28087c;
    stim[28] = 201'h0f1a180b07d9a3dbd4ccacfff6c4b59dcf4d85a76db444b95c4;
    stim[29] = 201'h0535c51c56e7d6488bd4799e4db88f1e0292fc8ce9911dabc58;
    stim[30] = 201'h165fc36064c7d4f2990d004ab04e68202950a047f76985e2eef;
    stim[31] = 201'h10ba604306a014684d23049f046202cead6a954e847e9c8b0ce;
    stim[32] = 201'h0d253529e04b40d312bcfd96579f09c8bd9eca583e0ab464af7;
    stim[33] = 201'h0be1dca56f63414dfcee98769a6cb903cf3331dc3ad082886c0;
    stim[34] = 201'h169d1ce9c98d6fde127a22ec7608484725eb6970f3f4ffd0200;
    stim[35] = 201'h09940e75e7d8b11e63b8a2045af1130c5eec88f802cb8768f23;
    stim[36] = 201'h12f8cd820b0d78107b5a8e5d25b8924779a573bbbf436af1bec;
    stim[37] = 201'h133e5b8b0909ec5f0759cf13dbd3190b63d1adf61eedb0bfd61;
    stim[38] = 201'h19a7cf08a6062ab251cef6fda27bdb7091858e961e864a22cd9;
    stim[39] = 201'h0cce7f9fa5327d9f7200b18e20abfe619b6e4a9df29eea09bb4;
    stim[40] = 201'h06fcf54e58b8c61bec07053b3ca3299f9052ef22f3808eef09e;
    stim[41] = 201'h1c3f3256bd6ff81610e23bce9a28a3ed64f5f263842280cccde;
    stim[42] = 201'h03d6f9df57af0ff9a298cfcce1183c366b621c58be1f1884735;
    stim[43] = 201'h1b25de723b26a06aadb5e542359fca623bec807f1d7bb79c29b;
    stim[44] = 201'h08579c2e917bfde958c1f3e83a005f228d54dbbe7733c512252;
    stim[45] = 201'h196a28e8019f8740dd56516f157c75e775f0fc0dde6ccb3b872;
    stim[46] = 201'h17217c2ad9bb4cac709f5f5c268e25f0dc256c92ae261756ad6;
    stim[47] = 201'h19db82be4d5b602788de6565a3b94b59113a4e99747120891e3;
    stim[48] = 201'h01f2512350f83199df139288d005b5552eda423425768461372;
    stim[49] = 201'h0bf0dff6025491045a4b34635dd753c4131ca61f9cd2ae7c71f;
    stim[50] = 201'h1fbfd51e70e8f21a3e3e246718b0febe9201f1f0448c61c2d04;
    stim[51] = 201'h0af16a3c8b907ac850329735f2968ac618c14408ee756b4285e;
    stim[52] = 201'h15bb8a800df614612dd0c4c23bf9167eb62b369c3d9a9bb98a5;
    stim[53] = 201'h02ae8266af0b10b266bdbcece49096dd56ebb335dc4cab9c62c;
    stim[54] = 201'h0f0712b87e442e94a4ae029d84d5a5ac4382919b761e53cc149;
    stim[55] = 201'h1f9d85cb2039efc3becd246d57ec8243300d32a335a6116fc1f;
    stim[56] = 201'h14ceb26050913e7b66b56f69802a0634598887c6cfb313c4031;
    stim[57] = 201'h154df0dce9e111637a91e52ae04e168a509be2864f47f9c3560;
    stim[58] = 201'h0b64e1afbb85f0bab6fa78572ea5a1558b4b75990423bd00439;
    stim[59] = 201'h145c06ef8428c009c558affca14c11005a2e2423a6b3338ec23;
    stim[60] = 201'h149e0484c98cb565f057ef0bb9e4e9bd4638222da8d644b72c9;
    stim[61] = 201'h198b40638a7511e0db67a17dc55063f87e368b775a42205f45f;
    stim[62] = 201'h01f4e698a5729cd72f2ce5da319830a27b97f121e9291cdcc7b;
    stim[63] = 201'h1ac977d5e294b1fe208d91a5d05a192c5d0d51efe2e554e9b68;
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
      expv[0] = 100'hd8a05e9fa6fa27d221b1c1b5b;
      expv[1] = 100'hafe9966ddba21cf8dd5e9bd1d;
      expv[2] = 100'h4e0d8b4ebf2e28674d3456efa;
      expv[3] = 100'he0881a2827c19b0ce064aee86;
      expv[4] = 100'h547ef9a248f11cd76c90c5597;
      expv[5] = 100'h528708c70239984369076a313;
      expv[6] = 100'h30f828c9c96b7e435975f4e72;
      expv[7] = 100'h7fb96a2d2ff6d5c9eab9dc08a;
      expv[8] = 100'he639fc7cd0a8664721dbf2a95;
      expv[9] = 100'h11bca42b77955851770a23ea5;
      expv[10] = 100'hd12110eae58fabe2b79b341c8;
      expv[11] = 100'hec5b9f7824c820711c487e155;
      expv[12] = 100'h012d8329e8ecb28e23a9fdf90;
      expv[13] = 100'hde2094e40816063314e9d7d5d;
      expv[14] = 100'h7fd9c1308e851b0d7c03484d5;
      expv[15] = 100'ha2aa7a1f8d68eaae031b25993;
      expv[16] = 100'h8ea4b4650331366bd188a5cc3;
      expv[17] = 100'h1c78625bb51580a8ed8ba4a01;
      expv[18] = 100'h3c5141910c8cafe9ae5787355;
      expv[19] = 100'h6d5777bb4ddbfe9a34b9e7faf;
      expv[20] = 100'h053bc1c9f004ffbbe4c3ac78c;
      expv[21] = 100'haaa35f9918aef7c179ad08538;
      expv[22] = 100'hed9f422694782f67816f5fe00;
      expv[23] = 100'h22e0f2cc72259c84b760eebe4;
      expv[24] = 100'h4e7ca64fb87fb273c34d920dc;
      expv[25] = 100'h230c0bcc8836041cd4169e728;
      expv[26] = 100'ha6c7a95fb87900a56aea09046;
      expv[27] = 100'h0a6a63a7f9d6e848e4c409942;
      expv[28] = 100'h78d0c0583ecd1edea66567ffb;
      expv[29] = 100'h29ae28e2b73eb2445ea3ccf26;
      expv[30] = 100'heee8f432ddfc40a1528082ce4;
      expv[31] = 100'h85d302183500a342691824f82;
      expv[32] = 100'hdea4c5aa0f834a6f37a2721f3;
      expv[33] = 100'h5f0ee52b7b1a0a6fe774c3b4d;
      expv[34] = 100'hb4e8e74e4c6b7ef093d11763b;
      expv[35] = 100'h89e2dc3a6803e226ef461911e;
      expv[36] = 100'h97c66c10586bc083dad472e92;
      expv[37] = 100'h0d7fa1b6ef0df6b178da13197;
      expv[38] = 100'h36688a4c2f0d2e343121db7bc;
      expv[39] = 100'h6673fcfd2993ecfb90058c710;
      expv[40] = 100'h37e7aa72c5c630df603829d9e;
      expv[41] = 100'he1f992b5eb7fc0b08711de74d;
      expv[42] = 100'h59c4231f0fa34708dacd87831;
      expv[43] = 100'hb2873dbbd71fc026fb88ca7f3;
      expv[44] = 100'h42bce1748bdfef4ac60f9f41d;
      expv[45] = 100'hcb5147400cfc3a06eab28b78a;
      expv[46] = 100'hb90be156cdda656384fafae13;
      expv[47] = 100'h8f122091c5d32e4b91135a53b;
      expv[48] = 100'h0f92891a87c18ccef89c94468;
      expv[49] = 100'hf1c7cea9673f0ca71904795d7;
      expv[50] = 100'hfdfea8f3874790d1f1f12338c;
      expv[51] = 100'h578b51e45c83d6428194b9af9;
      expv[52] = 100'h4a33bb2b37872d9a8dafcd13f;
      expv[53] = 100'h157413357858859335ede7672;
      expv[54] = 100'h2506794f0ddb31283846b4b56;
      expv[55] = 100'hf07ed10cb598a99601984826f;
      expv[56] = 100'h18047919be6c7c2233458c0a8;
      expv[57] = 100'haa6f86e74f088b1bd48f29570;
      expv[58] = 100'h384017b8841335da5a3550b4a;
      expv[59] = 100'h886e3999acb8848e8b4011065;
      expv[60] = 100'h269da44d62b688838c57b2e4f;
      expv[61] = 100'hf45f40884b5dda2d8fc3f8c15;
      expv[62] = 100'hbc67671292f091fd3bc8a1833;
      expv[63] = 100'hd64bbeaf14a58ff1046c8d2e8;
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
