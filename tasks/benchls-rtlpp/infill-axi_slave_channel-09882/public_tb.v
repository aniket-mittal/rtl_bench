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

  rtlpp_09882 dut (
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
    stim[0] = 228'h5c58f2823457bd8e74be9303f072fa977d8eaed6ab79ef8118e8977c9;
    stim[1] = 228'h0906f83086af8d529cab76e97e56dc6ff97a768796a33b5fefad09ca6;
    stim[2] = 228'hb2b03d1c9b2e0768d8f5b5372e6362bff1850a4c1c5a271d19f8ec71e;
    stim[3] = 228'hba8b2f44b2984258d2b7986895c0fe5d15fd0193af3f0545572c7cd2f;
    stim[4] = 228'he77cc766cd111cd8d2885743a6b382652e8c7d5ae391c85288a7c884d;
    stim[5] = 228'hf349ef2fcd27478efc87d8a05bda0f14f21d2fd97dc24555fc4787d5e;
    stim[6] = 228'ha20de766fd094c455b8b5fb23a9dcfc8b3c10ebec5c3a375ed45d483d;
    stim[7] = 228'h8186f4fe6189bdb93646b1c1144f93ce07a6f7c826f082b1042813eb2;
    stim[8] = 228'h95222a8dbe5fd6750e899f2b6f025c2ac161439db2dd020b0d2824623;
    stim[9] = 228'hb554414c46485f2746c984d99fb9f65885adfcc8b0560f150febd5900;
    stim[10] = 228'hfaf2950d8ad310bd4054ed3d0c673f3261db1a955a1e18542fc941b9a;
    stim[11] = 228'h9454ca64b78ac1d853e87eb098aa4fb65c3e4d8da0f3246dd049c6712;
    stim[12] = 228'hdecc8dbb6bc393a445183cf91ae9f49df1945e173d2bbd61e9ed89e67;
    stim[13] = 228'ha966a6aba07b02da6a54e8cefd0b2b0406dc7e67cf2eae7d94f1553dd;
    stim[14] = 228'ha2abb0b0e2c2e24b18cea1eb17a8806d2a4e00d833b3cca8c5cafc827;
    stim[15] = 228'hadc43e8b13976221504fd8fd2f0e56e90ce14946988c468e4eb0cf4bc;
    stim[16] = 228'h8f68e7a2502efad72ce39486002b8a9267f430cfd3c0a279b7abe16e8;
    stim[17] = 228'h9662d062884600d74535717d4d893608c284a0bf615ef63b09051274b;
    stim[18] = 228'hf9e68938010e3faec60e458e586a9e7ae250e21d4c724efa4c77ec347;
    stim[19] = 228'he2c6169bc4f0c41ffae5abc4c404b70893350e0a23736d9e6ecfde3cc;
    stim[20] = 228'ha47e756ab481d0ebbe09eb807ba227ce1b8bcc0ac0c4cca7ea304d2cc;
    stim[21] = 228'hdf49ec355533ec93f07d5aff1c58598a735434085922dc42c486c5a56;
    stim[22] = 228'hc0a67c41e229324713648a81a01d830e40e109e0995f3388f8a09bc30;
    stim[23] = 228'hd3c248d4a0871b2dbb5fc99efadc9b5500d9fcd6e14889d6979601575;
    stim[24] = 228'hd1761bbf4f3bdf3c2d219e7f50e779a96b5d1d997c6feb24363ae929e;
    stim[25] = 228'hefb7c8cc9dd30e1c34fa5972846f68671803038ad7d2e19188ec82cef;
    stim[26] = 228'h9ee841239302d533bc2e5ca7d6c0b6696d4931bdb056c18a533b53e25;
    stim[27] = 228'h872345d3fbe805b3b9068bcdf06bc9765f10d0d50876e096b691f0675;
    stim[28] = 228'hcbcc1cd5421890b849903954225dc74fb3c33a3b738c96ec14002b5a4;
    stim[29] = 228'h854fae44d9b431cb863bc8e4b89b56ef7a52db64168de86d28b3699eb;
    stim[30] = 228'haebad6e3d767404ce52489b0c6c38d9fb97ac123ca1b7095e6011046d;
    stim[31] = 228'h933c927785e3e93f4e2f6133b475d6bbacb635417dfdd9c775f146e09;
    stim[32] = 228'h5413ac8e49b363379e4d1cdc7d89b92e887be64e7b43886e4715e5031;
    stim[33] = 228'hecd7ba4947d261c80b4ed9f15cd6310985ecc912861bb2cbc9e386095;
    stim[34] = 228'h9b3537b3bed25587dba455adfd8d28636b7b0e63b33fc7912544c85c4;
    stim[35] = 228'h8a7bc59f4eeb46a4e4bff131e33e5452b67cb7d963d7010c8edf1667c;
    stim[36] = 228'h99ffb5154bff2e8167722056a3562009721b2de48d568603984dcb333;
    stim[37] = 228'hb70ea4126759ffecd7c8736bbfb0edba3a8759fa58e8073f7c2162286;
    stim[38] = 228'hc2dd571f7bf3d4c19d6f9d9f7503f6c59c473969db53678e919cdafe5;
    stim[39] = 228'hf65bc6d4d9e65eda2e554a3b1d2180086f9be58a40968abbc7e146f62;
    stim[40] = 228'hf5db905945dfec45cd6c55b922e51bb786a9c9967495ac3cd655f0138;
    stim[41] = 228'hd6b6e902407320b86263f9fa8eba66388693a5ab03524c3d3261ad29a;
    stim[42] = 228'hf2281c247961c78f2b83dcd3436c7cffe3d4a17ac49d033f57cc90d05;
    stim[43] = 228'ha1455b708a483f33fa4b6373c342395ef8e1549a888928bebb28c2d89;
    stim[44] = 228'h8c314b391f33c1dd528eda945b947fbcf6deb898045a3d962b72d5140;
    stim[45] = 228'hbd71365217f92cb3d567bc967b57403c4380fd5066bbd28f0b5b1003d;
    stim[46] = 228'hc18c5ce8d8078d0d4c6bfed3dffcff8b5a2d9f5d6cdff68d850e60c5d;
    stim[47] = 228'hfd3bb23f397c0739f2a7be474776daa1232b01e5509b2085e00a8b1a3;
    stim[48] = 228'hefb958eebd45466cc63ee4f2ee56a265e310daca6936361b2d5279d0d;
    stim[49] = 228'h989a131ce40674fa0ccfd540310d85f6fb4359c4f29e910318ca4c6ae;
    stim[50] = 228'h95180c478af0b286a74e66b42ddb1abf6ffcd0d9f4af7bfcafb31d6fd;
    stim[51] = 228'hb3cd6a5be774128b0b05508d71eb1a8910900108aed51b84362440e0d;
    stim[52] = 228'ha8428832c9b5afc38046357cbf2ffc743ee13d039dfa2259b0649e801;
    stim[53] = 228'h9b802ad3c10d529e12015a96f49bc02ef4da9573e0ae23b63c0b352e2;
    stim[54] = 228'hd45712bcb307c8aacc6604dee6e023b0874efa85a76fa8756708ff8f3;
    stim[55] = 228'h413035124718d8b2294bda97b0478a357e0635426468a19570b64fcb9;
    stim[56] = 228'hd0c6dd3f0bb09217296f831496a11ad38ce6e63a50cb98b0fdbbf4971;
    stim[57] = 228'h85604a38dafdab05fbc96f8fdda4cb9bb6a9465d965939136ff08a96f;
    stim[58] = 228'hb58726a4caf7e0677240ada79533e7eb8587b71d27c0915e4ed78ff82;
    stim[59] = 228'he78fce52059846cc66b215c88d40f2ce1ef75efebffda8518403385cc;
    stim[60] = 228'hcaff9fefe948db0ffb5dad9eba085d768f6fbe4c717f7e8bf88617b28;
    stim[61] = 228'h89f3cdccd2b69bb550b773241838e462846dcb7b5a06ba65622049550;
    stim[62] = 228'hbf5344ad1fc493dd8f8875013b8606f6d2e900bc2e83f73aa83215082;
    stim[63] = 228'hfa6e93b93a572e9d675a44063a9b423a286d5c1a25b6afbef974cdb90;
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
      expv[0] = 177'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 177'h000000000000000000000000000000000000000000000;
      expv[2] = 177'h000000000000000000000000000000000000000000000;
      expv[3] = 177'h1b2b52ff99f8ec71f03d1c9b2cda9b9731b31850a4c10;
      expv[4] = 177'h03a8d174572c7cd2fb2f44b29ccc344ae07f5fd0193a2;
      expv[5] = 177'h1677a99488a7c884dcc766cd14aba1d359c2e8c7d5ae6;
      expv[6] = 177'h1734dc53fc4787d5f1ef2fcd27ec502ded0721d2fd962;
      expv[7] = 177'h1220df22ed45d483dde766fd0aafd91d4ee73c10ebed3;
      expv[8] = 177'h10181738042813eb36f4fe618cd8e08a27ca7a6f7c821;
      expv[9] = 177'h095230ab0d2824623a2a8dbe5a4f95b7812c161439da0;
      expv[10] = 177'h135551620febd59014414c464b426ccfdcfe5adfcc8a4;
      expv[11] = 177'h17af44c9afc941b9b2950d8ad6769e86339e1db1a954e;
      expv[12] = 177'h09455ed95049c67134ca64b78cbf584c5527c3e4d8db3;
      expv[13] = 177'h05ec9a77e9ed89e67c8dbb6bc21e7c8d74fd1945e173f;
      expv[14] = 177'h1a965c1014f1553ddea6aba07d74677e85926dc7e67d7;
      expv[15] = 177'h0a2a89b4c5cafc827bb0b0e2c5d0f58bd440a4e00d825;
      expv[16] = 177'h0adc63a44eb0cf4bd43e8b1390ec7e97872ece1494680;
      expv[17] = 177'h18f69a49b7abe16e90e7a2502b4a430015c27f430cfd3;
      expv[18] = 177'h1966302309051274bad062884338bea6c49e284a0bf79;
      expv[19] = 177'h1f9e21ebcc77ec347e8938010f22c72c354e250e21d47;
      expv[20] = 177'h1e2c64226ecfde3cd6169bc4f7d5e262025f3350e0a34;
      expv[21] = 177'h0247ff386a304d2cd6756ab485f5c03dd117b8bcc0ac5;
      expv[22] = 177'h05f4ae29c486c5a571ec355531ad7f8e2c2935434084e;
      expv[23] = 177'h0c0a0c3978a09bc3167c41e22bc540d00ec20e109e098;
      expv[24] = 177'h153c6d54179601575a48d4a086e4cf7d6e4a0d9fcd6e6;
      expv[25] = 177'h051746a5b63ae929f61bbf4f3e4f3fa873b8b5d1d9975;
      expv[26] = 177'h16fb199c08ec82ceffc8cc9dd6acb94237b1803038ad0;
      expv[27] = 177'h09eea1a5d33b53e25841239301ae53eb605ed4931bda0;
      expv[28] = 177'h10726dd93691f0675b45d3fbe9c5e6f835e1f10d0d510;
      expv[29] = 177'h0cbcc53e94002b5a541cd5421c1caa112ee73c33a3b6b;
      expv[30] = 177'h0854d3bda8b3699ebfae44d9b564725c4dafa52db6417;
      expv[31] = 177'h12ebde7ee6011046dad6e3d76644d86361c597ac123d8;
      expv[32] = 177'h0133f2eef5f146e09c927785e73099da3aeecb635416e;
      expv[33] = 177'h000000000000000000000000000000000000000000000;
      expv[34] = 177'h0ecd3c2649e386095fba4947d46cf8ae6b185ecc9129a;
      expv[35] = 177'h11b3118da544c85c5537b3bed3aad6fec690b7b0e63a0;
      expv[36] = 177'h08a7c94a8edf1667d3c59f4eea7898f19f2d67cb7d960;
      expv[37] = 177'h019fb825984dcb333fb5154bf8102b51ab1121b2de480;
      expv[38] = 177'h1b70f6e8fc21622876a412675eb9b5dfd875a8759fa41;
      expv[39] = 177'h0c2deb16119cdafe5d571f7bf0cecfba81ffc473969d0;
      expv[40] = 177'h1f65b821c7e146f633c6d4d9e5251d8e90c0f9be58a45;
      expv[41] = 177'h1f5dcede5655f01393905945da2adc91728a6a9c99675;
      expv[42] = 177'h1d6b50e23261ad29b6e90240747cfd475d36693a5ab05;
      expv[43] = 177'h1f22f3ffd7cc90d0581c2479676e69a1b63c3d4a17ac1;
      expv[44] = 177'h1a146d7bbb28c2d89d5b708a49b1b9e1a1198e1549a95;
      expv[45] = 177'h10c366f3ab72d514114b391f36ed4a2dca3f6deb8981c;
      expv[46] = 177'h0bd770f10b5b1003d9365217f9de4b3daba0380fd5068;
      expv[47] = 177'h0c18de2d050e60c5dc5ce8d8067f69effe7fa2d9f5d78;
      expv[48] = 177'h07d3da84e00a8b1a3bb23f397cdf23a3bb6a32b01e550;
      expv[49] = 177'h1efbb197ad5279d0d958eebd467279772b52310daca78;
      expv[50] = 177'h0189b7db98ca4c6af2131ce4056aa01886c5b4359c4e8;
      expv[51] = 177'h1951cafdafb31d6fd80c478af3335a16ed8affcd0d9ff;
      expv[52] = 177'h033cc224362440e0dd6a5be7752846b8f58b0900108ac;
      expv[53] = 177'h1a8419d0b0649e801a8832c9b11abe5f97fdee13d0392;
      expv[54] = 177'h11b860bbbc0b352e302ad3c10fad4b7a4de14da9573f1;
      expv[55] = 177'h154556c26708ff8f3f12bcb305026f73701274efa85b7;
      expv[56] = 177'h000000000000000000000000000000000000000000000;
      expv[57] = 177'h150c0b4e7dbbf4971edd3f0bb3418a4b508ace6e63a4d;
      expv[58] = 177'h1056366eeff08a96f84a38dafab7c7eed2636a9465d9c;
      expv[59] = 177'h1b5867ae4ed78ff83726a4caf3d6d3ca99f6587b71d2a;
      expv[60] = 177'h16789b380403385cd7ce52059e0ae446a07bef75efeb6;
      expv[61] = 177'h0cafbdda788617b2979fefe94fd6cf5d042cf6fbe4c7c;
      expv[62] = 177'h009f518a6220495513cdccd2b2b9920c1c7446dcb7b5f;
      expv[63] = 177'h1bf52bdb283215083344ad1fc63a809dc3072e900bc39;
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
