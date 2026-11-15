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

  rtlpp_01211 dut (
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
    stim[0] = 228'h502c09232cc0af273bbe68a9fc9503b3ec9a0b631da0a8baac565b5b9;
    stim[1] = 228'h41cf81272ddf307ce05688c53c23cefbedb2c9a997b5d17563532704a;
    stim[2] = 228'ha7a22d417372f051272f28f15b15ff7695dc234fe1c96974f5ceb2f18;
    stim[3] = 228'hfa9ac1affb7067f4cb8a554a394d191db3eefc676211b6d5a7922a6d4;
    stim[4] = 228'hb737be081b33c04fc84d40ee1903843af5c9be0c0b7aaa5b4fccc348c;
    stim[5] = 228'h918f05ff9fee3951352024f70d465411a19d7d85ca328a79e00a892bd;
    stim[6] = 228'hfd802a676fe884da5ffbc40cb739ba6bf5d737ebf34e3920861d33a79;
    stim[7] = 228'h9c7cc398162436c5f73f05a7920dfc6fd0c1f1bb30bb1278cde117228;
    stim[8] = 228'h80ad417f2a06e0dc6e1aafb3c132b5c48f8559e3f19cc00c0ddf30a65;
    stim[9] = 228'h9a8e33dd545815fc6d51318ee1a0a6a6702a9cc1254ed34acfe9583f6;
    stim[10] = 228'ha851299ec60f610ea1cbdad0e3a0f6cdd62a8b4be7b80238999d74ff5;
    stim[11] = 228'ha1f19aed2f73462f40dc898f19029d9d7cd7a05cf560c763cb1ccb4a8;
    stim[12] = 228'hcfbd43985cb5826bcfdd450de694b68baadf43a917413c4447201b01f;
    stim[13] = 228'hcc7d8d63dbfa55bb0801a8241d788200da62b81f28a30d3a129f36cb1;
    stim[14] = 228'hca464b311f15141ff8a2d5d2b01be470746980e2909d4250b16976266;
    stim[15] = 228'he62d1c489226106c9a0839b172b480c175a4457b8e86e388b50e318ad;
    stim[16] = 228'ha0cb45bd777e6f4915cf2c13007251a60c74836ed0d0fd7d2991ba293;
    stim[17] = 228'hd5e1f2eb13eaeb85552984b256e5080e9b08dcfa1daad695113d3b1f2;
    stim[18] = 228'h8c340f3bfe072dc23894b78bc86bb2ea600e5a4da1e20f70f365a0401;
    stim[19] = 228'had73c593b700fe282f3272e987d95855f6f86f477db71259cf6bf0172;
    stim[20] = 228'h848c0dfa7fd927ad650a425dc1eb4c0a6087e9aa46786514539c9b928;
    stim[21] = 228'h96a9d5d6b1ae38b563ff8b164a4d69148139c153c6d00937e3e2839bd;
    stim[22] = 228'he65cb3de9649fca74075a6148636408ca021e15029eb054796c8aa9fa;
    stim[23] = 228'hdb2d273090fb5027d71e87693e71030398fdff062b3ac7ca631b26e52;
    stim[24] = 228'h91e447e1b396a0a5b172fd7677418a490843d3b150d2d6345d7717bfc;
    stim[25] = 228'hb7681fb5fa770ac00cf8bf4e04abb64db0a8c2bf132d3ee8724070b8e;
    stim[26] = 228'hbbd76117445fdae15cc21c898c9fbe4030e74cc5ff5f929362fb1187f;
    stim[27] = 228'hf483072ef100a4f8125dd41016e71a2fdb59ba5aa660cebb6f4b7895a;
    stim[28] = 228'hd0071b98fe11356697f28c6a0b647847adf2f1d9d9dbe1ab697003713;
    stim[29] = 228'hd8c6c0179b15823a490f7608cabab1f8b0b62b8313ff9b18967c21afc;
    stim[30] = 228'hd71e9732f19e6d3d208a52190186b90c3062e6d9354c80976cb96b37a;
    stim[31] = 228'hec46ceda73a88fae12e63c4a3b6da25f3ae23b9879c7dd4cb0924728c;
    stim[32] = 228'hb310d04c8cfeb317cc1e1bb379b991f5a82015108d02fa42a434806b1;
    stim[33] = 228'h950b7c4ec37cb908a998bc27049a7f4e5d5b9da851c61363a5644fc26;
    stim[34] = 228'h80a129318573ba162695027139882a0b1c5fd10ad358e6363ff4e411a;
    stim[35] = 228'h8f24aa89878940880083b6e5623e67a6bbdd5bc19659d474d0e7795e4;
    stim[36] = 228'ha599c1a4e672bbf892306fc116c88dab5c1cde87fe57b3a83778ab718;
    stim[37] = 228'hcfa6beddfe1b0c5f5b07751b2d91f62b6d5c51eba33c222eeddd96a7b;
    stim[38] = 228'hf074426e1fc0c87506ec1c3275dc20ad49121954bc4478f72f8b8f173;
    stim[39] = 228'h81290af1afa696afc03cd475e87052f52dbdec970205f82680d46926f;
    stim[40] = 228'h93de0f6aa509a99fce22b50507a34be87a8f1e070098a973ec6fee8af;
    stim[41] = 228'h9ae23c1de486dd9e8b28cc8569029bfa35af6d6e9654ae0b9390958fc;
    stim[42] = 228'hab4cb8d4fbe6557046b044cfc390ea65151d6dcc63be7e56d37e0c142;
    stim[43] = 228'hc5c14a719f4e421748c9f3c0544eb779fb990014d6b788a0c63aaedec;
    stim[44] = 228'ha728ae29b07536397ef96e22bae82d6cafb76c58cd6b7b712f86def00;
    stim[45] = 228'h851d97d2ac9e7816b96d81f3119eb0d136f7d232bc4d3109271860fe9;
    stim[46] = 228'heaf8958c0a5c88943fb754b069887aa9205be7b000bf64832441a4551;
    stim[47] = 228'h86b7a24f88d6182f13ee9ffca23838e0f108016ad69d88a8087a9355f;
    stim[48] = 228'h84f22d5b8d1fda0136c76edee875d34a5d4976822f8dfe10716af1ee1;
    stim[49] = 228'hf21c3d90581576ff772aa614b107addf107402a4ce61e9ff336d9c7c3;
    stim[50] = 228'hc3a9f7de8cc2d0a16227460674f6d22247e604f7cc82b39da9e0dd16e;
    stim[51] = 228'hd99f4f8a41d3285c194e9aef19e2c437bf867d76537e750df295d17d8;
    stim[52] = 228'h8841f2a94fcb09aa8abab056a13ad85c7f2f9266ab41bffa33a77fda9;
    stim[53] = 228'hcea920e85de999929d0ad544ee0c2fde8536a1633e60cdba9052a211e;
    stim[54] = 228'hb828d8fe185dc1c5de25a7d418117a390ce4c8eb6852ea10981dfebf6;
    stim[55] = 228'hd42ace3dc1f2d24b4194658a8550b4bdb2ad1d0ddaaff268ef497a1ac;
    stim[56] = 228'hd50dc6f4d8e049d076d3e8748a3f2430410bb0a678e1aad6227cf2817;
    stim[57] = 228'hf6f5ce1c99841f5d952faca837f11c3219501e880dd8311da1f5e6854;
    stim[58] = 228'he3fcbf1881a735bc4e5a84f8e4399d647142329763231455ebb509c72;
    stim[59] = 228'h493620778f1ee2471607cbade1e25688915dfe735891f9e0edf591eaa;
    stim[60] = 228'hdbbb89b77f4be3ea28f585a225edfd4adc8e61a6f5da2ec499589701b;
    stim[61] = 228'hf56fc3de08568fbee2a759b8146426c55e634c8a96bc3f0407e1eef5a;
    stim[62] = 228'hd2b50799b5ed696ac3f9f1e65d87cad0a38100629371e485905084c6c;
    stim[63] = 228'hf425d4148ae86e171a6ad1fe11a0e38b0f048b3aba8d1752920a19c8c;
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
      expv[0] = 177'h050286cf800000000409232cc3b454fe4a82c9a0b6315;
      expv[1] = 177'h041c83ef800000000781272dde44629e11e6db2c9a98b;
      expv[2] = 177'h027a05da00000000022d4173701478ad8aff5dc234ff7;
      expv[3] = 177'h07a984768000000002c1affb722aa51ca6893eefc677a;
      expv[4] = 177'h037300eb8000000007be081b3720770c81c55c9be0c16;
      expv[5] = 177'h01188046800000000705ff9fe8927b86a32c19d7d85c7;
      expv[6] = 177'h07d801af80000000002a676fede2065b9cdb5d737ebfd;
      expv[7] = 177'h01c781bf0000000004c398162282d3c906fd0c1f1bb2b;
      expv[8] = 177'h000a87120000000005417f2a0657d9e0995cf8559e3e0;
      expv[9] = 177'h01a88299800000000633dd545e18c770d05702a9cc12a;
      expv[10] = 177'h028503370000000001299ec60f6d6871d07f62a8b4be1;
      expv[11] = 177'h021f067580000000019aed2f7744c78c814dcd7a05ce3;
      expv[12] = 177'h04fb822e800000000543985cb52286f34a5eadf43a91e;
      expv[13] = 177'h04c7800300000000058d63dbfd54120ebc43a62b81f25;
      expv[14] = 177'h04a401c180000000064b311f17eae9580df546980e282;
      expv[15] = 177'h0662830580000000051c4892269cd8b95a415a4457b90;
      expv[16] = 177'h020c8698000000000345bd777c9609803928c74836edf;
      expv[17] = 177'h055e003a0000000001f2eb13eac2592b7281b08dcfa08;
      expv[18] = 177'h00c303a980000000040f3bfe01dbc5e435da00e5a4da7;
      expv[19] = 177'h02d701578000000003c593b7043974c3eca96f86f476a;
      expv[20] = 177'h0048802980000000040dfa7fde212ee0f5a4087e9aa50;
      expv[21] = 177'h016a84520000000001d5d6b1aa458b2526b0139c153c5;
      expv[22] = 177'h066582328000000004b3de964b530a431b20021e15022;
      expv[23] = 177'h05b2840e0000000005273090fbc3b49f38838fdff0622;
      expv[24] = 177'h011e0124000000000447e1b392febb3ba0c2843d3b149;
      expv[25] = 177'h0376813680000000001fb5fa705fa70255df0a8c2bf1f;
      expv[26] = 177'h03bd01008000000007611744588e44c64fdf0e74cc5e8;
      expv[27] = 177'h074800bf0000000003072ef104ea080b738bb59ba5aa5;
      expv[28] = 177'h0500011e80000000071b98fe13c63505b238df2f1d9d1;
      expv[29] = 177'h058c07e28000000006c0179b153b04655d590b62b830c;
      expv[30] = 177'h0571843080000000069732f19e290c80c359062e6d920;
      expv[31] = 177'h06c4017c8000000006ceda73af9e251db6d3ae23b986e;
      expv[32] = 177'h033107d68000000000d04c8cfb0dd9bcdcc882015109e;
      expv[33] = 177'h0150853900000000037c4ec37c5e13824d3fd5b9da84b;
      expv[34] = 177'h000a002c00000000012931857301389cc413c5fd10ad1;
      expv[35] = 177'h00f2069a8000000004aa89878c5b72b11f37bdd5bc18b;
      expv[36] = 177'h025986ad0000000001c1a4e674b7e08b6445c1cde87f9;
      expv[37] = 177'h04fa00ad8000000006beddfe1fba8d96c8fed5c51ebb1;
      expv[38] = 177'h070702b50000000004426e1fc20e193aee109121954bf;
      expv[39] = 177'h001283d480000000010af1afa76a3af4382adbdec971d;
      expv[40] = 177'h013d87a180000000060f6aa50f5a8283d1a3a8f1e0717;
      expv[41] = 177'h01ae07e880000000023c1de4876642b4814b5af6d6e94;
      expv[42] = 177'h02b481940000000004b8d4fbe02267e1c87351d6dcc7e;
      expv[43] = 177'h045c05e780000000014a719f4b79e02a275fb990014c5;
      expv[44] = 177'h027285b28000000000ae29b074b7115d7414fb76c58df;
      expv[45] = 177'h00518344800000000597d2ac9bc0f988cf596f7d232b8;
      expv[46] = 177'h06af82a48000000000958c0a5aaa5834c43a05be7b010;
      expv[47] = 177'h006b03838000000007a24f88d7cffe511c19108016ac5;
      expv[48] = 177'h004f052900000000022d5b8d18b76f743aebd4976823c;
      expv[49] = 177'h0721877c00000000043d905817d30a5883d507402a4d7;
      expv[50] = 177'h043a80890000000001f7de8cc023033a7b6a7e604f7d8;
      expv[51] = 177'h059980de80000000074f8a41d6cd778cf165f867d7658;
      expv[52] = 177'h008401718000000001f2a94fcd582b509d69f2f9266bf;
      expv[53] = 177'h04ea877a000000000120e85de9eaa2770616536a16325;
      expv[54] = 177'h038280e40000000000d8fe185ad3ea0c08bace4c8eb74;
      expv[55] = 177'h054282f68000000002ce3dc1f532c542a85d2ad1d0ddb;
      expv[56] = 177'h055080c10000000005c6f4d8e0f43a451f9410bb0a676;
      expv[57] = 177'h076f00c80000000005ce1c9986d6541bf88d9501e8818;
      expv[58] = 177'h063f85918000000004bf1881a6427c721ccd14232976a;
      expv[59] = 177'h04930222000000000620778f1be5d6f0f12f15dfe735f;
      expv[60] = 177'h05bb852b000000000389b77f4d42d112f6fdc8e61a6f6;
      expv[61] = 177'h075683150000000007c3de08572cdc0a3217e634c8a9c;
      expv[62] = 177'h052b034280000000050799b5ed78f32ec3e2381006290;
      expv[63] = 177'h0742062c0000000005d4148aebe8ff08d072f048b3aaa;
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
