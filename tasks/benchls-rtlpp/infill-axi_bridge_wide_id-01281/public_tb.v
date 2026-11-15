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
    stim[0] = 228'h5a4268db23c3c3b94d803b4286982c8d0f56c3e53d8222a4b31dcbfde;
    stim[1] = 228'h40d09b5842deed4d7e9281c2dc2f8f3d90d9bd609e4028091a01dd179;
    stim[2] = 228'h21648c6e09a64ef9dc976c1724cfee35476aea9ed459c10eb7b51053e;
    stim[3] = 228'hb92d5b1cf02715b078b6f85a981ee5b957bd349b2e7e1a3cc1c191132;
    stim[4] = 228'h998c4480e8d8e25236c99aa3a57ee87aaa22ecb95000ae1d82315c492;
    stim[5] = 228'h8d87f857c43f72bcdd9b09f4ef74a7ced3d5cd4c5497d3bbe0bf0e72d;
    stim[6] = 228'hd764e13878de8457dc945531483e5cdd6313b9262dd53910534ee5de2;
    stim[7] = 228'hc152ecc1f94079190d51913c12a0d767411c510693463f1fd0cb34e8d;
    stim[8] = 228'hf702609acbca6c2a7c2787140de6de7c77cfa365dad0a0517fd9068f9;
    stim[9] = 228'hf490c60106b22348ba1e4fd1193015562c5855ff64b00d4741528bbe8;
    stim[10] = 228'hd4d25c1e91e95629bb8cf1d1f553fabc925f412eb2edb15cd08af8570;
    stim[11] = 228'hb8755c5546ae0f56060d248208b3e0b46b636be47d047e25032e064b8;
    stim[12] = 228'h81cd778e706a718b28d940b81200ca4b8a305357dccfca2f33b611938;
    stim[13] = 228'he0bf6c272198932668d132ecf71e3cef80844e1e5bb416c0137e293a6;
    stim[14] = 228'ha0d23ef3f87335b04e5782fc6567755491d2b8bdb8c31987aa778b90a;
    stim[15] = 228'h9f2633e6a9949f2faa2745126676bb583e2433a09af7c48b1bdbf9d4d;
    stim[16] = 228'h88cba330f61068963f983793e3c832968d90f2b7e2fa006cd22b309ba;
    stim[17] = 228'h9777b0238cf3f738ec8e5cc58d7df237e9ee1dc0ce517ffbf43b21fc0;
    stim[18] = 228'hc44d8d410fb5c11cb36ad7ff1d8f9675a1820a6ff2e403b27a9ba13e0;
    stim[19] = 228'h9b3a5483a27d5bf5d57d87c586f20c1ba5d7472d10bddd9a85edff07d;
    stim[20] = 228'he1e6e1348b3b974cc25fc885036d04e372e3cae219f16bd20363d832d;
    stim[21] = 228'hcc7c65b587c634d1ab236db4cadead70fecc856a04a7414454b99a8c4;
    stim[22] = 228'hba1d6976949565d678fbc95f6c19842d1d2811e2efc231c804b179a5d;
    stim[23] = 228'he9839d92923f0826aa56ba8fc60637727aa417bb1687d6076e6dfd602;
    stim[24] = 228'h89734ad05a063ac505390ba0c746a191cca452e2ce7b4475db55178e6;
    stim[25] = 228'hb2ccd072f598d8c562dc50ea477a74588178e6897d4767bb70109f71e;
    stim[26] = 228'hf4288e5a3b1809c7c6d8880af5123176f0da46a3a0c2a54e96b776c68;
    stim[27] = 228'hfd27e930d4fe6eb68ff67bcf1daf31f8a5c1891dcc7f14288e0e866bb;
    stim[28] = 228'hbd1e192860532b577b0fe158ebf4bcb2c85adc4589daf00268f2e2c59;
    stim[29] = 228'hf521bd87d21e292209d69f62d892f7a30ab089feee7045b1aaf916f32;
    stim[30] = 228'hd18b50951329f4b7033ddbff36d47dc74068ccb2820982890cc069bb9;
    stim[31] = 228'hf5c0fcc8aae1c8829400db8ac324cba0ae7873c8b44a6f46f52acf5d1;
    stim[32] = 228'he2f76897d287eaf1aa085ca65250f8aa9671660e617e98b4bc16b8176;
    stim[33] = 228'hd81f8083bdb81d130fed15737bc9b689775a66e7e52ac948db8e43000;
    stim[34] = 228'he1ef513e4aef4aaab1d8bb497217aecbe72003a2b76f5ab69f4c7b011;
    stim[35] = 228'hfce702b2710372cd1a95c04d7390fedf9927b510842d6e1147bc355ad;
    stim[36] = 228'hde29663aae57ffbeaca0cd1d33320cf62a3eb37767953d09d6986e2f5;
    stim[37] = 228'h95b7bba8611a8d0b14754d75ed424c01b10b9e2468846c838760993ff;
    stim[38] = 228'hb4b8a917cf824395c3b63b24db03b075105ef1f584cd2edf416d505c9;
    stim[39] = 228'ha4b4036f9e4489e1ea201076023cfee75bc21980dcfbd78591a040f87;
    stim[40] = 228'hc3d72f7fe77743f4a0ebdf6d7e32d7d219a961e1a82b4525302bc8c2a;
    stim[41] = 228'h821a10e828f20aca91b2c4aaf1e92c65cf84a4a3cf1465fb950374de1;
    stim[42] = 228'h93bb0585b67c4e995b3632a0e119d267a2f2b5cc74ba99a370857370f;
    stim[43] = 228'h83b68e12a77fd9328f947ba501e37fb0224be38653fc2275b6dc2a133;
    stim[44] = 228'ha5a8b224da7c18516f450f152023f029aedd4074aadcc3258fa191249;
    stim[45] = 228'habe4a375290e5da7be29287c971af7f805fb9cb6f9638fbc4b9b120c5;
    stim[46] = 228'h25f1bda94bbc499df51a12e882fd9ce0e26fd9012552386af9af80869;
    stim[47] = 228'h9186ace66dc6a0619c17e01d4374b4b7e7c6c64a2b0e366f67dabd302;
    stim[48] = 228'hc8ce776eecaf770656dfdf920006717a8eb721d968f9540c9da20c81c;
    stim[49] = 228'he8541b6682f2bb85ddb549eb30b997fbb236681c6aebf9e911c861d8a;
    stim[50] = 228'hbd5cf1355f87f25960d128d72fac77305d2b9ebc42f684199a3a2200d;
    stim[51] = 228'h90cfb33ece454e796b92a4d1d8b283e5df0fcb0090e039d0213c4f3c9;
    stim[52] = 228'hc94c202f690297c4b00c597f71fde0f3c15945913df31f1228ef9dcb3;
    stim[53] = 228'ha7474b60c3810d073da995ca73818f5b78d9f2c96d26f05fb8977809c;
    stim[54] = 228'hfc98472c4f15795890e45b94aa8d049fcb1bf481466ff8c73b16c2bf4;
    stim[55] = 228'hb89ffd92104991e0b9dbc02e6cfb1a56a51646c3c51cee95e97dc539c;
    stim[56] = 228'hb889795f7772adcb006cddddd6333a89755908a64d6d923862319ba6d;
    stim[57] = 228'hdaec2eab4d863fd062417bf20380f906acd09e96615e4b19cd112fb4c;
    stim[58] = 228'ha02fe441f2a06d0debf43ecefc9a7df933bb6ff0619584994918f4d57;
    stim[59] = 228'he9624030f26fb28d16b37ba1afe1298caf6449f8e779abae06959e138;
    stim[60] = 228'h81a7358f493061fa4352dd2c2ccfc8f8c8a2c49eacd323abb9639e0df;
    stim[61] = 228'hcd0f84623056164af0f17607427220db688b36d79f3ed961fa2572798;
    stim[62] = 228'hff4282d21991c7d1831fdbe547f7e69b3a8116110b05c8533743f6722;
    stim[63] = 228'hc15efad9640780b1f51d3db9b5143a62cf51181a7ae1e3e071819d655;
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
      expv[0] = 177'h00000000000000000268db23c41da1434c14f56c3e531;
      expv[1] = 177'h0000000000000000009b5842dec0e16e17c70d9bd6094;
      expv[2] = 177'h0000000000000000048c6e09a4b60b9267f676aea9ec0;
      expv[3] = 177'h0000000000000000055b1cf020fc2d4c0f757bd349b2d;
      expv[4] = 177'h1800000000000000044480e8d9cd51d2bf70a22ecb954;
      expv[5] = 177'h000000000000000007f857c43e84fa77ba573d5cd4c49;
      expv[6] = 177'h180000000000000004e13878dbaa98a41f2c313b9263c;
      expv[7] = 177'h064a10000000000002ecc1f944489e09506e11c51069c;
      expv[8] = 177'h0e4a00000000000002609acbcdc38a06f36f7cfa365d2;
      expv[9] = 177'h161398000000000000c60106b4a7e88c980cc5855ff66;
      expv[10] = 177'h0e139558ef56df779a5c1e91ecf8e8faa9fb25f412eba;
      expv[11] = 177'h16138d58ef56df779d5c5546ab12410459f0b636be47d;
      expv[12] = 177'h06138558ef56df7785778e706d205c090062a305357c5;
      expv[13] = 177'h06138558ef56df77876c27219b19767b8f1c0844e1e4a;
      expv[14] = 177'h0e138d58ef56df77823ef3f870417e32b3bd1d2b8bdac;
      expv[15] = 177'h072b9558ef56df778633e6a9972289333b5be2433a080;
      expv[16] = 177'h072b8558ef56df7783a330f6139bc9f1e41ad90f2b7e3;
      expv[17] = 177'h172b8d58ef56df7787b0238cf42e62c6befa9ee1dc0df;
      expv[18] = 177'h072b80dfef56df779d8d410fb6ebff8ec7ce1820a6fe1;
      expv[19] = 177'h1f2b80dfef56df77825483a27ac3e2c379045d7472d0c;
      expv[20] = 177'h02be90dfef56df7786e1348b3e644281b6852e3cae216;
      expv[21] = 177'h0abe98dfef56df778465b587c036da656f55ecc856a02;
      expv[22] = 177'h059195c3ef56df779d69769493e4afb60cc5d2811e2fa;
      expv[23] = 177'h1d919dc3ef56df779b9d92923b5d47e3031faa417bb08;
      expv[24] = 177'h052b15c3ef56df779b4ad05a0205d063a350ca452e2c3;
      expv[25] = 177'h052b1dc3ef56df7784d072f59a287523bd3c178e68971;
      expv[26] = 177'h0d2b15c3ef56df77808e5a3b1b44057a89190da46a3b2;
      expv[27] = 177'h052b1dc3ef56df7787e930d4fb3de78ed7985c1891dc9;
      expv[28] = 177'h052b15c3ef56df778619286053f0ac75fa5c85adc4598;
      expv[29] = 177'h1d2b15c3ef56df7781bd87d2194fb16c497eab089fee1;
      expv[30] = 177'h04eb15c3ef56df77835095132b6dff9b6a3c068ccb280;
      expv[31] = 177'h0ceb15c3ef56df7780fcc8aae1edc5619262e7873c8b6;
      expv[32] = 177'h14eb0dc3ef56df77876897d2802e53292879671660e6d;
      expv[33] = 177'h04eb05c3ef56df77878083bdb90ab9bde4df75a66e7e6;
      expv[34] = 177'h0ceb0dc3ef56df7787513e4aeddda4b90bd672003a2ad;
      expv[35] = 177'h10ec15c3ef56df778702b27106e026b9c87f927b51094;
      expv[36] = 177'h08ec05c3ef56df7781663aae57668e999904a3eb3777c;
      expv[37] = 177'h065015c3ef56df7787bba8611da6baf6a12510b9e2474;
      expv[38] = 177'h1e5015c3ef56df7780a917cf821d926d81d905ef1f596;
      expv[39] = 177'h06501dc3ef56df7784036f9e40083b011e7fbc21980c8;
      expv[40] = 177'h0e5005c3ef56df77872f7fe7726fb6bf196f9a961e1a1;
      expv[41] = 177'h007595c3ef56df778210e828f5e25578f494f84a4a3d3;
      expv[42] = 177'h18759dc3ef56df77830585b67c9950708cea2f2b5cc6d;
      expv[43] = 177'h007585c3ef56df77868e12a7793dd280f1be24be38653;
      expv[44] = 177'h08758dc3ef56df7780b224da78078a9011f8edd4074a1;
      expv[45] = 177'h007585c3ef56df7784a375290b943e4b8d7e5fb9cb6e5;
      expv[46] = 177'h000000000000000001bda94bbe8974417ecc26fd9013f;
      expv[47] = 177'h000000000000000006ace66dc0f00ea1ba5c7c6c64a3b;
      expv[48] = 177'h180008000000000006776eecabefc9000338eb721d968;
      expv[49] = 177'h0000000000000000041b6682f2a4f5985ccf236681c7f;
      expv[50] = 177'h180008000000000004f1355f84146b97d63fd2b9ebc40;
      expv[51] = 177'h006890000000000007b33ece445268ec5943f0fcb009e;
      expv[52] = 177'h006888000000000004202f6902acbfb8fef015945912c;
      expv[53] = 177'h1068800000000000074b60c383cae539c0c78d9f2c97a;
      expv[54] = 177'h086888000000000000472c4f14adca554684b1bf4815e;
      expv[55] = 177'h1072127f6f56df779ffd921048e017367d8a51646c3d4;
      expv[56] = 177'h0072027f6f56df7799795f77756eeeeb199b55908a649;
      expv[57] = 177'h0072027f6f56df77842eab4d803df901c078cd09e9664;
      expv[58] = 177'h0072027f6f56df7787e441f2a61f677e4d3d3bb6ff060;
      expv[59] = 177'h0872027f6f56df77824030f26ebdd0d7f090f6449f8f5;
      expv[60] = 177'h1072027f6f56df7787358f49356e961667e08a2c49eb1;
      expv[61] = 177'h0072027f6f56df778784623055bb03a1391088b36d78f;
      expv[62] = 177'h10720a7f6f56df778282d219906df2a3fbf7a81161106;
      expv[63] = 177'h0872026cef56df779efad964009edcda8a1af51181a73;
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
