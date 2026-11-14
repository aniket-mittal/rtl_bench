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
    stim[0] = 201'h01c7c8dd7daa55fdc083516f38e61bcffbfebfab3320064a5f8;
    stim[1] = 201'h0f19df4b237e9cf263d3d1ce2716b05b72b69f5a8705c508f50;
    stim[2] = 201'h07a3949618b181d9870b36b03d67aeb95b4e995155d5d937597;
    stim[3] = 201'h1d4836be636063233b766234fe5587c209e6e0cedf945b9413f;
    stim[4] = 201'h0205f7fc392071cdf038f7d16943ed4f91ffe927752463f56a8;
    stim[5] = 201'h040dfe2ea3c60cc35d49f420b4df3dd215e12811bcff720748b;
    stim[6] = 201'h1a72a44384a1bf58c02c4beb5d394cebe8c1c7fa801e7e636fc;
    stim[7] = 201'h18f0d033da65eed9454b249cb76e91715ea5286ca9bc07bfffd;
    stim[8] = 201'h1c6557fe9851108f4957dfbc574cb5804b7b6766fe38ae48aff;
    stim[9] = 201'h0f85d15b75571fed7125b79348065a25bccf14ca4f21a1e6941;
    stim[10] = 201'h1e356fead7c26765ea6646a69da9d3c00a7491b42c7f909ef78;
    stim[11] = 201'h0735f6163bd8b07b709fe78cb026804e764f1b1e3483bf98493;
    stim[12] = 201'h1e973b5a411d510b17dbdc3589e8dacbf931142936470374a2b;
    stim[13] = 201'h00d695bdc81311eb985b17c56b1854899ca8efcddcad705ad51;
    stim[14] = 201'h1a440682b3be5d3a763f4e24a450755500f32e32cbea73088c3;
    stim[15] = 201'h0cbe4676327cf47fdcba1007aed8433db9c9b4438f1fff70ebc;
    stim[16] = 201'h05a54ddcd0ce5d86654abe0553e5d9445c9e1fc2b58bcdd20a9;
    stim[17] = 201'h0da936214a88d8de893513cbc9c3c853840a6f8e75f5417a591;
    stim[18] = 201'h1e047af6463e5a0cfc53f3de73cb5c827271c0e4d042668ba6d;
    stim[19] = 201'h149ddc1def26b5480f1d100b4940a5193aea6e470f05239a1cc;
    stim[20] = 201'h1c00cb0cc4d685de42d8e0746dd69de780dd20efafb4555f5ba;
    stim[21] = 201'h0e58ef1a36bfc39d704d96c927b779ed8a73ca3a77fbb54cd44;
    stim[22] = 201'h0e223077307e54cf72dc4c1249f5a0b441c7135323061077628;
    stim[23] = 201'h0605e956928167e3ab52058bd0190e490e28faf65f5a07a8e73;
    stim[24] = 201'h0bc0dc58bb562da3d4878c649b7c2989258d94d2a2a3966405e;
    stim[25] = 201'h0f5fa0f59a679a372132bc1a56bbb09747780664fcb9891321c;
    stim[26] = 201'h12b458ed71650c7466340548b9482ef1f8f876a02b2cefcff3d;
    stim[27] = 201'h0dc2b1bb66ca1846dc7db2a4afdf05673ea047e5be3a4faa872;
    stim[28] = 201'h105c86b32f9dcfbb9d2bb9637e4a0d07a9299842e400dfeef15;
    stim[29] = 201'h0fe33becc87d802fb054b875343e2c9a608c1002f35b749e74c;
    stim[30] = 201'h191b5bf765f33614a71a4e117181f441f34ec2b11b31dc322a1;
    stim[31] = 201'h005b1be2a1fbc611fe76330ebdfab3702027bab605f0712601d;
    stim[32] = 201'h0be94cd5c3a9cf08777db41db0c942c1079734cca9ffde43daa;
    stim[33] = 201'h04882e4d60bd07682b6ba0267650c757ed764236bf21b5b37ac;
    stim[34] = 201'h13c1ee38a1a2916e7247e3f9ec160a77a42654811ce17e311ee;
    stim[35] = 201'h0fd4e238a7082006292a684660f85ded636dc0084f814fd63a5;
    stim[36] = 201'h05b0117d81bc8e92bfbdbb0160ffbf4033f63affbb66edeebfa;
    stim[37] = 201'h14701a9d3f79a3a66722221eb0d838dd964d865ff44d860c5ac;
    stim[38] = 201'h14d35100daa7dd6b80f92e306bbdf2d712d81add2403e1e97cc;
    stim[39] = 201'h15b268ae2a71d14436ba92bc90caf3938f7c8dffbe0ab2ae748;
    stim[40] = 201'h01d5e1f469f35248f86dbb255076521a3c4ce38504eb8ec5e80;
    stim[41] = 201'h16fbe0af79379a98675944d768718dec97bf2696953868e03eb;
    stim[42] = 201'h1ba5b7ef27bf34206fee18aa4249ce896371fa9683e5a13d111;
    stim[43] = 201'h12c68e41421575d82942477007ff9488000105300347ab4a738;
    stim[44] = 201'h0f49f1a8ef48e59b145236a46e0fec1a2a4328b2971b1be08fd;
    stim[45] = 201'h0b25e1187dd23f69e3d52fc2d3b8ce9ce8402d88fc6820e09cf;
    stim[46] = 201'h003d1f1d6df1f89ff3354a91345d6befe35ecd0ad8ef4dc6664;
    stim[47] = 201'h02abeab6343d5fd092893265ef186eccafdb06fe026610ea219;
    stim[48] = 201'h1a9590469b355c4086c0217e443d93aed97d087c95a2194eed5;
    stim[49] = 201'h0c09b2084c99c4f2125abdd789019dec2ba1adc226c2c1036cd;
    stim[50] = 201'h03622a0ada4570e807de7498df38ec75f2fa879ed9084e7edea;
    stim[51] = 201'h0c0d80e54f71393bbdb5a16f9a0d5dc90d44e104864d5499430;
    stim[52] = 201'h13765c8bf0afbf649d3cb0fe382379434fa1d9601226e16a814;
    stim[53] = 201'h0f1e8e7fece271853992e175f849181a05d4f37ebd2c09b9506;
    stim[54] = 201'h08b6422bcdc0d6c114de02b1cfd09266d7e1be8cf78c4087f74;
    stim[55] = 201'h1a514f728e8e3e8efa94fbaadf46540e291ab8d4cd8e1968e47;
    stim[56] = 201'h1939cba6518635dd043e47e18ea9dd0d4620261055d3a5168b9;
    stim[57] = 201'h06e23b390b225e1958f84cfa37c6c1f1d753d15fe93cd166a4a;
    stim[58] = 201'h1e3f16cf4c8b302fc17f68865f92862eecd2ebbf42952ad6c18;
    stim[59] = 201'h016c046290ec55e4f132a3dbe61333c83685227e55556504dff;
    stim[60] = 201'h0162c085220d2f0240998d0873e85bdb879f733ccfe81d31c71;
    stim[61] = 201'h00b8942a77dc0ac21b91998fb455801aef6f16c5c6754ffb89c;
    stim[62] = 201'h14cd0e2ba5167f85ea454dd02917f5b6f7abf89762af1e88212;
    stim[63] = 201'h0cafb51932a2bba07e484407c3c515655502342f7f62bc17659;
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
      expv[0] = 100'h0e3e46ebed52afee041a8b79c;
      expv[1] = 100'h78cefa591bf4e7931e9e8e713;
      expv[2] = 100'hd35d93757551532e5b53aebcd;
      expv[3] = 100'hf9053b453f6e60ecf2087c354;
      expv[4] = 100'h102fbfe1c9038e6f81c7be8b4;
      expv[5] = 100'ha25c09dfe7b10290f509779f6;
      expv[6] = 100'hd395221c250dfac601625f5ae;
      expv[7] = 100'h7fffbc07b2a6c294af51d12ed;
      expv[8] = 100'hfea24ea38fecdcdbda4035a65;
      expv[9] = 100'h052cf0b09e4a651e67b48b4c0;
      expv[10] = 100'hf1ab7f56be133b2f53323534e;
      expv[11] = 100'h92433fb8258f1b1e4dce402c8;
      expv[12] = 100'ha8a5d81c4d92851193fa6b62f;
      expv[13] = 100'h156b41d6a7767ee2a73225431;
      expv[14] = 100'h862219cafa698e99e01555c14;
      expv[15] = 100'h65f233b193e7a3fee5d0803d7;
      expv[16] = 100'h2a09767a35a87f0f27445374f;
      expv[17] = 100'h134bd055f5ce3eca043942787;
      expv[18] = 100'h6cba2cc84164e071c9c8275a7;
      expv[19] = 100'ha4eee0ef7935aa4078e8805a4;
      expv[20] = 100'he006586626b42ef216c703a36;
      expv[21] = 100'h72c778d1b5fe1ceb826cb6493;
      expv[22] = 100'h711183b983f2a67b96e260924;
      expv[23] = 100'h9ce2bc0b5f4debe28e124e130;
      expv[24] = 100'h5e06e2c5dab16d1ea43c6324d;
      expv[25] = 100'h7afd07acd33cd1b90995e0d2b;
      expv[26] = 100'h79fe7ee69a80adc3e3f1ee825;
      expv[27] = 100'h6e158ddb3650c236e3ed95257;
      expv[28] = 100'h51eeff6004e8433292bc160a4;
      expv[29] = 100'h7f19df6643ec017d82a5c3a9a;
      expv[30] = 100'h0a8987719b11a86e59f045f03;
      expv[31] = 100'h700c91c1f40dabbc8081d9abf;
      expv[32] = 100'h5f4a66ae1d4e7843bbeda0ed8;
      expv[33] = 100'h2441726b05e83b415b5d0133b;
      expv[34] = 100'h9e0f71c50d148b73923f1fcf6;
      expv[35] = 100'h4b8d7e503e420076d8d6f743e;
      expv[36] = 100'h2d808bec0de47495fdedd80b0;
      expv[37] = 100'ha380d4e9fbcd1d33391110f58;
      expv[38] = 100'ha69a8806d53eeb5c07c971835;
      expv[39] = 100'had934571538e8a21b5d495e48;
      expv[40] = 100'h0eaf0fa34f9a9247c36dd92a8;
      expv[41] = 100'haf80e2c3952d2c9fbd26f631c;
      expv[42] = 100'h111790b4f82d2bf1d8d22e724;
      expv[43] = 100'h9634720a10abaec14a123b803;
      expv[44] = 100'h7e20fb1b1d29a2984a8b06fe0;
      expv[45] = 100'he720e082c7e2368042e72e63b;
      expv[46] = 100'h01e8f8eb6f8fc4ff99aa5489a;
      expv[47] = 100'h308ae10cc80fec1b7ea66ec31;
      expv[48] = 100'h56ee5308b527c217d36eb9378;
      expv[49] = 100'h66d810686c8876b0ba86f7301;
      expv[50] = 100'h1b115056d22b87403ef3a4c6f;
      expv[51] = 100'h606c072a7b89c9ddedad0b7cd;
      expv[52] = 100'h9bb2e45f857dfb24e9e587f1c;
      expv[53] = 100'h78f473ff67138c29cc970bafc;
      expv[54] = 100'h45b2115e6e06b608a6f0158e7;
      expv[55] = 100'hc4e2d30e366563ab128e054c5;
      expv[56] = 100'h3a2d14b975410c808c561772a;
      expv[57] = 100'h3711d9c85912f0cac7c267d1b;
      expv[58] = 100'hf1f8b67a6459817e0bfb4432f;
      expv[59] = 100'hff6414d5554fc8942d8279990;
      expv[60] = 100'h1c719702fe6799df3c3b7b42f;
      expv[61] = 100'h05c4a153bee05610dc8ccc7da;
      expv[62] = 100'ha668715d28b3fc2f522a6e814;
      expv[63] = 100'h34dd07a8dfde85881554d5147;
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
