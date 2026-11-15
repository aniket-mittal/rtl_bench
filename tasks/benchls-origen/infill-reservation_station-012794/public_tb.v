// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 342;
  localparam OW = 275;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_012794 dut (
    .clk(clk),
    .new_inst(in_vec[341:341]),
    .p1(in_vec[340:340]),
    .p2(in_vec[339:339]),
    .src1(in_vec[338:275]),
    .src2(in_vec[274:211]),
    .vb_request(in_vec[210:207]),
    .vb_data_in(in_vec[206:143]),
    .vb_tag_in(in_vec[142:134]),
    .res1(in_vec[133:70]),
    .res2(in_vec[69:6]),
    .busy(in_vec[5:5]),
    .wb_request(in_vec[4:1]),
    .kill(in_vec[0:0]),
    .vb_data_out(out_vec[274:211]),
    .vb_tag_out(out_vec[210:202]),
    .op1(out_vec[201:138]),
    .op2(out_vec[137:74]),
    .wb_data(out_vec[73:10]),
    .wb_tag(out_vec[9:1]),
    .nmi(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 342'h11e489a102cc9cdf8365e6d376e1fcc7b5307a36cd3ff4f873250a92f9bd997ab4710f436f99de8ca628c9;
    stim[1] = 342'h32f4db4d22bf6c501f85aac8f22f59c4ad726d12d90fff920e581d425e3e821e8e1ac45270573134d54d91;
    stim[2] = 342'h1ff83977de30e726cf7ace810e43f31d2c020a7e659e5a0e4308c99c17083274947cc580a5e281e1b3a0b9;
    stim[3] = 342'h2ce2e42d77bb77bbadf54e454eb18fee7640472bc15662053cc1251f0fa5e7d2c6c7ea504240ade9ce5d52;
    stim[4] = 342'h0980a5e908376318438e0689ae97f5de971f53a38205246da602af3bb5c3b8d2f1b0034afdd631ad7d9106;
    stim[5] = 342'h30baaf26836dc0bcd65b942e0790e48ee1045b361c53c88de6a303b1471e714109fd127f62d337dec9b5ca;
    stim[6] = 342'h3616b77248b4e24d7fbd150cbe4785b1cf0f56fa3ad958d3fb720df762e3e88f5278bacb68e86e55518745;
    stim[7] = 342'h37a396aee52767d837297ac2523b46dbe3ebf9f534d7c1e76ec0ed3f5a3195826d651cc794ad4df029316c;
    stim[8] = 342'h33bd027c2cea564e3e305f502467d769353ab8d159f029508db97e73bdae23acb00b56ae1f7c15c1bfca0a;
    stim[9] = 342'h3e437713dc53ddfde807ee1ca571d6ec67fa96c5c6951c5eb5462a00fbb07d2a59c25f74417f33ad98f170;
    stim[10] = 342'h0e85f5cbcbf98f9c54db4018781197b4bd1c38a42c308799fb25d924569111c027d377b2b9958d5bd79ab5;
    stim[11] = 342'h1be5620e9eb799fb136ac6d18a74f41c98cebda44838ff15dfa750fc01f1412bca392d2b05e33df2012cae;
    stim[12] = 342'h2627b6821e34b218efa752863a750d40052b336ac38e705b042a3a5e1b0fdc4371d14a44d9e7c7845f6197;
    stim[13] = 342'h3becaaba6625a1714c9df97c1fe5ce820ab6c47a7b0285fc713a5c8f993ffba91b6e1757f529860c1f9fb0;
    stim[14] = 342'h08c40b472b1e10576c8eeb7de2f6bc05e887480b5e317ebad84bbe7d087d890f99a5f72286c63df6d122b7;
    stim[15] = 342'h009e551d6233a515499acff20538ebeeedfe9a468bdb0f93e839e83438f9f60f635e01a52ce8817c0b08cd;
    stim[16] = 342'h153f408da9af089adbb4fadf868d7a8533d865811002517cdf32c48e1374a25db60fc1ca9b2b88da2fe4c9;
    stim[17] = 342'h1a0f5824b3a63ee5ecbc0c85721c0c22ca2bf6811eae44a882ebdbedaadbf00191d2bc8c5378b0bf7f25d2;
    stim[18] = 342'h3c264b4aa9eba9643c92eaae2db627cd398aa4f114df2b64709ab8de5f96575471be59ad8ced5c7e435620;
    stim[19] = 342'h389eb2a695cf4ab8a0693a7ddaa64ed22e885e122486b4137683300275f5c303ac1524e8ee4b0a8efa2047;
    stim[20] = 342'h13761dad64293896febbe4715f00b795211f0b97e3e6585de168e52d0b0fb75a21faf8ee1f8b1d44632dd5;
    stim[21] = 342'h184a66b3ac7469220498e4f5b23ed715c82f194ef7428d440da90896f4d77d1c210e73ba6438051fe0a5de;
    stim[22] = 342'h2c8aaa724bdbbaf7263dd1f2cae6c4c0bfa08aef584e8f8e501feff7d60fb0c5593799acaeb5a9b8e327fb;
    stim[23] = 342'h09d72f96b81dc5cbfaada5d87c9e3d474bf064bf3532711fae8b3ba9f692b460e8f12dab7852a84f3b7069;
    stim[24] = 342'h1839d2addfb21490cb830972a29955b6f625e54b155c74ea769b7fa73bc20f458fb899eee9f0e09f628fdd;
    stim[25] = 342'h34ed8b020f6b5b6e05f193bb68ae5046583922a5638dd2461625a3c0ab110b7bf34c4b481e10c9a988ac78;
    stim[26] = 342'h191f006db03d51dd80d140b0875e9df230000bacc938be95a9669ca4e33debb919b33c30c57ebf1135146b;
    stim[27] = 342'h2d5187104d3296816a09c2276355522e68d2ef49fa9a3ea41c04e0cb64cb4c3725cd513556e4efd757f7dc;
    stim[28] = 342'h2653e7b9d48b9167bb1d5a6e5f224a5306a61794b3f28026d73d40780d1bbea139228d438a85c3408219ba;
    stim[29] = 342'h29f8580697868ecfd26c5fdd492780c2d93040f57ad453ec9eba47323d8b6990b69ea2a28dedc170b4478a;
    stim[30] = 342'h25a2ba9a436676211f19f02473dba98edefc55409dbdfe03f9ecadbc7d4aab71b40c6bf2d97cc0e54fa540;
    stim[31] = 342'h11afd0dc60674ff83d9e32365f0c9d4532ce2319191f2894db0c51b9b06d7d6ed9124c90481926c542bce2;
    stim[32] = 342'h0828c6a8f14d9802414cd9b4d6d3afb6c38261c63d5a82d4c4c28f71f0f37882b058399f13b65340a55a27;
    stim[33] = 342'h38b7cc3feec8d4d8cdf6e308dad087f78b2099223c381ba1b3b570773702be7eac9e71707aa19084dd6438;
    stim[34] = 342'h2d7f4f82a0d6592a0b0a642793d00cd7112112e754eaaedbb95597bad98a11a74822f80876fec8f6ba14f6;
    stim[35] = 342'h28edc67f193ea0e7f914e090f57a0d995ed1117216525ede6b24769be922a447f3bf2ff1fc3559e698a7d2;
    stim[36] = 342'h1bf5b3e9d3f725e981889570140c8650936a43e4d146ccb0a418a29ff094758af4b5dbce62da05c14d9a58;
    stim[37] = 342'h16dccd105c28076aabfae55030d40c8e897bbd00ab7842daaf431c009ea262eb68786e6038591c468d5d82;
    stim[38] = 342'h11170a0ea6109fdc5cbafba640f489856f84863ef2bcdb80213edabf568e9fcfed34494df6f1c9597913e9;
    stim[39] = 342'h30a5fd9e9d38aa42cf887365bef6e11fbf7e8ba8d3f3fbd49c429bd0f7ce133c1dbd63ee784b63107204a7;
    stim[40] = 342'h202bdce23671a465b70b8504808f54e98f251a3d81ddff321064a068eb3f260dc5b61dee79823f0030da9a;
    stim[41] = 342'h3b2866feb9a2b1bef085955977d5e806629a88c19c176bf9953da0341d1bb247c91c18a2ae4cac3364315c;
    stim[42] = 342'h262958b95b2f20be76ec505cf830aedb7ee919419a5380d631a2f1082f9635449629eefd20f9e0bce283c6;
    stim[43] = 342'h1e103fd20fd67dfbc488dd125a8e25c21034d7bee2c7c2a0bc76f02904c5a43d884f812e6382ced1a13e8c;
    stim[44] = 342'h04e52fdefa929ecc5726b129bad3b9a58d88482fef86947a25399fc51e14525782b48f73cdef7320f9ac9e;
    stim[45] = 342'h2d58b20341519e3545918b7be1acb9c34b8b37505d910a465e9f3b4601e14cee56596180fa5e5169739576;
    stim[46] = 342'h01b68c8eee26b96dc647e8dc5c99c57b7d8bcd83f6b723f45facaea8efbab6c9bce0f36cf422a7e111e55d;
    stim[47] = 342'h2387faa2ce5e5b4db268bcd94702fad7ab0c48c0c6d5725aafa5f68ac8c33124f93eb744ae615023c9245c;
    stim[48] = 342'h286eb19e7d93354ec6321df8c86b8b21e49da5df5270f74b9df5710fdeff5371b90df7a42e58d676cd2f7c;
    stim[49] = 342'h1d4c94f7a81c266dc443bf80588f7d5d87d342d9dcfa19510455c0413438b377a17f48e20149012386a44a;
    stim[50] = 342'h0a1e619c16d3f76b45f95586e2d9e20b7a5d6e463df7f689ba464a8c4c794361b7aaacc9a5579606d1d676;
    stim[51] = 342'h05dbb703951232ae220f0eb4550b4e61c7720b6b8a045c950fd58804e3efbe19fcb02b7df2c9e3943ea7f4;
    stim[52] = 342'h2705661e73918149774069f8afcefab8be18a8403157a3241c0fc429c86e41ef49ae6dbe9dfa0f6243f907;
    stim[53] = 342'h2fe8cbda6630d1de34615659d6e7ce63079f803019610de85d52399c507da945d25ef3be7b10b326e45da0;
    stim[54] = 342'h38b3d7545bad12b43c0574ca9c260e9e00eb99dcdca0e7df7494faced7cbfd772d3ea90543ac1692d114a8;
    stim[55] = 342'h2849ef77ea05f1da7411b8f03f4126a883d02b6cc848598a741fdff6151a4ad8f510303a5ab030d189a09a;
    stim[56] = 342'h3d6b567611489ca6509f4968ad6a9daa73348980fdce3637bf413d79d7a2eed15fab9adb16e65809da700e;
    stim[57] = 342'h1e107b9c10aacd0bf7281abc0976a296615c4139dd47c6a5aceda63f4e0da10138a48b9d829e1fdec53e9d;
    stim[58] = 342'h12abb1ba6ca6c15f2e4f69da4dccddd4a3722de0be3ac16f3355a6b3c1c676239efa14dd07f538e99623ef;
    stim[59] = 342'h3dc225d2474544dbb541fb13163da601c7a9d66188fa7ba2acef4a41355304ac79343ba6bbcbdc32a1cdb1;
    stim[60] = 342'h21105fdd877959889e166c062741884a40569f41a9f0e045ef1f228497f8340639cad27892f767dd70589f;
    stim[61] = 342'h384123dfe4cdd61d523e18b4da58ab8cbf8ced69d283deb54771583dcd9cff6f587fda8ef9d2d55ccb89c3;
    stim[62] = 342'h3d2e9497ff63b83a6b6d7b6ca64ae4be7337dbc35b3fab0913a75816023dacccf6de540b70da500db0dc1f;
    stim[63] = 342'h252d358bbbca96defc3e774fb660de1568362e965578083cd00868f8648ee868f5b06ad9f53acf5b97ac60;
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
      expv[0] = 275'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 275'h1525f37b32f568e2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxf436f99de8ca628xxx;
      expv[2] = 275'h3a84bc7d043d1c35xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx45270573134d54dxxx;
      expv[3] = 275'h13382e1064e928f9xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx580a5e281e1b3a0xxx;
      expv[4] = 275'h4a3e1f4bcfa58d8fxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxa504240ade9ce5dxxx;
      expv[5] = 275'h5e776b8771a5e36041xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx34afdd631ad7d91000;
      expv[6] = 275'h07628e3ce28213fa41xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx27f62d337dec9b5c00;
      expv[7] = 275'h1beec5c7d11ea4f100xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxacb68e86e555187518;
      expv[8] = 275'h5a7eb4632b04daca00xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxcc794ad4df02931518;
      expv[9] = 275'h7ce77b5c47596016803d1cb577293b3ec1bacb68e86e55518756ae1f7c15c1bfca207;
      expv[10] = 275'h5401f760fa54b384803d1cb577293b3ec1bacb68e86e5551875f74417f33ad98f15ca;
      expv[11] = 275'h3248ad2223804fa6803d1cb577293b3ec1bacb68e86e55518777b2b9958d5bd79a800;
      expv[12] = 275'h21f803e282579472003d1cb577293b3ec1bacb68e86e5551876d2b05e33df2012c800;
      expv[13] = 275'h74bc361fb886e3a28037b2b9958d5bd79ab7b2b9958d5bd79a8a44d9e7c7845f61801;
      expv[14] = 275'h391f327ff75236dc0037b2b9958d5bd79ab7b2b9958d5bd79a9757f529860c1f9f800;
      expv[15] = 275'h7cfa10fb121f334b8037b2b9958d5bd79ab7b2b9958d5bd79ab72286c63df6d122800;
      expv[16] = 275'h506871f3ec1ec6bc001757f529860c1f9f9757f529860c1f9f81a52ce8817c0b08c01;
      expv[17] = 275'h091c26e944bb6c1f801757f529860c1f9f9757f529860c1f9f81ca9b2b88da2fe4c00;
      expv[18] = 275'h37db55b7e00323a5001757f529860c1f9f9757f529860c1f9fbc8c5378b0bf7f25c00;
      expv[19] = 275'h71bcbf2caea8e37c801757f529860c1f9f9757f529860c1f9f99ad8ced5c7e4356000;
      expv[20] = 275'h6004ebeb8607582a0021325a554f5d4b21e49755716db13e69e4e8ee4b0a8efa20401;
      expv[21] = 275'h4a5a161f6eb443f58019ad8ced5c7e435619ad8ced5c7e435638ee1f8b1d44632dc01;
      expv[22] = 275'h112de9aefa38421c8019ad8ced5c7e435619ad8ced5c7e435633ba6438051fe0a5c00;
      expv[23] = 275'h5fefac1f618ab26f0019ad8ced5c7e435619ad8ced5c7e435619acaeb5a9b8e327c00;
      expv[24] = 275'h7753ed2568c1d1e20019ad8ced5c7e435619ad8ced5c7e43562dab7852a84f3b70400;
      expv[25] = 275'h7f4e77841e8b1f710019ad8ced5c7e435619ad8ced5c7e435619eee9f0e09f628fc00;
      expv[26] = 275'h4781562216f7e6988019ad8ced5c7e435619ad8ced5c7e43560b481e10c9a988ac400;
      expv[27] = 275'h3949c67bd77233660019ad8ced5c7e435619ad8ced5c7e43563c30c57ebf11351452c;
      expv[28] = 275'h4196c996986e4b9a8019ad8ced5c7e435619ad8ced5c7e4356113556e4efd757f7d2c;
      expv[29] = 275'h00f01a377d42724504d9ad8ced5c7e435619ad8ced5c7e43560d438a85c3408219800;
      expv[30] = 275'h0e647b16d3216d3d3d59ad8ced5c7e435619ad8ced5c7e435622a28dedc170b4479ea;
      expv[31] = 275'h5b78fa9556e36818ba59ad8ced5c7e435619ad8ced5c7e43562bf2d97cc0e54fa5400;
      expv[32] = 275'h237360dafaddb224ec99ad8ced5c7e435619ad8ced5c7e43560c90481926c542bcf64;
      expv[33] = 275'h1ee3e1e6f10560b06c99ad8ced5c7e435619ad8ced5c7e4356399f13b65340a55a364;
      expv[34] = 275'h60ee6e057cfd593cec99ad8ced5c7e435619ad8ced5c7e435631707aa19084dd64364;
      expv[35] = 275'h2f75b314234e90458019ad8ced5c7e435619ad8ced5c7e4356380876fec8f6ba14c00;
      expv[36] = 275'h6d37d245488fe77e5599ad8ced5c7e435619ad8ced5c7e43562ff1fc3559e698a7c00;
      expv[37] = 275'h453fe128eb15e96ba459ad8ced5c7e435619ad8ced5c7e43561bce62da05c14d9a400;
      expv[38] = 275'h38013d44c5d6d0f0a459ad8ced5c7e435619ad8ced5c7e43562e6038591c468d5d800;
      expv[39] = 275'h357ead1d3f9fda68a459ad8ced5c7e435619ad8ced5c7e4356094df6f1c9597913c00;
      expv[40] = 275'h37a1ef9c26783b7aa459ad8ced5c7e435619ad8ced5c7e435623ee784b63107204800;
      expv[41] = 275'h40d1d67e4c1b8b6c2459ad8ced5c7e435619ad8ced5c7e43561dee79823f0030da800;
      expv[42] = 275'h40683a37648f92386499ad8ced5c7e435619ad8ced5c7e435618a2ae4cac336431724;
      expv[43] = 275'h62105f2c6a892c5380194337f5cd158df7842caacbbeaf40332efd20f9e0bce283c01;
      expv[44] = 275'h6052098b487b109f22d94337f5cd158df7842caacbbeaf4033012e6382ced1a13e916;
      expv[45] = 275'h3f8a3c28a4af056922d94337f5cd158df7842caacbbeaf40330f73cdef7320f9ac916;
      expv[46] = 275'h768c03c299dcacb2a2d94337f5cd158df7842caacbbeaf40332180fa5e51697395516;
      expv[47] = 275'h5d51df756d9379c19f0f73cdef7320f9ac8f73cdef7320f9acb36cf422a7e111e5401;
      expv[48] = 275'h6d1591866249f27d1f0f73cdef7320f9ac8f73cdef7320f9acb744ae615023c924400;
      expv[49] = 275'h621fbdfea6e3721ba5cf73cdef7320f9ac8f73cdef7320f9acb7a42e58d676cd2f52e;
      expv[50] = 275'h0082687166ef42fef54f73cdef7320f9ac8f73cdef7320f9ac88e20149012386a4400;
      expv[51] = 275'h151898f286c36f55754f73cdef7320f9ac8f73cdef7320f9acacc9a5579606d1d6400;
      expv[52] = 275'h1009c7df7c33f960754f73cdef7320f9ac8f73cdef7320f9acab7df2c9e3943ea7c00;
      expv[53] = 275'h085390dc83de935cf54f73cdef7320f9ac8f73cdef7320f9acadbe9dfa0f6243f9000;
      expv[54] = 275'h7338a0fb528ba4bdf54f73cdef7320f9ac8f73cdef7320f9acb3be7b10b326e45d800;
      expv[55] = 275'h759daf97faee5a7d520f73cdef7320f9ac8f73cdef7320f9aca90543ac1692d114800;
      expv[56] = 275'h3fec2a3495b1ea2000059ebaa2dd6895a1e02ba654e13074f0303a5ab030d189a0801;
      expv[57] = 275'h7af3af45dda2bf571fe90543ac1692d114a08dc781fa0935441adb16e65809da70001;
      expv[58] = 275'h4c7e9c1b42027149002b5ab3b08a44e532b03a5ab030d189a08b9d829e1fdec53e801;
      expv[59] = 275'h4d67838cec473df4002b5ab3b08a44e532b03a5ab030d189a094dd07f538e99623c00;
      expv[60] = 275'h14826aa60958f268002b5ab3b08a44e532b03a5ab030d189a0bba6bbcbdc32a1cd800;
      expv[61] = 275'h45092ff0680c7395802b5ab3b08a44e532b03a5ab030d189a0927892f767dd7058800;
      expv[62] = 275'h307b9b39fedeb0ff803ba6bbcbdc32a1cdbba6bbcbdc32a1cd9a8ef9d2d55ccb89c01;
      expv[63] = 275'h302c047b5999edbc803ba6bbcbdc32a1cdbba6bbcbdc32a1cd940b70da500db0dc000;
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
