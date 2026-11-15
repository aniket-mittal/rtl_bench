// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 143;
  localparam OW = 94;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01909 dut (
    .s_axi_aclk(clk),
    .s_axi_aresetn(in_vec[142:142]),
    .s_axi_awaddr(in_vec[141:129]),
    .s_axi_awlen(in_vec[128:121]),
    .s_axi_awsize(in_vec[120:118]),
    .s_axi_awburst(in_vec[117:116]),
    .s_axi_awlock(in_vec[115:115]),
    .s_axi_awcache(in_vec[114:111]),
    .s_axi_awprot(in_vec[110:108]),
    .s_axi_awvalid(in_vec[107:107]),
    .s_axi_wdata(in_vec[106:75]),
    .s_axi_wstrb(in_vec[74:71]),
    .s_axi_wlast(in_vec[70:70]),
    .s_axi_wvalid(in_vec[69:69]),
    .s_axi_bready(in_vec[68:68]),
    .s_axi_araddr(in_vec[67:55]),
    .s_axi_arlen(in_vec[54:47]),
    .s_axi_arsize(in_vec[46:44]),
    .s_axi_arburst(in_vec[43:42]),
    .s_axi_arlock(in_vec[41:41]),
    .s_axi_arcache(in_vec[40:37]),
    .s_axi_arprot(in_vec[36:34]),
    .s_axi_arvalid(in_vec[33:33]),
    .s_axi_rready(in_vec[32:32]),
    .bram_rddata_a(in_vec[31:0]),
    .s_axi_awready(out_vec[93:93]),
    .s_axi_wready(out_vec[92:92]),
    .s_axi_bresp(out_vec[91:90]),
    .s_axi_bvalid(out_vec[89:89]),
    .s_axi_arready(out_vec[88:88]),
    .s_axi_rdata(out_vec[87:56]),
    .s_axi_rresp(out_vec[55:54]),
    .s_axi_rlast(out_vec[53:53]),
    .s_axi_rvalid(out_vec[52:52]),
    .bram_rst_a(out_vec[51:51]),
    .bram_clk_a(out_vec[50:50]),
    .bram_en_a(out_vec[49:49]),
    .bram_we_a(out_vec[48:45]),
    .bram_addr_a(out_vec[44:32]),
    .bram_wrdata_a(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 143'h14a98a37220a06175498887582cad40427f3;
    stim[1] = 143'h25c8fd17d43f96ebb2150896871d96315e3f;
    stim[2] = 143'h50af482d49c1e531259680a5feedf5ed09b4;
    stim[3] = 143'h6146a572115d01e821ce8a2ca18a6d3eda2e;
    stim[4] = 143'h58a4796c15ca16cbf1db5a8401bfa6d98fda;
    stim[5] = 143'h6064c70fc733dd09ff51ce3f5c247cf0307c;
    stim[6] = 143'h7a5e88cbd57500b8136c8f5e975034be73cd;
    stim[7] = 143'h5916cbd22df18d90d27f0989c91e039bc0b5;
    stim[8] = 143'h72aa4e23031c4c0c10263341a94c0f91da89;
    stim[9] = 143'h45bf9e663376b52396d82b39a3a9703f48ec;
    stim[10] = 143'h69a50be7993828932252796470a4bf53ba61;
    stim[11] = 143'h6e80c5139a76b7b9ba9299a384efe4c3725e;
    stim[12] = 143'h72b906eef9866f030836bead1e3ebf1f1b7f;
    stim[13] = 143'h4765cc3ea6bc4c3a794589be825168c18844;
    stim[14] = 143'h4fa3df88972f129716cbf23ec2f3efdaf84d;
    stim[15] = 143'h7509fe8a049b399a11aaec44d53403239a38;
    stim[16] = 143'h504091b3bd98782abff510caf49f4d1af288;
    stim[17] = 143'h5a8e4b0a0542a1a2f254e9c676f1dcdeeaf1;
    stim[18] = 143'h63739b5af4868ca6537c383192be135dda7f;
    stim[19] = 143'h5025186297b11f2c51c0dd2c9224c003dbfe;
    stim[20] = 143'h5ba87d1bc91314b5b9b5f098875e4a8946e9;
    stim[21] = 143'h5cd334b4690a21f4d9fd76f2ce801f3f0fea;
    stim[22] = 143'h430b26542034afeef7be3287dddb9c335e87;
    stim[23] = 143'h56403ca2987ea5909cb64447fa4886445a25;
    stim[24] = 143'h539a3879bcc3cb138133bbf9e1f59705bbee;
    stim[25] = 143'h67eb7080382721590a0c64de138a20f95a77;
    stim[26] = 143'h78f3e74653d04b80b1c42eab2454ad37f90a;
    stim[27] = 143'h42117ecffd0c9fe7e2f98e4745d6d2653319;
    stim[28] = 143'h76460f5c8010a66e76b89cae7e219fc792a6;
    stim[29] = 143'h2195b7476fff2d87472dc8d1d3df0093002c;
    stim[30] = 143'h5d51fa052f47940b37c85dc1d0aaea59f71c;
    stim[31] = 143'h4d3552c68278b30eb41e1c4e7612d9b762fc;
    stim[32] = 143'h63bf97bdfb9ba96852d4f89932b6110729b2;
    stim[33] = 143'h683a84c85a3352f9d24f5868dc13ab608655;
    stim[34] = 143'h59195376afb7c6b1bd51deaf04d25b9ae6e4;
    stim[35] = 143'h7ac5bed2df98fa65899363d6102f7458e174;
    stim[36] = 143'h0807d11819d66a44bf06e7153edfb4b5af82;
    stim[37] = 143'h4d2e68db95870c2d87d07f571c85544689cb;
    stim[38] = 143'h499928748eb82bab1cde5c2ed6df6e32986e;
    stim[39] = 143'h63d056768a5f7ffe8b870a4cb843c5d17589;
    stim[40] = 143'h6dd626a33a09349a54fae2773739b0a4b400;
    stim[41] = 143'h7f56b34935a4cd1d9d20364e7b43f995d317;
    stim[42] = 143'h414be86cfc6fa1c83431d0f6e2dd0fcdf6f0;
    stim[43] = 143'h5cbb031c5ded5fd2f100443a4887112e46c6;
    stim[44] = 143'h61a39c51d92dcc45123bd80711a5111e7b05;
    stim[45] = 143'h77e9e94993246c75a3a103e817c23aefd534;
    stim[46] = 143'h4215bb1515eb96e8c30b0d5f1f9aa95c680d;
    stim[47] = 143'h4f1164131fb7ca0c81db870dcd301bfa2a5a;
    stim[48] = 143'h403bd3828ad5941a1137d9c6349a3468b09f;
    stim[49] = 143'h51a88b0cf34182b3a4e46140b13c8a9a1d19;
    stim[50] = 143'h460850277ea0990d80e801dea126ffcedac3;
    stim[51] = 143'h63a7272a82e19a8f049318bda0a20ef4376a;
    stim[52] = 143'h56084960394ac9f5839a6a077af8fc90dc08;
    stim[53] = 143'h4849b587ae2023d1626203a9f14ea271e12a;
    stim[54] = 143'h7317942836fddf66127197f1526413cd94d1;
    stim[55] = 143'h5812e464c6126d10faafdb270ab58934c7a2;
    stim[56] = 143'h514469f1c37b4016c05ca317d59e55bea1b4;
    stim[57] = 143'h5b513ec65f05f766c8929add4ece10d940fd;
    stim[58] = 143'h73f38f704978a5c944e17871e9fd82424e5e;
    stim[59] = 143'h521c4a10d8e9b6edd2aa215398fe120508a1;
    stim[60] = 143'h66277d3c9cba5b6048e9344ac9c6c0fbb7a5;
    stim[61] = 143'h7f9b758238556f578062743685820d5709fd;
    stim[62] = 143'h5710891c7e06900e82a08322626041fae61f;
    stim[63] = 143'h7df3aabeee2eabe5023e1f2ea402125c970f;
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
      expv[0] = 94'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 94'h0xxxxxxxxxxx0000xxxxxxxx;
      expv[2] = 94'h0xxxxxxxxxxx0000xxxxxxxx;
      expv[3] = 94'h3xxxxxxxxxxx0857xxxxxxxx;
      expv[4] = 94'h3xxxxxxxxxxx0857xxxxxxxx;
      expv[5] = 94'h3xxxxxxxxxxx0857xxxxxxxx;
      expv[6] = 94'h3xxxxxxxxxxx0857xxxxxxxx;
      expv[7] = 94'h22xxxxxxxxxxc857aea01702;
      expv[8] = 94'h00xxxxxxxxxxc857aea01702;
      expv[9] = 94'h00xxxxxxxxxxc857aea01702;
      expv[10] = 94'h00xxxxxxxxxxc857aea01702;
      expv[11] = 94'h30xxxxxxxxxxd4d2aea01702;
      expv[12] = 94'h30xxxxxxxxxxd4d2aea01702;
      expv[13] = 94'h30xxxxxxxxxx14d330cde061;
      expv[14] = 94'h30xxxxxxxxxx14d330cde061;
      expv[15] = 94'h30xxxxxxxxxx14d330cde061;
      expv[16] = 94'h30xxxxxxxxxx74d493673342;
      expv[17] = 94'h22xxxxxxxxxxf4d4b30f0557;
      expv[18] = 94'h00xxxxxxxxxxf4d4b30f0557;
      expv[19] = 94'h01xxxxxxxxxxf870b30f0557;
      expv[20] = 94'h01xxxxxxxxxxf870b30f0557;
      expv[21] = 94'h014a8946e9xxf871b30f0557;
      expv[22] = 94'h014a8946e9xxf871b30f0557;
      expv[23] = 94'h019c335e87xxf872b30f0557;
      expv[24] = 94'h019c335e87xxf872b30f0557;
      expv[25] = 94'h019c335e87xxf872b30f0557;
      expv[26] = 94'h0120f95a77xxf873b30f0557;
      expv[27] = 94'h0120f95a77xxf873b30f0557;
      expv[28] = 94'h01d2653319xxf874b30f0557;
      expv[29] = 94'h01d2653319xxf874b30f0557;
      expv[30] = 94'h00d2653319xx0000b30f0557;
      expv[31] = 94'h30d2653319xx0ea8b30f0557;
      expv[32] = 94'h30d2653319xx0ea8b30f0557;
      expv[33] = 94'h30d2653319xx0ea8b30f0557;
      expv[34] = 94'h30d2653319xx0ea8b30f0557;
      expv[35] = 94'h30d2653319xx0ea8b30f0557;
      expv[36] = 94'h30d2653319xx0ea8b30f0557;
      expv[37] = 94'h00d2653319xx0000b30f0557;
      expv[38] = 94'h00d2653319xx0000b30f0557;
      expv[39] = 94'h30d2653319xx04ccb30f0557;
      expv[40] = 94'h30d2653319xx04ccb30f0557;
      expv[41] = 94'h22d2653319xx24cc4126934a;
      expv[42] = 94'h22d2653319xx24cc4126934a;
      expv[43] = 94'h00d2653319xx24cc4126934a;
      expv[44] = 94'h30d2653319xx2e5d4126934a;
      expv[45] = 94'h30d2653319xx8e5e25b988a2;
      expv[46] = 94'h30d2653319xxee5f648d8eb4;
      expv[47] = 94'h30d2653319xxee5f648d8eb4;
      expv[48] = 94'h30d2653319xxee5f648d8eb4;
      expv[49] = 94'h30d2653319xx4e605ab28342;
      expv[50] = 94'h22d2653319xx2e6068305674;
      expv[51] = 94'h22d2653319xx2e6068305674;
      expv[52] = 94'h00d2653319xx2e6068305674;
      expv[53] = 94'h30d2653319xx2b0468305674;
      expv[54] = 94'h22d2653319xx8b04c4047a2c;
      expv[55] = 94'h00d2653319xx8b04c4047a2c;
      expv[56] = 94'h00d2653319xx8b04c4047a2c;
      expv[57] = 94'h01d2653319xx9946c4047a2c;
      expv[58] = 94'h0110d940fdxx9947c4047a2c;
      expv[59] = 94'h0110d940fdxx9947c4047a2c;
      expv[60] = 94'h01120508a1xx9948c4047a2c;
      expv[61] = 94'h01c0fbb7a5xx9949c4047a2c;
      expv[62] = 94'h010d5709fdxx994ac4047a2c;
      expv[63] = 94'h010d5709fdxx994ac4047a2c;
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
