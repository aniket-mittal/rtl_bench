// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 194;
  localparam OW = 263;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03552 dut (
    .aclk(clk),
    .aresetn(in_vec[193:193]),
    .s_axi_awaddr(in_vec[192:161]),
    .s_axi_awprot(in_vec[160:158]),
    .s_axi_awvalid(in_vec[157:157]),
    .s_axi_wdata(in_vec[156:125]),
    .s_axi_wstrb(in_vec[124:121]),
    .s_axi_wvalid(in_vec[120:120]),
    .s_axi_bready(in_vec[119:119]),
    .s_axi_araddr(in_vec[118:87]),
    .s_axi_arprot(in_vec[86:84]),
    .s_axi_arvalid(in_vec[83:83]),
    .s_axi_rready(in_vec[82:82]),
    .m_axi_awready(in_vec[81:80]),
    .m_axi_wready(in_vec[79:78]),
    .m_axi_bresp(in_vec[77:74]),
    .m_axi_bvalid(in_vec[73:72]),
    .m_axi_arready(in_vec[71:70]),
    .m_axi_rdata(in_vec[69:6]),
    .m_axi_rresp(in_vec[5:2]),
    .m_axi_rvalid(in_vec[1:0]),
    .s_axi_awready(out_vec[262:262]),
    .s_axi_wready(out_vec[261:261]),
    .s_axi_bresp(out_vec[260:259]),
    .s_axi_bvalid(out_vec[258:258]),
    .s_axi_arready(out_vec[257:257]),
    .s_axi_rdata(out_vec[256:225]),
    .s_axi_rresp(out_vec[224:223]),
    .s_axi_rvalid(out_vec[222:222]),
    .m_axi_awaddr(out_vec[221:158]),
    .m_axi_awprot(out_vec[157:152]),
    .m_axi_awvalid(out_vec[151:150]),
    .m_axi_wdata(out_vec[149:86]),
    .m_axi_wstrb(out_vec[85:78]),
    .m_axi_wvalid(out_vec[77:76]),
    .m_axi_bready(out_vec[75:74]),
    .m_axi_araddr(out_vec[73:10]),
    .m_axi_arprot(out_vec[9:4]),
    .m_axi_arvalid(out_vec[3:2]),
    .m_axi_rready(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 194'h1059e7de8e16d3374f2475ec8cd9deac0950d5266fa081388;
    stim[1] = 194'h1670f096aa3dfe5c3379364c13013e766a6641901dd38c69b;
    stim[2] = 194'h39d718e6cd02b64a9da9fb31dba667597d65910ab8781a039;
    stim[3] = 194'h3348ba045f4ec48e6cb36c59864484fe592effed18cfe9917;
    stim[4] = 194'h2098c6f41ca1ec5bb8f0c57af5fdcecaf250668253d601ee9;
    stim[5] = 194'h2239d3ad052d044aa8f90557963edfe3e55b4b54ce6583f08;
    stim[6] = 194'h37cba879a7c994d24dd0120a1d86684699ab55269191658e2;
    stim[7] = 194'h065101872784f09533845f289bfe7f0691eb573e63861853a;
    stim[8] = 194'h0c5e53f799b3fd54cd925a961312534770cb5c562362d7f64;
    stim[9] = 194'h2ced8312bd513a06532c7106c2cc6dab7b2bbaea31710ff91;
    stim[10] = 194'h23821262800b0df17a60bb30e09e0b5e300ec12bfdd584e09;
    stim[11] = 194'h23b5f92c5d12da4ab6c8d17623ba1ca5387747027fb80cbf7;
    stim[12] = 194'h2341ab0cffef56a4decf279bae5d7253670b7534cf3691c2e;
    stim[13] = 194'h24022a7e302fd322b469bbfc04a11e85728b7d5491cd99e35;
    stim[14] = 194'h3f16ba670371a8bfe1df5054ffe39d337fc86e2ff5ba0bd4f;
    stim[15] = 194'h36cc9bea0b5d6e4e06e95abb0f630479cfbab174ee9d644db;
    stim[16] = 194'h395ad59f7f52ebff4bab28419bc7fb254ccb2ddd05dbc24d7;
    stim[17] = 194'h2075f295d4fab6e60d54917575b5c333e62c1124194f5e798;
    stim[18] = 194'h23d9bb429872899b961f112127725304ec93f953c11e3ca00;
    stim[19] = 194'h02399f49ddb1cfa599e69bdc31cbe7a9bc769965eb96fe191;
    stim[20] = 194'h378be1b4f53e3214646d6399f68d1a25e534ecad1cf979775;
    stim[21] = 194'h1f4c2dc949bff420bdce71037af09ae28cd225f8c0b9ffefc;
    stim[22] = 194'h358b8ad20be42c9c933110c410cd7185d39bea175cff83a57;
    stim[23] = 194'h38ed7e821d1fa07bd1fc64b6fb578a69ef34ccd4357c58ca6;
    stim[24] = 194'h2411d60a4ccf6cd11e6339f03c8dab763a68f8c51ee467146;
    stim[25] = 194'h3cc6aca79fc44d9bebe52ff50a132a7ceaf340dd307f1c9e0;
    stim[26] = 194'h2ad9208f1040f50669fc1ff781c2c1c53e954c169501adf65;
    stim[27] = 194'h258b041453e4bbfc1894f8263d573759a1873a888eea2ebea;
    stim[28] = 194'h3601ca998dc2f002b9580bf3cda8d34955656fe1635885f7a;
    stim[29] = 194'h3ef9ced5cf9bacc6d563a1bfba9cffb4760fbffb7d4a150ea;
    stim[30] = 194'h2ec931dd53148712ee735485988f88ca353e049e16dd5d1c7;
    stim[31] = 194'h2da30304e5448602e4c8b443bd020c024b782b22f58d620fb;
    stim[32] = 194'h3fe2cace455fe5d63630e865842b20958cc1463f0f21be5b9;
    stim[33] = 194'h3be5765601e722d48f441768c3ae670431f42ae0835d1f4f1;
    stim[34] = 194'h29d638ef367ac15ebc7bf7f02b1c5edcfe23c5be2ab4a4021;
    stim[35] = 194'h248d2e6b5456f7f4ba3150ea95d899fdd0d35e156a2c8fc99;
    stim[36] = 194'h2d40b566a562a2183c794c3e6b17f9dd6f43d5b5615f017a4;
    stim[37] = 194'h25b8912a7d75df7f0d54f98440b3de76afe1d652ecf40cdb2;
    stim[38] = 194'h35530d1d38fe38f7500bd1514268e6e85f335bfc89572e44f;
    stim[39] = 194'h210b9e8b9675e46cd0b7759dbda87c49985e96244f90aaf54;
    stim[40] = 194'h36a297c1f2228036f66d8b214a98a26a21e7de821cd337195;
    stim[41] = 194'h2a7cecb240117a7f3a3965816df47dc1f3ed7c6bcc117e755;
    stim[42] = 194'h3b6d77b7c3ff5a95f7ddeb5ea93dd58a4b8c9bbaca454cf2a;
    stim[43] = 194'h34c31fab5f707d69970544b09993dc9b5f73112d50ced414e;
    stim[44] = 194'h255cd4a906705079f47b81ccb3e5f8b3e12788ebb0c10e69f;
    stim[45] = 194'h2092c3f5d454733df636b4830e7db9724c95fe8babb30dbe3;
    stim[46] = 194'h3d4ab3d6ee1b4e85fbcc99819358c2f48d87f8a1832207d43;
    stim[47] = 194'h22f43f897991a42e099cb4d10499ef78d97c5d56667655e84;
    stim[48] = 194'h2db0a57a7cdd0e9785dbd85f0eaec947739e0f8bb4651b819;
    stim[49] = 194'h2a70ac6f3c5c35c0216f68428f0147c86789aac839b7ddd57;
    stim[50] = 194'h2664897e2bbc91b0c3acda0e54cab850a08a9cbdb10952173;
    stim[51] = 194'h3556cc731031e7f971e45c960f57da2fd718ed5c7bcbc1146;
    stim[52] = 194'h3fbc467be04049eeaf3a5cd7cfd45b51b190eb287a26f222d;
    stim[53] = 194'h26be8407893d2283140b4d5dcf3bfbcd9f07bb57c44e39fe7;
    stim[54] = 194'h341e342846a288f72e354793ed41ec42e0972b08ec1ca5c58;
    stim[55] = 194'h3930bc962c940fc683a038d596f53a2d7b47629dae34c8262;
    stim[56] = 194'h34b24125ad1a8b300fea69f27c1b22ea2ef2105589b1c5f95;
    stim[57] = 194'h2a3dd3677aaca12eb53bfaf31e98fc4700ef93dc7c92d5062;
    stim[58] = 194'h220a712e10fcddfc6e7aa893281949b315a8365c6eb1215fa;
    stim[59] = 194'h3d9172f53dcd9c9179e79c373e07ea0223213fc36703051ce;
    stim[60] = 194'h2c445bbe92aea786e6e8d67f6ecfcb0f8c32a6c2f6a7a3bb3;
    stim[61] = 194'h2285d647f7e26d384acb563e6dcb178d3dc48ffa6a50406b6;
    stim[62] = 194'h27db6e97815b94c2c1d0957fb937ad4903adf20b27b61a60f;
    stim[63] = 194'h3e3d060261537cbf6c8336d4cebf2276767db2bfcac171308;
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
      expv[0] = 263'h000000000000000000000000000000000000000000000000000000000000000000;
      expv[1] = 263'h000000000000000000000000000000000000000000000000000000000000000000;
      expv[2] = 263'h000000000000000000000000000000000000000000000000000000000000000000;
      expv[3] = 263'h2d5c3c0d0173ae31cdb3ae31cd9b2056c953a056c953b74cfd98edd0fd98edd363;
      expv[4] = 263'h3e8c67f4c8e6917408a6917408bfe9d891cda9d891cd9571b62cc321b62cc3224c;
      expv[5] = 263'h3929eb00f741318de801318de83f143d8b77143d8b771df062bd7afc62bd7afedf;
      expv[6] = 263'h786732c1f90473a75a0473a75a0925a0895525a089551dfc82abcb1c82abcb1f6f;
      expv[7] = 263'h000000000000000000000000000000000000000000000000000000000000000000;
      expv[8] = 263'h000000000000000000000000000000000000000000000000000000000000000000;
      expv[9] = 263'h000000000000000000000000000000000000000000000000000000000000000000;
      expv[10] = 263'h3118b887fc59db062559db06257f2a2740ca6a2740ca664e388361663883616643;
      expv[11] = 263'h0ffeeac271470424c5070424c5000161be2f4161be2f4cc05d98704c5d98704f60;
      expv[12] = 263'h733fdc065ec76bf258876bf258bf225b4956e25b4956d98c68bb11dc68bb11dd20;
      expv[13] = 263'h4c679b48e186835619c6835619fffdead49bfdead49bd98f93cdd72f93cdd72ed3;
      expv[14] = 263'h7248e6ccf0c80454fc480454fc6405fa645685fa64568cccddfe0250ddfe025090;
      expv[15] = 263'h65fadd05ebfe2d74ce3e2d74ce00ee3517fc2e3517fc3bbfa82a7ff3a82a7ff1bc;
      expv[16] = 263'h2c774eb2276d9937d42d9937d412ebadc9c0ebadc9c0ddccad5d87b0ad5d87b1b0;
      expv[17] = 263'h4282ede126f2b5ab3ef2b5ab3effea5d7fe96a5d7fe9774d9420cde19420cde3ff;
      expv[18] = 263'h040ca7af3d00ebe52b80ebe52bad1f56dcc19f56dcc1aab248babada48babadadf;
      expv[19] = 263'h000000000000000000000000000000000000000000000000000000000000000000;
      expv[20] = 263'h000000000000000000000000000000000000000000000000000000000000000000;
      expv[21] = 263'h000000000000000000000000000000000000000000000000000000000000000000;
      expv[22] = 263'h000000000000000000000000000000000000000000000000000000000000000000;
      expv[23] = 263'h53ae7fc1d2eb1715a42b1715a412fc8593927c85939266708862086488620866d3;
      expv[24] = 263'h081abe2c64b1dafd0431dafd043f23f40f7a23f40f7a3ffe325b7daa325b7dabfc;
      expv[25] = 263'h0e8f72338a8823ac148823ac149b19ed9a23d9ed9a23ccc19cf81e459cf81e46dc;
      expv[26] = 263'h0e983f8e4e398d594f398d594f3ff889b37d7889b37d7fc297fa850a97fa8509b0;
      expv[27] = 263'h1b4a80d6fad5b2411e15b2411e24081ea0cd081ea0cd3ffe0ffbc0e20ffbc0e12f;
      expv[28] = 263'h6c4775175f0b1608288b160828a4fc977f833c977f8311327c131eaa7c131eabf0;
      expv[29] = 263'h48b1ac42fb2c0395332c0395331b385e0057385e00572abc05f9e6d405f9e6d40f;
      expv[30] = 263'h77bea50a873df39dabbdf39dab9bf37598dab37598daaec1d0dfdd4dd0dfdd4e4f;
      expv[31] = 263'h190b6eae8edd9263ba9d9263baa4e290e25de290e25dccf1aa42cc45aa42cc47fc;
      expv[32] = 263'h217ac6b1075b460609db460609c92890c05ca890c05c998c5a21de805a21de8120;
      expv[33] = 263'h178790df2d7fc5959cbfc5959c892bfcbac6ebfcbac6c4707432c2147432c215b0;
      expv[34] = 263'h2241ae8fa677caecac37caecac003ce45a91fce45a91ea820bb461d60bb461d763;
      expv[35] = 263'h7f155a520053ac71de53ac71de6dcf582bd78f582bd78cfdfbf8158dfbf8158e43;
      expv[36] = 263'h5eb51647e5491a5cd6891a5cd6ad0adefe974adefe974470a8754aeca8754aec0c;
      expv[37] = 263'h5eb0af80bc9a816acd5a816acd492c544307ac5443078cfca61f3588a61f358bff;
      expv[38] = 263'h6f767a066c0b712254cb712254ff2ebbefe1aebbefe1aab27cc2205a7cc22059bf;
      expv[39] = 263'h3844ab9723eaa61a3a6aa61a3a761fc71eea1fc71eea000de8a8a135e8a8a1340f;
      expv[40] = 263'h6827c8557a82173d1702173d172dcebc8d9a0ebc8d9a1573baceded7baceded403;
      expv[41] = 263'h090e699b8ced452f83ed452f83e4c45006dec45006decccec590a54ec590a54c0c;
      expv[42] = 263'h79e608bf3ad4f9d96494f9d96480022f4fe7422f4fe7447cb2c0b6f8b2c0b6fa43;
      expv[43] = 263'h716522a67936daef6fb6daef6f80ffeb52beffeb52befbbef5af549ef5af549edf;
      expv[44] = 263'h74a8676a0ba9863f56a9863f56bfee0fad32ee0fad32e202a2584ccaa2584cc9bf;
      expv[45] = 263'h55d8608735cab9a9520ab9a95209ce0a0f3e8e0a0f3e8cfdc0e659f1c0e659f2df;
      expv[46] = 263'h4dd5d986de412587eb812587ebad0a8e67beca8e67bec4735a41873f5a41873edc;
      expv[47] = 263'h1ec19103ea7a9567adfa9567addbc369d0bf4369d0bf7b8e4cc0c9ae4cc0c9ac0f;
      expv[48] = 263'h2d333b2af485e87f12c5e87f12f6323485c1323485c1333e5a68824e5a68824c9f;
      expv[49] = 263'h0bda328dc15b614af4db614af4ff1ba1d2f09ba1d2f0bbbdec2f8755ec2f87576f;
      expv[50] = 263'h381cdbeeead4e158de54e158de7f0b86b8040b86b8042ecfb4214783b421478093;
      expv[51] = 263'h4cd884a90a4cc912fc4cc912fc52f792361877923618774e6d072a666d072a652c;
      expv[52] = 263'h423de5e08aaaad98e62aad98e624063cff2e063cff2e3fc22e4b07aa2e4b07abff;
      expv[53] = 263'h4c3d137911ff788cf7ff788cf7c008093dd5c8093dd5e67d2e6be7e92e6be7ea43;
      expv[54] = 263'h5be2271cfecd7d080f0d7d080f1227a45062a7a45062800da6aee79da6aee79dbf;
      expv[55] = 263'h28760e52e3283c6850a83c685089d4511ee5d4511ee5c472a3c9f6a2a3c9f6a09f;
      expv[56] = 263'h42d71a64123261792c7261792c5b1281f8d05281f8d077401c6acb781c6acb7ad0;
      expv[57] = 263'h18c4d8e2fce964824b6964824b5b23516601e3516601ffcd34f93e0d34f93e0db0;
      expv[58] = 263'h6a3e496a82147ba6ced47ba6cef6d59425d6959425d6a67dfd798f4dfd798f4c0f;
      expv[59] = 263'h14375890af0414e25c0414e25c241f9bbf8ddf9bbf8dccfd5449940d5449940c93;
      expv[60] = 263'h01b381828fbb22e5ea7b22e5ea7f39b3922f39b3922f3fc3ce1b9f03ce1b9f03ff;
      expv[61] = 263'h037b53d1dc5888b77d1888b77d24d5d4f0dcd5d4f0dcddcc6b3fb7646b3fb767ff;
      expv[62] = 263'h7335282034850bac8fc50bac8fedfc4da7097c4da709598dab1f36e5ab1f36e5b0;
      expv[63] = 263'h2993db0d31cfb6dd2f0fb6dd2f002b7298582b7298583bb04abfdc984abfdc9bfc;
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
