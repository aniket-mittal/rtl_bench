// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 230;
  localparam OW = 177;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03214 dut (
    .aclk(clk),
    .aresetn(in_vec[229:229]),
    .s_axi_awid(in_vec[228:217]),
    .s_axi_awaddr(in_vec[216:185]),
    .s_axi_awlen(in_vec[184:177]),
    .s_axi_awsize(in_vec[176:174]),
    .s_axi_awburst(in_vec[173:172]),
    .s_axi_awlock(in_vec[171:171]),
    .s_axi_awcache(in_vec[170:167]),
    .s_axi_awprot(in_vec[166:164]),
    .s_axi_awregion(in_vec[163:160]),
    .s_axi_awqos(in_vec[159:156]),
    .s_axi_awvalid(in_vec[155:155]),
    .s_axi_wdata(in_vec[154:123]),
    .s_axi_wstrb(in_vec[122:119]),
    .s_axi_wlast(in_vec[118:118]),
    .s_axi_wvalid(in_vec[117:117]),
    .s_axi_bready(in_vec[116:116]),
    .s_axi_arid(in_vec[115:104]),
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
    stim[0] = 230'h084407b4bbdfccb349b6d85351af59a4e1b1f7f1cc4555c5fb279f9088;
    stim[1] = 230'h1ce2378bd0535e0a5f9081374e0cf1564da8205d3be1776ac2fa367b9b;
    stim[2] = 230'h3d388937d6d8b342d6e0a70c7b19425f056f813d7192ff3111aeae54bb;
    stim[3] = 230'h375e29b2058db2a54e7bc4fb688e547f49872137e8d56369d2eaac719e;
    stim[4] = 230'h29cc29ec95b47240b77f3ab38b791d623abb7695a920b045dc2b770bd9;
    stim[5] = 230'h3cc4984b2f3afb8ca099d631f7b34edbfebc8fc4a09dcef7e1f474f97f;
    stim[6] = 230'h229e0d3795e9b8d5f57df272ead2411b2904aeec214efb22b63444ddcc;
    stim[7] = 230'h37b89d8128c6983aa4d790105fda8f6fec0778c7d4008c39efeef2b433;
    stim[8] = 230'h2497d25fd2298dbb08890917a6177b9a79cb03050837581c52e5c7bc2e;
    stim[9] = 230'h3ca5003157eb3456dad3154e39fb8bceb4efd0c61023f0bbcd1bc067e2;
    stim[10] = 230'h2d587d79ed0bf612fce5a8935ec57f9f8ee2a64b0140737f2a21a3f0cc;
    stim[11] = 230'h2f7795565fd61bf838012e39aaf40cd671188793045a4a4a6fda7d79f8;
    stim[12] = 230'h33222fd881719e2458d97f08aa2f4f6d8c1e6c6cd196dde0285d47a1c8;
    stim[13] = 230'h37fe16b31ad43d63ea370242cd68235ebe3cf31ee062775b7860510245;
    stim[14] = 230'h247f4fbd1286f5fc457a77f9d2c29e74439735ce204790e59da67622dc;
    stim[15] = 230'h33cb155fe439c46b872fa9928a4e4b7750110305c09300f0c6409f682f;
    stim[16] = 230'h3fbd8b2f9f26548671bc13064a3b622ca59e8126547df68343d68a17f7;
    stim[17] = 230'h36e2ddc6ac57571989a7f96e8d94bd56f547da463370804f1fa771089d;
    stim[18] = 230'h2f4c5f6acd7f3baaf73891a9c7998c0377e92778a61926950a45ea4580;
    stim[19] = 230'h3db1afe0d7061f597e80b0e6dac3a1e66e6189ad2d054e4663df06f835;
    stim[20] = 230'h226fc02f4b8246914b088e38e49c6b71da8216764d7afece694d28a81e;
    stim[21] = 230'h3093beedc9b9793077de5a26dca2bdb8092d9061d5c6f08f7fefb44541;
    stim[22] = 230'h368b2f636e7b0145115e968dc722c25bdba3a840eaec0c6991a99fc5f2;
    stim[23] = 230'h2d50bad3ced1cacd3c7708e6347ed46f7c70f4d8c8f5ca3cc699afc2c2;
    stim[24] = 230'h22d289de03e1e43119feb1e462774c70e768bd5985f9774965ffd5a778;
    stim[25] = 230'h38717a99f38f1c7aec66c47a59b89afb0fea143cdf816427b87203b643;
    stim[26] = 230'h2bd64cbba75b9d0ad7ab94184746e84304582d262819d3d677832f6143;
    stim[27] = 230'h27069e9e4bd8f7ecb3162836f91b685e3a263b79f9d2855f8bebb705c4;
    stim[28] = 230'h2c3d3a1903a7b83e3dc5ee0414ae2bb1df5e543086d66ee456b14585ec;
    stim[29] = 230'h235d49400026dcf8afcba3a510a076152a6c80ec306c71b8000d5df64a;
    stim[30] = 230'h3ed78fcfcaaa7b47c46773485b7ce3f182538dc51336f39ffa1b7787f7;
    stim[31] = 230'h397052eff0c47f063555e902a1e7ecf64b3a3f9da2c4e5a06738ac39cf;
    stim[32] = 230'h3e0ba891c805575347f49b6b78313e053bcfd5ac0545a98f7281be4a5f;
    stim[33] = 230'h2f1be36186de4e9dcc6fe83e068d5baa95eb16dabd707d14ec941f2746;
    stim[34] = 230'h2875feba04e1370d7e2b5224c6fc600407aa3550d2d76273d8e527d57a;
    stim[35] = 230'h31c3f346902b9701c7a479ebf459d3543aba63140b45b5f9d2c97c7433;
    stim[36] = 230'h3b14fab966abc19ce0ae295fc7e9948c5353672f51edd82ec4c24f9707;
    stim[37] = 230'h2d55fd1b03f031874da934e3e8a8b03231a908d3d155dc264c9d42325e;
    stim[38] = 230'h240c5884f5b162de9e39139b23929ac19225719de4f9f18d2e0619a820;
    stim[39] = 230'h382bc49cabb463d2bbe5ce8fa57d409b455bd14fe8ecc1958db52297e7;
    stim[40] = 230'h344062ddeedb7cbce381dfaed9f3457a859b2e46abfafd65e9c0bf0aa4;
    stim[41] = 230'h20c909a8790d0ba29e2533182528b731c71e986274a719c237079149e9;
    stim[42] = 230'h38ddcb7141c2e10676b09ae1d565bc109d004b2373929559f2ea954d4e;
    stim[43] = 230'h3867529b1d16dcdfb8f4dc51327cb4ed9995797d179e58c82c2d366415;
    stim[44] = 230'h31063282ca046ba24dbc324381829ff2993616a03d6c1e72aa99703df9;
    stim[45] = 230'h34860ae22c5ad47110f93a8f697bd3b5acde33e5d371dbd9022a0ccba5;
    stim[46] = 230'h3f69efce8e5d6397fe9d13a135f22f6ebdb5beaf6763832e62ad6d0ee7;
    stim[47] = 230'h23c87ad723609cee8241453bef4c6dd478ca83845b8cdc05471f7b11ff;
    stim[48] = 230'h24c66e750b4fe6484a1e5e7b4c1876f8634818f8182db0b112ddab7537;
    stim[49] = 230'h3e4ad764042c4d57557ef38069ac71e2360a25c79c4b942b32f9bdab87;
    stim[50] = 230'h3740824425e6cd92b55a7e26c3c0648fd7074a8b1dc3c9e382272b8479;
    stim[51] = 230'h3443600dc2349588b6f331be0fcc7b91680d4871789b76505f16bc85fd;
    stim[52] = 230'h394724e8ca21c8d74cf241bc0dd1d1d7a8f55fbb934edc88eb0b22cb1d;
    stim[53] = 230'h3f52b1242b4f45fa2bdb4956edeb700f250af914de20f3bfa5904202df;
    stim[54] = 230'h37d9e174477e3c959b500c39b80b5c2c83c90324e58346a62d42dc63e0;
    stim[55] = 230'h3e47b5b8640d4a9a7dbd60dbe5b1d5a3ad3dca9f6aeb0ece6e7d24b690;
    stim[56] = 230'h331f36300a6e27c011bb5622acdd1e347366b9046bdc5e81ae16730983;
    stim[57] = 230'h3e506a096cbf8c2e4ea0d5c9e6af5c807c97256521ec25b598a70845e3;
    stim[58] = 230'h37deaff29c92b8de9e2929ab5b379d0f89538628dbe1cfbffbedf1e963;
    stim[59] = 230'h29f36e50822e3bde171b164f30956b1bc4da35564ec803c84d556cedab;
    stim[60] = 230'h3a54ce880f62689dd1bcbed5ddb8453a8ff0f37c156f2650ba9206481c;
    stim[61] = 230'h3c8842fbd016a99ec975b305ba8301191e1b3c8b6e6c9efad9c65163f5;
    stim[62] = 230'h22095a578ea41298e18e87d7f0c62dc61a53cf441c9b159c059d42a981;
    stim[63] = 230'h2e72c0d98d8f4d3aff80c486272e1d2623a18cf960e49ab6a2885d5349;
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
      expv[3] = 177'h00000000000000000224df5b650a70c7b1900adf027bc;
      expv[4] = 177'h100000000000000000a6c81634bc4fb688e2930e426f0;
      expv[5] = 177'h000008000000000000a7b256d3f3ab38b7927576ed2ba;
      expv[6] = 177'h1000076def56df779a612cbcea9d631f7b31fd791f887;
      expv[7] = 177'h0000076def56df779034de57a7df272ead2052095dd9d;
      expv[8] = 177'h0000076def56df77927604a31a790105fda9d80ef18e4;
      expv[9] = 177'h18000f6def56df7797497f48a090917a6176f396060ae;
      expv[10] = 177'h0000076def56df779400c55fad3154e39fb969dfa18d9;
      expv[11] = 177'h08000f6def56df7791f5e7b42f5a8935ec571dc54c97b;
      expv[12] = 177'h0000076def56df779655597f5b12e39aaf40e2310f265;
      expv[13] = 177'h1000076def56df7790bf6205c597f08aa2f1183cd8d8c;
      expv[14] = 177'h0800076def56df77905acc6b5670242cd6857c79e63d9;
      expv[15] = 177'h10000f6def56df77953ef44a1ca77f9d2c2a872e6b9ca;
      expv[16] = 177'h0000076def56df7794557f90e0fa9928a4e0a022060a0;
      expv[17] = 177'h1800076def56df77962cbe7c9fc13064a3b54b3d024d9;
      expv[18] = 177'h00000f6def56df7793771ab1587f96e8d94fea8fb48c3;
      expv[19] = 177'h10000601ef56df77997dab35ff891a9c7998efd24ef12;
      expv[20] = 177'h08000e01ef56df7796bf835c1f0b0e6dac3cdcc3135a7;
      expv[21] = 177'h109b95b8ef56df779f00bd2e0c88e38e49c5b5042cedf;
      expv[22] = 177'h089b8db8ef56df7796fbb726e7e5a26dca2e125b20c3b;
      expv[23] = 177'h109b85b8ef56df7794bd8db9e9e968dc7229b74750804;
      expv[24] = 177'h009b8db8ef56df7792eb4f3b43708e6347eaf8e1e9b06;
      expv[25] = 177'h109b85b8ef56df779227780f81eb1e462771ced17ab38;
      expv[26] = 177'h009b8db8ef56df7795ea67ce3e6c47a59b8a1fd428793;
      expv[27] = 177'h189b8421ef56df779932ee9d6db94184746c08b05a4cb;
      expv[28] = 177'h01c19c21ef56df77927a792f6362836f91b4744c76f23;
      expv[29] = 177'h09c195d8ef56df779ce8640e9b5ee0414ae5bebca8616;
      expv[30] = 177'h11c185d8ef56df779d2500009aba3a510a0654d901d98;
      expv[31] = 177'h09c18dd8ef56df77963f3f2aac773485b7cd04a71b8bb;
      expv[32] = 177'h065c15d8ef56df77914bbfc3135e902a1e7c96747f3b0;
      expv[33] = 177'h0e5c0dd8ef56df7796a247201449b6b78316779fab597;
      expv[34] = 177'h165c05d56f56df779f8d861b7cfe83e068d32bd62db5e;
      expv[35] = 177'h0e5c05d56f56df7797fae81387b5224c6fc40f546aa11;
      expv[36] = 177'h065c05d56f56df7797cd1a40ac479ebf459a7574c6298;
      expv[37] = 177'h165c0dd56f56df7793eae59aaee295fc7e9aa6a6ce5ef;
      expv[38] = 177'h0e5c00196f56df779ff46c0fc4934e3e8a8e635211a6f;
      expv[39] = 177'h165c08196f56df77996213d6c19139b2392b244ae33ba;
      expv[40] = 177'h065c004def56df779f1272aed35ce8fa57d08ab7a29e2;
      expv[41] = 177'h065c084def56df77998b77bb6e1dfaed9f310b365c8de;
      expv[42] = 177'h0e5c004def56df779426a1e431533182528f8e3d30c4d;
      expv[43] = 177'h065c004def56df77972dc5070f09ae1d565f3a0096468;
      expv[44] = 177'h0e5c004def56df77954a6c745b4dc51327cf332af2fac;
      expv[45] = 177'h165c004def56df7790ca0b2814c32438182b326c2d40d;
      expv[46] = 177'h065c004def56df77902b88b16993a8f697bb59bc67cac;
      expv[47] = 177'h1e5c084def56df7797bf3a3977d13a135f257b6b7d5e3;
      expv[48] = 177'h00f216ea6f56df7799eb5c8d801453bef4c4f1950708e;
      expv[49] = 177'h18f206ea6f56df7799b9d42d3ce5e7b4c186c69031f18;
      expv[50] = 177'h079296ea6f56df77935d9010b5ef38069ac66c144b8e9;
      expv[51] = 177'h1f9296ea6f56df77920910979ba7e26c3c05ae0e95165;
      expv[52] = 177'h079286ea6f56df7795803708d3331be0fcc6d01a90e38;
      expv[53] = 177'h079286ea6f56df779493a32884241bc0dd1b51eabf76c;
      expv[54] = 177'h1f928eea6f56df7792c490ad3ab4956edeb64a15f229b;
      expv[55] = 177'h079286166f56df779f85d11df900c39b80b3079206483;
      expv[56] = 177'h17928e166f56df7796d6e19037d60dbe5b1b5a7b953e7;
      expv[57] = 177'h079286166f56df7794d8c029b9b5622acdd2e6cd7208c;
      expv[58] = 177'h07928e166f56df7791a825b2fc0d5c9e6af2f92e4acb2;
      expv[59] = 177'h17928687ef56df779abfca7249929ab5b37b12a70c507;
      expv[60] = 177'h0f928687ef56df779db94208b9b164f3095589b46aac0;
      expv[61] = 177'h17928687ef56df779b3a203d8dcbed5ddb811fe1e6f90;
      expv[62] = 177'h07928687ef56df77910bef405c5b305ba8303c367916d;
      expv[63] = 177'h1f928e87ef56df7795695e3a96e87d7f0c6434a79e88a;
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
