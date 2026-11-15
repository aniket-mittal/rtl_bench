// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 96;
  localparam OW = 73;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_039113 dut (
    .clk(clk),
    .inst(in_vec[95:64]),
    .BRAM0(in_vec[63:32]),
    .BRAM1(in_vec[31:0]),
    .bram0_addr(out_vec[72:63]),
    .bram1_addr(out_vec[62:53]),
    .bram1_we(out_vec[52:49]),
    .bram1_en(out_vec[48:48]),
    .dsp_inmode(out_vec[47:43]),
    .dsp_opmode(out_vec[42:36]),
    .dsp_alumode(out_vec[35:32]),
    .BRAM1_in(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 96'he62d9c5502ec2dc67505a73e;
    stim[1] = 96'h755f4db0e5bc8c1fc28d904f;
    stim[2] = 96'h7f0948645d51d205cfa1121c;
    stim[3] = 96'h98753c4420170562bf9f74a4;
    stim[4] = 96'hc1882ec7cba5ffe401b851d2;
    stim[5] = 96'h3cd708eeb78c1505884ffb70;
    stim[6] = 96'hee792d2bd8d555747c57631e;
    stim[7] = 96'h5c56130124a8ecc90d022797;
    stim[8] = 96'hdac847afa4777b7bd7160212;
    stim[9] = 96'h6ccb3e6350d7844aa40c0fd6;
    stim[10] = 96'hcf85686468882a9075e46b10;
    stim[11] = 96'hdb09a26f75368350cff3ee34;
    stim[12] = 96'h63f9a30d79b088cb1b2516bf;
    stim[13] = 96'hd919006799f74a2d3fcbcf9b;
    stim[14] = 96'hfd3fd2addec7599ccbb6a494;
    stim[15] = 96'h8a646a7ee868fe179171d121;
    stim[16] = 96'h98933a01f6a4b30acaf5240c;
    stim[17] = 96'he4bae30dada0db2d3da7810f;
    stim[18] = 96'hffe006f3c5ff5d71eb01b21a;
    stim[19] = 96'h87cf0c35336b1302e05fc36e;
    stim[20] = 96'hbc1cc2ae42be046103346146;
    stim[21] = 96'h5a827b6d5d500951f3adaa94;
    stim[22] = 96'h476df00e19f73fa3f3690d2d;
    stim[23] = 96'h85bd65a22fac889eb9ba3c23;
    stim[24] = 96'hdc728775ef4a2fd27aecbf51;
    stim[25] = 96'h69573766fb2681494a528528;
    stim[26] = 96'h159bc15989818382a1f3a44b;
    stim[27] = 96'h0defbb6db4c4a0e5a57f2622;
    stim[28] = 96'hd3037037e21f93d136d744a5;
    stim[29] = 96'hcb8e0eba61e12a3f6455cb6a;
    stim[30] = 96'h374e16dcb98d170d0bea65d1;
    stim[31] = 96'hda904a48a3f21301438a1e7b;
    stim[32] = 96'hdcd48546b37b7bc72de312d8;
    stim[33] = 96'hd035c60f679dfd072ed5ba0a;
    stim[34] = 96'h88a95fc2775beca86b329824;
    stim[35] = 96'hd8f17ee917cff459c1d29588;
    stim[36] = 96'h282c074afc69e55a1f2832c4;
    stim[37] = 96'hf0dfb66af6f5d8af2bfebbbe;
    stim[38] = 96'h99f905762a4a742a1ca6e61b;
    stim[39] = 96'hca1218d6fdf47f0364188294;
    stim[40] = 96'h76845ab1927f94638e1a4024;
    stim[41] = 96'h423fc8a7723c1806ac0775ee;
    stim[42] = 96'hed5bc4fc5db3a51cb6e2b688;
    stim[43] = 96'h6ad3afe1fd8eb2e56dbd3c48;
    stim[44] = 96'ha2dfd17c289e774a930e32aa;
    stim[45] = 96'he4ae78563f7a5418de253ca5;
    stim[46] = 96'h5b438175dd4725d5d312457c;
    stim[47] = 96'hdc582d348e8f4a116c50d8d5;
    stim[48] = 96'h82d362c3e85b1896af2917d4;
    stim[49] = 96'h300011cede2f4c18f26e9eb3;
    stim[50] = 96'h3ea36eb88c53e1aa7984cbca;
    stim[51] = 96'he27143839d8054e0955b1f18;
    stim[52] = 96'h8b024d85d7f4cfc0731825d1;
    stim[53] = 96'hce6e081e7a24f6ddccf2901c;
    stim[54] = 96'hfb3c75a2b88af6b7ac645e7a;
    stim[55] = 96'h30b6f255a83fa45e50ab0d08;
    stim[56] = 96'h283033f8dab3588948d0817f;
    stim[57] = 96'h69cf584aaa426e15a1774209;
    stim[58] = 96'hbf23a3031caf60feaf59fc2c;
    stim[59] = 96'h50fa7121289de33db7bf6449;
    stim[60] = 96'hf55fe630ed0aec7f0c31849b;
    stim[61] = 96'h373351b1fbcb27792e7971e1;
    stim[62] = 96'h61779765168ab5459f1f53cf;
    stim[63] = 96'h1177fd91962b3d1f8a2f3ddb;
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
      expv[0] = 73'h00a8041de2c02ec2dc6;
      expv[1] = 73'h00801a1f55ee5bc8c1f;
      expv[2] = 73'h0020061970f5d51d205;
      expv[3] = 73'h0020041507320170562;
      expv[4] = 73'h00382c18188cba5ffe4;
      expv[5] = 73'h00700e174d7b78c1505;
      expv[6] = 73'h0058121967dd8d55574;
      expv[7] = 73'h0008301645b24a8ecc9;
      expv[8] = 73'h00783a182cba4777b7b;
      expv[9] = 73'h0018261b4cd50d7844a;
      expv[10] = 73'h0020061578968882a90;
      expv[11] = 73'h00782619b0b75368350;
      expv[12] = 73'h00683019bfc79b088cb;
      expv[13] = 73'h0038061911b99f74a2d;
      expv[14] = 73'h00682a1fd3fdec7599c;
      expv[15] = 73'h00f02614261e868fe17;
      expv[16] = 73'h00082013093f6a4b30a;
      expv[17] = 73'h0068301acbcada0db2d;
      expv[18] = 73'h00982e107efc5ff5d71;
      expv[19] = 73'h00a8021f7c0336b1302;
      expv[20] = 73'h00702a1cc1742be0461;
      expv[21] = 73'h0068361228b5d500951;
      expv[22] = 73'h0070001df6819f73fa3;
      expv[23] = 73'h00101a1d5b02fac889e;
      expv[24] = 73'h00a83612c7bef4a2fd2;
      expv[25] = 73'h0030361715dfb268149;
      expv[26] = 73'h00c8141bd9289818382;
      expv[27] = 73'h0068361fde1b4c4a0e5;
      expv[28] = 73'h00b8021330ae21f93d1;
      expv[29] = 73'h00d02a1e38961e12a3f;
      expv[30] = 73'h00e02c1e746b98d170d;
      expv[31] = 73'h0040241029ba3f21301;
      expv[32] = 73'h00301414cdbb37b7bc7;
      expv[33] = 73'h0078201583a679dfd07;
      expv[34] = 73'h00103c190a1775beca8;
      expv[35] = 73'h00482e110fb17cff459;
      expv[36] = 73'h0050341c025fc69e55a;
      expv[37] = 73'h0050261f8def6f5d8af;
      expv[38] = 73'h00b016191f32a4a742a;
      expv[39] = 73'h00b00c12219fdf47f03;
      expv[40] = 73'h00882a1468e927f9463;
      expv[41] = 73'h00380a1fa38723c1806;
      expv[42] = 73'h00e00e1bd5d5db3a51c;
      expv[43] = 73'h00083e13addfd8eb2e5;
      expv[44] = 73'h00e0161fad4289e774a;
      expv[45] = 73'h00b0041e4ac3f7a5418;
      expv[46] = 73'h00a81613b4bdd4725d5;
      expv[47] = 73'h00a0121845b8e8f4a11;
      expv[48] = 73'h00182c132d0e85b1896;
      expv[49] = 73'h00701c10006de2f4c18;
      expv[50] = 73'h00c02a136a78c53e1aa;
      expv[51] = 73'h0018381127c9d8054e0;
      expv[52] = 73'h00281812301d7f4cfc0;
      expv[53] = 73'h00f0001e6697a24f6dd;
      expv[54] = 73'h00101a1c33fb88af6b7;
      expv[55] = 73'h00a824168b6a83fa45e;
      expv[56] = 73'h00c03e10035dab35889;
      expv[57] = 73'h0050041f1cdaa426e15;
      expv[58] = 73'h00183013f271caf60fe;
      expv[59] = 73'h0008121a0fa289de33d;
      expv[60] = 73'h0080221fd5eed0aec7f;
      expv[61] = 73'h00881a13736fbcb2779;
      expv[62] = 73'h0028361797c168ab545;
      expv[63] = 73'h00881817972962b3d1f;
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
