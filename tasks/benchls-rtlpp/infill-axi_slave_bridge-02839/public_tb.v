// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 254;
  localparam OW = 201;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02839 dut (
    .aclk(clk),
    .aresetn(in_vec[253:253]),
    .s_axi_awid(in_vec[252:237]),
    .s_axi_awaddr(in_vec[236:197]),
    .s_axi_awlen(in_vec[196:189]),
    .s_axi_awsize(in_vec[188:186]),
    .s_axi_awburst(in_vec[185:184]),
    .s_axi_awlock(in_vec[183:183]),
    .s_axi_awcache(in_vec[182:179]),
    .s_axi_awprot(in_vec[178:176]),
    .s_axi_awregion(in_vec[175:172]),
    .s_axi_awqos(in_vec[171:168]),
    .s_axi_awvalid(in_vec[167:167]),
    .s_axi_wdata(in_vec[166:135]),
    .s_axi_wstrb(in_vec[134:131]),
    .s_axi_wlast(in_vec[130:130]),
    .s_axi_wvalid(in_vec[129:129]),
    .s_axi_bready(in_vec[128:128]),
    .s_axi_arid(in_vec[127:112]),
    .s_axi_araddr(in_vec[111:72]),
    .s_axi_arlen(in_vec[71:64]),
    .s_axi_arsize(in_vec[63:61]),
    .s_axi_arburst(in_vec[60:59]),
    .s_axi_arlock(in_vec[58:58]),
    .s_axi_arcache(in_vec[57:54]),
    .s_axi_arprot(in_vec[53:51]),
    .s_axi_arregion(in_vec[50:47]),
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
    .s_axi_awready(out_vec[200:200]),
    .s_axi_wready(out_vec[199:199]),
    .s_axi_bid(out_vec[198:183]),
    .s_axi_bresp(out_vec[182:181]),
    .s_axi_bvalid(out_vec[180:180]),
    .s_axi_arready(out_vec[179:179]),
    .s_axi_rid(out_vec[178:163]),
    .s_axi_rdata(out_vec[162:131]),
    .s_axi_rresp(out_vec[130:129]),
    .s_axi_rlast(out_vec[128:128]),
    .s_axi_rvalid(out_vec[127:127]),
    .m_axi_awaddr(out_vec[126:87]),
    .m_axi_awprot(out_vec[86:84]),
    .m_axi_awvalid(out_vec[83:83]),
    .m_axi_wdata(out_vec[82:51]),
    .m_axi_wstrb(out_vec[50:47]),
    .m_axi_wvalid(out_vec[46:46]),
    .m_axi_bready(out_vec[45:45]),
    .m_axi_araddr(out_vec[44:5]),
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
    stim[0] = 254'h09d16ef80edf881c696fa49f159cbd03e9584ee095991108407578b57e24a66f;
    stim[1] = 254'h19019b01a075999949d62e7f9a1ace10007bbc1a6696b6b2df0940d89b4dc9fb;
    stim[2] = 254'h2bf5af96f26cd1d29d8daa21ea50c619eea6f6004eeed309451e87e7da6917b9;
    stim[3] = 254'h3496b57502c7d9a667376dc4758a401c46f7e76c85a4fe20f983d3c944212997;
    stim[4] = 254'h3857202f5bac208ea97591bd04fac0eb3480a6262938adaf5520ba100fb1f1de;
    stim[5] = 254'h28d1b435f45f423b6cea0f7a5ef593017bf5223563865368503ae937d4054620;
    stim[6] = 254'h252516a8b3feb0e467ac394c382b9c5d69fa56e4d7cd437c7d2d438d73676cfe;
    stim[7] = 254'h2a54b44c99192900955f2c88a41de90f4ce71a59cf244984ba22760c4bcf80a4;
    stim[8] = 254'h365228b9dcf53c95b0c646a913e02441f41dcab28be5dfba191bc5ed17aa46e5;
    stim[9] = 254'h2084adfb0b94a42e889bf17d85858b68e25a537630504c40d0a1169abaf015e1;
    stim[10] = 254'h36f09b71baa2db50981e5cfdfd8215338047a6fa6c36b2e734397ab3b50b6603;
    stim[11] = 254'h26a7bb57dc0d736afedbc756e05264ed1ff6626617446d8299f9c409992db907;
    stim[12] = 254'h2e1659651f492e008aaec4c34e6aa45a5932aa74d418c686ab1b7f282cd7e43d;
    stim[13] = 254'h30731428c562f9866525ef79fce2b5883644493cd0f565119b9d4c0bafb3a563;
    stim[14] = 254'h2d8ca7741d5a8e89ed8655247fbcc03e25dccba393fed073542c683a14cf784d;
    stim[15] = 254'h2074a948eb849f2ff3d964e56c15533781ffddc6bf9570873123c6baebc4e10d;
    stim[16] = 254'h38c04012c4d391802b20ce0e220864061d6c387e3d0bc3017c7161f4ec71941a;
    stim[17] = 254'h2acf1dab00ca30fc016d349f9716ca7d87df00e7d210c119783f0e4ab22ed2bd;
    stim[18] = 254'h3c2b13b1e06c2b3383dcad17f9eec108cfe22da6aa70f9c818bec365f5390763;
    stim[19] = 254'h260ad25bdbe3c073cc9c07b7ceb0fbb4fa029bfad815efcf26122b6aadee61e5;
    stim[20] = 254'h3c6d60cc1050bfb3813bf941d770ac4c8921d888063e192c7729d20b1acbdaf1;
    stim[21] = 254'h28f531373f7f9f437d588a77540300a54635bb6fb76f98e2b99dee22af835849;
    stim[22] = 254'h280294f27fce9e70d47c8b272bc73b61b82345e0371d68ab72d0f06f87459a49;
    stim[23] = 254'h254d9f36b2a8f0127d053b590eb104dffed170c0364c334e964b288b1cdeb7fe;
    stim[24] = 254'h343325192352c0d559dc44d751f41de5cc6c7d96101739a41a2fee11142715d7;
    stim[25] = 254'h377a9fb47dda8f91aa4d9c6696cc3edcbc9436dc03a0ef4ffd8ba03160ce157b;
    stim[26] = 254'h2295bb56760e5a5ead5d5386f44ef9584beadfbd5dbc3d988b43587d24331126;
    stim[27] = 254'h25c27c40c14c19be5a54a817134e67f72b9ce71249147c46b543cbe23c51ae67;
    stim[28] = 254'h244bfd01bbec2854233b894da4104a8e959a528c419fcd070eaf00c73df73555;
    stim[29] = 254'h339e614cf1dbb682be5257628b765a9afacdc259a0e5b93baea63e766d5aacb0;
    stim[30] = 254'h278abc16d7d7525f9b0ee13f3173ae16ae23cf302f129cbdef02f378fb31c897;
    stim[31] = 254'h2b4695d790b8e833c3086336a4147e5104c4515249d9af0a148bd72505cfc972;
    stim[32] = 254'h247b83bfdec86f67f649825335f491c813a2a6ed74e3cfc698aa4fddf7427b38;
    stim[33] = 254'h26090298d76111baa24f1d7eb885ba5bdfc942ab39b870c68e56c7267def5037;
    stim[34] = 254'h28acb51bd7b12de66b909f335ce226003535bfc50f47468023b6b3385fc2b09e;
    stim[35] = 254'h281f1a002bf4d3d2507beb551b497627f4716b3fe4586d0790b9a4250b335047;
    stim[36] = 254'h33d31c6a1acf482952de11be7be838a9f0a9468afc01916e07f9ea65cedf64fa;
    stim[37] = 254'h2724e8540645e7620d627883648c9c53fb2bc5d02b215ca5e5edd4c743cdcd4d;
    stim[38] = 254'h3aea7f276ab4339f9b97e35211e6808796c4eac280a68c6cd0438afb2e801106;
    stim[39] = 254'h38f86d83a83cdc79b837fb4767105b5dbbacb68483b44046f3e96179a824a905;
    stim[40] = 254'h024fc3ab32ffdc8d1cb0d402c2b122564e2953d94a780a61409d792252123d26;
    stim[41] = 254'h214b5c6a901e0cf891ea1d52656a30af888232a50bd5a0d23b30c59fa50b9947;
    stim[42] = 254'h32861c1e655014a41aad065ccfc2bbc5760932484f34945cf5319721167ec22a;
    stim[43] = 254'h2a948a2c5781696510c82483aff78dcb9abb15b961e906ce2b14328994193089;
    stim[44] = 254'h398c45be32efeac07306683a413b4dc3089b71e30052de861e2c61e59521e11c;
    stim[45] = 254'h377d02537f6a46af0e24a8a901fdb4c30c028f27323658784dbd8a92e6d7c123;
    stim[46] = 254'h3d64c6f1a82c2da5f54da3752bd6831f489142c798fa996f5a8515cc9cea104a;
    stim[47] = 254'h318af09b9c0713b35a67360cf0d1cfcb3c145ee0ee3b8d27e07e91f2cf2c6943;
    stim[48] = 254'h273245e97fdd65cdda76604e76e9f9e6e6baabd8b1513797347c7e0a7b245efc;
    stim[49] = 254'h2cf65cd80b1fba27ad31d02cb7404efc8d68cc9f5cfdbd862ad48486991a2bd9;
    stim[50] = 254'h224da6674b60e5da80aca70d3376a6555ba23e9e04989fa57f47043cfb1b39c0;
    stim[51] = 254'h2932503ca46d1aba5c18818cb19fb1d3f10b034d961f0e24c8baa1cb722cf766;
    stim[52] = 254'h21a2e84ca41230b52db235f1ec3f4638765b04bd1cbfb69131ffb3463b5f3e92;
    stim[53] = 254'h308313f1fdd3f62320e2e5e4b4ecae213b4f9cbb825d5a6ac1e08101a33402aa;
    stim[54] = 254'h2237022a65f398a3f172f8b6732de3edcf66c3b9a49625e83afc4fc40bbdf582;
    stim[55] = 254'h356910b0a1678202ff649a9bf92d46f98514db9dbe919ef95e2e97b62225bbb4;
    stim[56] = 254'h362184541779e4bbea2452ce5f32e9a2e161a0c8ffe190c3a2724a646b82759d;
    stim[57] = 254'h22561900e08a66665b2efe17719d4d4e528e5f9a47f536927c33506223ee8aff;
    stim[58] = 254'h3712c2002f501c8d334ae0765c4b3b58c15d2488018a7eb86afc8b1795569441;
    stim[59] = 254'h2dcd467aea03f262abfd973bd99bf64d21d0d9910b33532ff9ac621b4c040325;
    stim[60] = 254'h3a70e6e974a9fd48bd7b0fc6422e95eb7052dee10bcf4483f463ce7f8ba1f87b;
    stim[61] = 254'h2b638f07ca07d3fc9136367477f1f88d42539fb3c2b21d3c4284a417fb3c100a;
    stim[62] = 254'h2f8e12602215ebb13a1cd85575df0f0a433c18069f5dceda36efda001c9a18cf;
    stim[63] = 254'h346a8cf5e6861767ceb97cea841df0ac7e08d2fbffe8cf9366be384ec89ee398;
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
      expv[0] = 201'h000000000000000000000000000000000000000200000000000;
      expv[1] = 201'h000000000000000000000000000000000000001000000000000;
      expv[2] = 201'h000000000000000000000000000000000000001a00000000001;
      expv[3] = 201'h000000800000000000000000000000000000001800009ddda63;
      expv[4] = 201'h100000000000000000000540b1f668800000006a00009ddda61;
      expv[5] = 201'h080000000000000000000540b1f6683d04fac08600009ddda60;
      expv[6] = 201'h000000000000000000000540b1f6683d04fac0da00009ddda61;
      expv[7] = 201'h000000000000000000000540b1f6683d04fac08a00009ddda61;
      expv[8] = 201'h180000800000000000000326464a4088a41de94600b39e48922;
      expv[9] = 201'h000000000000000000000326464a4008a41de96800b39e48921;
      expv[10] = 201'h000000800000000000000326464a4008a41de93200ec60a0983;
      expv[11] = 201'h18000000000000000000046ea8b6d0fdfd82156e00ec60a0980;
      expv[12] = 201'h00000080000000000000046ea8b6d07dfd82155800cc2e88da3;
      expv[13] = 201'h1800002c9900000000180147d24b80c34e6aa40c00cc2e88da0;
      expv[14] = 201'h000000ac9900000000100147d24b80434e6aa4380079a1eaca2;
      expv[15] = 201'h0800002c9900000000100147d24b80247fbcc0360079a1eaca1;
      expv[16] = 201'h101d29ac990000000010023ae127c8a47fbcc000018d7f2ae02;
      expv[17] = 201'h081d282c990000000010023ae127c80e2208647e018d7f2ae01;
      expv[18] = 201'h101d28ac99000000001002c0328c388e2208640801cfa421823;
      expv[19] = 201'h001d282c99000000001002c0328c380e2208643001cfa421821;
      expv[20] = 201'h101d282c99000000001006f6f8f0188e2208644801cfa421821;
      expv[21] = 201'h001d282c99000000001006f6f8f0180e2208642201cfa421821;
      expv[22] = 201'h001d28ac99000000001006f6f8f0180e2208646200df6edf302;
      expv[23] = 201'h001d282c99000000001006f6f8f0180e2208645a00df6edf300;
      expv[24] = 201'h081d282c99000000001006f6f8f018590eb104e600df6edf301;
      expv[25] = 201'h101d28ac9900000000100648d4b030d90eb104d8012c202e722;
      expv[26] = 201'h001d282c9900000000100648d4b030590eb104d8012c202e720;
      expv[27] = 201'h101d282c990000000010059d839690d90eb104f2012c202e721;
      expv[28] = 201'h081d282c990000000010059d83969017134e678c012c202e720;
      expv[29] = 201'h001d282c990000000010059d83969017134e6798012c202e721;
      expv[30] = 201'h081d28ac990000000010059d839690628b765a9400b341cb723;
      expv[31] = 201'h001d282c990000000010059d839690628b765ad200b341cb721;
      expv[32] = 201'h001d28ac990000000010059d839690628b765ac800a493b35e3;
      expv[33] = 201'h001d2809d10000000018059d839690628b765ada00a493b35e1;
      expv[34] = 201'h081d2889d10000000010059d8396907eb885ba0401567370e03;
      expv[35] = 201'h001d2809d10000000010059d8396907eb885ba2201567370e00;
      expv[36] = 201'h081d2889d10000000010059d839690551b49762e007fc8b0da3;
      expv[37] = 201'h101d2809d100000000100286b3d208d51b497652007fc8b0da0;
      expv[38] = 201'h081d2889d100000000100286b3d20803648c9c0601a05642b83;
      expv[39] = 201'h06ba9909d100000000100286b3d20803648c9c5a01a05642b80;
      expv[40] = 201'h000000000000000000000000000000000000005000000000000;
      expv[41] = 201'h000000000000000000000000000000000000002a00000000000;
      expv[42] = 201'h08000080000000000000000000000052656a30c6014a17ab403;
      expv[43] = 201'h0000003b048000000018000000000052656a30ca014a17ab401;
      expv[44] = 201'h1800003b0480000000100315e05a5883aff78dc6014a17ab400;
      expv[45] = 201'h0663113b0480000000100315e05a5803aff78dc2014a17ab401;
      expv[46] = 201'h1e63103b04800000001004dfda91a8a901fdb49e014a17ab400;
      expv[47] = 201'h075931bb04800000001004dfda91a82901fdb4ca018f31f5322;
      expv[48] = 201'h0f59303b04800000001004dfda91a80cf0d1cfe4018f31f5321;
      expv[49] = 201'h075930bb04800000001004dfda91a80cf0d1cff801b162a26e2;
      expv[50] = 201'h0759303b04800000001004dfda91a80cf0d1cfd201b162a26e0;
      expv[51] = 201'h075930bb04800000001004dfda91a80cf0d1cfd2013c09313e2;
      expv[52] = 201'h1f59303b04800000001007291b46a88cb19fb1bc013c09313e1;
      expv[53] = 201'h0759303b04800000001007291b46a80cb19fb1a2013c09313e0;
      expv[54] = 201'h1759303b048000000010047f74fd888cb19fb1ea013c09313e1;
      expv[55] = 201'h075930bb048000000010047f74fd880cb19fb1fa0173492c4a3;
      expv[56] = 201'h175930428a0000000018042859e0808cb19fb1a00173492c4a1;
      expv[57] = 201'h0f5930428a0000000010042859e0804e5f32e9cc0173492c4a0;
      expv[58] = 201'h075930428a0000000010042859e0804e5f32e9d80173492c4a1;
      expv[59] = 201'h075930428a0000000010042859e0804e5f32e9ca0173492c4a1;
      expv[60] = 201'h075930428a0000000010042859e0804e5f32e9ea0173492c4a1;
      expv[61] = 201'h1f5930c28a0000000010025d2a7f50c6422e958e01c2179e882;
      expv[62] = 201'h075930428a0000000010025d2a7f5046422e958801c2179e881;
      expv[63] = 201'h0f5930428a0000000010025d2a7f505575df0f2c01c2179e880;
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
