// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 177;
  localparam OW = 139;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03660 dut (
    .clk(clk),
    .rst(in_vec[176:176]),
    .i_m0_we(in_vec[175:175]),
    .i_m0_cyc(in_vec[174:174]),
    .i_m0_stb(in_vec[173:173]),
    .i_m0_sel(in_vec[172:169]),
    .i_m0_dat(in_vec[168:137]),
    .i_m0_adr(in_vec[136:105]),
    .i_m1_we(in_vec[104:104]),
    .i_m1_cyc(in_vec[103:103]),
    .i_m1_stb(in_vec[102:102]),
    .i_m1_sel(in_vec[101:98]),
    .i_m1_dat(in_vec[97:66]),
    .i_m1_adr(in_vec[65:34]),
    .i_s_dat(in_vec[33:2]),
    .i_s_ack(in_vec[1:1]),
    .i_s_int(in_vec[0:0]),
    .o_m0_ack(out_vec[138:138]),
    .o_m0_dat(out_vec[137:106]),
    .o_m0_int(out_vec[105:105]),
    .o_m1_ack(out_vec[104:104]),
    .o_m1_dat(out_vec[103:72]),
    .o_m1_int(out_vec[71:71]),
    .o_s_we(out_vec[70:70]),
    .o_s_stb(out_vec[69:69]),
    .o_s_cyc(out_vec[68:68]),
    .o_s_sel(out_vec[67:64]),
    .o_s_adr(out_vec[63:32]),
    .o_s_dat(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 177'h1a3e3ec1cfd83890afe1abbba5f6aa294d18acef24afb;
    stim[1] = 177'h158493d1cb0b85643c71688c75b001be5310af6ed7204;
    stim[2] = 177'h0ea909051cc0a6a97504ba893d7319754586d19d16022;
    stim[3] = 177'h084e94d641f810b7668f711f10cb5d497070310e2a661;
    stim[4] = 177'h0ccd472be09698cb625c54629f52f875f360e9904f6f1;
    stim[5] = 177'h1199b49839ec479cd2c615f8636e862641fbe8f4ebee2;
    stim[6] = 177'h0773ce12877c473a8dbe43180f9c4be953f7d0a63e2ca;
    stim[7] = 177'h01174f17ba8e7bf42a613c2e3e8d3284d886a56ee32d2;
    stim[8] = 177'h0c50e188670c3755a91fc058769d1dbb1d3d6c4ae8b2d;
    stim[9] = 177'h0e6fdd5c7081eced02433644342a39f88100add6b2da9;
    stim[10] = 177'h02b2ba1777200346ebf27e60c9fdd52cfe090f242c472;
    stim[11] = 177'h031a7e406af1f1336c50af3b7d6808a765b63dda63d50;
    stim[12] = 177'h04f53f9b3a7d7a240f9b66500fbecca215c0e7dd14e06;
    stim[13] = 177'h0679639f6ac2d642d300c3550fc81852820d934e2c2ed;
    stim[14] = 177'h0bdf5d41aec7e4f2a1b4dd73d3215dd8dacd147b06a00;
    stim[15] = 177'h0ecf9f8060b06556dc1d18f556d1019ccd2a2f0dd1877;
    stim[16] = 177'h06549131a96a05319a14dee4715baf4dbfff1564e7709;
    stim[17] = 177'h072a55597aa735c484d2459421fcd8fad8202f80b8d45;
    stim[18] = 177'h04a2653b3d6bba5adbc35b971306407a0ac455a517cfb;
    stim[19] = 177'h0a947d126b424e483e4b6d03b5e6997dae7143640fdbd;
    stim[20] = 177'h0b474c24e6eadc21f080fc404aef3e6f75a8ddf020e9e;
    stim[21] = 177'h0e34831c7b2e5e35b4ed92950286a7950762226a4ea08;
    stim[22] = 177'h0c195e6a6361ab5c14b641301991fd5410198c2fb650f;
    stim[23] = 177'h0c0f2c1dfffcc345ef52f34d060a0b170acdc2705a9e6;
    stim[24] = 177'h0d0cb84be57ad60e61e7c58aebb03e3caa3a7be78e15e;
    stim[25] = 177'h02d4a9478f5ec9aa5885bc63dbfb91b228b180f0fd4b2;
    stim[26] = 177'h069c9960eb7a4f42da9f5b13c0ee397a2d0057071afdf;
    stim[27] = 177'h09e0e3a71a2b716bc8362c88125eb3636dc4749a25ee4;
    stim[28] = 177'h08aeb3ec8dcb50c5909b40e6baadf51be9f8a5d547dae;
    stim[29] = 177'h0d53354ecadd5b2b1d59375de7bc13418cccdb94606bc;
    stim[30] = 177'h0e48a0c8efa8927490c08464b0eaf6ea9ae6cd4013488;
    stim[31] = 177'h0f68b8eaff5a3171c22b73122f1d41f0342c68efecdbb;
    stim[32] = 177'h00476f921d36af8302c0c8f91f694fded4d8b4ac0863f;
    stim[33] = 177'h011e042e042cb27b1621002783e3eca00ec44a8ef45ce;
    stim[34] = 177'h0be9360988f26ae212abd28e98722ff72dc240a21d513;
    stim[35] = 177'h0b0a09466e059e9328ea9852dbeebbe16ac20baaca63e;
    stim[36] = 177'h083d2b5bbc9baf1d9bfcbecda3e787b0ccb592e06eed9;
    stim[37] = 177'h0e0e115fa5330dbd877018a2a2d4ab86e4a63fb3413c3;
    stim[38] = 177'h03c34c812b4437ac06623e8236205336a08fc74932a85;
    stim[39] = 177'h0dbf04a00b5428106de4582ed3153204fde35110b40bc;
    stim[40] = 177'h01f90b3e17a053fe772ca1bc504b259c561c36e08bf1a;
    stim[41] = 177'h0282767bf73d7a640c1df71bcbb57516ecae4323ec98a;
    stim[42] = 177'h09bfd154938b31c62185298cecac872db4101d2b9c5dc;
    stim[43] = 177'h0e50540822812229876dfc45e47b5b4e59d77b9a3d524;
    stim[44] = 177'h084f95678f11d562686d9e7af299fe7033f0023a524e9;
    stim[45] = 177'h077232c900e0cad132daba82d638bf819f303e7d9da3a;
    stim[46] = 177'h141e740b97cf7fe44de27712ba55f445e6f7b91184da6;
    stim[47] = 177'h0e897a7f388c6068eebe9aa782b03489bad632702791a;
    stim[48] = 177'h00cd318a4081ca27c359d83e414e0dc6e3596e97b11fc;
    stim[49] = 177'h070264b28884cb08b032531ade4a0d50230aeac3db29f;
    stim[50] = 177'h09ce533a84d581438d2119031b9a84555e841a5d512ae;
    stim[51] = 177'h01f7953904e8b0d76d370699c6e8b5b886d010620724c;
    stim[52] = 177'h0181403fd8a01247003ed630713e0964de4a1051a0fd3;
    stim[53] = 177'h0e64c95ce9e667ba16c8a23cb3c7aad2818583b8dd84e;
    stim[54] = 177'h0fa6b8ff4492951e768dc88e6c44a1381f563995746b2;
    stim[55] = 177'h0b00ead1d67cf36618f0e46d226d887360d7917d53474;
    stim[56] = 177'h071e6237e1fd383a8f29598d6f192911bbd76aaa7060d;
    stim[57] = 177'h01384fb647e0758c1b3560ab8564d288c221909eb3bd2;
    stim[58] = 177'h1d6e49cbf4175bcbf882d8de867915a477434f30729dc;
    stim[59] = 177'h0fc4d1ce07780b7a4ed2d3efa281e7bb496f61e45b50b;
    stim[60] = 177'h0a788b580dc5052e4bcb6a7c9977a132d4b09a08b09ac;
    stim[61] = 177'h0a6bcd84fef3d1e478d6f456c0b366f3ccbe28130354e;
    stim[62] = 177'h0962c6bfdd303b1fcc0955b4aabd180ba7e95338c538c;
    stim[63] = 177'h083cd746bcc41ee25804db4ce0c972a8c8e04c6c69ae6;
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
      expv[0] = 139'hxcef24afxb3bc92bexxxxxxxxxxxxxxxxxx;
      expv[1] = 139'h2f6ed7204bdbb5c81000000000000000000;
      expv[2] = 139'h119d1602046745808000000000000000000;
      expv[3] = 139'h310e2a662c438a99842c085bb3474a6b20f;
      expv[4] = 139'h29904f6f0a6413dbc000000000000000000;
      expv[5] = 139'h68f4ebee0a3d3afb80c623ce696cda4c1cf;
      expv[6] = 139'h10a63e2c84298f8b2000000000000000000;
      expv[7] = 139'h656ee32d095bb8cb40873dfa153ba78bdd4;
      expv[8] = 139'h2c4ae8b2eb12ba2cb5261baad48870c4338;
      expv[9] = 139'h2dd6b2daab75acb6a730f6768127eeae384;
      expv[10] = 139'h4f242c4703c90b11c25001a375f95d0bbb9;
      expv[11] = 139'h3dda63d50f7698f54288f899b62d3f20357;
      expv[12] = 139'h27dd14e049f745381000000000000000000;
      expv[13] = 139'h134e2c2ee4d38b0bb3316b21698cb1cfb56;
      expv[14] = 139'h147b06a0051ec1a806e3f27950dfaea0d76;
      expv[15] = 139'h2f0dd1874bc37461d000000000000000000;
      expv[16] = 139'h1564e770a55939dc23250298cd0a4898d4b;
      expv[17] = 139'h2f80b8d46be02e3513939ae242652aacbd5;
      expv[18] = 139'h55a517cfa56945f3e155dd2d6de1329d9eb;
      expv[19] = 139'h03640fdbe0d903f6f64127241f2a3e8935a;
      expv[20] = 139'h1df020e9c77c083a7000000000000000000;
      expv[21] = 139'h226a4ea0889a93a82000000000000000000;
      expv[22] = 139'h4c2fb650e30bed943500d5ae0a5caf3531b;
      expv[23] = 139'h42705a9e409c16a7950e61a2f7a7960efff;
      expv[24] = 139'h7be78e15cef9e385758d6b0730f65c25f2b;
      expv[25] = 139'h40f0fd4b003c3f52c26f64d52c4a54a3c7a;
      expv[26] = 139'h57071afde5c1c6bf734d27a16d4e4cb075b;
      expv[27] = 139'h349a25ee4d26897b94f5b8b5e41071d38d1;
      expv[28] = 139'h25d547dac97551f6b000000000000000000;
      expv[29] = 139'h1b94606bc6e5181af544d063333dd779ef0;
      expv[30] = 139'h0d401348835004d2202dbaa6b9b1192c3ab;
      expv[31] = 139'h28efecdb8a3bfb36e000000000000000000;
      expv[32] = 139'h74ac0863ed2b0218f02b57c18163b7c90e9;
      expv[33] = 139'h4a8ef45cc2a3bd173086593d8b1f0217021;
      expv[34] = 139'h40a21d512028875446f9357109549b04c47;
      expv[35] = 139'h4baaca63c2eab298f682cf49947504a3370;
      expv[36] = 139'h12e06eeda4b81bbb641dd78ecdfe95adde4;
      expv[37] = 139'h3fb3413c0fecd04f0000000000000000000;
      expv[38] = 139'h074932a861d24caa12e21bd60331a64095a;
      expv[39] = 139'h1110b40bc4442d02f000000000000000000;
      expv[40] = 139'h76e08bf18db822fc60f029ff3b9c859f0bd;
      expv[41] = 139'h4323ec9880c8fb26224ebd3206013b3dfb9;
      expv[42] = 139'h1d2b9c5dc74ae71774d598e310cfe8aa49c;
      expv[43] = 139'h3b9a3d524ee68f549000000000000000000;
      expv[44] = 139'h023a524ea08e9493a428eab13437cab3c78;
      expv[45] = 139'h3e7d9da38f9f6768e000000000000000000;
      expv[46] = 139'h791184da4e4461369107bff226ff3a05cbe;
      expv[47] = 139'h327027918c9c09e46000000000000000000;
      expv[48] = 139'h2e97b11fcba5ec47f060e513e1a698c5204;
      expv[49] = 139'h2ac3db29cab0f6ca7000000000000000000;
      expv[50] = 139'h5a5d512ac697544ab4eac0a1c697299d426;
      expv[51] = 139'h10620724c41881c930f4586bb69bca9c827;
      expv[52] = 139'h1051a0fd0414683f4000000000000000000;
      expv[53] = 139'h03b8dd84d0ee3761312ab4a061688f2cf1e;
      expv[54] = 139'h3995746b1e655d1ac3784e07d582239b112;
      expv[55] = 139'h117d5347445f54d1d4321cd835e91b489b6;
      expv[56] = 139'h2aaa7060caaa9c183000000000000000000;
      expv[57] = 139'h509eb3bd0427acef40903ac60d9c27db23f;
      expv[58] = 139'h0f30729dc3cc1ca775bbade5fc4724e5fa0;
      expv[59] = 139'h21e45b50887916d42000000000000000000;
      expv[60] = 139'h1a08b09ac6822c26b632829725ec45ac06e;
      expv[61] = 139'h28130354ca04c0d53000000000000000000;
      expv[62] = 139'h1338c538c4ce314e3000000000000000000;
      expv[63] = 139'h0c6c69ae531b1a6b923caa323816d338325;
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
