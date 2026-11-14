// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 264;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[263:8]),
    .sel(in_vec[7:0]),
    .out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 264'h9805e6363a87f6f9524403c5f9ba9bcef706025e3a5c632e8b7853155d7cd2fc7f;
    stim[1] = 264'hb1a7c253fbfb94a12278501b351819576f82e8630e8a5f4b720791fb17b3ff27e5;
    stim[2] = 264'h52ac8a3c8591217879d1b8a60ebf6a33de576723a521c754070c150c9d14f09740;
    stim[3] = 264'h7e6f5d0b823bb915b42d5ec6a7149ecbb0c036123b65663461f3c334df080a9722;
    stim[4] = 264'h45fc20dd63bf220a0fb91f5562c1cb55bb35f951d3bca6c5cfdbb657fa6c796ec5;
    stim[5] = 264'hcf49d367a558cf91deacdddf45a53f9bb63b777189766552f3c1994236a6e4d4c0;
    stim[6] = 264'h40d7b5e608f46d0f73649eb6288c76e69567428c23a09c9f34111cb2ec3cbd55fc;
    stim[7] = 264'h52493a4acfa2893c766e7a4b13491dca8db26994ee2619e3888bbf1df5bc3f2dc2;
    stim[8] = 264'h12770de80188099a577329dcc4082423830637f013097943de190aa786d69d6351;
    stim[9] = 264'h34f71ea2699c4265406c08142bd3d9a4526c9df4db16b597c72a7ad0dd45569c47;
    stim[10] = 264'h7d40a88469a0eee3ec4c7c70cd3abcf522af6ba322eed0c559acbfeb66a96d48c4;
    stim[11] = 264'h70e53448eb97a2ac7f61b2cd29c441bfb68a3c1e4e8f740c14057431008ba5ff45;
    stim[12] = 264'hee37d896f8eba6828163c20ef6c7f244a52718023813caacd5a240260a7927e25a;
    stim[13] = 264'hac9aeedafeac5f6b2dc50638e2051447fd5a0145fe180297373cdc19a923ff7d92;
    stim[14] = 264'h96a1dd3e7e0da1e5c36aa30b9aa616254e007aa370ce64de129a4d520afff70756;
    stim[15] = 264'h4eea5ce5a181cfc0f680db54423b7855f5cfbe8680a67cb8799277cc3e722c6590;
    stim[16] = 264'h64f53d21ea0d7fe01448d5cb3a14aa6173ccbb24b3703f8b06a69312a5aa3d8afa;
    stim[17] = 264'h072cd925815d8f22fb22dfeffe1cd276c928ab321ca1ab2becd9e2c88e0833c88f;
    stim[18] = 264'h61ba654409053b1af64d1f423e894237deb0e3042afeb9c2ac03cac15622173d29;
    stim[19] = 264'h2313ed8e0ae7a7fa6d0fe79d6eb2817498deba23d9512e02634e3c95a7049874ff;
    stim[20] = 264'h1be17ba2c063115a05d53b14ab5154057ca18a8b8f5ca275ec9e961b4fedf8e658;
    stim[21] = 264'h1b84ec37823df641530344aa2bdaeb2c044630435549e5974e38d5772ff4811bb8;
    stim[22] = 264'h9f3a90a949cbdd159b46aafb6fe6066e91768e8966afa32a78de6d64e3307e8474;
    stim[23] = 264'h7ceddc674084c681a138db21d92ba51c95a42dd9c6034a7b3688642efe42d20e1a;
    stim[24] = 264'ha8168bf72e9813edf864cbf0c8c65558c746836b2c192dbe7e086fb47207bb691a;
    stim[25] = 264'h65f9ac6991ac0cf8833744714d06ef635776b69cc579c3f30f43688332cd7c1e75;
    stim[26] = 264'h94e981effab25e78d0434e883bbdca524600ffdec30d512e5c9ac959951120678b;
    stim[27] = 264'h8ef669a5edb51122a9c85a07836e2c4d8d52241d2774cfbd2840bcd97923c8fd5f;
    stim[28] = 264'h4f0e9747f0291c18ab7a443591dbf49ac647f844ebfe03f795368502b82ff863cd;
    stim[29] = 264'h867db2748fdf0d765afa34904a0c1faaff4067e1021532cdd6bf54cc70036a1bc0;
    stim[30] = 264'h87c6aa743b2c9fa1b04cb2308545185d0f30433a6bfa72daf46077927c888f3a57;
    stim[31] = 264'h709735004c41ace6943bcb9440bfd396f398521e355cd28ed046cf178112f63f66;
    stim[32] = 264'h2423632edeb2bd084fb31b75b7f69b7df72dd1f0a89bbb822cffcb17e074929a89;
    stim[33] = 264'ha04fa83ce2d5941018e61f2315e06ca485fc3e022ce0cc68fa57c377be4c062893;
    stim[34] = 264'hc799ac310e0b14c4cdb5986deedf1ee99f3a7e47577a60240c471476a863e86f0b;
    stim[35] = 264'h96a3b6bf5fd27029deefdcc4fa33bbf91668afb7a0ea6737b7aba5ba8e99e768c9;
    stim[36] = 264'h39a13e594fc65a9c91975d0ba07786509370df45ad444c68d43d0f0732eaa9d9ee;
    stim[37] = 264'h0e167b9cb36ad4bfc891e7fe8e9ba8b1b7329fbdac10d34c8f1399535955776a88;
    stim[38] = 264'h7c829dcaf7d124c9c72c11c5e124dc0a099e6dadb2a8bb4819a2698329cae010dd;
    stim[39] = 264'h0478165135f88a22b45c72a1c4095c199fb0c637b52956dbabab54b6e5f06b791f;
    stim[40] = 264'h8ac3512b4a1d345a5a80abda5da0b78fa4c6d11423932541da5222284d41e7e2fd;
    stim[41] = 264'hbfd6656842d35eeadb06ffb003e09db82aab15feb2ae980a2eb2ca38afe4bf3278;
    stim[42] = 264'h5cfc42b84a9c4a79b963b396f21af21a6fb6e5c5b9596a8e9cf03032aaea5271b7;
    stim[43] = 264'hcf9fa18bc76ec814c6c9b7514882dde189d990787da182111fb7cade4a359bf6b0;
    stim[44] = 264'hf0dcefac94f098b1e73f1cbc037249b592d4b9fbe5088f32708f6c451533665ea5;
    stim[45] = 264'hd5104fff9761d802ab3d67a9a5ad92e75aec149c8ad8025888426071ae2a0018d0;
    stim[46] = 264'hb6a39ee3f6287cabeede0ee8daf29217c9efbaa68074e22eee207cf06479162a75;
    stim[47] = 264'h76cfd9374aa1d8d013f99ac5576b95d507fc67faf7409b40e0270eb7efc5d23960;
    stim[48] = 264'hc4b8da900b68e405d57d591912f8e2c76b25941056d3ea0a6fa54186ed8484f5ef;
    stim[49] = 264'hf1994e489aedcfc155b20c54dd0b07af8da7221f7ddb042d8518f339efba21c1e3;
    stim[50] = 264'h690b11707911cfa29eedb3dd5b33f2c0fb5440588b96db40f0e8689f5a146d8f0a;
    stim[51] = 264'h8718cfa51797dd2496ac0b174d4385ab5b70093f30ef9d3351dec17c15fa048baa;
    stim[52] = 264'h9ecad52e497f7c7a83859c8ceb4467ec756b27e6806255d5227ab287c93188f057;
    stim[53] = 264'ha43aad4e3cf9452b4d9c1e647d62afa10d7097d23f7e1869086415c4458616682e;
    stim[54] = 264'hd5e51c415a086bc53527c0058ba7acc73ed4734b499bb6bb4d6b93d94a73172496;
    stim[55] = 264'h087c5d5c1f4e50aae43493d6abb18ca370d74ab3438590e99c9e9ea34a0075945b;
    stim[56] = 264'hd97984793e267fe19a5cda5be02a55afc23e5f5efc5e1fa162ad5ec02ad6f50444;
    stim[57] = 264'h3a8dc83a14257427b6ade90db56bee715140436baeed9b88ba31c6b8a531e3ee1c;
    stim[58] = 264'hb9315bc414a1f8ed28bc8611728f6c316993828d84c13387c6f2c4c927639d2995;
    stim[59] = 264'h812cc0a3cefb5de541eac63ea9ebfaaae5638577e33d10d53d4a7aba7ee2e94782;
    stim[60] = 264'h0f0bd7b8418646db7db6a670c912f36414de80b6f47ce3a4a7c92f9f7da512ee93;
    stim[61] = 264'hc22f02ec480db1a93828f5645c31eb6f0dc946d7dca102585d6ab093867da53c2c;
    stim[62] = 264'h46d311a23d6136243515afb2015a8bc9517580d8661bd5264071895edfdd9e9b6c;
    stim[63] = 264'h846ddf71dd2d220f242b8cc8a68ff8397ca9cf5643a28a9776d9ed11e44b2b14a8;
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
      expv[0] = 1'h1;
      expv[1] = 1'h1;
      expv[2] = 1'h0;
      expv[3] = 1'h1;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h1;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h1;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h1;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h0;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h0;
      expv[25] = 1'h1;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h0;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h0;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h1;
      expv[47] = 1'h0;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h1;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h0;
      expv[61] = 1'h1;
      expv[62] = 1'h0;
      expv[63] = 1'h1;
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
