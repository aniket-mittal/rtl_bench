// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 165;
  localparam OW = 67;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_149815 dut (
    .sys_clk(clk),
    .sys_rst(in_vec[164:164]),
    .pipe_stb_i(in_vec[163:163]),
    .Y(in_vec[162:147]),
    .S_X(in_vec[146:131]),
    .S_U(in_vec[130:115]),
    .S_V(in_vec[114:99]),
    .E_X(in_vec[98:83]),
    .du_positive(in_vec[82:82]),
    .dv_positive(in_vec[81:81]),
    .du_q(in_vec[80:65]),
    .du_r(in_vec[64:49]),
    .dv_q(in_vec[48:33]),
    .dv_r(in_vec[32:17]),
    .divisor(in_vec[16:1]),
    .pipe_ack_i(in_vec[0:0]),
    .busy(out_vec[66:66]),
    .pipe_ack_o(out_vec[65:65]),
    .pipe_stb_o(out_vec[64:64]),
    .P_X(out_vec[63:48]),
    .P_Y(out_vec[47:32]),
    .P_U(out_vec[31:16]),
    .P_V(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 165'h1e6c1cafdd756134852c245d0b2f9484f1179502e5;
    stim[1] = 165'h14291dc2975353b9b8099d510efe9f18d9f7c4539e;
    stim[2] = 165'h00d2e7c7c4e2d4ddcce9691f51f04421d7a214f5e1;
    stim[3] = 165'h05c0a82ddd36eab114ba4edc0b2551905a31a0d7a8;
    stim[4] = 165'h013cbd16531f9a320bffdec62a72669405ae768cfd;
    stim[5] = 165'h0da5997c7b7a6e0b0992a10a0491bc7ce7f0c7777b;
    stim[6] = 165'h0f58db8afd6128e9e872d775d86060057a1d44e3f7;
    stim[7] = 165'h04cea2e02bc9d04ef6baea496203f62488ecf91f8d;
    stim[8] = 165'h0210b5942b019fd5bd458a3606770c5a9cfb4eabfd;
    stim[9] = 165'h08950447a1b172dbc6cea0b343e3ff82833616f528;
    stim[10] = 165'h05145def32bdef4dec054d30a04265ca360549119a;
    stim[11] = 165'h0f9c50ce4838c47985b96cb65c174de7f7f60b0917;
    stim[12] = 165'h021ee51b51bb5cea1c045448a6e505f7f7655eeb60;
    stim[13] = 165'h0236a5ae316cdf8ee2f8dbb3453e75a7494cb8e842;
    stim[14] = 165'h09ba7e129552a39c0ed7f558d64c7c2be19a37f6cd;
    stim[15] = 165'h0dd3fb029bf1189bfbab296d281562daf1473cc191;
    stim[16] = 165'h09041ebc537ff9e1d297a2c131d900394831893433;
    stim[17] = 165'h0c06757557962c74b68361004a5f2d6497f780170b;
    stim[18] = 165'h0c7311732602047351c8b81f887082253796115224;
    stim[19] = 165'h0887c6772c99c7a7b040df10de3209868d1527987b;
    stim[20] = 165'h098920a1f9db8d7e1512b72881c1bb5d959e9e3b21;
    stim[21] = 165'h0685caf25254b4d82ce9b3f7581f0aa856567fd818;
    stim[22] = 165'h06c9505ddbef65b65a0a348c26f5743b0fee370dca;
    stim[23] = 165'h05a600a7d49238756f84a5d618089d159124175f25;
    stim[24] = 165'h0e8117f3f9a367c56a150cc4ea3d68491d0640c307;
    stim[25] = 165'h07fe7ca6bc722af6ffc673ca839a55e68ac3c8ec01;
    stim[26] = 165'h164be0bc34bbaaf4ae79cf362d28a50105e283c100;
    stim[27] = 165'h042380cf1eb2d211231872c4ac5edf9c6fc5a390ff;
    stim[28] = 165'h0235c65edbe2251dfc6956c2cae6105b80313ea792;
    stim[29] = 165'h0c659c68daedde36f518df772760a438c254982835;
    stim[30] = 165'h068ee2afbe7ac04b61e0db911405f0d7151731a96f;
    stim[31] = 165'h0158df52edf4ae29b59cdf303831ad6ecf77b55ddd;
    stim[32] = 165'h082f5095a8567cc7c1b5970023d0256dff14c8580d;
    stim[33] = 165'h09596be10149366594fb69d05097cc104ac17ca4be;
    stim[34] = 165'h0acf220285e02abaa059b4da2cc3b008c40180ff62;
    stim[35] = 165'h0e57d9b7cec79802cdfe8dc451e5844ca07573bd69;
    stim[36] = 165'h08422ad0ff0e680fe4716279671df2ca42e970df1e;
    stim[37] = 165'h063850f8a9d1b61bdb58a580a28471f6e4db719eb0;
    stim[38] = 165'h0fa2f335e14fbcebde7a0d1471e4744c5e3a7cb7b0;
    stim[39] = 165'h0a24593ff08347919c1ec5dccf3c7fb1a4e382cdf6;
    stim[40] = 165'h0e4185f53017991305021e6fb693734250f705eac6;
    stim[41] = 165'h050baba122402e7760eaaf03b6ae4e0f20b91e8f03;
    stim[42] = 165'h0a96b36c4315beef69215df558380e8694f4b193c1;
    stim[43] = 165'h15a42e454acdd80ffd2770446d819c1282be3cc34a;
    stim[44] = 165'h0da90042a71ed79bf750f9b435dd6d393d1495ec95;
    stim[45] = 165'h0f04b4b155b6af6c1da3a6ab217e8a4d77608270ca;
    stim[46] = 165'h0b3bf1a06a830b9e330f28a5d770e5986f4374ae54;
    stim[47] = 165'h05c76efcabee2d4cee511097c385551992ff78db37;
    stim[48] = 165'h0b264cec11af4726b2708937ed311069f8ef36d731;
    stim[49] = 165'h05943da98ee71f3811c9dcae749f320ff64500f869;
    stim[50] = 165'h0eddfc9ccc60b338a09bc334f5ab657fbdee5626ef;
    stim[51] = 165'h0585b2b63077ede3d045ebe071e400eabafc7d963d;
    stim[52] = 165'h0e8b0bc8925b1eacc9708a1a261940092ef95015a3;
    stim[53] = 165'h0bfcab4c329ab408119a3c36597abdcb1a0d3d3668;
    stim[54] = 165'h00a5bb2bf4e6c6697103ea9822dd3322fca0f80d38;
    stim[55] = 165'h0dc2e0891153b52e6f8b3f53f9e9ada6061126b97c;
    stim[56] = 165'h072a04b097a93c8571c950169656a84377a0047d93;
    stim[57] = 165'h0786480547024781eecb8b14db9f09916b04112c7a;
    stim[58] = 165'h0a4d38f3cd73f022201b371d7c4d465a080fc488ef;
    stim[59] = 165'h0e349ebd907ae031533d45ec2a4711cda55e5a6652;
    stim[60] = 165'h0f4c2f5effed29f8172153fe060932cb39e0e5b5da;
    stim[61] = 165'h0b70e6c0e886591838d8dc01551ebbe48ff02611b6;
    stim[62] = 165'h048d578c54b5143c30e01dba4be35bc8ccf67efa87;
    stim[63] = 165'h06d422029cab35b24e419e9c5f141de38318d5b866;
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
      expv[0] = 67'h095fbcd83aeac2690;
      expv[1] = 67'h095fbcd83aeac2690;
      expv[2] = 67'h0b8528523ea6a7737;
      expv[3] = 67'h0b8528523ea6a7737;
      expv[4] = 67'h0b8528523ea6a7737;
      expv[5] = 67'h0b8528523ea6a7737;
      expv[6] = 67'h62f8fb4b36f4dc161;
      expv[7] = 67'h02f8fb4b36f4dc161;
      expv[8] = 67'h02f8fb4b36f4dc161;
      expv[9] = 67'h02f8fb4b36f4dc161;
      expv[10] = 67'h688f412a0362e5b78;
      expv[11] = 67'h088f412a0362e5b78;
      expv[12] = 67'h619c9f38a07188f30;
      expv[13] = 67'h519caf38a2b6b9335;
      expv[14] = 67'h519cbf38a8c313991;
      expv[15] = 67'h519ccf38ab26f6c76;
      expv[16] = 67'h519cdf38afbdbc8d8;
      expv[17] = 67'h519cef38a9b43e19c;
      expv[18] = 67'h519cff38a1b1e2f51;
      expv[19] = 67'h519d0f38ae2dd6449;
      expv[20] = 67'h019d0f38ae2dd6449;
      expv[21] = 67'h6143f31243b71afc2;
      expv[22] = 67'h5144031242becdb01;
      expv[23] = 67'h51441312471ffbd7a;
      expv[24] = 67'h5144231245d0b32b2;
      expv[25] = 67'h514433124bf80af92;
      expv[26] = 67'h01786c97c97755e95;
      expv[27] = 67'h01786c97c97755e95;
      expv[28] = 67'h01786c97c97755e95;
      expv[29] = 67'h01786c97c97755e95;
      expv[30] = 67'h68d1b8cb35dbbc6de;
      expv[31] = 67'h08d1b8cb35dbbc6de;
      expv[32] = 67'h08d1b8cb35dbbc6de;
      expv[33] = 67'h612b505ea0acf98f8;
      expv[34] = 67'h512b605eabee990d3;
      expv[35] = 67'h012b605eabee990d3;
      expv[36] = 67'h636f9cafbd8f30059;
      expv[37] = 67'h536facafb9c40657a;
      expv[38] = 67'h536fbcafbde78f7c2;
      expv[39] = 67'h536fccafbd0b2d193;
      expv[40] = 67'h536fdcafb6ef1f8c1;
      expv[41] = 67'h536fecafba6cc7443;
      expv[42] = 67'h036fecafba6cc7443;
      expv[43] = 67'h0c8a9b48559bb01ff;
      expv[44] = 67'h0c8a9b48559bb01ff;
      expv[45] = 67'h60854b520e3daf37e;
      expv[46] = 67'h50855b520a31fa3bf;
      expv[47] = 67'h50856b5205034d788;
      expv[48] = 67'h50857b5208d8a4abf;
      expv[49] = 67'h50858b520f194d324;
      expv[50] = 67'h50859b520412dcb29;
      expv[51] = 67'h5085ab5206b7bc254;
      expv[52] = 67'h5085bb520797b4092;
      expv[53] = 67'h5085cb5206cdb4529;
      expv[54] = 67'h5085db52088073e8b;
      expv[55] = 67'h5085eb5203bf6d009;
      expv[56] = 67'h5085fb520e5f2d89c;
      expv[57] = 67'h50860b520daa7b6e1;
      expv[58] = 67'h50861b520503a38e9;
      expv[59] = 67'h00861b520503a38e9;
      expv[60] = 67'h6d7b2c6930f5c062a;
      expv[61] = 67'h5d7b3c6930ac36bc6;
      expv[62] = 67'h0d7b3c6930ac36bc6;
      expv[63] = 67'h0d7b3c6930ac36bc6;
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
