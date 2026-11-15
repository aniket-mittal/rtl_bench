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

  rtlpp_02917 dut (
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
    stim[0] = 228'h441ca0e53b870f58e5ab25878187d2c8b59a2cec5991e14fdb275775d;
    stim[1] = 228'h09ae67673416d9cd4eb45a5cfdecbaa1bc1b13d8da0960de2a2b8b045;
    stim[2] = 228'hc01ceca5c39e5d39352a17cbe8fd44009c5160390af455cf58c99b1dc;
    stim[3] = 228'h9bcdd17b6aea9a1bc3d8ee328ed43b4e96473dbd84fe89e7c4c794d95;
    stim[4] = 228'hc3f74018aed362ac87ed2a911a1f31403af9a8f640623cbed30ad7eeb;
    stim[5] = 228'ha8cdeba4f64a3e2b7d66c7fac22b445939f1be417ac302fcf14d6fffd;
    stim[6] = 228'h888f6b583d3d9d3e8aab2db0b59d3cfed47522bece56baa49b18ee46b;
    stim[7] = 228'hdd0b43f870a3cc797e248b8c4cc9e97ae02f37d618dc352dc8c1a9130;
    stim[8] = 228'h97590d7e90c511dcf56620b90e65bfb2a15ab59b6ce227661040ed6c0;
    stim[9] = 228'he19b281e14daa25101f7afb6de4fa8466e175aeb13d97d8f1d35ef430;
    stim[10] = 228'hd29cbd725e3c4fdda231783cfb458803cef4fc1c7171983072af5155b;
    stim[11] = 228'h9d97b9d882592eaa542d9ffc72dd59904ab76d88f93cc196d5e1a8caf;
    stim[12] = 228'hd9ed1fb38ecd38d0f5a0e414925c9763d22250ca01d30b539d405822d;
    stim[13] = 228'hb8ed266c48e228a22f1bea98eada50041523fe225ed7c5d7274347c1f;
    stim[14] = 228'hb284cffdba348ae085e7ba23e08fe834568b6bdcf55a8e2c41514848c;
    stim[15] = 228'h9e315efdd09962cffb912dda9414226871c2a7ac6449460895ec7943a;
    stim[16] = 228'hfe9f3e4d55648f4ac5a9b94dd0d79c83a38b044f4e93d152b2db386a8;
    stim[17] = 228'h85c5703fe1a9e7a3184b6e0682bee5487780d1b42f58972e6d849a344;
    stim[18] = 228'ha7bb71631d62d7815a3966c6d7783e0158970d5536f05f5f3b2da35e9;
    stim[19] = 228'hfcb416ca248d3e67758b44789984a6819d5fb277008f7c0ee59657d59;
    stim[20] = 228'h8d808626f68147aeeb304eb1c504e088f0383da45644906d231ffd7dd;
    stim[21] = 228'hb44a5480d70303594a9a2dbf36fb6f9c764d834dbabc88e865b37b0e4;
    stim[22] = 228'hd24ca79315f0d32c0f587e125f16fda74f8789db8d91e086280bbaa39;
    stim[23] = 228'hd0f39f09df2cd8419ae5e16148775a95961fd3cca605bda23db799ba0;
    stim[24] = 228'h82ea68d65b6d337e987436518001529fc36dc7579be64aae8517695a2;
    stim[25] = 228'hfcf64cb8bb8fdbffd34fb2a2c21962c69ebb6a79c9d24e49b187da2b2;
    stim[26] = 228'h90d56abd8356f5f0dda910bb054affd557837862c9578896637ef00bb;
    stim[27] = 228'he82f8df97f7d0b5c0e7e2a279904e3358bc457c667a945de5d946d95f;
    stim[28] = 228'h9350589367fc7def8100bf653022ea3f6d99975ee77ed25c538654812;
    stim[29] = 228'he2e7b912d4ebc2296e334ec529a9b8dc9c0fe90d2475210d656b5859e;
    stim[30] = 228'h9d08dec235fcc0208c1d1313273c232dbd38e7c1163b8b88438d83667;
    stim[31] = 228'h917aef359962375c0c6ea64ee026889066c855b5c03898f96c046ada4;
    stim[32] = 228'he15f739ca8163849cef167156d9cf1d68ca470e4af5b048db93ac0971;
    stim[33] = 228'h978a4524a604717c54d0d8a4a8cef8df14ec6d6d7cb81f58268f0aeed;
    stim[34] = 228'hb50c846aa603023816cbdc0b4e2e3365d68c41ba6c641af741195e349;
    stim[35] = 228'hf430417091a65473cd2811037ae0f2c59e2dbbb98a248464f0116bab3;
    stim[36] = 228'hf9259933b880e3a162fc9e3b2a08a4572a372ddfc301114280443f610;
    stim[37] = 228'hd9df70a5174c23d7150abd482a9dde749a1cd8c64ec6b03385e5f4cae;
    stim[38] = 228'ha4e32dc8c38350830ec99a8f8cf166f8becf375faac36a998491ff9dc;
    stim[39] = 228'he8854da1e62ca339b07524f497ec50a4dc47d601dde5ba0b89d62e323;
    stim[40] = 228'hf21b1e218a15b6cfabf2407cb2ce17a2ffdde24ce99f7942055fab36e;
    stim[41] = 228'hf6ee124498fa4d9a7df99e9eb412b62d1e3c5b7badf1039569b01daf0;
    stim[42] = 228'hfd1fb8ef7e792b61bf687e79044adfd64a26027417ff3aac5479bd51a;
    stim[43] = 228'h9579bad121c33b0386612b75ddcc5045246799002123dcaccdd4b4665;
    stim[44] = 228'hf1e3512a9d6236cb14af6391ba4484fae81b29c72e17fa9cad0731111;
    stim[45] = 228'hdac892d847ebc7ec9767abc3f96ea69c1b354911578ca82d5af6326b3;
    stim[46] = 228'hc9545c5ce5cd147aca024a01a6076be87b0c0458f030a32cffb90ad99;
    stim[47] = 228'hf9a1cb63879930ec311ef9e1d110bc9f69f9432c7639c43516056ebf1;
    stim[48] = 228'hcfe928b329d0bceb018e1f88f092d3832337947d4494eb28f6fe56315;
    stim[49] = 228'he44a16c7421d66096739fbf75e1eb4043d474d5ea4478d42f0f5aa3f0;
    stim[50] = 228'hefb9345855c0897dee2834d1232fcb5852c2426c23c54fe6516b77671;
    stim[51] = 228'h91dc16e589069937cf9accdc1e22c4435fb3bc5716f7b8c8e4724c5fc;
    stim[52] = 228'hf20ec321ac87b34189370733665fd8f8ea98f3b57cd45118e46ac6bf2;
    stim[53] = 228'h820fb0b40154e7f80102c11606ebd42259ff89a96d02edc89048217e3;
    stim[54] = 228'hbfc264b697f0716b383307f90398807fb50c68647ce9208078af27069;
    stim[55] = 228'hf1950351ee033d6e858c08d9dc60c658843812260eb9b91aa314cabb3;
    stim[56] = 228'hf540a41d496cb0aa7286e2331d990ccaeb4445e8cc279765fc9245fd2;
    stim[57] = 228'hc5a009abcba6737db8e194824dbb1bf90781bbf61cbbbd04c78e16197;
    stim[58] = 228'hf8de4f15e3b95c1bc6e33385c087ebb3d9983f219931bf0497497daee;
    stim[59] = 228'h9c2174d4041703b874b5156031d0b02f7bca3e1d688d84781a6fdec7c;
    stim[60] = 228'hcef48fc8c527616a0b82cb9ddae6cbf09fe045351d901d31816f4a160;
    stim[61] = 228'hcc16b6b6fcb1e3a03ba9bae4c941dabc82a6ec7c698bb4d65134dfb76;
    stim[62] = 228'ha5740176ab41d50e11b6ca1880958432ed25fc4ae792d7aa4e6b89d85;
    stim[63] = 228'h8919a2a8637a7d44a09aee885f17ce4e6e66bcf1384272eab12a94e36;
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
      expv[1] = 177'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 177'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 177'h1xxxxxxxxxxxxxxxx4eca5c39c8be5f47eaxc5160390x;
      expv[4] = 177'h1xxxxxxxx4c794d9xceca5c39c8be5f47eaxc5160390x;
      expv[5] = 177'h0xxxxxxxx4c794d9x4eca5c39c0be5f47eaxc5160390x;
      expv[6] = 177'h1xxxxxxxx14d6fffxdeba4f64de3fd6115ax9f1be416x;
      expv[7] = 177'h1xxxxxxxx14d6fffx5eba4f64de3fd6115ax9f1be416x;
      expv[8] = 177'h1xxxxxxxx14d6fffx5eba4f64de3fd6115ax9f1be416x;
      expv[9] = 177'h1xxxxxxxx14d6fffx5eba4f64d905c8732dx15ab59b7x;
      expv[10] = 177'h1xxxxxxxx14d6fffx5eba4f64d905c8732dx15ab59b7x;
      expv[11] = 177'h0xxxxxxxx2af5155xdeba4f64d105c8732dx15ab59b7x;
      expv[12] = 177'h1xxxxxxxx2af5155xfb9d8825d905c8732dx15ab59b7x;
      expv[13] = 177'h0xxxxxxxx2af5155xfb9d8825d720a492e4x22250ca0x;
      expv[14] = 177'h0xxxxxxxx2af5155xfb9d8825d720a492e4x22250ca0x;
      expv[15] = 177'h0xxxxxxxx2af5155x7b9d8825d720a492e4x22250ca0x;
      expv[16] = 177'h1xxxxxxxx2af5155x15efdd09ff20a492e4x22250ca0x;
      expv[17] = 177'h0xxxxxxxx2af5155x15efdd09f5ca6e86bcx38b044f4x;
      expv[18] = 177'h1xxxxxxxx2af5155x5703fe1a9dca6e86bcx38b044f4x;
      expv[19] = 177'h0xxxxxxxxb2da35exd703fe1a933636bbc1x38b044f4x;
      expv[20] = 177'h1xxxxxxxxb2da35exc16ca248bb3636bbc1x38b044f4x;
      expv[21] = 177'h1xxxxxxxxb2da35ex416ca248bb3636bbc1x0383da44x;
      expv[22] = 177'h1xxxxxxxxb2da35ex416ca248b96df9b7dbx0383da44x;
      expv[23] = 177'h1xxxxxxxx80bbaa3xc16ca248b96df9b7dbx0383da44x;
      expv[24] = 177'h1xxxxxxxx80bbaa3x416ca248b96df9b7dbx0383da44x;
      expv[25] = 177'h1xxxxxxxx80bbaa3x416ca248b96df9b7dbx0383da44x;
      expv[26] = 177'h1xxxxxxxx80bbaa3x416ca248b96df9b7dbxebb6a79cx;
      expv[27] = 177'h0xxxxxxxx37ef00bxc16ca248b085d82a57xebb6a79cx;
      expv[28] = 177'h0xxxxxxxx37ef00bxc16ca248b085d82a57xebb6a79cx;
      expv[29] = 177'h0xxxxxxxx37ef00bxc16ca248b085d82a57xebb6a79cx;
      expv[30] = 177'h0xxxxxxxx37ef00bxc16ca248b085d82a57xebb6a79cx;
      expv[31] = 177'h0xxxxxxxx37ef00bxc16ca248b085d82a57xebb6a79cx;
      expv[32] = 177'h0xxxxxxxx37ef00bx416ca248b085d82a57xebb6a79cx;
      expv[33] = 177'h0xxxxxxxx93ac097xc16ca248b085d82a57xebb6a79cx;
      expv[34] = 177'h1xxxxxxxx93ac097xa4524a606885d82a57x4ec6d6d6x;
      expv[35] = 177'h0xxxxxxxx93ac097x24524a606085d82a57x4ec6d6d6x;
      expv[36] = 177'h0xxxxxxxx0116babxa4524a606085d82a57x4ec6d6d6x;
      expv[37] = 177'h0xxxxxxxx0116babxa4524a6064f1d95045xa372ddfcx;
      expv[38] = 177'h1xxxxxxxx0116babx770a5174bcf1d95045xa372ddfcx;
      expv[39] = 177'h0xxxxxxxx0116babx770a5174b4f1d95045xa372ddfcx;
      expv[40] = 177'h1xxxxxxxx9d62e32xd4da1e62ccf1d95045xa372ddfcx;
      expv[41] = 177'h1xxxxxxxx9d62e32xd4da1e62ca03e59670xfdde24cfx;
      expv[42] = 177'h0xxxxxxxx9d62e32xd4da1e62c203e59670xfdde24cfx;
      expv[43] = 177'h1xxxxxxxx9d62e32x7b8ef7e78a03e59670xfdde24cfx;
      expv[44] = 177'h1xxxxxxxxdd4b466xfb8ef7e78a03e59670xfdde24cfx;
      expv[45] = 177'h0xxxxxxxxdd4b466xfb8ef7e7831c8dd224xfdde24cfx;
      expv[46] = 177'h1xxxxxxxxdd4b466x092d847eeb1c8dd224xfdde24cfx;
      expv[47] = 177'h1xxxxxxxxfb90ad9x892d847eeb1c8dd224xfdde24cfx;
      expv[48] = 177'h0xxxxxxxxfb90ad9x092d847ee7cf0e8885xfdde24cfx;
      expv[49] = 177'h0xxxxxxxx6fe5631x892d847ee7cf0e8885xfdde24cfx;
      expv[50] = 177'h0xxxxxxxx6fe5631x892d847ee7dfbaf0f5xd474d5eax;
      expv[51] = 177'h0xxxxxxxx6fe5631x092d847ee7dfbaf0f5xd474d5eax;
      expv[52] = 177'h0xxxxxxxx6fe5631x092d847ee7dfbaf0f5xd474d5eax;
      expv[53] = 177'h0xxxxxxxx6fe5631x092d847ee7dfbaf0f5xd474d5eax;
      expv[54] = 177'h0xxxxxxxx048217ex892d847ee608b0375ex9ff89a97x;
      expv[55] = 177'h1xxxxxxxx048217exa64b697f5e08b0375ex9ff89a97x;
      expv[56] = 177'h0xxxxxxxx048217exa64b697f5608b0375ex9ff89a97x;
      expv[57] = 177'h1xxxxxxxx048217ex0a41d496df1198ecc8xb4445e8cx;
      expv[58] = 177'h1xxxxxxxx78e1619x8a41d496df1198ecc8xb4445e8cx;
      expv[59] = 177'h1xxxxxxxx78e1619x8a41d496df1198ecc8xb4445e8cx;
      expv[60] = 177'h0xxxxxxxx78e1619x0a41d496d71198ecc8xbca3e1d6x;
      expv[61] = 177'h0xxxxxxxx78e1619x0a41d496d71198ecc8xbca3e1d6x;
      expv[62] = 177'h1xxxxxxxx78e1619x6b6b6fcb0f1198ecc8x2a6ec7c7x;
      expv[63] = 177'h1xxxxxxxxe6b89d8xeb6b6fcb0e50c404acx2a6ec7c7x;
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
