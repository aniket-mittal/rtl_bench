// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 288;
  localparam OW = 144;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02286 dut (
    .A11(in_vec[287:272]),
    .A12(in_vec[271:256]),
    .A13(in_vec[255:240]),
    .A21(in_vec[239:224]),
    .A22(in_vec[223:208]),
    .A23(in_vec[207:192]),
    .A31(in_vec[191:176]),
    .A32(in_vec[175:160]),
    .A33(in_vec[159:144]),
    .B11(in_vec[143:128]),
    .B12(in_vec[127:112]),
    .B13(in_vec[111:96]),
    .B21(in_vec[95:80]),
    .B22(in_vec[79:64]),
    .B23(in_vec[63:48]),
    .B31(in_vec[47:32]),
    .B32(in_vec[31:16]),
    .B33(in_vec[15:0]),
    .Y11(out_vec[143:128]),
    .Y12(out_vec[127:112]),
    .Y13(out_vec[111:96]),
    .Y21(out_vec[95:80]),
    .Y22(out_vec[79:64]),
    .Y23(out_vec[63:48]),
    .Y31(out_vec[47:32]),
    .Y32(out_vec[31:16]),
    .Y33(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 288'had4180673ecf0ac357079f75013fbbbfc2b3fec3cedca58d6ddf300212bd8ae2ecff33b8;
    stim[1] = 288'h6b9cad36f3bc29035cf2fdb5fd25ef4785ee1896c2cc205c276173104351c02d8f99df93;
    stim[2] = 288'h20e18dafd7128cd722bb3c61b9fa1055cfa3b594631ada8cc4bb969c8e8ed83cccaab872;
    stim[3] = 288'h65a4c62d18eca9f4e6981b239d28f78cf74da074b74e53f6969964647561d5ca2fa7572c;
    stim[4] = 288'h2872fa0d237abe116f5da8ae4ae4d6264604457b91a44055d845877ebe95d75a78c15bb3;
    stim[5] = 288'h9494906505353507a00fa9c840931ea963c5107992a61161ad89823c512a89a0a1b40a7a;
    stim[6] = 288'h390bc8d1a38874522e1f344d36cbc1b28878016e73e9213362d03f763328744392384588;
    stim[7] = 288'h212f65f81f7b97f9a59c4691b70f8d990382205b28376e97184fc01c9e4a9ca4596ef420;
    stim[8] = 288'h0060a9e2f521f4a2bc4abc806fe148075cd9cc3211f107b5d94c141c8d7d1e39b55b9f9a;
    stim[9] = 288'h37b4cd627cc0fdc62d1c077e11dfc051c2e7bfaaebbb98ff283e00f8d0ea7359aad0cc40;
    stim[10] = 288'hfdfd917909eade57f73c2e2c1c3e1a4db9dca75326591efb0f6ddff8a6ab431723110e3f;
    stim[11] = 288'h3f647ec29c3de424e0ac1aeff11bc266827e215cdd29a8514c0537e6f0ede55762cb5cb3;
    stim[12] = 288'h2c4c639d9eee4a738123ac62a6151f830e9ee1c8270b96a69f4eb997e0748078b39c7a6d;
    stim[13] = 288'h666712efb5c4eda3504a7cc5d2258365a44fb67a82746109f74b92aa4aa24e9a39f601b2;
    stim[14] = 288'h078980e899c480a24954941b712958e87d902ad907a7c6f1d9788ce9792ec8bed7a13a74;
    stim[15] = 288'h27577b5b776e1b956aae90c2cd3e9a7ab85d8fe1a0f0af5f771f965d97aaecdc816d3868;
    stim[16] = 288'ha5a380bb8ab4795b50ce49f92515d0ef03a86e486361b279fb503f3dcdaa32fd3a14d1dc;
    stim[17] = 288'h7cba62c19711cc41eacf65d2f32aaf81d3375e49d04bde9a3d28d000bc3878308a0f4edf;
    stim[18] = 288'hff3a0f3c8a4fed1e8cc72627fe52fc13e42fec671467f006a26a8a758e1b86ed57a5bc81;
    stim[19] = 288'h3319b25be9e1d62a84eb9ab3bc1ea38b39513c2d0048460c47ffd336a3e25af14aaa1c0e;
    stim[20] = 288'h4e8f256fe7dbe7b5810302d5558fe15e876e68ecae429d116f1d8ca53068634ee89e3ab0;
    stim[21] = 288'h52cff7ae332902d98b818084b81164c041a85e437abb750d3712a7cabfc9c309140175fb;
    stim[22] = 288'hf866320ae1c22bb471aba93ff0222b76a6cc91b12ca86e94711ea28fed59be866feaead2;
    stim[23] = 288'hc4e09107b3adcc9dd8f918535a7fa72cacb98992f677b5ad4c5085f4cc15eb5ab17ccf7a;
    stim[24] = 288'he0c366c19a1538d3fbba1122646bcccfbf4afad39eacfc52ee6829ba4befa7bee9a7f406;
    stim[25] = 288'h237f4f2002ed7faa55ff4df63896e7688b71685bae2fb459a1815a50e7a14689aef5fc83;
    stim[26] = 288'hbee645a3b897ec18b0ba451649fc9e166681541e95261886f35c61d816d0f53e182e8e81;
    stim[27] = 288'ha2c3fbd9f3d91d5d9ba8f076001ffb55e6f781d337a0436b7d1be2def9d67add9df117f8;
    stim[28] = 288'hf196466011da2e39faab45b9b09c58e0788e6c9455aa219331bc61237ce913618a865798;
    stim[29] = 288'h66352a688cfd0ead095459cc6a9e2e6da623077181e07decd694539bf9907923f8584847;
    stim[30] = 288'h2e638ac3edba51319852f930b85c37ade9d5b9787549beb0709edcc497f825219746a64f;
    stim[31] = 288'hdc61fa2cfd3b26cac1d3b310a57de27e23772c45ee19a34446ebd39d673c032750cf5550;
    stim[32] = 288'h7cc8fb2494787b0172a285faa706847e20c2e9e827845e16ce47c924b1ed077b4f9f8b08;
    stim[33] = 288'ha321a5b19ca9ea09bca722ea4b7ebce7279770bef80ddef84b2248ace9417cd65610f7e8;
    stim[34] = 288'h7950d65a3f083298cfa469b7762e0110114e606290bea6dc99e400d5898ebc4f22f57c96;
    stim[35] = 288'h43b20a388f6690a7a576396e20b09b3cca3eb1d331b3fa60f0b12825d18a555fd44a0260;
    stim[36] = 288'h91bf44ebcc55b6b83494242e5c6bcb1cf57df89735301e9ab48060a11251e7fe5181eab2;
    stim[37] = 288'h66227ec35dd139bd26a531011aa5136a16e29eae9dc945563dc3ae68cb194d8dcd65cef0;
    stim[38] = 288'h28301be3f14a4e3517ba1a6d4dfabb372f2c2b08fd5ee365349e4e2d3348462d54357970;
    stim[39] = 288'h375c011e8c9779c91e3ff3b0419c43a20aacd45f63b55ffe535f8a48c85d8a2e45880154;
    stim[40] = 288'he4f4b07061d95a9961b3c7b55e0da0a83163cf5b8c30ed41abdcb7c07b12d5e5105689dc;
    stim[41] = 288'h5656fcd01e75b933d7a58bbd7d6fa8feacf26d34ef650bff5a33e6392fb9e2f552b6b688;
    stim[42] = 288'hfc861711812f197e6966ce351442c56605b7fab7714c5334eba79c4148338c6ac9a41485;
    stim[43] = 288'h6ff9a3c231bc0bb79900c480aceb7a32644f285ea34fadf361ed61cd61a2511ee29218eb;
    stim[44] = 288'h0a2e3dc739abdeddb3cbf79682a8c8b480ecc2bffd308b831ee5ed8c7a60584160d6d208;
    stim[45] = 288'h5c79d720922d91427949ce79de551942dd89eb53d20805ff9605fac58843331124f04d56;
    stim[46] = 288'h6732e01c3edbf85e755fa1c604c2efea5b7cc1fe523662269d4241bb14eb3a9050b2f63f;
    stim[47] = 288'he54ca1f888fe6c31920dc0d3e98772e00231bd3f3dd0460852a2e96c109e48b10a8effe1;
    stim[48] = 288'h2b3a6378b233f7dbe02ae3177fbedd82aceaff482444b153febc26b7b6ba794a7b5779aa;
    stim[49] = 288'h09f12161b0a44c5c70c2e8305950ba80fe3619506c8dc46016700161c0ee0a6e2a23ee4e;
    stim[50] = 288'h2b684fdf3c0256f7f5b9ea46db6151e63d183b3bfbbfdb23f9ecbf5b1c2993d7dfb8a936;
    stim[51] = 288'h9f5513c21eef5fa7a8658f8a5bc272e19607920cd9a498549904f2ca79b9b641d0fa4bab;
    stim[52] = 288'hbf252977dcac6f77fa5f804d7966dc36ea0e563995c9e8a9fae51a1050ae3ec626e6d611;
    stim[53] = 288'h95f09be8a98f12a1fe7e9c88395adb83a10cf3d0732565b232891505cafd26b06976f4c2;
    stim[54] = 288'h490cd31a035edf7d72d12109f37c98f83d932559606ac2368ebafceaa3c4bb8bb0108c81;
    stim[55] = 288'hfcdc641c61ce5a97339113bf5f5e7155cdd7e77fd10bc82a7b7ba83bd6c2d1d91b7c52fd;
    stim[56] = 288'h82d9b71a394d8c48cc470d592172e426e9d451b71af273066bace5b6a8f66c2754864e90;
    stim[57] = 288'ha0fdd7b7258c8cc230114decc3abbf2dd9cedc0a2fdba583f7c5a611e7f6b706de15bdc7;
    stim[58] = 288'he91ff33319522bf950fe9aadb60108d3a320a49afad4d573d8027b913802cfba805e103a;
    stim[59] = 288'hbb3107a86c1a8d49e890b3c0c0a70b5f76a6c167ca5bec614a55e6ae1ffd5844f4d9eeca;
    stim[60] = 288'hc915e7f972621d39cca67a28834275f4c5a15d5de84c2165f877e87e0b79da04f3abe011;
    stim[61] = 288'h08ed078ae5065ebce28a218a681aab4c5e46756c0e0bd48c53a8e730f2f1bdcdf2b1cbc1;
    stim[62] = 288'h4c94b93d8b3edcd9b71815559c4ee2c308a7460ad1eb35cd3f6fa865b1ebec4e86504d5e;
    stim[63] = 288'h14bd50fd3b85cacded0dc743eac89ae1006cfb2287622c2072fcba3c67c68adf66170587;
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
      expv[0] = 144'h33fae6dbbda04decd92d45aab364ffefee5e;
      expv[1] = 144'h60eabd0cd51abe4535b13595516b9a2a1d6d;
      expv[2] = 144'h2a216472f422f8a19334b4807ad3196e6c74;
      expv[3] = 144'h636dc780fc35ec06c88dd314648e531b70b8;
      expv[4] = 144'h752b576849b9d268f9d8fe70313237c8169e;
      expv[5] = 144'h9f21dfe852e87056aaae496d1b0cc272f94f;
      expv[6] = 144'h2622311954193893f2c4aa16f242700fa701;
      expv[7] = 144'h8209ea1379c9718b66ddcf1773d49cd12053;
      expv[8] = 144'h06316ed34614781cf01afbac91571eb8e90a;
      expv[9] = 144'hf604bf6ce7e0c11297229b520203d30d9ceb;
      expv[10] = 144'h8d92d5b78b7849b5114b033596a7fec2395d;
      expv[11] = 144'h677549af12e5068545d1c7bd438433e12013;
      expv[12] = 144'hc3c6f4e7dbc22072c04ee6280662f9746c40;
      expv[13] = 144'h3c03e3bad82521debb4ed6894ebf58c04e25;
      expv[14] = 144'h31592ccbf47934bcd71d7fd6ab61a3776489;
      expv[15] = 144'h7404ab753e6784bf1580cfa79c30210b54ce;
      expv[16] = 144'h6f2c1b6201e9330d51051bcb80a01f088f03;
      expv[17] = 144'h93627e7d6feba74102594c504e7233879265;
      expv[18] = 144'hd45184adf47f03933428c7582a5f38f8759c;
      expv[19] = 144'h03db58a406d0a0fa6f408838fcfc728ce58c;
      expv[20] = 144'h3821d893f4274919550f91ad0efe3058974f;
      expv[21] = 144'h81da7baaff54038189d16eba06dbaf93a055;
      expv[22] = 144'hf33e4bda9b965178573bdb312e1e4bb21506;
      expv[23] = 144'h87c2469868652e88508334146d38df95a099;
      expv[24] = 144'he9b78ef10c23f8b53616370827359a905c43;
      expv[25] = 144'h941ab322118e22935254255b9633792f1b61;
      expv[26] = 144'hce1a0bced8eb64fc14746bc655aee326e4c9;
      expv[27] = 144'hdaf13b57621f553d5de6af9fd4bfa39de04b;
      expv[28] = 144'hf2d216d84bf2bba1e8112236467ec08cbfc4;
      expv[29] = 144'he01c17505e8784d1645c3b50988b5f477dad;
      expv[30] = 144'hc4bc0163c85e69c415e122f0e15b7dee4893;
      expv[31] = 144'h0586972a5c8442932711831c407cfdb4ebec;
      expv[32] = 144'h59e4a2b85944bdf44092ffe00198cf4eb13a;
      expv[33] = 144'h3046ec29d91125781d49d62f276cfc0a2d8f;
      expv[34] = 144'h7640c4eaff5c53b94a6790d29eee641a761c;
      expv[35] = 144'h83488d0a03308d0d279f417cd88e28a81f98;
      expv[36] = 144'h207f3270285bc82cb4c2b980c623f8a95124;
      expv[37] = 144'hf5c2745f9d67efb239d2b28b925e0cc7afa8;
      expv[38] = 144'h499c7ed90628389d2cb9a8e9787e92937d5a;
      expv[39] = 144'h886897b4a1baf59833554711caea183c4b12;
      expv[40] = 144'h331930a67550b0204abe01fbc68e1bb25a31;
      expv[41] = 144'h14e1a56cf022e31cd23a6672dbc06a6564af;
      expv[42] = 144'h3857fe35e706068ed142fc73c87ec4bacacd;
      expv[43] = 144'h72101269f8b31132b879fd3508d6bc9db43a;
      expv[44] = 144'h75c0b7664382cc90abd8fce748483338bed8;
      expv[45] = 144'hadd84f986b05a3dce2ad427f47f284e26cf7;
      expv[46] = 144'h0204bd464905ac22b6e517e3e4902b12281e;
      expv[47] = 144'ha0425f44d2ae0d2c3a566201e0da605ed889;
      expv[48] = 144'ha82e9e8523dca91656032dcb6c8c7bec9272;
      expv[49] = 144'he3383aea50867e40f8bec57ca834b8f2c974;
      expv[50] = 144'h0d3aff4d105b6243cb5c682a378b5061fa29;
      expv[51] = 144'hf7b37fee67bb46727c7247f74763c4a8ecee;
      expv[52] = 144'h9fb8150585bb6a08c68d2d3e6ed84b0a5ff8;
      expv[53] = 144'h2e785e22df8690be416ba688967be8192c23;
      expv[54] = 144'h6c1a229cc8cea032595c6aeb161d2d38c51b;
      expv[55] = 144'h983605b045e64f7beb6cd06b6eb81ec55151;
      expv[56] = 144'h4c526bec406290bbda2025fa355257c04a70;
      expv[57] = 144'h3bfda512692523314b7367107e232a2c0ce1;
      expv[58] = 144'hbaa0e0ab6ee72e78c998fb099f80f917c659;
      expv[59] = 144'h0367c2a57b1d782fa29370793ad420a5a426;
      expv[60] = 144'hf7e8fc40ba7c3c7f0f58d99b0deacb3b870f;
      expv[61] = 144'h995a4d351e0c0962fe5eedc406e6f1c4258a;
      expv[62] = 144'h5f1f344df5471dc8093bd803557bb6b9b4c9;
      expv[63] = 144'hfe01bf997e71c263578b8c03842031005efa;
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
