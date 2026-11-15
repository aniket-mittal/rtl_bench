// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 228;
  localparam OW = 177;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01304 dut (
    .aclk(clk),
    .aresetn(in_vec[227:227]),
    .s_axi_awid(in_vec[226:215]),
    .s_axi_awaddr(in_vec[214:183]),
    .s_axi_awlen(in_vec[182:179]),
    .s_axi_awsize(in_vec[178:176]),
    .s_axi_awburst(in_vec[175:174]),
    .s_axi_awlock(in_vec[173:172]),
    .s_axi_awcache(in_vec[171:168]),
    .s_axi_awprot(in_vec[167:165]),
    .s_axi_awqos(in_vec[164:161]),
    .s_axi_awvalid(in_vec[160:160]),
    .s_axi_wid(in_vec[159:148]),
    .s_axi_wdata(in_vec[147:116]),
    .s_axi_wstrb(in_vec[115:112]),
    .s_axi_wlast(in_vec[111:111]),
    .s_axi_wvalid(in_vec[110:110]),
    .s_axi_bready(in_vec[109:109]),
    .s_axi_arid(in_vec[108:97]),
    .s_axi_araddr(in_vec[96:65]),
    .s_axi_arlen(in_vec[64:61]),
    .s_axi_arsize(in_vec[60:58]),
    .s_axi_arburst(in_vec[57:56]),
    .s_axi_arlock(in_vec[55:54]),
    .s_axi_arcache(in_vec[53:50]),
    .s_axi_arprot(in_vec[49:47]),
    .s_axi_arqos(in_vec[46:43]),
    .s_axi_arvalid(in_vec[42:42]),
    .s_axi_rready(in_vec[41:41]),
    .m_axi_awready(in_vec[40:40]),
    .m_axi_wready(in_vec[39:39]),
    .m_axi_bresp(in_vec[38:37]),
    .m_axi_bvalid(in_vec[36:36]),
    .m_axi_arready(in_vec[35:35]),
    .m_axi_rdata(in_vec[34:3]),
    .m_axi_rresp(in_vec[2:1]),
    .m_axi_rvalid(in_vec[0:0]),
    .s_axi_awready(out_vec[176:176]),
    .s_axi_wready(out_vec[175:175]),
    .s_axi_bid(out_vec[174:163]),
    .s_axi_bresp(out_vec[162:161]),
    .s_axi_bvalid(out_vec[160:160]),
    .s_axi_arready(out_vec[159:159]),
    .s_axi_rid(out_vec[158:147]),
    .s_axi_rdata(out_vec[146:115]),
    .s_axi_rresp(out_vec[114:113]),
    .s_axi_rlast(out_vec[112:112]),
    .s_axi_rvalid(out_vec[111:111]),
    .m_axi_awaddr(out_vec[110:79]),
    .m_axi_awprot(out_vec[78:76]),
    .m_axi_awvalid(out_vec[75:75]),
    .m_axi_wdata(out_vec[74:43]),
    .m_axi_wstrb(out_vec[42:39]),
    .m_axi_wvalid(out_vec[38:38]),
    .m_axi_bready(out_vec[37:37]),
    .m_axi_araddr(out_vec[36:5]),
    .m_axi_arprot(out_vec[4:2]),
    .m_axi_arvalid(out_vec[1:1]),
    .m_axi_rready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 228'h167dc83846ddda3fd743e42a6f8bb4e2d86d51625974da706f90ac7f1;
    stim[1] = 228'h5ed7cb026a28ae0201d1b6f439c5d9ca693f416e51bd7d4832ed30307;
    stim[2] = 228'h9e891bfbe0c38bc902bcf5ef3318b80be99a314e568407055af573f88;
    stim[3] = 228'h9e6dda3534ca584024a3accb0f501f0db98fd15b19cbdb8b9b9b7622d;
    stim[4] = 228'hec47f206797dba33887953b9b6e639cda87f606cf6a97b4c50f4d5027;
    stim[5] = 228'h85b7bd95d4f96eb5802a1f31f14e7a4434b7159da2a4a7f656fb08c7d;
    stim[6] = 228'he1ef9ea1cb9e6f0fa62b1f61d290a9f855e7293f487a968d4ea531b27;
    stim[7] = 228'hbbd9a8ff3f5a407a61b4e7f888acf49a66a3d6c68cc6671d992ba4e15;
    stim[8] = 228'h848284d289abaac2b6d8e1ee7e431d9612f17b67ed2aa08a219e5efd3;
    stim[9] = 228'hb99450d2bb772978db662d5a9ab13c536ce4af0af9d33bf48dd46e71f;
    stim[10] = 228'hdaabf12a8416f2ac049d422d6dadba7ded9dfd1c748d4148e9fb9fe30;
    stim[11] = 228'heb20d9fd940be0197799e2e77ca95f18aac96778c219296b745681da4;
    stim[12] = 228'hc6f1eaef2ae61ba2266ee553ec38b38146e76c4943ebc187972762570;
    stim[13] = 228'hab1de15c0f8ac638c4bd63efbc8767d1841a825c83d5e086480f5788c;
    stim[14] = 228'h95ca4bcfc9ceaf620e51aa866b81269f7cfab4766bdde9ba1d4496ac0;
    stim[15] = 228'hf610ccc40cf37035fe28ca900d9d44d03f68cf66085fa7f65ec9214ae;
    stim[16] = 228'hb141ee2f697725bf336bea01c63547e42fe572285216f3654ab95267d;
    stim[17] = 228'he67874b37d968935734980e2e59726191811fa2243c3603b78d2aa820;
    stim[18] = 228'hc1bb346bda003d091d85f7949c6ed05cc16147f65732e6a452696edf1;
    stim[19] = 228'hdf63061cbd4426d1a428e4be0bfcd1045a2089b7d31efda980a652e62;
    stim[20] = 228'habba8d1bc367a325a54264b685a3ce085e8beef42f348c4f3d9e0a1c3;
    stim[21] = 228'he2f5c56f1cc5906aed2bcb3e44c2d7c926cc39b68fbb4a31fc556ebaa;
    stim[22] = 228'hc6eae06e36d9bfd3779d14902f0b0f790a69f54fbb67e380df2744703;
    stim[23] = 228'hde98712038804ca230be7ec65b049b4d67877305961f1dcacdf13a992;
    stim[24] = 228'he64b3f1c353866a9b53bfd4919bf31c6f4a257ec780cc94de27ca1181;
    stim[25] = 228'h999dc219ce8c701f4c162b2dc63442bd709dfdae179ad010270512b87;
    stim[26] = 228'hbda33919534ff2ca674080768c9218b5557e75d90afd9d6ab69c278c4;
    stim[27] = 228'h84789618e733e2ad4bede294107b58d09efa9134f63ef941d4717855d;
    stim[28] = 228'h8b2a0aae85d62ab41c52efac3bd439b90a460607cdd0f556e9f58c14a;
    stim[29] = 228'hadc5ce373aabaabc8cb9dfaca1fa8ebe7e8d842ac957a9185f0db8372;
    stim[30] = 228'hbb93e8a79fd7599ea306bb69c57a3466557924583cf0388e0e5aa5a17;
    stim[31] = 228'hf56178a32d43043dad1e76cea5225d66a99d4aab139076a47ae010b12;
    stim[32] = 228'hdda20cf3b740649fcc15f09810067dc00516ebefff5f91cbf08426570;
    stim[33] = 228'ha071293aeb059030842a43464eed3f2ba314daf9cfeece2b882d491db;
    stim[34] = 228'h954a425cabe380e9fd69da9896e398c15a8392099f3f93322f75c0c54;
    stim[35] = 228'hcc6c7437394cf6fa7d36ed1244ba37aef94afa60abb7cddd0fe600455;
    stim[36] = 228'hf6b30966a14f6e846191a878fb73e7b499e6172b896fa7f2012f8239d;
    stim[37] = 228'hb5135a7c214f1927b178e669233e53b7a01becd76164a161b42c17cf1;
    stim[38] = 228'he3c1b8d09cb658190d1974dcd29bb50f6c1da7bb1053e604d215f2904;
    stim[39] = 228'h995738c2d4893359214faed3d5720da056b70e4fddefc8d80bd13bcbf;
    stim[40] = 228'ha7b087098ff22adce3d99d60cce31fe2615de84729dbbe2384064475d;
    stim[41] = 228'h9ff45b5ac5e2c4679bb499e2df36fbef2e27760909028b160e20a7f5d;
    stim[42] = 228'hb1946686896a73fa83733d98ff9c8c4e2194e3e7c2f7807f4c7578a7d;
    stim[43] = 228'h8e2bd7c9f3eb9aab8965d9e73854da5ad3d7acba72da65c17ec6c1c66;
    stim[44] = 228'hc4ab6e057e648feffd4389c7d682204702266e2b3c479863bff40a25a;
    stim[45] = 228'h9aa2b31de3ae36ecd762dfad66bef42156ea84cb2d93694d6501703e6;
    stim[46] = 228'he8c75616b746efe9252b453e2c18050f021c584bfb4050406fddb7578;
    stim[47] = 228'he2edd49c877ff9da52715176d8df8fee17eec6fc5165c119007fc4a99;
    stim[48] = 228'hdbc39c59f44a61a5b052615df32771405c9050eee4a200683352ee525;
    stim[49] = 228'haec321e9031580d22fd584db51dd97138df335fc99350493fb424ffef;
    stim[50] = 228'h331ae10895307f38675fc335a206c2d6d80568207e5d8beb2ffa90a7b;
    stim[51] = 228'h8222a59a7000c3c501efdfa20b22b57fd1faf0ce16dac65cacb3376ca;
    stim[52] = 228'hdf56c669d50d893d4416f2c2c17862307edf9c80a3941cddbf5a324b4;
    stim[53] = 228'hb405b2c98469b1fd7ca5608faa017dad6a9e4dde2005874367d962bc3;
    stim[54] = 228'hefd7707551f58c94a32139eea88bcdfc4dfee283897414f693cfb4d2e;
    stim[55] = 228'hdc096e52c3b693ce4bc7ff69ee29eb8980fea65346cc6533ac4ac446c;
    stim[56] = 228'hce12595b1bc9f775a179239e8598a25bb52e60881f0ef8e22cb467e7d;
    stim[57] = 228'he7c7dc827f73707431b5947c164735c47ec7d17ab648073036f1f3aa8;
    stim[58] = 228'hb6da3e6b82799b8e996d348fb11c588bb46c6c79de8a76d8d49c11a45;
    stim[59] = 228'hb15bf7097bc493c79168374fa106e1a446fefb06eea4702ab91266ef5;
    stim[60] = 228'hf6ee6fef052f0242dac6c7793858283bf1eab82a6435812adedc64cd3;
    stim[61] = 228'hec660b14067120bb59588ab54f00816f82507faa367b96469f13e6bf5;
    stim[62] = 228'hd4b2d68e29149db08895b5bc078cb90b552f2436fef42d70753e557c0;
    stim[63] = 228'h83a287ef0e6714794f88b68db3531c6bf18d9b9dcd0f47b41e91cdf3e;
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
      expv[0] = 177'h000000000000000000000000000000000000000000000;
      expv[1] = 177'h000000000000000000000000000000000000000000000;
      expv[2] = 177'h000000000000000000000000000000000000000000000;
      expv[3] = 177'h01e8802fdaf573f8811bfbe0c47af7998c5899a314e40;
      expv[4] = 177'h09e684369b9b7622cdda3534c8566587a80f98fd15b0c;
      expv[5] = 177'h06c40f36d0f4d5026ff206797929dcdb731887f606cfe;
      expv[6] = 177'h005b0110d6fb08c7cfbd95d4fa0f98f8a73b4b7159db3;
      expv[7] = 177'h061e87e14ea531b26f9ea1cb9f0fb0e948515e7293f48;
      expv[8] = 177'h0bbd8269992ba4e149a8ff3f5d73fc44567c6a3d6c690;
      expv[9] = 177'h10481658219e5efd2a84d289a9f0f73f218d2f17b67f0;
      expv[10] = 177'h0b99194d8dd46e71ec50d2bb7496ad4d589cce4af0aff;
      expv[11] = 177'h05aa81f7e9fb9fe303f12a84162116b6d6dad9dfd1c62;
      expv[12] = 177'h1eb21c62f45681da40d9fd940cf173be54aeac96778d7;
      expv[13] = 177'h046f06051727625701eaef2ae172a9f61c5a6e76c4940;
      expv[14] = 177'h0ab18746480f5788c5e15c0f8c31f7de43b641a825c90;
      expv[15] = 177'h015c827d9d4496ac024bcfc9c9554335c097cfab47675;
      expv[16] = 177'h1f610b40dec9214ae0ccc40cf2e54806cea5f68cf6613;
      expv[17] = 177'h03140790cab95267c9ee2f6977f500e31aa6fe572285b;
      expv[18] = 177'h1e67806478d2aa820074b37d92c07172cb97811fa2251;
      expv[19] = 177'h041b817352696edf0b346bda04fbca4e376816147f651;
      expv[20] = 177'h05f6041100a652e623061cbd40725f05fe69a2089b7dd;
      expv[21] = 177'h0abb88213d9e0a1c2a8d1bc362325b42d1e7e8beef426;
      expv[22] = 177'h062f0724fc556ebaa5c56f1cc5659f22616e6cc39b685;
      expv[23] = 177'h1c6e95e45f2744702ae06e36d98a48178586a69f54fb0;
      expv[24] = 177'h05e99d35cdf13a992071203881bf632d824a78773058e;
      expv[25] = 177'h1664871be27ca1180b3f1c353cfea48cdf994a257ec66;
      expv[26] = 177'h019982f5a70512b86dc219ce8f1596e31a2309dfdae08;
      expv[27] = 177'h03da0ad5369c278c433919534d403b46490957e75d90f;
      expv[28] = 177'h0047834254717855c89618e736714a083da9efa9134fe;
      expv[29] = 177'h10b29ee469f58c14a20aae85d2f7d61dea18a460607da;
      expv[30] = 177'h0adc02f9df0db83725ce373aae6fd650fd47e8d842ad4;
      expv[31] = 177'h03b901990e5aa5a16be8a79fd75db4e2bd1d57924583c;
      expv[32] = 177'h0f56059afae010b12178a32d463b6752912c99d4aab19;
      expv[33] = 177'h05da0f0070842657020cf3b747784c08033c516ebefea;
      expv[34] = 177'h0a0704ae882d491da9293aeb0021a327769e314daf9c5;
      expv[35] = 177'h115493052f75c0c542425cabe4ed4c4b71c9a83920989;
      expv[36] = 177'h0cc68ebb8fe600454c7437394df689225d1f94afa60a6;
      expv[37] = 177'h076b06d2012f8239cb0966a14a543c7db9f79e6172b93;
      expv[38] = 177'h13510edeb42c17cf1b5a7c214bf334919f2a01becd773;
      expv[39] = 177'h0e3c043dd215f29041b8d09cb43a6e694ddcc1da7bb10;
      expv[40] = 177'h01950e810bd13bcbef38c2d48c5769eab9056b70e4fc6;
      expv[41] = 177'h0a7b078984064475c887098ff64eb066718e15de8473d;
      expv[42] = 177'h11ff17bc8e20a7f5cc5b5ac5e3ccf16f9b7ae27760904;
      expv[43] = 177'h0b190938cc7578a7cc6686896d1ecc7fce44194e3e7c3;
      expv[44] = 177'h00e2816b7ec6c1c663d7c9f3ed6cf39c2a6b3d7acba72;
      expv[45] = 177'h144a891c3ff40a25a36e057e67c4e3eb41102266e2b2f;
      expv[46] = 177'h09aa00856501703e62b31de3aeefd6b35f7d6ea84cb36;
      expv[47] = 177'h068c0c3c6fddb757875616b744229f160c0421c584bea;
      expv[48] = 177'h1e2e97b8007fc4a98dd49c877da8bb6c6fc77eec6fc40;
      expv[49] = 177'h05bc0d013352ee524b9c59f44ab0aef993b9c9050eee3;
      expv[50] = 177'h000000000000000000000000000000000000000000000;
      expv[51] = 177'h000000000000000000000000000000000000000000000;
      expv[52] = 177'h08220dff2cb3376ca2a59a70026fd105915d1faf0ce02;
      expv[53] = 177'h05f500c1bf5a324b46c669d50e796160bc33edf9c80ae;
      expv[54] = 177'h1b401eb5e7d962bc3db2c9846eb047d500bca9e4dde22;
      expv[55] = 177'h06fd07f113cfb4d2e7707551f21cf75445e4dfee2838b;
      expv[56] = 177'h05c086262c4ac446c16e52c3b77fb4f714f20fea65351;
      expv[57] = 177'h04e1096eacb467e7ca595b1bca11cf42cc5352e60881f;
      expv[58] = 177'h1e7c0711b6f1f3aa87dc827f72ca3e0b239dec7d17aa1;
      expv[59] = 177'h036d9a2ed49c11a44a3e6b827f9a47d88e2946c6c79da;
      expv[60] = 177'h13158691391266ef4bf7097bc39ba7d083706fefb06f9;
      expv[61] = 177'h076e90efdedc64cd2e6fef0529e3bc9c2c111eab82a61;
      expv[62] = 177'h16c60dbe1f13e6bf4e0b140675c55aa780402507faa2a;
      expv[63] = 177'h054b042d753e557c02d68e29105ade03c65952f2436f7;
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
