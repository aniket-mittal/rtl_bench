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

  rtlpp_06448 dut (
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
    stim[0] = 228'h2118967a0fb5fc1777532ecdc9598f3009b3aeec30c4274dd7657ed21;
    stim[1] = 228'h195ab8b186753ebc61fd773d39059755823eb97229bfb4954138592d9;
    stim[2] = 228'hc67095823eef1ff79519bdc7b03cfcd584c093addf6caf6f5a884e36e;
    stim[3] = 228'he27c39170f83b51746fd13a1f84cf397eed3e8f90bda273fc0963d856;
    stim[4] = 228'hc92a418a129da176117404a6bf647d6bd08f351db8c80db4c550fbcc8;
    stim[5] = 228'hf35f0e1539a689ac0d10d71a0a8cc7652f2fc9693313161ee2d26d521;
    stim[6] = 228'h8008ee7ba715aa4a9d55dec86df2b5916e6e84650c27bc02ea5820006;
    stim[7] = 228'h88bda87ae1d9240e37883caf3eb8dd1f625af5d9534f35fd94814cebe;
    stim[8] = 228'h8aa768c469a761ea93ea3a805b24ad7cebdc5e79c2573500f89954431;
    stim[9] = 228'ha90c3d6cd970ed100f43c8ce799930ae2657dc340073b42ef5280d274;
    stim[10] = 228'hc3f57f39c4426b0795949fe02e31ab0f46dfb2a900a18c1511c7c88a7;
    stim[11] = 228'he8f1a20a18965d61cac249fbfd0960157503b00056b259a9bdb536a80;
    stim[12] = 228'hfb9d5fb7c8e4e5e0fc90258db110ed8fcd0f91b3143a124506a4b150b;
    stim[13] = 228'hd077f5dd739e388e2b879a3feb30d55e1e00724d56002da0476a0b054;
    stim[14] = 228'hafe0151fc78650e39072a984fe4442a291a155891e29de8c4019b2bb1;
    stim[15] = 228'he98a0c7ab6b83e26ca3129410600f8bbee56eb4c4a30c1349f30a6df5;
    stim[16] = 228'hd734e8a69b9249a0eac8dacc1b074bc638ceed8f98541655b403c2163;
    stim[17] = 228'haffff764c0a0b7d5d8b085ac9f6e4da7fca79e4a1330b4ad969f02308;
    stim[18] = 228'h2e789fd15a350870e52c6435b01963fec3f3ca02dd43dd97982069fdb;
    stim[19] = 228'hef58d1c4c1c0327f68a24c3b73d066e23ef980ff587de931103d8737f;
    stim[20] = 228'h8dc2ae3fb87f0ad862b1089eb05d9abd35cdae26912ce16f020d39d5b;
    stim[21] = 228'hc4740ff7a574a079d1cb4d842a9579eb5c517f6e7aae6d68a90f9f6a0;
    stim[22] = 228'hc194f2fa7444a716165f8a7bbe28804e524fe191416b0dd9c2b3dc546;
    stim[23] = 228'hc6b0f7bf86f56290ab66443a731f4ae5ea77ccf4e2296e43424512a48;
    stim[24] = 228'hd1a40c08db61f3373286170b67a5c2446207705c74f883cd11e50f8c8;
    stim[25] = 228'hee1e8c1efa05f78df3a9e9116a323f95148e06645098c3cc39255cab0;
    stim[26] = 228'hd0ca6168b090096b8ef1f490a070091e82305e49589c9c97a9cf8780a;
    stim[27] = 228'h961307355eb80917f628241665621fb6588c2493bfa6ac34f12bb8751;
    stim[28] = 228'hf050fafc83a466e1709dc0361e63850f47a984e8aa0ab6248a75feb65;
    stim[29] = 228'he8440f76b9b2a3367c45391191052443791fb43b9d2ae0c0fbc0e8401;
    stim[30] = 228'h9b13e850dd9584467048f95e0b19a50f5d9d94b0eae147a1fd9a3b29a;
    stim[31] = 228'he43736b2f4a981d3af855bbcec011a130ef7fb2ab03ebaa0bfe7606e6;
    stim[32] = 228'hfd14a935f420bc6f57f11100a6ba48dd76417728dcdf1b52bf509da5a;
    stim[33] = 228'hf6b8991a7bff14121144c52b04be2d515211f199599f293c7f3f8afbd;
    stim[34] = 228'hebb788991e7a5b7b1d842ac20f8a12bc710fba9eeefbb4a597259981e;
    stim[35] = 228'h9fe2c9de4b6f83242dc79c11c020b9e658ad974368da9b4e4c20f3379;
    stim[36] = 228'he30015ab271d4f695e6f56986fc416a6dfc4b96de82d685d6372a620a;
    stim[37] = 228'ha928df24389dec558c6e9185a04c7526891c880400e997625fdc9df07;
    stim[38] = 228'h9ae6b9f9ba1d79e4005d3ef3da4d9e4bb33c5ae5c3259d2f7c648e11d;
    stim[39] = 228'h8fc2b8fa167a1c3af0377e9c67766c531fbddf6e666051caabc01c5e9;
    stim[40] = 228'hb821f1cf3c38579f5d672f28494c4cc0a424989c0302ed091dd3efff7;
    stim[41] = 228'h859524d8fc91dddf36efb81473e74793058c498b90e857370663d9885;
    stim[42] = 228'hb5017c3dd536b000f72ce635e7cdd21e75c5bac5590025e3ffdea02cf;
    stim[43] = 228'h81de20a74282d2b9a28b4f06244f13ffb854c7112bb62859ba91d2dcc;
    stim[44] = 228'ha52d51dedd17a24618c1113064f72779fe6c3acc56685597b82b53713;
    stim[45] = 228'hec2a530c59f3fc9b9c97f9af3c04977ac516df4226808187c8556ce06;
    stim[46] = 228'hc7900b1a36fdf32feb0e290ac6f934880e1429c2052aacec6df0593f5;
    stim[47] = 228'hc3970d33eda7bd25f65954fedb546bcb0fc623f65c2d8de0d583689d7;
    stim[48] = 228'h94abe7a56cf990ac5cac0bf61e5db3b69230a1276603efbc7d3d56676;
    stim[49] = 228'h909b1644a7aa0bdc8ab9649dd515080f688ad14c79783a0dfdec44792;
    stim[50] = 228'h9104646b2ea9985a008920d30d44052ce1e669fd591e6f21b6f2ab99e;
    stim[51] = 228'hbbd273c7da38ff02401e492632f4c859928d37fc518072d4b57d62721;
    stim[52] = 228'ha2719690de33dbb0d6a0719b44c5debe6aaa6108fd1d12874c8f3a627;
    stim[53] = 228'hd80eefbe6715bb591f6a283875e3b312b2452380312fe94f56ed049d4;
    stim[54] = 228'hf622fdfbc705f739fde18d052def5cc37be3699a06f41cb042d1dfd40;
    stim[55] = 228'hf0d4496d1b304457571f0ade5110a278d441f22b93b8d4247595d1b61;
    stim[56] = 228'h86e3fa8572ecb9b21f1c90385a5aa81d28d295e4ce110705c5b8a0933;
    stim[57] = 228'h8271c36d3e97e6df7b0c297520b8d667008721cd36d9af9775ec19f9a;
    stim[58] = 228'ha67cb7cbc446eb325f1eb768d9a3374c01fa9ddaa7dffd5312ebd982a;
    stim[59] = 228'hca9ac3e2664905bc94a295a19acaee97a9a9e875acc5814b4ed4be3fb;
    stim[60] = 228'hd44a8e303483704a8e4dee65bb416b9b4507c4b2ca55004335bcea446;
    stim[61] = 228'hb03d4268521fef6da10c0558a8883b6248e4bb898b5646b9fd3b7afe9;
    stim[62] = 228'h83dafafbcd43ca9b9f17f8ce53edf4139f537c2284555595039fa884a;
    stim[63] = 228'hf49f777a6a165ed1fb0ff020f9d070157aec26afdeba064bb5dc6bb5b;
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
      expv[0] = 177'h000000000000000000967a0fb39766e4acc69b3aeec32;
      expv[1] = 177'h000000000000000002b8b186763b9e9c82ce23eb97238;
      expv[2] = 177'h00000000000000000095823eebdee3d81e7c4c093add7;
      expv[3] = 177'h00000000000000000439170f8309d0fc267aed3e8f911;
      expv[4] = 177'h000000000000000002418a129b82535fb23d08f351da5;
      expv[5] = 177'h0000000000000000070e1539a66b8d054666f2fc96928;
      expv[6] = 177'h000000000000000000ee7ba715ef6436f95ce6e84651c;
      expv[7] = 177'h000000000000000005a87ae1df9e579f5c6c25af5d95b;
      expv[8] = 177'h00000000000000000768c469a59d402d9254bdc5e79d8;
      expv[9] = 177'h0000000000000000043d6cd97064673ccc98657dc3419;
      expv[10] = 177'h0000000000000000057f39c443cff01718d26dfb2a904;
      expv[11] = 177'h000000000000000001a20a189024fdfe84b1503b0004d;
      expv[12] = 177'h0000000000000000055fb7c8e092c6d88874d0f91b30a;
      expv[13] = 177'h000000000000000007f5dd739f4d1ff5986de00724d55;
      expv[14] = 177'h000000000000000000151fc781d4c27f22231a155890c;
      expv[15] = 177'h0000000000000000020c7ab6bb14a0830078e56eb4c41;
      expv[16] = 177'h000000000000000004e8a69b906d660d83a38ceed8f8a;
      expv[17] = 177'h000000000000000007f764c0a2c2d64fb725ca79e4a19;
      expv[18] = 177'h0000000000000000009fd15a30321ad80cb23f3ca02cc;
      expv[19] = 177'h000000000000000000d1c4c1c7261db9e837ef980ff55;
      expv[20] = 177'h000000000000000002ae3fb87c044f582ecb5cdae2693;
      expv[21] = 177'h0000000000000000040ff7a574a6c2154ab9c517f6e77;
      expv[22] = 177'h000000000000000004f2fa7443c53ddf144124fe19146;
      expv[23] = 177'h000000000000000000f7bf86f0221d398fa2a77ccf4f6;
      expv[24] = 177'h0000000000000000040c08db638b85b3d2e2207705c62;
      expv[25] = 177'h0000000000000000068c1efa06f488b5191f48e066442;
      expv[26] = 177'h0000000000000000026168b0957a485038002305e494c;
      expv[27] = 177'h00000000000000000307355ebb920b32b10f88c2493b5;
      expv[28] = 177'h000000000000000000fafc83a0e01b0f31c47a984e8b9;
      expv[29] = 177'h0000000000000000040f76b9b39c88c8829591fb43b92;
      expv[30] = 177'h000000000000000003e850dd93fcaf058cd5d9d94b0e1;
      expv[31] = 177'h00000000000000000736b2f4a92dde76008aef7fb2abd;
      expv[32] = 177'h000000000000000004a935f4278880535d216417728ce;
      expv[33] = 177'h000000000000000000991a7bf9e295825f15211f19955;
      expv[34] = 177'h00000000000000000788991e7d956107c50b10fba9ef9;
      expv[35] = 177'h000000000000000002c9de4b6a4e08e010598ad97436e;
      expv[36] = 177'h00000000000000000015ab271cab4c37e20ffc4b96df6;
      expv[37] = 177'h000000000000000000df24389a48c2d0263c91c88040b;
      expv[38] = 177'h000000000000000006b9f9ba1a1f79ed26cf33c5ae5cd;
      expv[39] = 177'h000000000000000002b8fa167dbf4e33bb35fbddf6e6a;
      expv[40] = 177'h000000000000000001f1cf3c3f979424a624424989c14;
      expv[41] = 177'h00000000000000000524d8fc97dc0a39f3a658c498b89;
      expv[42] = 177'h0000000000000000017c3dd530f31af3e6eb5c5bac553;
      expv[43] = 177'h00000000000000000620a74284278312278b854c71136;
      expv[44] = 177'h00000000000000000551dedd138898327b97e6c3acc48;
      expv[45] = 177'h000000000000000002530c59f5fcd79e024e516df4220;
      expv[46] = 177'h0000000000000000000b1a36ff1485637c9ce1429c217;
      expv[47] = 177'h0000000000000000070d33eda2aa7f6daa32fc623f647;
      expv[48] = 177'h000000000000000003e7a56cfe85fb0f2edb230a12775;
      expv[49] = 177'h0000000000000000031644a7ae324eea8a8088ad14c7c;
      expv[50] = 177'h000000000000000004646b2ead106986a2041e669fd55;
      expv[51] = 177'h00000000000000000273c7da392493197a6128d37fc5a;
      expv[52] = 177'h0000000000000000019690de30b8cda262eeaaa6108e8;
      expv[53] = 177'h000000000000000006efbe6714941c3af1db245238036;
      expv[54] = 177'h000000000000000002fdfbc704c68296f7adbe3699a0d;
      expv[55] = 177'h000000000000000004496d1b33856f288853441f22b89;
      expv[56] = 177'h000000000000000003fa8572e9c81c2d2d508d295e4c0;
      expv[57] = 177'h000000000000000001c36d3e9794ba905c6e08721cd34;
      expv[58] = 177'h000000000000000004b7cbc441dbb46cd19e1fa9ddabe;
      expv[59] = 177'h000000000000000002c3e2664ecad0cd65769a9e875a2;
      expv[60] = 177'h0000000000000000028e3034857732dda0b2507c4b2c2;
      expv[61] = 177'h0000000000000000054268521e02ac54441a8e4bb8981;
      expv[62] = 177'h000000000000000002fafbcd45fc6729f6fdf537c2288;
      expv[63] = 177'h000000000000000007777a6a10f8107ce839aec26afc2;
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
