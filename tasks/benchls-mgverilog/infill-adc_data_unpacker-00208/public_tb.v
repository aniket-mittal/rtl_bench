// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 129;
  localparam OW = 116;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00208 dut (
    .rx_clk(clk),
    .rx_data(in_vec[128:1]),
    .adc_rst(in_vec[0:0]),
    .adc_clk(out_vec[115:115]),
    .adc_data_a(out_vec[114:59]),
    .adc_data_b(out_vec[58:3]),
    .adc_or_a(out_vec[2:2]),
    .adc_or_b(out_vec[1:1]),
    .adc_status(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 129'h162c8973f90069a5f63efd01bfa0d8541;
    stim[1] = 129'h0938a327c0b2cda991f56297dce44f8d5;
    stim[2] = 129'h100c96c77010a48443320e103bed2ab5e;
    stim[3] = 129'h163bd3a271f30e572aed5101b02415486;
    stim[4] = 129'h1e5cd9f066c7c9d24dd12c1195807502e;
    stim[5] = 129'h071dfe9fd6894f0f555b1d94facae9f2e;
    stim[6] = 129'h17ed3c738d42d3e7d002d5ea0524b6678;
    stim[7] = 129'h1227e293e5db017c209b41a0d15469724;
    stim[8] = 129'h01507a06e4a1c6d3999f7972ae8dad0f0;
    stim[9] = 129'h1d82ff7c231cbe12cf413bd2c4150d0b2;
    stim[10] = 129'h1ed2a0241a0c1cef0ead742cdc80de9fe;
    stim[11] = 129'h0533452526742d866a60b74381a75a520;
    stim[12] = 129'h129afdff67b212274e468eef9d54b9ac2;
    stim[13] = 129'h10dc4de2fc29c2cc714c2b7132ca9a4a6;
    stim[14] = 129'h103915238edb6c64249e45421692cc9a2;
    stim[15] = 129'h19bf37f618650e27e4ba366d046a23db8;
    stim[16] = 129'h11963d76edd5bb2293a69edaaa6af9536;
    stim[17] = 129'h1d2ac012b9c13f81f37738706dd41554e;
    stim[18] = 129'h1ce7b62f066b046f2d0c932f25f839704;
    stim[19] = 129'h04113be14fdc50d6d5c26f02beeb92228;
    stim[20] = 129'h1e83691c34ea37b807f25a0e3c3b5cf32;
    stim[21] = 129'h0ee434473cbb1cbe19017729a2d975b38;
    stim[22] = 129'h0934313daabe6b82d8e28ae0c90535a0e;
    stim[23] = 129'h0575e775bfaa0ada705c0089337743e1e;
    stim[24] = 129'h192c6b6252a2524410634f5cd63b9673a;
    stim[25] = 129'h00c34aff5cfdbc065d2898cc3eab3e6d0;
    stim[26] = 129'h00cfc0ac13f2074120eff099c5b861e8a;
    stim[27] = 129'h19ac8db6b003dd0342637005e370d6716;
    stim[28] = 129'h1c8f5791e107cc20bdf0b65adfaa316a4;
    stim[29] = 129'h180616877c7616d627bed31286f84013a;
    stim[30] = 129'h12c83bc63957cf2e1c0d7ec7572dcce9a;
    stim[31] = 129'h1e48abdf370798fcea8a9d85116f75980;
    stim[32] = 129'h1255c2c19511448d86e14dd76faa5bc98;
    stim[33] = 129'h135276cf4bd58a772efd94c030fa86506;
    stim[34] = 129'h11a11cc8fab89d1789019a5e40b08544e;
    stim[35] = 129'h16c377e7ec0d16ba107db74f9d4487008;
    stim[36] = 129'h05d268c7bd2697734d770f29080ea6c2c;
    stim[37] = 129'h1e86eaf7e55b199ad147ea77dfde3229e;
    stim[38] = 129'h10468238000c7ec4b66879cda5a7d4df6;
    stim[39] = 129'h0813ebfed75b64d12f39cf761962b0b16;
    stim[40] = 129'h074f225c27c4ea43e1b84f7c8f7630a1c;
    stim[41] = 129'h1b92d97cbd88f133ebfed68a94563caee;
    stim[42] = 129'h1a71f3890270e19a2df9cc38d545bbba0;
    stim[43] = 129'h13755472851c8f0bcb28705d095035fd2;
    stim[44] = 129'h1622651cd26ee23a94d3d0d9a62f61a9a;
    stim[45] = 129'h05455d1ae371db9e5223a395f0dc3b812;
    stim[46] = 129'h1116a677b0ba241ec9b70edf4f389719c;
    stim[47] = 129'h0ba0e43b7d81883b28d344715db494874;
    stim[48] = 129'h1cdb1f8572e01ce55d9db5267768c136c;
    stim[49] = 129'h078ed433763fdd4eee4ba34b0f496cb3c;
    stim[50] = 129'h0d5273029cbfc91b1758f7a81373d24e6;
    stim[51] = 129'h0063008840069c1060bc074b8b89c9b64;
    stim[52] = 129'h087d5a47409774249e33428f07a8708c8;
    stim[53] = 129'h1f89bc08f6186129c9243fd57eea7aef8;
    stim[54] = 129'h1f2e810afe2907673a575da358f54e016;
    stim[55] = 129'h1713aef1e3a81f8f1aca24d8414d07ef6;
    stim[56] = 129'h18328a3bc4ddaaff34e94b2d623ed8330;
    stim[57] = 129'h1b902e239af3248bb53c6a82d00241c66;
    stim[58] = 129'h122727c2b6ca970466068dd80b9361496;
    stim[59] = 129'h0c9a3abb4ef7a6bd94a210a682463c45e;
    stim[60] = 129'h1263fc691675d1a5711b304275ef9df30;
    stim[61] = 129'h0e3f00b30c6ffb3a03d214d262769b1cc;
    stim[62] = 129'h14c6411406fe71f218f1960076d8e285e;
    stim[63] = 129'h00047ebfb7a146c239a5a2cc8a83f4f14;
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
      expv[0] = 116'h7ed80dee175401e45806ca6a45f38;
      expv[1] = 116'h73c64553e0ad5782a52d8b68c9878;
      expv[2] = 116'h6f8cd322ab95f040410ac925a4470;
      expv[3] = 116'h40aa40d5544861c7d931bb94f7221;
      expv[4] = 116'h563607154302f19b787dca7672501;
      expv[5] = 116'h6b54afb27f72f4da1c95dbc7af5f9;
      expv[6] = 116'h14c04a2d9d678a355e2cd4ff07d39;
      expv[7] = 116'h450347b25872409749b07858bc339;
      expv[8] = 116'h3a66dbf3464f1292841d01b693869;
      expv[9] = 116'h103d501346eb328c77ca2f87d2dc1;
      expv[10] = 116'h723a0cd7a51fece87ac12f380f041;
      expv[11] = 116'h06a8740e95d203999543336146651;
      expv[12] = 116'h75394a6e6bac2f9ecb21ac8f675f1;
      expv[13] = 116'h4b44a8c692ca7170c29dc0b36c629;
      expv[14] = 116'h5a132de3215a223b41b7931d44239;
      expv[15] = 116'h1192a3a0f59b8d61e651f38de7f61;
      expv[16] = 116'h29ceae6e57b37ab7475b66cf42969;
      expv[17] = 116'h374d41755614f0677412afe001f29;
      expv[18] = 116'h17b582ce5cd04f19f2b0791d8f2f1;
      expv[19] = 116'h7bd6b8248bc282bf11c51436f6c11;
      expv[20] = 116'h709fb5273e932e53faa235ea581c1;
      expv[21] = 116'h0b6596156dd389f2bbb0472d1e071;
      expv[22] = 116'h2462522d6aa0e0aaa5e742e442dd9;
      expv[23] = 116'h4dc175c0f821e97e94a15ab1da759;
      expv[24] = 116'h58c1b8359bd3bccae424c492c4021;
      expv[25] = 116'h7af4b28f9e2d0c7383da3702a65f1;
      expv[26] = 116'h168386f87c28b9cf8320f9d0212c1;
      expv[27] = 116'h0d890c359c1165c0663ccf4363569;
      expv[28] = 116'h7ef6a30c5d8a5a84727cf30de0b19;
      expv[29] = 116'h1b9f85e804d3b2f1e16065b5b6271;
      expv[30] = 116'h5cf0dcd33fa9a7654b7c83ceee061;
      expv[31] = 116'h45aaf6ad6778055c78788e3afcff1;
      expv[32] = 116'h3e9aa416f369975449155920ad819;
      expv[33] = 116'h43bba9d99530602f4d59229db72f1;
      expv[34] = 116'h02a508195684fe6ac788174737889;
      expv[35] = 116'h754049d9c5c08fb05ad035adfa079;
      expv[36] = 116'h2034eb71b3c2c974966925da33479;
      expv[37] = 116'h7f45e27c8a89f7957bb06e62bad79;
      expv[38] = 116'h16d87c85367f6d8040c66fb084b81;
      expv[39] = 116'h65bc2b9c2bd1765d21b73932f13e9;
      expv[40] = 116'h3d8763842bc1dc9f1c4ef29083fc1;
      expv[41] = 116'h512f63ef2daeeaf66e8f2c4e53fc9;
      expv[42] = 116'h55365b9eeb1a1889e90f1864fa291;
      expv[43] = 116'h252d02857c1d3d144dc953c50bd29;
      expv[44] = 116'h18d2f7386c29b9c9d8ee20895a9c9;
      expv[45] = 116'h4349c23ee0e1358d951c56e75e5a9;
      expv[46] = 116'h3ca78975c3b9df42c5a369019ed79;
      expv[47] = 116'h76a34935210751762e180a091b3b1;
      expv[48] = 116'h5df68dd84d56c64bf201b73fe5451;
      expv[49] = 116'h3d3896bb28d3cb589ffcef550ef31;
      expv[50] = 116'h4ddd3d8c95ee6872b5fd2244db029;
      expv[51] = 116'h2e029dc269d64b800068370030681;
      expv[52] = 116'h1ef8873420ac8f022177d50e84871;
      expv[53] = 116'h7ba4a646bfef95587f86984f09c89;
      expv[54] = 116'h63e9557387616378fc90e9d8472a9;
      expv[55] = 116'h056ad0a1f92f780edc813fe3af119;
      expv[56] = 116'h08d3ec960ad30d1361db2aba9f3b9;
      expv[57] = 116'h405425c072a662ebef3301238ba39;
      expv[58] = 116'h2e1936685369785b48a875c1e4629;
      expv[59] = 116'h095262271425e6bbb37ba1aebd9b1;
      expv[60] = 116'h57c4f9b77c130259c95c3c6f05691;
      expv[61] = 116'h098f6926c53cd231b8fff6c83a131;
      expv[62] = 116'h5b638f18a585e01bd3e6647852141;
      expv[63] = 116'h2a663e5d38b14cde801441b7a23f9;
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
