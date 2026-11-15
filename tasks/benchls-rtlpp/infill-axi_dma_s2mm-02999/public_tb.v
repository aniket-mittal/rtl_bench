// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 93;
  localparam OW = 177;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02999 dut (
    .s_axi_lite_aclk(clk),
    .m_axi_s2mm_aclk(in_vec[92:92]),
    .s_axis_s2mm_aclk(in_vec[91:91]),
    .axi_resetn(in_vec[90:90]),
    .s_axi_lite_awvalid(in_vec[89:89]),
    .s_axi_lite_awaddr(in_vec[88:80]),
    .s_axi_lite_wvalid(in_vec[79:79]),
    .s_axi_lite_wdata(in_vec[78:47]),
    .s_axi_lite_bready(in_vec[46:46]),
    .s_axi_lite_arvalid(in_vec[45:45]),
    .s_axi_lite_araddr(in_vec[44:36]),
    .s_axi_lite_rready(in_vec[35:35]),
    .m_axi_s2mm_awready(in_vec[34:34]),
    .m_axi_s2mm_wready(in_vec[33:33]),
    .m_axi_s2mm_bresp(in_vec[32:31]),
    .m_axi_s2mm_bvalid(in_vec[30:30]),
    .s_axis_s2mm_tdata(in_vec[29:6]),
    .s_axis_s2mm_tkeep(in_vec[5:3]),
    .s_axis_s2mm_tuser(in_vec[2:2]),
    .s_axis_s2mm_tvalid(in_vec[1:1]),
    .s_axis_s2mm_tlast(in_vec[0:0]),
    .s_axi_lite_awready(out_vec[176:176]),
    .s_axi_lite_wready(out_vec[175:175]),
    .s_axi_lite_bresp(out_vec[174:173]),
    .s_axi_lite_bvalid(out_vec[172:172]),
    .s_axi_lite_arready(out_vec[171:171]),
    .s_axi_lite_rvalid(out_vec[170:170]),
    .s_axi_lite_rdata(out_vec[169:138]),
    .s_axi_lite_rresp(out_vec[137:136]),
    .s2mm_frame_ptr_out(out_vec[135:130]),
    .m_axi_s2mm_awaddr(out_vec[129:98]),
    .m_axi_s2mm_awlen(out_vec[97:90]),
    .m_axi_s2mm_awsize(out_vec[89:87]),
    .m_axi_s2mm_awburst(out_vec[86:85]),
    .m_axi_s2mm_awprot(out_vec[84:82]),
    .m_axi_s2mm_awcache(out_vec[81:78]),
    .m_axi_s2mm_awvalid(out_vec[77:77]),
    .m_axi_s2mm_wdata(out_vec[76:13]),
    .m_axi_s2mm_wstrb(out_vec[12:5]),
    .m_axi_s2mm_wlast(out_vec[4:4]),
    .m_axi_s2mm_wvalid(out_vec[3:3]),
    .m_axi_s2mm_bready(out_vec[2:2]),
    .s_axis_s2mm_tready(out_vec[1:1]),
    .s2mm_introut(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 93'h03946aefda7b6ba9fe2881db;
    stim[1] = 93'h135424b10dd901cf051e875b;
    stim[2] = 93'h06bba6f539b85ea443d97c71;
    stim[3] = 93'h0e1c677165de9240502c108a;
    stim[4] = 93'h06926e942b478c4dd5c79e2b;
    stim[5] = 93'h0d0c5b19b09eafb2a06adf92;
    stim[6] = 93'h1c1613ad948018c1398b0db5;
    stim[7] = 93'h051f33f9e1876c208b3dae48;
    stim[8] = 93'h06f985d076aaf12da463ed5e;
    stim[9] = 93'h163d1a3d5693d5d85e8b5745;
    stim[10] = 93'h05ff3ffa45c86222d20e4457;
    stim[11] = 93'h0f01cedb4f6d76e62db9a8c7;
    stim[12] = 93'h16b932f231458742262dde2a;
    stim[13] = 93'h05b3e92bd156317b06427310;
    stim[14] = 93'h067ad9286f1239b9cc0fac52;
    stim[15] = 93'h0cdc0e92dcb74c31a5194a6a;
    stim[16] = 93'h0e8b809e466f9029bd7adaa6;
    stim[17] = 93'h0715b73699be79bcaa3f4626;
    stim[18] = 93'h1d03880db8003b487717b5b1;
    stim[19] = 93'h07531be786b1290acee1ad51;
    stim[20] = 93'h1d5a1b110de0fe5c10c2e481;
    stim[21] = 93'h16b90387e700759c3bf7bd9f;
    stim[22] = 93'h0d48a311579d099f5015f87e;
    stim[23] = 93'h16ef490d491f05b42b89b919;
    stim[24] = 93'h0a5d4adbb3d0972dfcfcdd4f;
    stim[25] = 93'h145425c5976003f305140082;
    stim[26] = 93'h15940c6585b8d10861d9e024;
    stim[27] = 93'h1e4a46a4a853adfe90e5dc90;
    stim[28] = 93'h0e555998d6c3d27f464f5025;
    stim[29] = 93'h140ae8203b7a4a9cb399c711;
    stim[30] = 93'h07193eb8d93161b1d98dfd8f;
    stim[31] = 93'h0e9190588380c45e9888e50b;
    stim[32] = 93'h1effebbbae9b2c728c1edd96;
    stim[33] = 93'h1cc913792a666c31c48bef60;
    stim[34] = 93'h0d955d678dfa7941d6355447;
    stim[35] = 93'h140c369cfa2bae309aab3e20;
    stim[36] = 93'h161e73c2a5d8d99686cfa3b2;
    stim[37] = 93'h04dc57fc9a37dbb9c48684e9;
    stim[38] = 93'h0497cc4b1018a37099a52bab;
    stim[39] = 93'h1f72d5e1a3e96281e18a4c7e;
    stim[40] = 93'h148dae47b8d764c5b6c3c6e1;
    stim[41] = 93'h142f711b5d51cb24e5b04bfa;
    stim[42] = 93'h053e3a7e70f8b972b327730e;
    stim[43] = 93'h0d58c277781c1585b5b6d3c4;
    stim[44] = 93'h0f5f7fbb2cd341ed4c1f8d50;
    stim[45] = 93'h1b803bd90f3e685d20ca7e5d;
    stim[46] = 93'h0e0cc50158da62c6b4c6e81c;
    stim[47] = 93'h1f3c91cf72387bb5839f4283;
    stim[48] = 93'h05895ced55537b3eb5c399fa;
    stim[49] = 93'h065c960475475241cc4da2c4;
    stim[50] = 93'h159711beae7ef861fc20f103;
    stim[51] = 93'h0f575e27972d4b8329dfcb91;
    stim[52] = 93'h07dd335754f31054394b2319;
    stim[53] = 93'h071d3bd9e6a2d5f552d1690f;
    stim[54] = 93'h1f91d0390ccea875df2ddb04;
    stim[55] = 93'h0d5f1f092a0ac2ba664f8022;
    stim[56] = 93'h0f11df2397c2fc8dceb6b2ff;
    stim[57] = 93'h040ac8839b465831e205554b;
    stim[58] = 93'h0627b28548e46c2ca80804f2;
    stim[59] = 93'h0c08eea74797d82472b6c7cf;
    stim[60] = 93'h15b1f655bc28043708787c5e;
    stim[61] = 93'h0623a0281916535805b4fdba;
    stim[62] = 93'h16cd7f29b843569102076391;
    stim[63] = 93'h1de38376ff59a95472444e02;
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
      expv[3] = 177'h190000000000000000000000000000000000000000000;
      expv[4] = 177'h010000000000000000000000000000000000000000000;
      expv[5] = 177'h110000000000000000000000000000000000000000000;
      expv[6] = 177'h01c02f185380000000000000000000000000000000000;
      expv[7] = 177'h01402f185380000000000000000000000000000000000;
      expv[8] = 177'h01c02f185380000000000000000000000000000000000;
      expv[9] = 177'h19402f185380000000000000000000000000000000000;
      expv[10] = 177'h01402f185380000000000000000000000000000000000;
      expv[11] = 177'h01c02f185380000000000000000000000000000000000;
      expv[12] = 177'h19402f185380000000000000000000000000000000000;
      expv[13] = 177'h01402f185380000000000000000000000000000000000;
      expv[14] = 177'h09c02f185380000000000000000000000000000000000;
      expv[15] = 177'h11402f185380000000000000000000000000000000000;
      expv[16] = 177'h01402f185380000000000000000000000000000000000;
      expv[17] = 177'h19402f185380000000000000000000000000000000000;
      expv[18] = 177'h01c02f185380000000000000000000000000000000000;
      expv[19] = 177'h09402f185380000000000000000000000000000000000;
      expv[20] = 177'h11c02f185380000000000000000000000000000000000;
      expv[21] = 177'h01402f185380000000000000000000000000000000000;
      expv[22] = 177'h11c02f185380000000000000000000000000000000000;
      expv[23] = 177'h09402f185380000000000000000000000000000000000;
      expv[24] = 177'h11402f185380000000000000000000000000000000000;
      expv[25] = 177'h000000000000000000000000000000000000000000000;
      expv[26] = 177'h000000000000000000000000000000000000000000000;
      expv[27] = 177'h000000000000000000000000000000000000000000000;
      expv[28] = 177'h10c02f185380000000000000000000000000000000000;
      expv[29] = 177'h00402f185380000000000000000000000000000000000;
      expv[30] = 177'h09402f185380000000000000000000000000000000000;
      expv[31] = 177'h11c02f185380000000000000000000000000000000000;
      expv[32] = 177'h09402f185380000000000000000000000000000000000;
      expv[33] = 177'h11c02f185380000000000000000000000000000000000;
      expv[34] = 177'h01402f185380000000000000000000000000000000000;
      expv[35] = 177'h01c02f185380000000000000000000000000000000000;
      expv[36] = 177'h01402f185380000000000000000000000000000000000;
      expv[37] = 177'h11402f185380000000000000000000000000000000000;
      expv[38] = 177'h01402f185380000000000000000000000000000000000;
      expv[39] = 177'h09c02f185380000000000000000000000000000000000;
      expv[40] = 177'h11402f185380000000000000000000000000000000000;
      expv[41] = 177'h09c02f185380000000000000000000000000000000000;
      expv[42] = 177'h01402f185380000000000000000000000000000000000;
      expv[43] = 177'h01c02f185380000000000000000000000000000000000;
      expv[44] = 177'h09402f185380000000000000000000000000000000000;
      expv[45] = 177'h11402f185380000000000000000000000000000000000;
      expv[46] = 177'h000000000000000000000000000000000000000000000;
      expv[47] = 177'h19c02f185380000000000000000000000000000000000;
      expv[48] = 177'h01402f185380000000000000000000000000000000000;
      expv[49] = 177'h01c02f185380000000000000000000000000000000000;
      expv[50] = 177'h19402f185380000000000000000000000000000000000;
      expv[51] = 177'h01c02f185380000000000000000000000000000000000;
      expv[52] = 177'h11402f185380000000000000000000000000000000000;
      expv[53] = 177'h01402f185380000000000000000000000000000000000;
      expv[54] = 177'h11402f185380000000000000000000000000000000000;
      expv[55] = 177'h09c02f185380000000000000000000000000000000000;
      expv[56] = 177'h01402f185380000000000000000000000000000000000;
      expv[57] = 177'h19c02f185380000000000000000000000000000000000;
      expv[58] = 177'h01402f185380000000000000000000000000000000000;
      expv[59] = 177'h19c02f185380000000000000000000000000000000000;
      expv[60] = 177'h01402f185380000000000000000000000000000000000;
      expv[61] = 177'h09402f185380000000000000000000000000000000000;
      expv[62] = 177'h11402f185380000000000000000000000000000000000;
      expv[63] = 177'h01402f185380000000000000000000000000000000000;
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
