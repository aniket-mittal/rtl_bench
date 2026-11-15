// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 102;
  localparam OW = 168;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04362 dut (
    .s_axi_lite_aclk(clk),
    .m_axi_s2mm_aclk(in_vec[101:101]),
    .axi_resetn(in_vec[100:100]),
    .s_axi_lite_awvalid(in_vec[99:99]),
    .s_axi_lite_awaddr(in_vec[98:89]),
    .s_axi_lite_wvalid(in_vec[88:88]),
    .s_axi_lite_wdata(in_vec[87:56]),
    .s_axi_lite_bready(in_vec[55:55]),
    .s_axi_lite_arvalid(in_vec[54:54]),
    .s_axi_lite_araddr(in_vec[53:44]),
    .s_axi_lite_rready(in_vec[43:43]),
    .m_axi_s2mm_awready(in_vec[42:42]),
    .m_axi_s2mm_wready(in_vec[41:41]),
    .m_axi_s2mm_bresp(in_vec[40:39]),
    .m_axi_s2mm_bvalid(in_vec[38:38]),
    .s_axis_s2mm_tdata(in_vec[37:6]),
    .s_axis_s2mm_tkeep(in_vec[5:2]),
    .s_axis_s2mm_tvalid(in_vec[1:1]),
    .s_axis_s2mm_tlast(in_vec[0:0]),
    .s_axi_lite_awready(out_vec[167:167]),
    .s_axi_lite_wready(out_vec[166:166]),
    .s_axi_lite_bresp(out_vec[165:164]),
    .s_axi_lite_bvalid(out_vec[163:163]),
    .s_axi_lite_arready(out_vec[162:162]),
    .s_axi_lite_rvalid(out_vec[161:161]),
    .s_axi_lite_rdata(out_vec[160:129]),
    .s_axi_lite_rresp(out_vec[128:127]),
    .m_axi_s2mm_awaddr(out_vec[126:95]),
    .m_axi_s2mm_awlen(out_vec[94:87]),
    .m_axi_s2mm_awsize(out_vec[86:84]),
    .m_axi_s2mm_awburst(out_vec[83:82]),
    .m_axi_s2mm_awprot(out_vec[81:79]),
    .m_axi_s2mm_awcache(out_vec[78:75]),
    .m_axi_s2mm_awvalid(out_vec[74:74]),
    .m_axi_s2mm_wdata(out_vec[73:42]),
    .m_axi_s2mm_wstrb(out_vec[41:38]),
    .m_axi_s2mm_wlast(out_vec[37:37]),
    .m_axi_s2mm_wvalid(out_vec[36:36]),
    .m_axi_s2mm_bready(out_vec[35:35]),
    .s2mm_prmry_reset_out_n(out_vec[34:34]),
    .s_axis_s2mm_tready(out_vec[33:33]),
    .s2mm_introut(out_vec[32:32]),
    .axi_dma_tstvec(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 102'h011b2f67cd29efe92362225ed4;
    stim[1] = 102'h24d96a6d8ee2824ae32a723ee5;
    stim[2] = 102'h3c27f3cea48d91db9f9b971dfc;
    stim[3] = 102'h1a0685abf4cc28083b296869f6;
    stim[4] = 102'h1bf194ae2d089132197cea1805;
    stim[5] = 102'h156176a6b191970e38c7fafb81;
    stim[6] = 102'h3995037a70575c06de37da3fe5;
    stim[7] = 102'h17f490eefffd6486edb4e73614;
    stim[8] = 102'h0e1810991c54b679477acaa618;
    stim[9] = 102'h128f8b15deb57c868f503050ca;
    stim[10] = 102'h3e24749269c019312e5dfd6c3c;
    stim[11] = 102'h38e130731668222ff3f88dfb90;
    stim[12] = 102'h3f90154c61f8eafd7a5fbf2f6a;
    stim[13] = 102'h3e25a8a0dad0639d979cf9178a;
    stim[14] = 102'h1f53b142d1b15883efa402e498;
    stim[15] = 102'h12641e82b3466558240ac73208;
    stim[16] = 102'h14a1f4181b69245cd850517172;
    stim[17] = 102'h176e7c7cea54d96aeff2009f1b;
    stim[18] = 102'h1011d561027e056cb819d958b5;
    stim[19] = 102'h15f4a0eadbb14234bc8cba1f1e;
    stim[20] = 102'h3d65b7306b5780f140a3d40406;
    stim[21] = 102'h145d79dc5b9771fc3f4713f4c2;
    stim[22] = 102'h37db8042517814f952f4f3dbdf;
    stim[23] = 102'h148582488f4189b49dcf940470;
    stim[24] = 102'h34f202fdfc5eb8e44b2aa1dedc;
    stim[25] = 102'h154830da0892bb589c7a723a20;
    stim[26] = 102'h3f371a236cc830806800bf7856;
    stim[27] = 102'h1b4baeb654c695aa342871080e;
    stim[28] = 102'h38d247481fbb5f528038900791;
    stim[29] = 102'h1f31fe390a550551a7e62c7468;
    stim[30] = 102'h105cfcf58e627dbcd75a29c27f;
    stim[31] = 102'h3e35a0ed025bed9537265b39a6;
    stim[32] = 102'h184a986274b980f6fa0f738767;
    stim[33] = 102'h1a3c012dad25a900bbf7451234;
    stim[34] = 102'h1b338ace3e10940c64f0cd3da5;
    stim[35] = 102'h399c6bdde77d72f54088e0229b;
    stim[36] = 102'h14709432f41330ceb9855fb309;
    stim[37] = 102'h3f0c679c0fee4d251bf5a10cba;
    stim[38] = 102'h37dda6ea6c11b32d10b1e82f69;
    stim[39] = 102'h12bb28b8b23d33e5551895683e;
    stim[40] = 102'h1c3b5e4e4b909bf726366b5952;
    stim[41] = 102'h16707cd029ae7877ac15cee0e6;
    stim[42] = 102'h361127829f321af012506a37a1;
    stim[43] = 102'h3989a73dd8b8e7526cbb134c7b;
    stim[44] = 102'h3a72cb1ab67fbeda3803effde5;
    stim[45] = 102'h31c0d7b35ddd0bf86ddb40c45d;
    stim[46] = 102'h1853088f6704b2993760017f4e;
    stim[47] = 102'h38694e6759c33f2eef8e7db9b4;
    stim[48] = 102'h35a89bb61eb47c3a954e1e3a33;
    stim[49] = 102'h12f474d883768308010a8531e7;
    stim[50] = 102'h3d72d3c06c2f39db3ab9b43bba;
    stim[51] = 102'h3591af42c647337df3a1dc50cf;
    stim[52] = 102'h30e3ad3d85167bfce2ae816483;
    stim[53] = 102'h1802987283a0d3fdfa48820cdc;
    stim[54] = 102'h317c278aa957d6f0c52a66ade8;
    stim[55] = 102'h3fa835b121a23df1c9d4758e91;
    stim[56] = 102'h3e17df52347a2ac46ee780c06b;
    stim[57] = 102'h1bca6ab62274f7514bc40b219b;
    stim[58] = 102'h106d0c4d706082561dcb8d3403;
    stim[59] = 102'h17d707cbacea46b4cc714ef844;
    stim[60] = 102'h3089236d064622d7629782e7e5;
    stim[61] = 102'h341addcef94c51feee014f49a0;
    stim[62] = 102'h3e0689746b250c26d686ab008b;
    stim[63] = 102'h37af96b3006a8de9f93eeae2e1;
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
      expv[0] = 168'h000000000000000000000000000000000400000000;
      expv[1] = 168'h000000000000000000000000000000000400000000;
      expv[2] = 168'h000000000000000000000000000000000400000000;
      expv[3] = 168'hc00000000000000000000000000000000400000000;
      expv[4] = 168'h000000000000000000000000000000000400000000;
      expv[5] = 168'hc00000000000000000000000000000000400000000;
      expv[6] = 168'h000000000000000000000000000000000400000000;
      expv[7] = 168'hc40000000000000000000000000000000400000000;
      expv[8] = 168'h000000000000000000000000000000000400000000;
      expv[9] = 168'h000000000000000000000000000000000400000000;
      expv[10] = 168'h440000000000000000000000000000000400000000;
      expv[11] = 168'h800000000000000000000000000000000400000000;
      expv[12] = 168'h400000000000000000000000000000000400000000;
      expv[13] = 168'h840000000000000000000000000000000400000000;
      expv[14] = 168'h43bd5b7dde00000000000000000000000400000000;
      expv[15] = 168'h87bd5b7dde00000000000000000000000400000000;
      expv[16] = 168'h01bd5b7dde00000000000000000000000400000000;
      expv[17] = 168'h41bd5b7dde00000000000000000000000400000000;
      expv[18] = 168'h05bd5b7dde00000000000000000000000400000000;
      expv[19] = 168'h41bd5b7dde00000000000000000000000400000000;
      expv[20] = 168'h05bd5b7dde00000000000000000000000400000000;
      expv[21] = 168'hc1bd5b7dde00000000000000000000000400000000;
      expv[22] = 168'h05bd5b7dde00000000000000000000000400000000;
      expv[23] = 168'h41bd5b7dde00000000000000000000000400000000;
      expv[24] = 168'h01bd5b7dde00000000000000000000000400000000;
      expv[25] = 168'h01bd5b7dde00000000000000000000000400000000;
      expv[26] = 168'h01bd5b7dde00000000000000000000000400000000;
      expv[27] = 168'hc1bd5b7dde00000000000000000000000400000000;
      expv[28] = 168'h09bd5b7dde00000000000000000000000400000000;
      expv[29] = 168'h8dbd5b7dde00000000000000000000000400000000;
      expv[30] = 168'h49bd5b7dde00000000000000000000000400000000;
      expv[31] = 168'h0dbd5b7dde00000000000000000000000400000000;
      expv[32] = 168'hc3bd5b7dde00000000000000000000000400000000;
      expv[33] = 168'h03bd5b7dde00000000000000000000000400000000;
      expv[34] = 168'h83bd5b7dde00000000000000000000000400000000;
      expv[35] = 168'h41bd5b7dde00000000000000000000000400000000;
      expv[36] = 168'h85bd5b7dde00000000000000000000000400000000;
      expv[37] = 168'h01bd5b7dde00000000000000000000000400000000;
      expv[38] = 168'h85bd5b7dde00000000000000000000000400000000;
      expv[39] = 168'h41bd5b7dde00000000000000000000000400000000;
      expv[40] = 168'h01bd5b7dde00000000000000000000000400000000;
      expv[41] = 168'hc1bd5b7dde00000000000000000000000400000000;
      expv[42] = 168'h05bd5b7dde00000000000000000000000400000000;
      expv[43] = 168'h41bd5b7dde00000000000000000000000400000000;
      expv[44] = 168'h85bd5b7dde00000000000000000000000400000000;
      expv[45] = 168'h01bd5b7dde00000000000000000000000400000000;
      expv[46] = 168'h01bd5b7dde00000000000000000000000400000000;
      expv[47] = 168'hc1bd5b7dde00000000000000000000000400000000;
      expv[48] = 168'h09bd5b7dde00000000000000000000000400000000;
      expv[49] = 168'h0dbd5b7dde00000000000000000000000400000000;
      expv[50] = 168'h01bd5b7dde00000000000000000000000400000000;
      expv[51] = 168'h81bd5b7dde00000000000000000000000400000000;
      expv[52] = 168'h41bd5b7dde00000000000000000000000400000000;
      expv[53] = 168'h05bd5b7dde00000000000000000000000400000000;
      expv[54] = 168'h83bd5b7dde00000000000000000000000400000000;
      expv[55] = 168'h07bd5b7dde00000000000000000000000400000000;
      expv[56] = 168'h83bd5b7dde00000000000000000000000400000000;
      expv[57] = 168'h43bd5b7dde00000000000000000000000400000000;
      expv[58] = 168'h87bd5b7dde00000000000000000000000400000000;
      expv[59] = 168'h43bd5b7dde00000000000000000000000400000000;
      expv[60] = 168'h07bd5b7dde00000000000000000000000400000000;
      expv[61] = 168'h43bd5b7dde00000000000000000000000400000000;
      expv[62] = 168'h05bd5b7dde00000000000000000000000400000000;
      expv[63] = 168'h81bd5b7dde00000000000000000000000400000000;
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
