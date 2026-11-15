// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 324;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00065 dut (
    .ap_clk(clk),
    .ap_rst_n(in_vec[323:323]),
    .in0_V_TVALID(in_vec[322:322]),
    .in0_V_TDATA(in_vec[321:290]),
    .weights_V_TVALID(in_vec[289:289]),
    .weights_V_TDATA(in_vec[288:1]),
    .out_V_TREADY(in_vec[0:0]),
    .in0_V_TREADY(out_vec[18:18]),
    .weights_V_TREADY(out_vec[17:17]),
    .out_V_TVALID(out_vec[16:16]),
    .out_V_TDATA(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 324'h319d029418321242fb4f934b1e6f2ce09d1a8dc1ec2af9bb4bf009d150075955ed3749685f5fc7ed8;
    stim[1] = 324'h4fbb1facc092ee4e59315c838c96b70782b406d8e0b131a07660b1fb0dcea01388e084b4f8f6c7fbf;
    stim[2] = 324'hcd35c298edc1dc4debe2568b725b88aa30f1176631520360ff297e674fe194969eb9031d2f1cf67b4;
    stim[3] = 324'h51978698ea8807c7b65f20f6b0affacc9b5b5b79b4187d56580fdf1805e6c08e431190623387d5472;
    stim[4] = 324'hfbad9065472733fd6baebbca80765794e50522e57b12bf6df9218e8b9f7d8c62b5d1a24ab01f00902;
    stim[5] = 324'ha6cfe9eecbd5c88da89505f946dd8ba8aea0bb30de5967752c5e4ee54fb0b5dfaa0ea42f949c8ac74;
    stim[6] = 324'ha37966c726000ea337c7bdfc51bf950fea54c672a68ba00bffaaa0dc9e1fd35e1bb967aff17d36df1;
    stim[7] = 324'hd13600519da939e58de875cdcd7b99a5c213a2466d2b578818ba5f91d4ca2492e597e8c8b65c27051;
    stim[8] = 324'hbf13498d976295bf1fcd3b2e05f28c881aa22a10f5d426209faa9c7467ddc0eb02d802ae7373332c8;
    stim[9] = 324'h837d6036f22b77c47226dbc96653ed615153567dcf5c0d8443d88c533aa53c2b529144835377bd79a;
    stim[10] = 324'hb7b3fc041fd7650d48834722300e001cad46479fcfb300b42a545245a40ef5539dde0ed4c057fd615;
    stim[11] = 324'ha735943e27fee33ca908380cc8560d329a3626d3b074ec403ac228a4d8dca1a7e82c8c75653bce423;
    stim[12] = 324'hf951c57b5ccd7c7c0f6659ae1c909790d582f1187eafb71c19d11a66ef3b95011eeca124dfc6b3b1f;
    stim[13] = 324'hd3a1afadfa5460ad91371c5a44661fbdc34e0a30f58cfb28f0900300891048522df90898810e94e4a;
    stim[14] = 324'hb0ddd5cfc63742ed15f65aef2291f2e5610cebde5d9dc5d5aeb3575464bfe04b530e85afc955ab9d5;
    stim[15] = 324'he67d0bcf5eb462b64f247c1ca403bde4d66c42f90d84e23cf02de796bb9332841e48c94ddcc46f673;
    stim[16] = 324'heff626bc03cc7e00d1b4b6f0ac80f446d4b2b0751b42a45dacd551a0be6d2a1044a5f3d1173248ec2;
    stim[17] = 324'hb9c8aaa799eba5e4091bfc82c0986a00a39ded714a30656153a5f3899ee4ac1066a96f9e3a7186415;
    stim[18] = 324'hb8b668535564b6f2cf42a2b9cbc8bdd8d4d276cc12c25efaffbdc19c6ef8b4ee099fb4e602a801716;
    stim[19] = 324'h898514f85707b56eb89f01f0c8dfed41ccaa8ea9623a9d43e3ca9328331e1ae094b89b6d83599d462;
    stim[20] = 324'haaa32fb1b64967cbbf01da0c2d6419f8a654c49b18621b78add0d11964e214adb7d80cd744ba49dbe;
    stim[21] = 324'hb386e5a78907cc227e80d33ca256731ec12601036381f65802d8083cb2cec7c356cab3a0d0d640fa0;
    stim[22] = 324'h8ef4decab7a9659669038494b25a05ec22d04d3d658650f1a3381bba395b4a28769108cd3f37ae0f2;
    stim[23] = 324'h8430526883748267950eda9149217ec93b8e1ca46c65c2fce83b956e98955f2ae6a30e894dd09acdf;
    stim[24] = 324'hd30a14fa9b118cedd49e81edf7f5195ba0ef7f34d419a2297d18f7ab8238c3a5c61a602431e3b8d45;
    stim[25] = 324'hec6c718808ea06c78c13aa544c77246b18da983907d0a83454265a221980f8f42f5e4183e4497b7b9;
    stim[26] = 324'hefff8e9647f6b4dc5132bb552450fc60e163b561e5457816af176960477697c331178d91b0d30fbb3;
    stim[27] = 324'hef749ef37b9f9c3fc36ee289d14c025c33967757ac7225fe83b103a3d7e2a946071d59973ba8a39f3;
    stim[28] = 324'heab094f969708618cfc630e3410ab9351be4f4c9ae493af7b50f763b868be81ee852e444c78eaad1c;
    stim[29] = 324'hd1fd7c6db864320bf7624c89313d770e61e6c952bc859b8db50cbf0c100846f5cf86208517c752b25;
    stim[30] = 324'hee8b98c18ebcf2f89b707cb7d29cbc158ada91b980ce96b1cb2c5dd132bff70e428a8bef584c8a18d;
    stim[31] = 324'hb43e9f85f3727ce66840e059907267f44afb621062a246291cc63932f27162f50955203c57ecd6c6b;
    stim[32] = 324'hade1fac13ea7502c324ef09df6467c7c15a66241501bc2470f021fcb9be4b773a500926c1c382c3e9;
    stim[33] = 324'hfa31109430647d408675af0d9a025716d50969e262ceef6644a4d43b840b65270d31c0d6f7881c39d;
    stim[34] = 324'hcb63883cfe45376e63da9f3c4587652b9eafd49a5b0c54e1f4fdd6fee7dbef19ff8eaac6b2f7c9fac;
    stim[35] = 324'hf35c8428eef0289c6ded1f7e93d591ba5d94619a6b83a8ba9b727bcfcb8fa7ca8af82ad738851f1be;
    stim[36] = 324'h9cdb3dec6eebf185e2160dc37636eee0ee1d410448ee5bd8b7200616a9cdb04967d625793e01a5200;
    stim[37] = 324'heacebe13c2c230bf10b048412f2df424ed109059b67a508903f2bed02ace1bff1c3b0c03bbb208487;
    stim[38] = 324'hb943d683fec549c16c8f3e2c6db8fcde174fa05273c22d84989a6e2ed6cc3aebdc21f8ad7a67d37a3;
    stim[39] = 324'hdee448c954d57d218089856dd01545f3e4fce90477b9195dd9cf07c33e21fc46af16b3a2b70304bef;
    stim[40] = 324'h9979232cc3cce55219e40b991437e30c0d57cc408d2bf5aef75e339e57026f131be40edffa8a8e7c2;
    stim[41] = 324'h9c775e952c52d7f4aacca4d669d8de471e6fbda175039d4f950f8641ebc7e73df86cfc1abd4fbca09;
    stim[42] = 324'ha1e5970bb2fc596a391decaaadcc1028bd4a3d1cb7aa5a013cd828706e460e10f31688cf3eae73463;
    stim[43] = 324'h88c55b5aca5d8a26ec6894dcadae1a622bd53e0170125b035c4ed062257dec7cc3c03fca0a7e4362c;
    stim[44] = 324'h830d46077b718e571f5a0a617ae46fa3abb704530ddc8f3e33768694030df0170742165eba7638150;
    stim[45] = 324'ha4e99f5c6cac62c3666d39265204ce89e51c7dccea02eb871cbf4cd74e3a4baf08717237dcf3ea8cd;
    stim[46] = 324'h95fae6fb302696a07567851196e5108f9e6070473cc887f0178dc2f92e54bb0207c85dee0c3ea07b3;
    stim[47] = 324'h830d75ca8b2618dd121ee03a359005229b8cab07d038de0c7e43b7d380ede16c9d0742af085d3e25e;
    stim[48] = 324'hb9e8d975712ac015f4872552dad1114f9afcde87ecce9b6bab2801484dec8ead905e72b6a2ad8e20b;
    stim[49] = 324'hb82f55590b15b16708f880453d591367d59ec29ea1e2940af0ae5afc764569c946786d530ebe50366;
    stim[50] = 324'hf41823ebab32f8e886a37d49df37d89dec3df91e0685a6769090939a740e6cf4071363cb5ce1da393;
    stim[51] = 324'he95322a8145c834105aff02904eb5712fcaba2a9ca62794cd4c147fe50783e9f6274b824d3726c888;
    stim[52] = 324'h918b680a856b72032938782076b3e74681f36e3df1973f05ba0ae0147993d179f33fe551989c1a4e5;
    stim[53] = 324'hcbb5b43f1b76a35db4e4b33c5bf3424a27dc9439c9cba1c21df049e2ea7ff23d3b5885759eb8aff9e;
    stim[54] = 324'h962227a638c57ebd5aa1999c29de660c53d172da05e123c08406bffacb7bb11e805b917c43e35d721;
    stim[55] = 324'hf655d410135c703aee27583f1fe188725f43e1044f9573d92159610471ca19ac047a7f854b15437ee;
    stim[56] = 324'hb56a2c66672c685932c1ca47339c967c4f5a50bc7c186b0591e50daa857d03cc486002b23aa09fa43;
    stim[57] = 324'he9f1954841e5599aa47dd196bc090120a6f74ba7d5e444f5774969e20c0cfe826d76fded71a06fba9;
    stim[58] = 324'hf54c898b0b93d88bd21559d54b7cde5d995b1cbbb5dad825f86f1c6030fcd3b4830c81daf0e82c482;
    stim[59] = 324'hc364d4474afca9d02d1684e59ef8d9f096cc3f1e026383f0ac5b019990dfaf9f62e258eb04fe58379;
    stim[60] = 324'he48a85172f33b9b5238a99511cb232045c27d94d7c215b880300e4e8c39b775444c731b328ffd7a05;
    stim[61] = 324'hcff253a9c594c3987bfbbb9a58d59230398fa53c9be432ee347ac8380e3983f4c79948eca866cf19c;
    stim[62] = 324'h9fe1c9beddcb86f3a6f429e401ece8a8f9dce48c9f72e4fc99ff04027ba2e237834f8c537bcaeb295;
    stim[63] = 324'hca34d2c50092d9272ab43c9569cf03c6267bc4d5c4642bc358c157f81a82ca80ffa6c0ea1614d9c5f;
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
      expv[0] = 19'h00000;
      expv[1] = 19'h00000;
      expv[2] = 19'h00000;
      expv[3] = 19'h00000;
      expv[4] = 19'h00000;
      expv[5] = 19'h60000;
      expv[6] = 19'h60000;
      expv[7] = 19'h70000;
      expv[8] = 19'h70000;
      expv[9] = 19'h70000;
      expv[10] = 19'h70000;
      expv[11] = 19'h7ffd0;
      expv[12] = 19'h7470e;
      expv[13] = 19'h7470e;
      expv[14] = 19'h7470e;
      expv[15] = 19'h7febd;
      expv[16] = 19'h72827;
      expv[17] = 19'h72827;
      expv[18] = 19'h74d0d;
      expv[19] = 19'h74d0d;
      expv[20] = 19'h74d0d;
      expv[21] = 19'h74d0d;
      expv[22] = 19'h74d0d;
      expv[23] = 19'h74d0d;
      expv[24] = 19'h71710;
      expv[25] = 19'h73b70;
      expv[26] = 19'h73b70;
      expv[27] = 19'h7099a;
      expv[28] = 19'h7a520;
      expv[29] = 19'h7a520;
      expv[30] = 19'h733e5;
      expv[31] = 19'h7d73d;
      expv[32] = 19'h7df06;
      expv[33] = 19'h76dd6;
      expv[34] = 19'h7c43e;
      expv[35] = 19'h7c43e;
      expv[36] = 19'h7c43e;
      expv[37] = 19'h7c43e;
      expv[38] = 19'h79e5c;
      expv[39] = 19'h71b00;
      expv[40] = 19'h7a700;
      expv[41] = 19'h7a700;
      expv[42] = 19'h71835;
      expv[43] = 19'h71835;
      expv[44] = 19'h71835;
      expv[45] = 19'h71835;
      expv[46] = 19'h7fc15;
      expv[47] = 19'h7d048;
      expv[48] = 19'h7d048;
      expv[49] = 19'h7395d;
      expv[50] = 19'h7395d;
      expv[51] = 19'h704b9;
      expv[52] = 19'h704b9;
      expv[53] = 19'h79c66;
      expv[54] = 19'h79c66;
      expv[55] = 19'h75520;
      expv[56] = 19'h75520;
      expv[57] = 19'h7e1c0;
      expv[58] = 19'h7e400;
      expv[59] = 19'h7e400;
      expv[60] = 19'h79641;
      expv[61] = 19'h767ac;
      expv[62] = 19'h767ac;
      expv[63] = 19'h78bdc;
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
