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

  rtlpp_02972 dut (
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
    stim[0] = 228'h3a81a800fb721eb583516c381a5573b8137b86652caaee413125d4194;
    stim[1] = 228'h534c557a021f5ae1bd5ad98e64edce926e6e39b8898fc8930c379d575;
    stim[2] = 228'hb64669d8e8e5e5d6092c991f558edcc2980d74ce489e32165e9808231;
    stim[3] = 228'hf5d73c2472bf2fcea12cecf30bc73a5855dd403bee8057c653e97b5ae;
    stim[4] = 228'hf260753152a86306dc65cfb0887351bbf0361f2cc32d2762db423f1c0;
    stim[5] = 228'hec514bba1e9db203e1c13dd0fa4218a64661d396d0947df8b8665fa4a;
    stim[6] = 228'hc314b7531e95e87deef2b81df67f32a5afa366c5d48d847e0293a2c05;
    stim[7] = 228'hf638dc2770e085cd1bc5ddbfea239380e9b5b94696ae00ef2024bc61a;
    stim[8] = 228'heff2cbc68568de96917868897c1be546909c47f5d62fdafd0b77c5b1a;
    stim[9] = 228'hc1bdd633dbf851b9fc809ca0e4df681cc20a117ddda0d4dc86aa91e43;
    stim[10] = 228'hd2c5ce5503f60bb8dd261bb3940c46bf1d38b9f7e05e9209e4703c9e5;
    stim[11] = 228'h9ee14370cc905a3568a7f148914902f88eae39e7251e0711f5c146506;
    stim[12] = 228'hdaf903d393a99b64255decff2902133083ef3ed45d943888d3dc963ae;
    stim[13] = 228'he0286d58b6301cb0a650ab7264d2bdea92403a24d3f0afff4878f593d;
    stim[14] = 228'h9616d43f5d2064351bcc91e9a9125d5f4bd78a0871bf5f47010696215;
    stim[15] = 228'ha8bf144c5c3a03c34d7b9ee5a76a142f6629cdd9f590b3d7f36b0d286;
    stim[16] = 228'h8bfb8158b958d34bb4bd40b45aa3110935503c902b0996805f3389263;
    stim[17] = 228'hfc523c773f85807ffb744c6289c1b2cd71817c72f34f2993b6bed2fb6;
    stim[18] = 228'h9ecd15ce46cdf9cb5ee048f72050f5014d07bc7ac4e35ee2cb967d1ee;
    stim[19] = 228'h8801e5054741c87bd0ee3c93d46aecbee14de38abdab3207f040f9255;
    stim[20] = 228'h85a49e502dced89fe92f04089a293c495ea408fb137cd76ee5a6be20e;
    stim[21] = 228'heaa25dfbfd1007ea40424c1e6f582c86edaf2791f44218a29e3b1f74c;
    stim[22] = 228'h85e068dbc9de57dcb3d42a42d472513cb736ff3456d5d5080a5743a6e;
    stim[23] = 228'hc3306d185cb974be15961eaf1edb767e8778240a70467b2c27cd20a35;
    stim[24] = 228'h91b353f563615c58893c1880812cf8bdecca19183d63e98b8cfd50143;
    stim[25] = 228'hec8730499bc61459bf2104f098cdb03eed63a436d575fa6b28c7c3575;
    stim[26] = 228'haa21b601ea140225202d8f763ec4c682b7adf5c232b97ff3c83865674;
    stim[27] = 228'hafd5d9297ea8bcddf033ae337e16b064e0cbd94a2de2b5318a9eb5922;
    stim[28] = 228'hb42ceb6d33a3d90a34ae64afb9a6ab29801f2fce8ef7e2a8290c8d388;
    stim[29] = 228'hb637238439e63665c6c167a4496ae2302f16dc4b45e0f7dd217f33430;
    stim[30] = 228'hf31c6d6507b7c19c871c0d75bcae367a687d76f434966c5737fa89eb6;
    stim[31] = 228'hfaa59bfc0005108dda0c6163965799cf8bf63571b9b558e0ffaa49d67;
    stim[32] = 228'hf4fec8bd48f5d18186ed2b74a01d3f26c293c3c7fe01a62498ad7b8ef;
    stim[33] = 228'hd058d5d5e7c09a249e9b9ec3e98e082ffe4e05152513760665110112d;
    stim[34] = 228'hff455dd2cf9ae2d71001074caed06c32a1195c1e842e61b9775af77f8;
    stim[35] = 228'hdeebd57cc2f99507e18e8edf10e89b2a6c073e0e54c0b6bd5593cb6ad;
    stim[36] = 228'hfd216e8fd525ad2c1aa5674ae1ce4cff30c9f9f8113a5bf672c875742;
    stim[37] = 228'hf28748020cad1edff639f7ef1807163432507cd2501290aab7a0bc1f8;
    stim[38] = 228'h9ecb4b99d80f6c0dddfbec5e6f35b267589e92c33da082d58055f5ae6;
    stim[39] = 228'hcd594e36898a7e4cf3c09958e4d23556adfc6a7cdc58b78c75650f12d;
    stim[40] = 228'h89bc5e5b0d40b14af2298a49c01e973f4c53618a24e5a69d5b56baf0f;
    stim[41] = 228'haef65847c09c8fc311fc113707a1b98729509f58dd76b3c53b0188288;
    stim[42] = 228'hc6a74106b882ff718718b32e7c9e3bfe88bc1166fe66e3242223dc4b4;
    stim[43] = 228'h83b18bb85d679a5f5125c07cfcf90e4560a4309c0a86188cb02208655;
    stim[44] = 228'hd52a7621a350c4319e8e00418275b2f66d168203b106b53ba23816433;
    stim[45] = 228'hfee94cdaf486ea86fa67c127aef788e015f414918f85f7fb572d2df72;
    stim[46] = 228'hbacd1558995baa7c0147e41e9fbba91eb3986286670c6cbfb69cf81fa;
    stim[47] = 228'h9b735e7a9ffb06eb816f16002c5fa5fed18be0213dc5e303350e5e1e3;
    stim[48] = 228'he0c4e13c3b963b9fa4b45cab86277aeeea8afc459bf88f30898d361f5;
    stim[49] = 228'hb341b54989a7102eb68007fe7650b37cecc6bbeaf811e11b2b9644196;
    stim[50] = 228'hb50f3979b74972272a33dc345bf7593e6d1c83fb838d57fbcee61a1ec;
    stim[51] = 228'h9d0667784fedb18510b1df940ec013e6a9669ffd2a5ce613b78c06f00;
    stim[52] = 228'ha8096b155fdfb3c844e26e7d39c419185094f4b70bfb1c14714e755a4;
    stim[53] = 228'he174fab45086cfe9a83fde22002f9bdb4b74db557a3014880ddc6cbb4;
    stim[54] = 228'hda0e15b8c5ab0fa7b7edcdc07829af326bc36e72616dec11c92059995;
    stim[55] = 228'haaeb697111b0821411068ff0eac2afee94afbbeb5beaf77d9e0c913e3;
    stim[56] = 228'hd2317aca2a6fcb65dfcad3b3c5ddfe06fd0e09cafdcc18d39b1092ee5;
    stim[57] = 228'hbb778f420dc9dcad9166e179be138fe248fa8c2f9f0effb4e64caca68;
    stim[58] = 228'hada0c84b0e110696719db03c0422cd091d4c586e7d6bc9edd7c73e072;
    stim[59] = 228'h9c5963ea49e72fc040beee5f32dbbe330d27191a6bdf409365da1a1d8;
    stim[60] = 228'hff81d75ebcc3106bcbbbe1ec7c1343cef3af81faa97bc973378e4d487;
    stim[61] = 228'hb572cb9db4e13fbbd9b892aaea10ee5cbf4bed35fc28096c67356ea79;
    stim[62] = 228'hecf1dd8d3b2ba89224926a5ab411c393a59078296725891c98bb03b52;
    stim[63] = 228'hcda181e95e7545b0632c1c4c139f74ab4dbd01e2e397022da5078b7cb;
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
      expv[3] = 177'h0800030a5e98082318000000004c8faac76c000000001;
      expv[4] = 177'h08000b0a5e98082318000000004c8faac76d5dd403beb;
      expv[5] = 177'h1800030a5e98082300753152abcc8faac76d5dd403be8;
      expv[6] = 177'h00000b0a5e98082300753152ab4c8faac768661d396df;
      expv[7] = 177'h00000a968293a2c058753152ab4c8faac768661d396df;
      expv[8] = 177'h15e2fa968293a2c040dc2770e6cc8faac768661d396de;
      expv[9] = 177'h0de2fa968293a2c040dc2770e63444be0df4661d396df;
      expv[10] = 177'h15e2f07306aa91e43dd633dbfcb444be0df0661d396dd;
      expv[11] = 177'h1de2e07306aa91e43dd633dbfc8dd9ca0624661d396dd;
      expv[12] = 177'h0c53907306aa91e43dd633dbfc0dd9ca0624661d396dd;
      expv[13] = 177'h0453807306aa91e43dd633dbfc0dd9ca0620661d396dd;
      expv[14] = 177'h0c53887306aa91e425d633dbfc55b932695d2403a24d6;
      expv[15] = 177'h1c538d7d010696215ed43f5d22d5b932695d2403a24d7;
      expv[16] = 177'h0c53857d010696215ed43f5d2255b932695d2403a24d5;
      expv[17] = 177'h1c53857d010696215b8158b95dd5b932695d2403a24d5;
      expv[18] = 177'h0dba357d010696215b8158b95d55b932695d2403a24d5;
      expv[19] = 177'h1dba3d7d010696214515ce46cdd5b932695cd07bc7ace;
      expv[20] = 177'h1dba32fbf040f9255d15ce46cdd5b932695cd07bc7acd;
      expv[21] = 177'h15ba3afbf040f9254515ce46cdd5b9326959ea408fb0a;
      expv[22] = 177'h1dba32fbf040f9254515ce46cda60f37ac15ea408fb09;
      expv[23] = 177'h15ba32fbf040f9254515ce46cda60f37ac11ea408fb09;
      expv[24] = 177'h1dba21fa27cd20a35d15ce46cd8f578f6dbdea408fb09;
      expv[25] = 177'h15ba21fa27cd20a35d15ce46cd8f578f6db9ea408fb09;
      expv[26] = 177'h15ba29fa27cd20a34515ce46cd8f578f6db8d63a436de;
      expv[27] = 177'h0816b1fa27cd20a34515ce46cd47bb1f6264d63a436dd;
      expv[28] = 177'h1816b1fa27cd20a345d9297eaec7bb1f6264d63a436dd;
      expv[29] = 177'h1016a1fa27cd20a345d9297eaec7bb1f6260d63a436dd;
      expv[30] = 177'h0360d9fa27cd20a345d9297eae47bb1f6260f16dc4b5b;
      expv[31] = 177'h0b60c9fa27cd20a345d9297eae06bade571cf16dc4b5b;
      expv[32] = 177'h1b60c73e7faa49d67d9bfc000686bade571cf16dc4b59;
      expv[33] = 177'h1b60c73e7faa49d6659bfc000686bade571cf16dc4b58;
      expv[34] = 177'h1b60c0bfe5110112dd9bfc000686bade571cf16dc4b59;
      expv[35] = 177'h0360c0bfe5110112c59bfc000606bade5718f16dc4b58;
      expv[36] = 177'h00c754a9d593cb6add9bfc000606bade5718f16dc4b59;
      expv[37] = 177'h18c75ca9d593cb6ac16e8fd526b3a570e7250c9f9f80e;
      expv[38] = 177'h10c744a9d593cb6ac16e8fd526b3a570e7210c9f9f80d;
      expv[39] = 177'h06fddca9d593cb6ac16e8fd52633a570e72189e92c323;
      expv[40] = 177'h1efddd5af5650f12d94e36898eccac72691d89e92c323;
      expv[41] = 177'h06fdcd5af5650f12d94e36898e4cac72691989e92c323;
      expv[42] = 177'h16fdcd5af5650f12de5847c099ccac72691989e92c323;
      expv[43] = 177'h16fdcd5af5650f12c65847c099ccac72691989e92c322;
      expv[44] = 177'h1efdc115b02208655e5847c099e03e7e7c8589e92c321;
      expv[45] = 177'h07473115b0220865465847c099603e7e7c8189e92c320;
      expv[46] = 177'h17473915b0220865414cdaf483e03e7e7c815f414919b;
      expv[47] = 177'h07473115b0220865414cdaf483603e7e7c815f4149199;
      expv[48] = 177'h0f4737fb350e5e1e394cdaf4830b00162fd55f4149199;
      expv[49] = 177'h0f4727fb350e5e1e214cdaf4830b00162fd55f4149198;
      expv[50] = 177'h134037fb350e5e1e21b54989a78b00162fd15f4149199;
      expv[51] = 177'h03403ffb350e5e1e21b54989a70b00162fd0d1c83fb8b;
      expv[52] = 177'h134027fb350e5e1e2667784fea8b00162fd0d1c83fb89;
      expv[53] = 177'h034027fb350e5e1e2667784fea0b00162fd0d1c83fb89;
      expv[54] = 177'h034027fb350e5e1e2667784fea0b00162fd0d1c83fb89;
      expv[55] = 177'h1bf694c9c92059995e15b8c5abe6e03c14d4d1c83fb89;
      expv[56] = 177'h03f68cc9c92059994615b8c5ab66e03c14d14afbbeb5a;
      expv[57] = 177'h1fe5301b9b1092ee597aca2a6ae9d9e2eefd4afbbeb59;
      expv[58] = 177'h0fe5201b9b1092ee417aca2a6a69d9e2eefd4afbbeb58;
      expv[59] = 177'h17e5281b9b1092ee40c84b0e13e9d9e2eef9d4c586e67;
      expv[60] = 177'h085f381b9b1092ee40c84b0e13772f996dddd4c586e67;
      expv[61] = 177'h085f2f3bb78e4d4878c84b0e13772f996dddd4c586e67;
      expv[62] = 177'h105f2f3bb78e4d4862cb9db4e5f72f996dd9d4c586e66;
      expv[63] = 177'h005f273bb78e4d4862cb9db4e5772f996dd9d4c586e65;
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
