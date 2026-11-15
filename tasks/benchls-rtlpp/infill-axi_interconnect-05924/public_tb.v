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

  rtlpp_05924 dut (
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
    stim[0] = 228'h0f285d7c6eafc8d7ee26f794d4a3ad95041efdd9f8f388cf4962aa437;
    stim[1] = 228'h407554ec15d1f96fb4637f04336e9c584c0fc82d4370860b80edd1850;
    stim[2] = 228'hc805eb822abb6a6223014737b1d69547246ed1575e75c4f8487c73215;
    stim[3] = 228'h906370fc5ed14639c2bc044e3e73a29e68ffabb0a83a31008416122b3;
    stim[4] = 228'he8698bba98d6bc41a3e6f8793e18f95ef51fe93854e8daa8e3f77051b;
    stim[5] = 228'hefb4e84afeb925303f563af20ef30f9ec41282ca762e394c8b5b7489a;
    stim[6] = 228'hd7e51c62d69d8596800300bef732c451ca530ddd5adf03eff8ad851ae;
    stim[7] = 228'h9fa0a56ce501977d1a70d5693134fd7ba160c044b8323986c4e31566c;
    stim[8] = 228'hffa75d2b4b5cbb3efd1ddfb688ea451d0dd512e462940b92ab3306591;
    stim[9] = 228'hb4a478952aa09893ea56cf9ad3696625c41f516af283f36a52812e8e2;
    stim[10] = 228'hd5e3a619bb312b15dbff3a58ce19870bae84a673964add52a273ac9e3;
    stim[11] = 228'hb463e93b16789efa53804ff394f3469e85ca82151e4353c1131607829;
    stim[12] = 228'hc4c3f25c2c3fcac7b53df388debc33db53312fb78760ebdfb262fa374;
    stim[13] = 228'hdacaf764f67c15bdf18c0458781d43390c933b383e4c0cbb40c767083;
    stim[14] = 228'hc19393ee243879825b5663d0d446dbe248c9dd2952e8858b64c47b52a;
    stim[15] = 228'hcd2624822f925980591edefe95f8df5f29ff32de4108fd096af98c7db;
    stim[16] = 228'ha9aecf0aa154d64f24f32f9772d6b330c25bdd7e6e62514cf799a8f2f;
    stim[17] = 228'hed19601278682c3ee677cf35fc2fe490a86e36579ed661e68929647ee;
    stim[18] = 228'hf0e3ff511ff0df05ffde6f985924aed9efde1693e10622363187478d8;
    stim[19] = 228'h81aec6d7d8b2e59cf32032695a560711e5b4d1e7a2b4bc6d5d8c539ac;
    stim[20] = 228'h9e479f74c69b32d17e86a3b25e92164cbccb51009b90b68d06d2a374f;
    stim[21] = 228'ha45db94923d167a72698147a35656d49dcf64e4866c031cd041107e78;
    stim[22] = 228'hae5dad4303a807a20b53a04ddab6bd4d5dcbf2a0ac412518f2cbe0d8b;
    stim[23] = 228'ha471757421c58a144bb9fafc3ef413c62e33272e9c16a9495f891d045;
    stim[24] = 228'h5726b1c15c3a683444646523e6d4253c2fc1a8ac1445d2b8410516564;
    stim[25] = 228'he29facad0b1e8c7e70ee01e347238e0d51dcc9e146541527163289d17;
    stim[26] = 228'h89a39aa08328ba98de1636b1f047164f5af670a84cc306782ee689192;
    stim[27] = 228'h9aec06df96804a4159ee7a4e1e4e05ac44a86f9bbf8837f87b3b532aa;
    stim[28] = 228'he61842a190395952dbb8775c02475655b0f5e94428c964d8fdb5b02b7;
    stim[29] = 228'hb23d3f32f6463869de60b549261a90a044240a57ac924b3699605959c;
    stim[30] = 228'hb4eb0b0aedaaa84556c8ccba799e2754697efe4330cbef5084d51abb6;
    stim[31] = 228'hfa617a1174049dd7b03808e52b237d844fb5f8bdcc7c91cd591000083;
    stim[32] = 228'h8fe2005a98a3a793ebe9bc463971ea78134423406b24942534561a4fd;
    stim[33] = 228'he63edf59a8f5bdfc276727b854c113ace50d460ff17779b1e4a0b8793;
    stim[34] = 228'hf623ff09e09dc7d874e214a56b3f40981b77cd9218311ff3522e8669f;
    stim[35] = 228'he72342b26cbb90db8a955b2e9c9900f408e81b1fae7d4a97e057f4267;
    stim[36] = 228'hb796804c641a9e8b2ae59a2a66d03709ec5718c7bdf754e77afdd735f;
    stim[37] = 228'hf23d3829868522dc909081dc20003735bda4845ead390374fdfc671a5;
    stim[38] = 228'h691f1af9197643f8ee0fbe924ccbf7a1e7fd120764ef1607bdd81c9bb;
    stim[39] = 228'hed1dfe5cf25e162c2b59f6c3918b749c325fd9b17186f44c7efed648a;
    stim[40] = 228'hb32aac0f869a9c8408a54d3050001eb5bf5d675566369ff9e24770c3c;
    stim[41] = 228'hb43650aa51b7a960e72b9e4cd68047e4e0678a991111cd5410db64a42;
    stim[42] = 228'hf2a03075bb9124c09f4e5bc724496225f3607999657363da530234c26;
    stim[43] = 228'hdf46e9c1d1b06836beca9e6f2a26277336835c0a7d0bb05af212025a9;
    stim[44] = 228'h907de321087642a42ad7e016fabef606520f0ea2235bb1de481f83566;
    stim[45] = 228'hdf1f90941db27885f87646bb7056631c7deca7c3dfedde7fece56c99f;
    stim[46] = 228'h8e7856751b985c563dbda7c0845f0a2dd377945cfcce14aa858d682d2;
    stim[47] = 228'hb05f1cafb09cce67db9c931d0ed0c9ac32d88e9bd1388a747469bbf69;
    stim[48] = 228'hdd39d65ed22902b0928903048a7f09e47934e119cc14179f47f004a38;
    stim[49] = 228'hbe19f2f99b69a89e9e169e4c816e28d6f6a0611b78ccdbe6aa53e3b56;
    stim[50] = 228'hfa14fa715d0af685dab25319097e7e0d18a79bdf8d6a1af9f657cb9f8;
    stim[51] = 228'h95223e05fe0431840dc171b7f0c069522ed3fb91535ca1f95a31e47b1;
    stim[52] = 228'ha5eddefed1d773bb01fce1ca2138cf3f9051c28fb1fa9cb6ef8acb680;
    stim[53] = 228'hb01b6ab22b355131c43aab0b122bac84fda9927aea3bfeb81e823882b;
    stim[54] = 228'hc231127be855d5614405316947fcd1778863eba96862103c73c2d22c2;
    stim[55] = 228'hecc0199aed598daf87c6a2e9299234fbf8edf51de7ec316b5d4675977;
    stim[56] = 228'h8cb2386048a912ddb4b2215f7bd3e01d8d4d036caf4d935e8b512020a;
    stim[57] = 228'h85b50a9cca9ab742a9ac20676f15d38669cbcfe4974e4794ebaa27894;
    stim[58] = 228'hf2bc76fb924e6b8db28ad2fea60f09cdeadec6b3184cdd99ad40c2a5b;
    stim[59] = 228'hd1f2564d9c0db05146752e40fc7a5367cb1865da9ebbb7c26643aaeaf;
    stim[60] = 228'h8ff9fd0dc4df66aa38d9c7fddfb866a996d1de9f4de1565f9cb3ffdbb;
    stim[61] = 228'h81a9d738c04a982663af012240d6589fa34cb6b03dbb0915afe478b1c;
    stim[62] = 228'h8b1b233815e0f35fab83fdce6526bc3b00896ebe50b64a0560ce5628f;
    stim[63] = 228'hbe60f96d1043fe2a002d0c0971e76b7a38ecd61fc9fb7cbf9c8a4484f;
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
      expv[1] = 177'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 177'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 177'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 177'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 177'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 177'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 177'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 177'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 177'hxxxxxxxxxxxxxxxxxx5d2b4b5fxxxxxxxxxxxxxxxxxxx;
      expv[10] = 177'hxxxxxxxxxxxxxxxxxx5d2b4b5fxxxxxxxxxxxxxxxxxxx;
      expv[11] = 177'hxxxxxxxxxxxxxxxxxxa619bb32xxxxxxxxxxxxxxxxxxx;
      expv[12] = 177'hxxxxxxxxxxxxxxxxxxa619bb32xxxxxxxxxxxxxxxxxxx;
      expv[13] = 177'hxxxxxxxxxxxxxxxxxxf25c2c3bxxxxxxxxxxxxxxxxxxx;
      expv[14] = 177'hxxxxxxxxxxxxxxxxxxf764f67exxxxxxxxxxxxxxxxxxx;
      expv[15] = 177'hxxxxxxxxxxxxxxxxxxf764f67exxxxxxxxxxxxxxxxxxx;
      expv[16] = 177'hxxxxxxxxxxxxxxxxxxf764f67exxxxxxxxxxxxxxxxxxx;
      expv[17] = 177'hxxxxxxxxxxxxxxxxxxf764f67exxxxxxxxxxxxxxxxxxx;
      expv[18] = 177'hxxxxxxxxxxxxxxxxxxf764f67exxxxxxxxxxxxxxxxxxx;
      expv[19] = 177'hxxxxxxxxxxxxxxxxxxff511ff2xxxxxxxxxxxxxxxxxxx;
      expv[20] = 177'hxxxxxxxxxxxxxxxxxxff511ff2xxxxxxxxxxxxxxxxxxx;
      expv[21] = 177'hxxxxxxxxxxxxxxxxxxff511ff2xxxxxxxxxxxxxxxxxxx;
      expv[22] = 177'hxxxxxxxxxxxxxxxxxxff511ff2xxxxxxxxxxxxxxxxxxx;
      expv[23] = 177'hxxxxxxxxxxxxxxxxxxff511ff2xxxxxxxxxxxxxxxxxxx;
      expv[24] = 177'hxxxxxxxxxxxxxxxxxxff511ff2xxxxxxxxxxxxxxxxxxx;
      expv[25] = 177'hxxxxxxxxxxxxxxxxxxff511ff2xxxxxxxxxxxxxxxxxxx;
      expv[26] = 177'hxxxxxxxxxxxxxxxxxxff511ff2xxxxxxxxxxxxxxxxxxx;
      expv[27] = 177'hxxxxxxxxxxxxxxxxxx9aa0832cxxxxxxxxxxxxxxxxxxx;
      expv[28] = 177'hxxxxxxxxxxxxxxxxxx06df9680xxxxxxxxxxxxxxxxxxx;
      expv[29] = 177'hxxxxxxxxxxxxxxxxxx42a19039xxxxxxxxxxxxxxxxxxx;
      expv[30] = 177'hxxxxxxxxxxxxxxxxxx3f32f644xxxxxxxxxxxxxxxxxxx;
      expv[31] = 177'hxxxxxxxxxxxxxxxxxx0b0aedaaxxxxxxxxxxxxxxxxxxx;
      expv[32] = 177'hxxxxxxxxxxxxxxxxxx0b0aedaaxxxxxxxxxxxxxxxxxxx;
      expv[33] = 177'hxxxxxxxxxxxxxxxxxx0b0aedaaxxxxxxxxxxxxxxxxxxx;
      expv[34] = 177'hxxxxxxxxxxxxxxxxxx0b0aedaaxxxxxxxxxxxxxxxxxxx;
      expv[35] = 177'hxxxxxxxxxxxxxxxxxxff09e09cxxxxxxxxxxxxxxxxxxx;
      expv[36] = 177'hxxxxxxxxxxxxxxxxxxff09e09cxxxxxxxxxxxxxxxxxxx;
      expv[37] = 177'hxxxxxxxxxxxxxxxxxxff09e09cxxxxxxxxxxxxxxxxxxx;
      expv[38] = 177'hxxxxxxxxxxxxxxxxxx38298686xxxxxxxxxxxxxxxxxxx;
      expv[39] = 177'hxxxxxxxxxxxxxxxxxx38298686xxxxxxxxxxxxxxxxxxx;
      expv[40] = 177'hxxxxxxxxxxxxxxxxxx38298686xxxxxxxxxxxxxxxxxxx;
      expv[41] = 177'hxxxxxxxxxxxxxxxxxx38298686xxxxxxxxxxxxxxxxxxx;
      expv[42] = 177'hxxxxxxxxxxxxxxxxxx38298686xxxxxxxxxxxxxxxxxxx;
      expv[43] = 177'hxxxxxxxxxxxxxxxxxx3075bb90xxxxxxxxxxxxxxxxxxx;
      expv[44] = 177'hxxxxxxxxxxxxxxxxxxe9c1d1b3xxxxxxxxxxxxxxxxxxx;
      expv[45] = 177'hxxxxxxxxxxxxxxxxxxe9c1d1b3xxxxxxxxxxxxxxxxxxx;
      expv[46] = 177'hxxxxxxxxxxxxxxxxxx90941db2xxxxxxxxxxxxxxxxxxx;
      expv[47] = 177'hxxxxxxxxxxxxxxxxxx90941db2xxxxxxxxxxxxxxxxxxx;
      expv[48] = 177'hxxxxxxxxxxxxxxxxxx1cafb09bxxxxxxxxxxxxxxxxxxx;
      expv[49] = 177'hxxxxxxxxxxxxxxxxxxd65ed228xxxxxxxxxxxxxxxxxxx;
      expv[50] = 177'hxxxxxxxxxxxxxxxxxxd65ed228xxxxxxxxxxxxxxxxxxx;
      expv[51] = 177'hxxxxxxxxxxxxxxxxxxfa715d0axxxxxxxxxxxxxxxxxxx;
      expv[52] = 177'hxxxxxxxxxxxxxxxxxxfa715d0axxxxxxxxxxxxxxxxxxx;
      expv[53] = 177'hxxxxxxxxxxxxxxxxxxfa715d0axxxxxxxxxxxxxxxxxxx;
      expv[54] = 177'hxxxxxxxxxxxxxxxxxxfa715d0axxxxxxxxxxxxxxxxxxx;
      expv[55] = 177'hxxxxxxxxxxxxxxxxxxfa715d0axxxxxxxxxxxxxxxxxxx;
      expv[56] = 177'hxxxxxxxxxxxxxxxxxxfa715d0axxxxxxxxxxxxxxxxxxx;
      expv[57] = 177'hxxxxxxxxxxxxxxxxxx386048aexxxxxxxxxxxxxxxxxxx;
      expv[58] = 177'hxxxxxxxxxxxxxxxxxx386048aexxxxxxxxxxxxxxxxxxx;
      expv[59] = 177'hxxxxxxxxxxxxxxxxxx76fb924exxxxxxxxxxxxxxxxxxx;
      expv[60] = 177'hxxxxxxxxxxxxxxxxxx76fb924exxxxxxxxxxxxxxxxxxx;
      expv[61] = 177'hxxxxxxxxxxxxxxxxxxfd0dc4ddxxxxxxxxxxxxxxxxxxx;
      expv[62] = 177'hxxxxxxxxxxxxxxxxxxfd0dc4ddxxxxxxxxxxxxxxxxxxx;
      expv[63] = 177'hxxxxxxxxxxxxxxxxxxfd0dc4ddxxxxxxxxxxxxxxxxxxx;
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
