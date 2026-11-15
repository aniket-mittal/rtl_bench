// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 528;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_115066 dut (
    .pcs_ctrl_in1(in_vec[527:512]),
    .pcs_ctrl_in2(in_vec[511:496]),
    .pcs_ctrl_in3(in_vec[495:480]),
    .pcs_ctrl_in4(in_vec[479:464]),
    .pcs_ctrl_in5(in_vec[463:448]),
    .pcs_ctrl_in6(in_vec[447:432]),
    .pcs_ctrl_in7(in_vec[431:416]),
    .pcs_ctrl_in8(in_vec[415:400]),
    .pcs_ctrl_in9(in_vec[399:384]),
    .pcs_ctrl_in10(in_vec[383:368]),
    .pcs_ctrl_in11(in_vec[367:352]),
    .pcs_ctrl_in12(in_vec[351:336]),
    .pcs_ctrl_in13(in_vec[335:320]),
    .pcs_ctrl_in14(in_vec[319:304]),
    .pcs_ctrl_in15(in_vec[303:288]),
    .pcs_ctrl_in16(in_vec[287:272]),
    .hw_address_ctrl_in1(in_vec[271:256]),
    .hw_address_ctrl_in2(in_vec[255:240]),
    .hw_address_ctrl_in3(in_vec[239:224]),
    .hw_address_ctrl_in4(in_vec[223:208]),
    .hw_address_ctrl_in5(in_vec[207:192]),
    .hw_address_ctrl_in6(in_vec[191:176]),
    .hw_address_ctrl_in7(in_vec[175:160]),
    .hw_address_ctrl_in8(in_vec[159:144]),
    .hw_address_ctrl_in9(in_vec[143:128]),
    .hw_address_ctrl_in10(in_vec[127:112]),
    .hw_address_ctrl_in11(in_vec[111:96]),
    .hw_address_ctrl_in12(in_vec[95:80]),
    .hw_address_ctrl_in13(in_vec[79:64]),
    .hw_address_ctrl_in14(in_vec[63:48]),
    .hw_address_ctrl_in15(in_vec[47:32]),
    .hw_address_ctrl_in16(in_vec[31:16]),
    .reg_addr(in_vec[15:0]),
    .pcs_ctrl_out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 528'h0080615f2cf2502b4ebd68cdc3e00caef2e969918b2442ab1fabe4ced532272e87a76621b672f3ff6105b32daaa0c01649747bd406765fedf5403e32032d167c2563;
    stim[1] = 528'hac5208b90ce07834b6263c16a0e06323dcba28a23cc2f5946a963154d628de14e8d11376c425e9e31eaf411c9ddd788186736420a4f30842190a1dfa630246ccbb63;
    stim[2] = 528'h20be409983fb9c9f6a0cda3659f5a18e454401b94d32d5418dc41b591ac8ea6d97abd7b7c3e7d73507aa06722b577d8eef5e30cd5bca2f09a88f3de0bf5578036fdf;
    stim[3] = 528'h85ba4688068c11b80a5238cceddf6d6d39e7e7482ea3c44f48972fb7be9a37e5b67d6b0aeadcc2b7e9f81386fe04c303d9c98a0217454feb38aad04be2d498aa73c5;
    stim[4] = 528'h33273fc7eaa0281c67088f1d7e660e42c01bfbf88e59a1487391a0fc101db4b37ae7d6c7b3a0c3b626ddeaa4ddadd902a72089dab02c0033ab0cad60c05e7c2405da;
    stim[5] = 528'h8339683f8d01679c102a918bae73f97f97d2298e3e75934baf00813e6f62de59479e8d79a4f60c8ace99961095be3fe737d13133f310812bba5f46649ea5b93f7236;
    stim[6] = 528'h174706bdf221e91ec8a00572283524a609f997338b71c5b65bd85a498569a02218dabc2a9dacfee6840febd6847b5492ce7662ef5606cff85b2cea9e45f0ad876889;
    stim[7] = 528'hf8c5724774eb68d9677ef904b7f65a9b059a5deaf0d0ee0aadb36d4da818f08fd30442344fc1e20d49c235824f860ba98339aed6a86c89516343d2864d0de8bf19fa;
    stim[8] = 528'hbdf7ce120ee58bd88933e5eb889b90d8108b5b39796a4fa46e3cc524cb47c15a8cad167ca3e3795762c63417b6cb0cb581db5f5672027fd802815599ce747aeeb020;
    stim[9] = 528'h7753460391b2328fb2cac85ab9621fa30f90c6bfd41df048bd1b0b4b97be883c16a7d446d74a977c9d82f29c656dc37ed577c7bf520be57b3aa26be3e80176da4573;
    stim[10] = 528'h700ec9850799f8570e500e15f029e4e1f18a9977228fce5804b84f0440cd1c4c64a95265f893b414be00743e7145777271fe5b64d9525c40357f7c88e63bc8c03b52;
    stim[11] = 528'h0c9750f4ef911aef78afa5a3be1ae45cd5b2c09c1bc50816fd87d673a7cb97874e7c558dd7eba8617346c0acd5dca52ff0912c06dfe446d83fcf7e7fe650e87bf3ad;
    stim[12] = 528'h9c8b1274ab00cad1b87369d33686bf57e4fcdd1e7e4953bdfff85158afe52a9a404d6ef261b6f158a9b21bf31d4e6fdcc16d992ea7b68351ffe1a314ed3b97dd90cf;
    stim[13] = 528'h627c8c8be6e3483f06802c7f12eabb59f16b2422bd026dab55a7bc388504cee6ae1eee78af851b7e8407fb49e8da457f4f50c7acfd6fa7fcb0ab53f7c2d2ddb4198c;
    stim[14] = 528'h835e713aee368cc5bfaf9f26557a7fd6e7ac1cc62bfd90c155317c490a2fb6b18ef96eafc5186de82c2cf0b8d2743328961b9d54833dbf5ea2cfe8daf5c2c7f2befb;
    stim[15] = 528'he7e5abce329b1f550c7741e69675e088027583c02c434772732f3d5fb86bc83b7c6e126a20a48d6a7307484c1d2c95fcf9bf50a03eeca54dfdca76b12d25e096e3f7;
    stim[16] = 528'h36757cb5709c1a4fb60069951f199beacfecad1a22d6f3aca7abd4db08f35b72316a66d5ddc70c608c2893c343b076abc003be5413ad2cf60da4ed29e11b9d78b3dd;
    stim[17] = 528'h6c0635646cb59207bf13cad587f84d7dc714dd0287515dd0d07e46d28d6f1d4ce535900efe615bbde241e17883897e718b6b9dc662b89ffcb9f189b0218716a4f9e7;
    stim[18] = 528'h7a16332d08509189a625057df70af3bc526fd62055b02e85ad2eed0397b8a8e3b7eb63f0e4d2bc6852b4f8a8cc08d62328fcefd359291d44ae510586b4e99e8fa404;
    stim[19] = 528'hff396f3f13c0c1d4103e75bd633c430c1b4fd20209e31372d13dc5da81052ef189cfaca96476076beee3a87c9b77aea412bd180ad1d89f0142b35d9bbf9e3241131b;
    stim[20] = 528'h46b83214b710924bbd008a7503e503a681529eb2b843a493d6b919a929c7fec5619cb1903056966bfc7e2465299d8a375571658b259975cf21f6e0f10114423a9290;
    stim[21] = 528'hdc1be868ca66e8d5b54f176c54feea3a0892af9683418d525c378b364f8e6873860cdb1b2cd24610d2c6b57965add5fc90f9faa7ebc00287995c82d635f6dc66cfb7;
    stim[22] = 528'h6ff99a6462f26d32e7b6063bb8dd5d74375e6a991fd1cceca8ef12b19e7b62f5489b62549e638ae220782d60f268fb6c5487846692afd3523591b4426f897c9eff24;
    stim[23] = 528'hb02b354cef2ae517854a341dd8b27c563e130fdda886817104ffb50654f3a8f18739b17362776c43f0c9eec67c96ef1e20c0ca63cef0a3012db6e2a856eb88e62a80;
    stim[24] = 528'h5af0645a8284544b3d31bb1bfb7655bdd3375387f3bfc7f106952242de57e63311584eed1839177f306dcb1c1be43da4a65804c9c4497addd8111b119a05eb1ba24c;
    stim[25] = 528'h80e0afda098166efa58554df432fa5955de4efb99d34a0797d2212f55560676877696d285264caf69c8f2f1db6cb55cbcc002532aece06c1056c43569d784514e0bd;
    stim[26] = 528'h2c1075effa62a7a51172ef7dede1cc4c6e16afde7faeec3fe4ce4ffed367d693fd7648f59b70845a275eebbd851d4473275525459a762ad72074b51fda85902655f0;
    stim[27] = 528'hae436189d0d6cca598a7033de7886d504a1a2f5fa88cd47cc83535c67ec64d5a8ba8a3b73e888c9ddc8d583a97d7e9e6de32ad7e9761d24e8921c2fb37e5f7029ef3;
    stim[28] = 528'hf32c77ea10a3ced485665f302b4a9a3dab32f7892e1e0b8aa53fa9d7379a477fb7ca1505d3825094ffcea00b5ec918eb2fb093132f71ab4fa3c72d44d207c56ea6d3;
    stim[29] = 528'h0223db914ebad31a203b7d9d86acf4d36972a6a56383f2825b94f9272a8eda8c61a5fd5d50384ba2e107309f95db0a70172c84dfa9ec2fd23186e3e3748bc9805c9e;
    stim[30] = 528'h8928c3acb3f71aed55fdbd5de1e44897de695c7868eb8f4ef520324854cb9232280f0be8f48233b4cf0ee1cc8487a5d45c1837188703c36fb3054758567043e9a095;
    stim[31] = 528'h06f29a2fc54ae257128c428e4c8201fd81dc6fac959c4f4a0a04c41d48a083355b17ce9c8f3877cbcd32789ebd0fa9aa6c2025d85079bb4c525c40877a98a895407b;
    stim[32] = 528'heb95f8b8a2611e388716c96a9bd9091414e87b37ac865d65d32a41ec5100dd6beb6764e3e128267c6e762835e6ef23b1f7758704d6f52f21c9e679dd863332d65767;
    stim[33] = 528'hc3815d8c42e22eee9bf222d53f54fa37f3fbc38d9da877426c3501574ecc98e49892b83c99cee8e4317121ea19ae02ab8b14125d6096b9fdcc012c744836ad799acb;
    stim[34] = 528'hd9b3101265b2e6f7e81b191623251186a3811cb8b43b80538879afb0bbd9251428231abbef57c554f7c3379403675819703addcaa7af609876857495c3b044ddb360;
    stim[35] = 528'hc84f5a055308bfeaa7953f15674084ade0bf3bd65ee4c43b354dd2bbf8df9d231f06ce2b543b0aa6866358efd67c50fbe28347fb05ddb64b95b1a04dbd4d5ef0c858;
    stim[36] = 528'hfcdfaa1c71d70427d693b20fefb62afadedc942ebea4e909ecbe20545f92cf0b693a010ac8dcf9029be7e6f214263be887f72f2dbaed8347548adf75f3e190ca646c;
    stim[37] = 528'hdd3f700e1a649ea5a6b5559fd5bc696a6234d4ea675d07ec97f0359c42c90978caf4bb0a1acc7ff0a8203e96154ef58b3454ad9a2e7dc8445eb2350d992cb6078dea;
    stim[38] = 528'h8838eb0bb0320417a7bcd65ef200044ff49ac3414bc2d4c411545cc89ff338e73313e63b2dbd57c41254eb24bf802682e238161229b640bde1db761c0381333b5df1;
    stim[39] = 528'hd3bc747ad96ba4cf0ef8ac1362ad072dc03ba908aff098ea1eed16a83b992ceb5e09d265654870a4860c4881e57e35f7ca748ccc3df87c0ffef057e950e96a84abf0;
    stim[40] = 528'h9fb6720696b37708fd7ed54b514789fc00a639f1bc15a35c51904e56fe5c400f7a73853df387ba8d6854b72ebb7d6179066e20501b1fcf014dc2f3164e9cc6171717;
    stim[41] = 528'ha822ede62a1761fd785841976449cf429745200bd8f18bdfcc76d87d3f348e274a9483ca3306d2e4a97e08824f4191813b01729f3fa9e8a99fa13351c30f1603fad3;
    stim[42] = 528'h7f330394b18432cd6d5c97fc0b4d0cb24699fc71a8e87aa46506f4b63b49780f88c092f6be06a5f4c7b5c2204d5c68a5a6f0b4cc87fe57ae5cb5e152ebbd909c1086;
    stim[43] = 528'h9b7355b7f1db1ab74692dba2e341c7d4bb58fa9b402cd63aa5c34a6ec73b2295894de22c5e31a00336f3ec9afab4e084ef869fa9f506f78d10e8841d37e87537c1f1;
    stim[44] = 528'h559906c45158fa0492420dda4f3c3aba61792285bed5febedec5979a5bb2379eadd20d3edc905067cc1fddf6a0fd47b45993e526b54afeed6105bd43786b506374b8;
    stim[45] = 528'ha47ffe00032c646f49b62dffed5b478ba382074d40a91e42883b7d8571130751333c5d9896207b261725052ac46f903db07403bd8f70a85939997b29e4a26c14c0ec;
    stim[46] = 528'hf029a32f352f8ce4a3d0393c2f1074fb498161e713f186e7b9c7d983d5b9ee2025b9ec1c5df80f3ba059ac7130d9f249a53294d96554abbcd8dfbe0c0ccef05c78dd;
    stim[47] = 528'hf5967002b1dd8f2131b073d3201b4b85e36450249d2e51788d2d07df1a946d5babba9d21f96f9c2a6f1e194a117a9f84e5b9475242b3be4ed8b7f66f9ebed15067bd;
    stim[48] = 528'heb02195748faa5986f9751eea0c6f459f54e30663213a141f3937a704f0c745c93ce1d4832484bab159873ea36679352dd21c351c3da8ec506913c3cc8260c2ea270;
    stim[49] = 528'ha6db366eca2ab53603bc7e0fb4b0c1123753d88ccfe8426359044e49b3bc5e9b431ef58211d64b94185ddccf7069ef2714f03cdbb4a38246f1afac53494de3b6cba3;
    stim[50] = 528'he09e10818bd7b1f0fc2f88ae421926ce8db12c07c056a2efbd37c23b19fedcf75695fb0a0cb79ef3390ba7d9882ab5cbcbd6a159d60ce2e7f6978b843040e33e0767;
    stim[51] = 528'h1568cd0a154c62f83aae1b3d1eb2a183249d908fe001536769a900d0a69a5c305c8c6a1a307f200867d5dffc0869b4ad86f226a57b5a9682c923e3ab417afc1529ab;
    stim[52] = 528'hd7ebe2a0fc90be55cfc89c911f9b818b2751681164cd2299476f78f62d641e27079fba88964c6ddeaaff1326163dc010ed232f1462635f17002fda5eef974d1001fc;
    stim[53] = 528'h4a680399b01dc116460ae3f73b60bfa048f8642ea33e160a0173fbeeab0cbf29f96f1acce65b99beb65c469677162c9f9439ec4f3b805ab0f58c463f14fb4b1ae16a;
    stim[54] = 528'h79b200b66f28c5c867c092a8c1eb21ed26fcc300e91a78c36cf4df51fb31ca92c894a8d1b7ae938011bf2225af49cba79afbcabff701f13ec9ceeaa15d6cfa5cc8a3;
    stim[55] = 528'h0a52a7ecdadb381323c62d110f516192898a160686948d56e82f148855d322320e2ac497da1362d8d10542b12c4eeefbbda30251d103caf86ffbf0f699ca6380d370;
    stim[56] = 528'h0ea8981ec459248d0c4ceb57580dc3063b7e9f135f7cb446b1b4a8a3cbb4eca921677a2c31f9774573d670971c4835db7862ce4bc328a45c3108509ca839701856b0;
    stim[57] = 528'h6688bc183141f5bc2b398738e35979d382d77d24cb48ef787dbff8c93a50d88259adcb2822a52f7813e00130041303a588a7d35e0c2aea1fc3feef037bd1ad744ab3;
    stim[58] = 528'h65b4e8bb56b9cf202aa66375b7528461e6bf913e045d6b195353a4f2d4ea925fea31f09e59e4a99bf1f00f96c8cf4d9f23f982f3826210a4015202576d70c4a3abe6;
    stim[59] = 528'hb6ec8fadd100aea3674a6c69a1bc8d7549ad5c7bc5b614f0eb3e82bc3076ebcea9408f735fe9e7cf3f9d56965313818e37cb4fa708b516dd2d3aa8d3ddb03a010174;
    stim[60] = 528'h358fd19f22336ab5274d09475fafccf229e013b67a1e195860afa69ee70f14762590c55f7372e12cde0cbf99d043dff05fca9b1beacfa7efecb28867418c75198c17;
    stim[61] = 528'h7a0a4cd2abd71354e807b62acaf4aaaab36d74a127482f528aed6c915cd1868e58b8a51aa7f90122313e79a0b66fce6c7cd572d323bc2cbe75daf278482981f1c1d1;
    stim[62] = 528'h681c570672253f50fd82ad28671c1f97fa55f86328b5061da6ac5180c9dd5af42000d096b907d786cb2e014dd157ca93ae54e6fe371f829326005344e0730e671f5a;
    stim[63] = 528'h0f23006fa45ce2f5ae199e0837f71fcb3704c9434279808b4246b68c17f8ac62a73a8aa1b692c954cd3fc469c0b26acf856a3762207cbb086bd412359fdb08dfbe57;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h0000;
      expv[5] = 16'h0000;
      expv[6] = 16'h0000;
      expv[7] = 16'h0000;
      expv[8] = 16'h0000;
      expv[9] = 16'h0000;
      expv[10] = 16'h0000;
      expv[11] = 16'h0000;
      expv[12] = 16'h0000;
      expv[13] = 16'h0000;
      expv[14] = 16'h0000;
      expv[15] = 16'h0000;
      expv[16] = 16'h0000;
      expv[17] = 16'h0000;
      expv[18] = 16'h0000;
      expv[19] = 16'h0000;
      expv[20] = 16'h0000;
      expv[21] = 16'h0000;
      expv[22] = 16'h0000;
      expv[23] = 16'h0000;
      expv[24] = 16'h0000;
      expv[25] = 16'h0000;
      expv[26] = 16'h0000;
      expv[27] = 16'h0000;
      expv[28] = 16'h0000;
      expv[29] = 16'h0000;
      expv[30] = 16'h0000;
      expv[31] = 16'h0000;
      expv[32] = 16'h0000;
      expv[33] = 16'h0000;
      expv[34] = 16'h0000;
      expv[35] = 16'h0000;
      expv[36] = 16'h0000;
      expv[37] = 16'h0000;
      expv[38] = 16'h0000;
      expv[39] = 16'h0000;
      expv[40] = 16'h0000;
      expv[41] = 16'h0000;
      expv[42] = 16'h0000;
      expv[43] = 16'h0000;
      expv[44] = 16'h0000;
      expv[45] = 16'h0000;
      expv[46] = 16'h0000;
      expv[47] = 16'h0000;
      expv[48] = 16'h0000;
      expv[49] = 16'h0000;
      expv[50] = 16'h0000;
      expv[51] = 16'h0000;
      expv[52] = 16'h0000;
      expv[53] = 16'h0000;
      expv[54] = 16'h0000;
      expv[55] = 16'h0000;
      expv[56] = 16'h0000;
      expv[57] = 16'h0000;
      expv[58] = 16'h0000;
      expv[59] = 16'h0000;
      expv[60] = 16'h0000;
      expv[61] = 16'h0000;
      expv[62] = 16'h0000;
      expv[63] = 16'h0000;
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
