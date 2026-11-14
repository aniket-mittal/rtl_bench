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

  rtlpp_01281 dut (
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
    stim[0] = 228'h03ed7a5d9b2830e7a9dfd08e6978fe670b585ed571d93402f50a52a38;
    stim[1] = 228'h44f836e6005285ef608a03771925d56ee9236627c359f87c887e1782f;
    stim[2] = 228'h8b6fad296d5a8b193730984e05fedc34cc9744c9d7ea3d4902afd6798;
    stim[3] = 228'hc432f4b1f825dc494754ee252f5f24a4bae788556565e1f2de882e7bd;
    stim[4] = 228'h8d52b145fd8c188f38c92d84b0850883d65efff3567fde60cb4e081ec;
    stim[5] = 228'ha8bf1733f4c6a700f86d193ddc45372b6d6edd942b0c6c8779bb199e2;
    stim[6] = 228'hc1ae20acbac7470433ced1ecd54d80092ef3137966c2ea4f08378c9ba;
    stim[7] = 228'hca065c10129af46b362a421e236f647ffdc12111f0405fd86c2f10ffa;
    stim[8] = 228'hb08ed7329d34fd64e8e30c461d3ffbcd12d575227481a6707a6336185;
    stim[9] = 228'hdcfe2a86a9bb9c7fce0f965b66cc0b881bbde2b74641613b35f0610e7;
    stim[10] = 228'hdbd9ab172834df2bd1c7dd1e1d869d99b51ae23a480e2faf7e7e5181e;
    stim[11] = 228'h1545f7984dc728877837e74015647b6c9fc1ebfe575253d3025ed6dd9;
    stim[12] = 228'h915a3ec6e4b75e1c213629a9a7128f30f2f8000717d1da4642973ef8b;
    stim[13] = 228'hb653cf3cb31748857d37d9bfb0a3f7703bd6995435a370c976733c0ad;
    stim[14] = 228'h9777e1859fd7787dc15f33f310c8c465baf1ecd667cd04e3b43ec5cf8;
    stim[15] = 228'hfea6fb9b3c15c18fdf3dc6b38b87c38471583a503578b0ac171dce42e;
    stim[16] = 228'he19e3a5c269b57e640222ad5b483d95d9c491058bb493b52ed2c04e12;
    stim[17] = 228'ha9f6d9108ed01e5bcbb811162477bb48688737ace10eba940fb75646a;
    stim[18] = 228'hc15281578cdfef001a47d95d26951d1f8c43e7d9912ac814f065fb3ea;
    stim[19] = 228'hc1e27b7738dfa63ce2c76d7700a118cb327f0c83d8766ddb6b17a24a8;
    stim[20] = 228'hfa5f548130541d6f3735aef233306737a62933348a5555a1c8144daef;
    stim[21] = 228'h8a8fafd4df5529cbc4ac70752a504231ed381ba6b567af9750b3cbdc9;
    stim[22] = 228'hce3ec823444af93bc61028ea81eda048cfd5f185b8a7224bae91f99f9;
    stim[23] = 228'hf7b1286524a511b26bf751e6e057c162d9273c2d476b105f483fd954d;
    stim[24] = 228'hfad79108fed21c9063c0e3368e695739335576d121c02c37d156ca1c1;
    stim[25] = 228'hd1bb6a34e006fceedb441549180567521cc8787e18f037f82c5b02bb1;
    stim[26] = 228'h821e5603c4274508d44f77d47464ae17d45f5ddfabd7a66135b6d6578;
    stim[27] = 228'hee4b710ccb0908996619f8364ea9e54bad4c8b0ad8ec92049ac4eba72;
    stim[28] = 228'hbb53621f897f5776f8f0a89fe3afe1de470b82341dde5ec90896fa909;
    stim[29] = 228'hfcba0b476a00b3b5fff69a5b75590416f784753743fce77b51ed6f24b;
    stim[30] = 228'hb9ed2ae772a4366941aebd5dccb7ac21bdad1feeb2eb597ee6eeaeac1;
    stim[31] = 228'hca679aa49cef56e4bc10f4eb96544f4e1fa944f540dd154dfb1e6dc9c;
    stim[32] = 228'hbf585b99d5d5e5d8cd8289c4532913b1e5a96434d68a1a8ced3282bea;
    stim[33] = 228'hb47e37db7ee570b1b1ed0679db387d80e8d4b3d931f127165d9010868;
    stim[34] = 228'hb7a1fc650355eaa3b4049a4b49f35674d4e6cf050cc19118bc48954ea;
    stim[35] = 228'hf9c47409ce197642c895bea7d23ba16d4e1de87870b2816a9ef31ba13;
    stim[36] = 228'h9fcba674569603108a83bacd122b3793a51f9b6c7704edc7ac9d9ec5d;
    stim[37] = 228'ha575c9d0fefdc6c5013899e814a6f39c4c4ead54aa053bfa7712163b0;
    stim[38] = 228'ha7d6c2d7d63d6ca67974c50726793a5f588a9902a2be0f59681ff1f49;
    stim[39] = 228'hc956154923cef4647cf3c4298c31aadb1f844fbf459b6c1939f9b3db2;
    stim[40] = 228'hda1652cfbc0229eef73331a9cebf458df2ffc1a34b782ee8130e85102;
    stim[41] = 228'hc9c9ea104e40613bd2f3f49b0d2b45f3caeffdb578e008e6810314f22;
    stim[42] = 228'hfea399df14f107e34b526d8edb6985d4c622bfdb2cdfc2942ec64f120;
    stim[43] = 228'hb92f058ffc379e66fc4e58250ac2b86f29b6459215410e09a6bee588c;
    stim[44] = 228'haf36c6bdfb409ab37d1834350af3403f9e585b732c8603281963c7f07;
    stim[45] = 228'h8f9baa570e8788e4cbd15c05ace4dbad3a8afe8eb08a0932be04ed904;
    stim[46] = 228'hcff5a842d97f2a87ea9555e4bee0c7a735b89f920d629ad3f7de05fd6;
    stim[47] = 228'hdc18ac0c8db46b5c71440a6ce1eab729c63e675c059a18a786fd54aab;
    stim[48] = 228'h8265d46a2f155e845c85ea3beebe8053583fd9e4064936c225060aaad;
    stim[49] = 228'hafc8d645d23ffe57c8af8ad75233594d88f705f7a0f18b474390bfe0e;
    stim[50] = 228'h5ded650ab1f533d606f246f9cd9ed0f4c3c7f5e1996e7491d0f1d2f8a;
    stim[51] = 228'he64e293c2594a8ef35235677e24f408d525b9c610e9ea9cda82ff35af;
    stim[52] = 228'h9479fe0adb4238b2e7a23079a2d31b28d3b5f8bbe809a450833129703;
    stim[53] = 228'hc73e0dc0d993a4d0ebc819dc48da2fab57917701c9cae505d2c73adf6;
    stim[54] = 228'hd3719942591776ae7a2fc2fecf0d1dcd6eeb9bb34d1a040936dc090f9;
    stim[55] = 228'h94acfb60ff7d6d20b39356cceb77066eb6feb300af27e280a0d423aee;
    stim[56] = 228'hdf6f31b89e8b2c74a1809647d2d26d95c07e9a8cafbfd67e7b6298913;
    stim[57] = 228'hc68bfaf8a39060f18f4e2263f17b087afa28d3ea4e1342e798a216cf5;
    stim[58] = 228'he8efa4df5062e6f846b458cf649590c39d6899056ff5290453dbf5fc5;
    stim[59] = 228'h911d9695a3bfb9149fe7bf10267141387d0783c34f266713264824dbc;
    stim[60] = 228'hb843b4c24d8153149df23b0b3d3a564c509c5c890bae9cc6536a83d88;
    stim[61] = 228'hb6d8ee52d56f2b5a559ab6f4013c63b3a6fcaf822ab0465b79a1da0c1;
    stim[62] = 228'ha91b53c36c505ab8d51245eacdfdb0ffcc7844aeb479160c363dbbfef;
    stim[63] = 228'ha53366154f2876a65039e10e4f5bf8e47d4f383579c5477fe2316e981;
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
      expv[0] = 177'h0000000000000000057a5d9b2b684734bc7eb585ed578;
      expv[1] = 177'h00000000000000000036e6005701bb8c92ec9236627df;
      expv[2] = 177'h000000000000000007ad296d5ccc2702ff6cc9744c9de;
      expv[3] = 177'h180008000000000002f4b1f824771297af95ae7885573;
      expv[4] = 177'h03aa1292ef56df779ab145fd8f96c258428165efff34f;
      expv[5] = 177'h13aa1a92ef56df77871733f4c08c9eee229ed6edd9434;
      expv[6] = 177'h0baa0292ef56df778620acbac2e8f66aa6c0ef3137976;
      expv[7] = 177'h13aa0a92ef56df77865c10129da10f11b7b5dc12111ee;
      expv[8] = 177'h0baa01ffef56df779ed7329d3206230e9ffb2d5752273;
      expv[9] = 177'h03aa09ffef56df77862a86a9bf4b2db36603bbde2b751;
      expv[10] = 177'h03aa01ffef56df7781ab172835ee8f0ec34d51ae23a55;
      expv[11] = 177'h000000000000000005f7984dc3f3a00ab23bfc1ebfe4a;
      expv[12] = 177'h0000000000000000023ec6e4b614d4d389472f800070e;
      expv[13] = 177'h080008000000000003cf3cb312ecdfd851ffbd699543a;
      expv[14] = 177'h169b95c0ef56df779fe1859fd619f9886465af1ecd663;
      expv[15] = 177'h0e9b9dc0ef56df7786fb9b3c17e359c5c3e31583a5039;
      expv[16] = 177'h169b85c0ef56df77863a5c269b156ada41e9c491058be;
      expv[17] = 177'h069b8dc0ef56df7786d9108ed5088b123bda88737acfc;
      expv[18] = 177'h069b85c0ef56df778281578cd8ecae934a8cc43e7d984;
      expv[19] = 177'h1e9b85c0ef56df77827b7738de36bb80508927f0c83d6;
      expv[20] = 177'h069b8dc0ef56df778754813057d779199836629333489;
      expv[21] = 177'h1e9b85c0ef56df7787afd4df55383a952822d381ba6b4;
      expv[22] = 177'h069b85c0ef56df7786c823444d147540f6d0fd5f185b2;
      expv[23] = 177'h069b8dc0ef56df7781286524a128f3702be19273c2d4a;
      expv[24] = 177'h069b858b6f56df779f9108fed0719b4734af35576d135;
      expv[25] = 177'h0e9b858b6f56df77836a34e0078aa48c02b7cc8787e1b;
      expv[26] = 177'h15a21d8b6f56df77865603c424bbea3a325745f5ddfb3;
      expv[27] = 177'h0da2005f6f56df779b710ccb0c7c1b2754f4d4c8b0ac8;
      expv[28] = 177'h030c905f6f56df779b621f897bd44ff1d7f070b82340e;
      expv[29] = 177'h130c985f6f56df779a0b476a02cd2dbaac85784753753;
      expv[30] = 177'h0b0c905bef56df779d2ae772a45eaee65bd5dad1feeaf;
      expv[31] = 177'h00d7185bef56df77879aa49ceafa75cb2a27fa944f54a;
      expv[32] = 177'h18d705386f56df77985b99d5d444e229948a5a96434cc;
      expv[33] = 177'h00d705386f56df779e37db7ee0833ced9c3c8d4b3d930;
      expv[34] = 177'h18d705386f56df7799fc650351cd25a4f9af4e6cf0508;
      expv[35] = 177'h020215386f56df779c7409ce195f53e91dd0e1de87863;
      expv[36] = 177'h02021d386f56df7783a67456905d6689159e51f9b6c76;
      expv[37] = 177'h0a02064eef56df779dc9d0fefa4cf40a537ac4ead54bf;
      expv[38] = 177'h02020e4eef56df7786c2d7d63be283933c9b88a9902a6;
      expv[39] = 177'h1202017d6f56df779e154923cae214c618d3f844fbf54;
      expv[40] = 177'h0202017d6f56df779e52cfbc0798d4e75fa52ffc1a357;
      expv[41] = 177'h1a02097d6f56df7781ea104e45fa4d8695a4aeffdb567;
      expv[42] = 177'h017997cf6f56df779b99df14f136c76db4c4622bfdb20;
      expv[43] = 177'h097997cf6f56df779f058ffc33ac128561589b6459204;
      expv[44] = 177'h117997cf6f56df779ec6bdfb419a1a8579a1e585b7321;
      expv[45] = 177'h017997cf6f56df7783aa570e822e02d6726ba8afe8ea5;
      expv[46] = 177'h017987cf6f56df7785a842d97b2af25f70675b89f920e;
      expv[47] = 177'h09798fcf6f56df7780ac0c8db6853670f55e63e675c0d;
      expv[48] = 177'h10a217cf6f56df7785d46a2f12f51df75f4183fd9e41a;
      expv[49] = 177'h00a21fcf6f56df7780d645d23b456ba919a88f705f7a6;
      expv[50] = 177'h000000000000000005650ab1f3237ce6cf683c7f5e198;
      expv[51] = 177'h000000000000000006293c2597ab3bf127a125b9c6116;
      expv[52] = 177'h100008000000000001fe0adb41183cd1698b3b5f8bbf2;
      expv[53] = 177'h000004a36f56df779e0dc0d9900cee246d177917701d0;
      expv[54] = 177'h080004a36f56df779999425917e17f67868ceeb9bb340;
      expv[55] = 177'h151794a36f56df779cfb60ff78ab6675bb876feb300b0;
      expv[56] = 177'h0d1784a36f56df779f31b89e8a4b23e9693407e9a8cab;
      expv[57] = 177'h00c01ca36f56df7783faf8a3901131f8bd81a28d3ea43;
      expv[58] = 177'h00c011ebef56df779fa4df50642c67b24ac9d68990574;
      expv[59] = 177'h00c011ebef56df779d9695a3badf881338a1d0783c350;
      expv[60] = 177'h10c011ebef56df779bb4c24d829d859e9d2f09c5c890e;
      expv[61] = 177'h08c009ebef56df7798ee52d56ddb7a009e326fcaf8222;
      expv[62] = 177'h10c006ceef56df779b53c36c54a2f566fed8c7844aea8;
      expv[63] = 177'h00c006ceef56df779b66154f2bf08727adf9d4f383563;
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
