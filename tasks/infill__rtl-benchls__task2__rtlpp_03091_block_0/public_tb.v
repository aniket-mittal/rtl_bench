// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 206;
  localparam OW = 153;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03091 dut (
    .aclk(clk),
    .aresetn(in_vec[205:205]),
    .s_axi_awaddr(in_vec[204:173]),
    .s_axi_awlen(in_vec[172:165]),
    .s_axi_awsize(in_vec[164:162]),
    .s_axi_awburst(in_vec[161:160]),
    .s_axi_awlock(in_vec[159:159]),
    .s_axi_awcache(in_vec[158:155]),
    .s_axi_awprot(in_vec[154:152]),
    .s_axi_awregion(in_vec[151:148]),
    .s_axi_awqos(in_vec[147:144]),
    .s_axi_awvalid(in_vec[143:143]),
    .s_axi_wdata(in_vec[142:111]),
    .s_axi_wstrb(in_vec[110:107]),
    .s_axi_wlast(in_vec[106:106]),
    .s_axi_wvalid(in_vec[105:105]),
    .s_axi_bready(in_vec[104:104]),
    .s_axi_araddr(in_vec[103:72]),
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
    .s_axi_awready(out_vec[152:152]),
    .s_axi_wready(out_vec[151:151]),
    .s_axi_bresp(out_vec[150:149]),
    .s_axi_bvalid(out_vec[148:148]),
    .s_axi_arready(out_vec[147:147]),
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
    stim[0] = 206'h10e8bbb0e12dcc0860eb6747c246497d9448494008b23025463e;
    stim[1] = 206'h1412dcef2fe80cea6eba271a1b6ccfdd49081c55be0ef3850274;
    stim[2] = 206'h2dcbb4c447c14f4d401e7fd4ae9d9cfb5df45ae075d6c698888b;
    stim[3] = 206'h3f0bf1f5a1180cfa957b91e2ae1183da2fabf5743a1ea4407a6f;
    stim[4] = 206'h381373fe98a0596fde2087741e4629ef36db989f8ace868a3594;
    stim[5] = 206'h203237b596ee33fa48c62191748c0388719504bf1c66a83d5ce6;
    stim[6] = 206'h279b2e4b25c73bb5f54a920f2e910acd23f76b850ddaeb80af46;
    stim[7] = 206'h3c8e0ee0fba67084d853b6960be2267c006e98337ef4a5b7453f;
    stim[8] = 206'h377665ce21daca152a4ee654dfa50eefe6bb9f341e7fe681ca28;
    stim[9] = 206'h3cb02d2315a00d8bb7be42e13ffb08f7aa2c02edb46d11ee1354;
    stim[10] = 206'h2bef8c55d4761690e03028b26b462d2b3fe99c361d5b70e2aa56;
    stim[11] = 206'h21d824c2308b3509e05255a13efecb25d806d7ca11b99c463ffd;
    stim[12] = 206'h3637a24ed6d20e2bfb08361f4f6b3bb458e1c584ef164f66fa84;
    stim[13] = 206'h3d423491ae29593584e3045bf86a5001888d6466b618e30abca0;
    stim[14] = 206'h307cb85ec45c9f4f0cb544e4765ea73693bcd95d2edd753ca408;
    stim[15] = 206'h268d56a14a3e1a20dc6f05ffc65a9afe7dd80e2441cddad73820;
    stim[16] = 206'h31f09a201932cf70bb8cd031ebb8f609b6ea68be9a14e849cd35;
    stim[17] = 206'h28429de44bafcdb76f01e8d99f70618bac1f0404b09ab0d8165e;
    stim[18] = 206'h370bed30b6b6a1b074a3194af77b520f4e7fff43750794dc3737;
    stim[19] = 206'h28c8f60f71265cadb3df695b9e4e2039fcc8ab9d66bfdf70372b;
    stim[20] = 206'h362b6e7c5e4b1caf147605c329ca4379cb60d59ded4650237802;
    stim[21] = 206'h35815f4748ad4a74665af24837dbbea8110809e72346820a2e16;
    stim[22] = 206'h3bbc82f1efd5b26e9ead5c4b98026d622b5a46c9eea1368923cf;
    stim[23] = 206'h200f70f2ac2a7c8690caa799c50e6ebf0164b18619e2e6d2c857;
    stim[24] = 206'h2b3b9a192aaecdaeebf64adf7e00655f0266da1a07fefd682a28;
    stim[25] = 206'h2dfd9b25e504ac6980b893d0c0b080a0e337bc2d45dcdfdeb7c5;
    stim[26] = 206'h3550c4deb7157a01d9d559464ec1f93505f894ca55027973363e;
    stim[27] = 206'h3a8802fb56d16971490ed0f05728b9d4bf0288af658834d0ec6a;
    stim[28] = 206'h3beadd926a39de5182d280e38032367d87377459589dd74a4879;
    stim[29] = 206'h345ed67050e042b58f8fb4c84e40385d2a8ef4815cc9cdbd222c;
    stim[30] = 206'h34b91f60db1b71f529b4e7eb9173b1a45f7bd20df63a40439553;
    stim[31] = 206'h2d318b64e4b32acfb383c6ad95a631d29761d2753fba6710f7af;
    stim[32] = 206'h2475646cf20296820697645d11e419439743f2a09c0dd4c3cd6e;
    stim[33] = 206'h2d02394109d13641b32a4c87aae7dff22b65bebb9f7c491544c3;
    stim[34] = 206'h2eba89d62c509abf41a7e01b5120e510345c075378d1118a74fa;
    stim[35] = 206'h21ce325fc9b2c0d5bd36bbc94039c00427fd84f366aca5e331a3;
    stim[36] = 206'h2c12ad07a7bfbd29aaa4c3ed55d9fcfbd4a8eea9dd91ee35a5a4;
    stim[37] = 206'h3879bf3a4fffffd01ce5e3d63cbda9e35d2fbd1e9a79f164f2a2;
    stim[38] = 206'h3537527e25da0f5e7e969cf5c13284897d233314c79fae1e9020;
    stim[39] = 206'h24506b0b0d2d7fea69bbf6f2c3fb0501705a517bd88457fd0395;
    stim[40] = 206'h32b3099b2153c3c5600eeb93f3939f59b017a7afe6e870977dc3;
    stim[41] = 206'h2d843a7562ca368a37e98a123c4fa557f4792e82c41489eb4d9f;
    stim[42] = 206'h257f8daea209d2167a2db65186ab044eb70b36a4353863e9fc44;
    stim[43] = 206'h20170958778d90f3339a2b3cb1194f74906d22669a010532d353;
    stim[44] = 206'h3fb2218c0c6591f82c63c626c2c4aa53a9e95ca89ea5a7fff7f1;
    stim[45] = 206'h23a68766231a9b8dd3fc985a774737c6d2b0aaed7f89741a3405;
    stim[46] = 206'h344259bacc932e822e2f9900609799cd501de7f026d0449b9836;
    stim[47] = 206'h3904160307edc152c6dd35fa273b1f5dc2c70935f6d08a16900d;
    stim[48] = 206'h227ed9cc4f00ba255b586016f382173a46568aa844f7fd897a24;
    stim[49] = 206'h29d05ecc556dc6e0dd1c5d4cac58bc69f3d4f10f039f2ba80abf;
    stim[50] = 206'h2aab238a1f7657c756a42c3828695f34e0ddf33b9923c209b372;
    stim[51] = 206'h3f4f48265fe8196f270f70c548d3802b28dec1e63e0117a737a4;
    stim[52] = 206'h25e299114b0b0e356b614ce6f48f80569e2e855d31201d610803;
    stim[53] = 206'h2db7bf0d601d04db1e568bdb73e20caa1b5279ae551918ec7338;
    stim[54] = 206'h3b0853f1b3969bcc6fd5208db0ebd263206c4898b58420c2e168;
    stim[55] = 206'h2b4f73742ff2ee96fc0c5e5bc9a5b165d98859bbfcc01f7e6627;
    stim[56] = 206'h389abb79f09d6b930b867c70785ab0acbd6436bc358e911e494f;
    stim[57] = 206'h2f43ab6893e2a8a9b73d96ecf3dd7605eb9ca5a16faf2a7b6c6e;
    stim[58] = 206'h38ba424255cf6e144d408665574a5f48f6e3412b35130502edf0;
    stim[59] = 206'h3e7de5eabdf30b22433b56da20ad560b6c8931a44401aa3c856f;
    stim[60] = 206'h3f66697fc8922bdb452240ee501e9be5653b870265d2f182ae83;
    stim[61] = 206'h29e0619263330d51177609ffc30a5436d9f954345ef65861a71c;
    stim[62] = 206'h232d39bdc8d1aa3d486af00b1bd777ebdb0267aad53c1e52d880;
    stim[63] = 206'h2ada3d7f29bf747fd628a66b4b8a1f34cd00b2b961e82808fba2;
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
      expv[0] = 153'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 153'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 153'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 153'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxx3b39f6bb2;
      expv[4] = 153'h1x6a4407a6e7c2fc7d6cxxxxxxxxxx3b39f6bb0;
      expv[5] = 153'h1x6868a35947c2fc7d6cxxxxxxxxxx3b39f6bb0;
      expv[6] = 153'h1x6868a35947c2fc7d6cxxxxxxxxxx3b39f6bb0;
      expv[7] = 153'h0x2eb80af477c2fc7d6cxxxxxxxxxx3b39f6bb0;
      expv[8] = 153'h0x2eb80af477c2fc7d6c5853b6960d3b39f6bb0;
      expv[9] = 153'h067e681ca287c2fc7d6c5853b6960d3b39f6bb0;
      expv[10] = 153'h16511ee135572c0b48c5d853b6960d3b39f6bb0;
      expv[11] = 153'h0e370e2aa5772c0b48c55853b6960d3b39f6bb0;
      expv[12] = 153'h0619c463ffdf2c0b48c5605255a13d3b39f6bb0;
      expv[13] = 153'h0019c463ffdf2c0b48c5605255a13d3b39f6bb0;
      expv[14] = 153'h100e30abca07508d2469e05255a13d3b39f6bb0;
      expv[15] = 153'h105753ca4087508d2469e05255a13d3b39f6bb0;
      expv[16] = 153'h085dad738217508d2469605255a13d3b39f6bb0;
      expv[17] = 153'h005dad738217508d24693b8cd031ed3b39f6bb0;
      expv[18] = 153'h002b0d8165f7508d24693b8cd031ed3b39f6bb0;
      expv[19] = 153'h00ab0d8165f7508d24693b8cd031ecf6a41e9c2;
      expv[20] = 153'h107df70372a2323d83dcbb8cd031ecf6a41e9c0;
      expv[21] = 153'h087df70372a2323d83dc3b8cd031ecf6a41e9c0;
      expv[22] = 153'h007df70372a2323d83dc665af24834f6a41e9c0;
      expv[23] = 153'h007df70372a2323d83dc665af24834f6a41e9c0;
      expv[24] = 153'h007df70372a2323d83dc665af24834f6a41e9c0;
      expv[25] = 153'h076fd682a282323d83dc665af24836f6a41e9c0;
      expv[26] = 153'h054dfdeb7c5a323d83dc665af24836f6a41e9c0;
      expv[27] = 153'h054dfdeb7c5a323d83dc665af24836f6a41e9c0;
      expv[28] = 153'h05034d0ec6b2323d83dc665af24836f6a41e9c0;
      expv[29] = 153'h015d74a4879a323d83dc665af24836f6a41e9c0;
      expv[30] = 153'h011cdbd222d2323d83dc665af24836f6a41e9c0;
      expv[31] = 153'h022404395522323d83dc665af24834f6a41e9c0;
      expv[32] = 153'h1226710f7ae34c62d93ae65af24834f6a41e9c0;
      expv[33] = 153'h125d4c3cd6f34c62d93ae65af24834f6a41e9c0;
      expv[34] = 153'h0a4491544c234c62d93a665af24834f6a41e9c0;
      expv[35] = 153'h0a4491544c234c62d93a665af24834f6a41e9c0;
      expv[36] = 153'h0a4a5e331a234c62d93a665af24834f6a41e9c0;
      expv[37] = 153'h0a4a5e331a234c62d93a665af24834f6a41e9c0;
      expv[38] = 153'h0a1f164f2a234c62d93a665af24834f6a41e9c0;
      expv[39] = 153'h0a7ae1e902034c62d93a665af24834f6a41e9c0;
      expv[40] = 153'h027ae1e902034c62d93a69bbf6f2c4f6a41e9c0;
      expv[41] = 153'h02070977dc234c62d93a69bbf6f2c4f6a41e9c0;
      expv[42] = 153'h01070977dc234c62d93a69bbf6f2c6f6a41e9c0;
      expv[43] = 153'h03063e9fc4534c62d93a69bbf6f2c6f6a41e9c0;
      expv[44] = 153'h03063e9fc4534c62d93a69bbf6f2c6f6a41e9c0;
      expv[45] = 153'h03063e9fc4534c62d93a69bbf6f2c6f6a41e9c0;
      expv[46] = 153'h031741a340434c62d93a69bbf6f2c6f6a41e9c0;
      expv[47] = 153'h051741a340434c62d93a69bbf6f2c6f6a41e9c0;
      expv[48] = 153'h041741a340434c62d93a69bbf6f2c4f6a41e9c0;
      expv[49] = 153'h049741a340434c62d93a69bbf6f2c5042e748d6;
      expv[50] = 153'h1472ba80abe27417b316e9bbf6f2c5042e748d4;
      expv[51] = 153'h0c72ba80abe27417b31669bbf6f2c5042e748d4;
      expv[52] = 153'h0c72ba80abe27417b31669bbf6f2c5042e748d4;
      expv[53] = 153'h0c72ba80abe27417b31669bbf6f2c5042e748d4;
      expv[54] = 153'h04118ec733927417b3161e568bdb75042e748d4;
      expv[55] = 153'h04118ec733927417b3161e568bdb75042e748d4;
      expv[56] = 153'h04118ec733927417b3161e568bdb75042e748d4;
      expv[57] = 153'h046911e494fa7417b3161e568bdb75042e748d4;
      expv[58] = 153'h0472a7b6c6e27417b3161e568bdb75042e748d4;
      expv[59] = 153'h0072a7b6c6e27417b3161e568bdb75042e748d4;
      expv[60] = 153'h00f2a7b6c6e27417b3161e568bdb755aac16d92;
      expv[61] = 153'h00f2a7b6c6e27417b3161e568bdb743d37caca2;
      expv[62] = 153'h00f2a7b6c6e27417b3161e568bdb7414a86db3a;
      expv[63] = 153'h0041e52d88127417b3161e568bdb75aeefd7b74;
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
