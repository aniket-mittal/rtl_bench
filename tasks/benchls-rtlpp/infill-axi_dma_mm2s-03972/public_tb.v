// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 98;
  localparam OW = 167;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03972 dut (
    .s_axi_lite_aclk(in_vec[97:97]),
    .m_axi_mm2s_aclk(in_vec[96:96]),
    .axi_resetn(in_vec[95:95]),
    .s_axi_lite_awvalid(in_vec[94:94]),
    .s_axi_lite_awaddr(in_vec[93:84]),
    .s_axi_lite_wvalid(in_vec[83:83]),
    .s_axi_lite_wdata(in_vec[82:51]),
    .s_axi_lite_bready(in_vec[50:50]),
    .s_axi_lite_arvalid(in_vec[49:49]),
    .s_axi_lite_araddr(in_vec[48:39]),
    .s_axi_lite_rready(in_vec[38:38]),
    .m_axi_mm2s_arready(in_vec[37:37]),
    .m_axi_mm2s_rdata(in_vec[36:5]),
    .m_axi_mm2s_rresp(in_vec[4:3]),
    .m_axi_mm2s_rlast(in_vec[2:2]),
    .m_axi_mm2s_rvalid(in_vec[1:1]),
    .m_axis_mm2s_tready(in_vec[0:0]),
    .s_axi_lite_awready(out_vec[166:166]),
    .s_axi_lite_wready(out_vec[165:165]),
    .s_axi_lite_bresp(out_vec[164:163]),
    .s_axi_lite_bvalid(out_vec[162:162]),
    .s_axi_lite_arready(out_vec[161:161]),
    .s_axi_lite_rvalid(out_vec[160:160]),
    .s_axi_lite_rdata(out_vec[159:128]),
    .s_axi_lite_rresp(out_vec[127:126]),
    .m_axi_mm2s_araddr(out_vec[125:94]),
    .m_axi_mm2s_arlen(out_vec[93:86]),
    .m_axi_mm2s_arsize(out_vec[85:83]),
    .m_axi_mm2s_arburst(out_vec[82:81]),
    .m_axi_mm2s_arprot(out_vec[80:78]),
    .m_axi_mm2s_arcache(out_vec[77:74]),
    .m_axi_mm2s_arvalid(out_vec[73:73]),
    .m_axi_mm2s_rready(out_vec[72:72]),
    .mm2s_prmry_reset_out_n(out_vec[71:71]),
    .m_axis_mm2s_tdata(out_vec[70:39]),
    .m_axis_mm2s_tkeep(out_vec[38:35]),
    .m_axis_mm2s_tvalid(out_vec[34:34]),
    .m_axis_mm2s_tlast(out_vec[33:33]),
    .mm2s_introut(out_vec[32:32]),
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
    stim[0] = 98'h05c5580c5ac1b50952dd1cab5;
    stim[1] = 98'h368057e7bee6f4bcb9bca25db;
    stim[2] = 98'h2f52231c8bb926360741dafa8;
    stim[3] = 98'h394f599c0c5731b63262d4131;
    stim[4] = 98'h3a9dab05cc797d3d44e82e120;
    stim[5] = 98'h1eac805742ffd989ed25da237;
    stim[6] = 98'h2a10abe87cdf720aba03d5018;
    stim[7] = 98'h39013965ea2adeebecf9c31a3;
    stim[8] = 98'h0cc7cd3eb987ea5058e35fe9e;
    stim[9] = 98'h2d1f7897cfeb7157dce521390;
    stim[10] = 98'h2c3c02e90d36228bd55109e5f;
    stim[11] = 98'h28e10233e908c0b838a884d2e;
    stim[12] = 98'h0eaa8ba70e83187b0d4be9310;
    stim[13] = 98'h0fb7152da0e7648260999088b;
    stim[14] = 98'h18f01e6cb8d8901238f0f907d;
    stim[15] = 98'h3f66abd5b681e7a0802818089;
    stim[16] = 98'h1eae3b95660165e9f345e667d;
    stim[17] = 98'h1d3cf7d35850236a5264e8467;
    stim[18] = 98'h1a0b76f573c161b8f1a17ef16;
    stim[19] = 98'h3f381f15228f308129125c4d8;
    stim[20] = 98'h1b2a132163f20e664c756cd31;
    stim[21] = 98'h0bda22110aa16b29676e7ebe3;
    stim[22] = 98'h39cdcfc076e89ef50a109a165;
    stim[23] = 98'h2f54f84e17e530c91f2724456;
    stim[24] = 98'h3b74812a6ec4a6797675428ce;
    stim[25] = 98'h2fd514e32eab1a33eff98513b;
    stim[26] = 98'h29d58d91eaec2ff8f549453d1;
    stim[27] = 98'h0de8f84d9b130a00030b5e18c;
    stim[28] = 98'h18a585296160abae9970248e2;
    stim[29] = 98'h0d84bd376782394e72997d1de;
    stim[30] = 98'h0eace081f14f2c621b0306d55;
    stim[31] = 98'h3e73274cc8ccd251e6a9597da;
    stim[32] = 98'h3cbc434dfe109ef607206cb13;
    stim[33] = 98'h1a775550d115055a1c8ce4d19;
    stim[34] = 98'h3e2c05f3ec8d2e0639725e0e7;
    stim[35] = 98'h0cbd555b5da9e2165c3c3b64f;
    stim[36] = 98'h091fc367e4557fb69d6a66f32;
    stim[37] = 98'h259cc3bca6c6083138504d8ba;
    stim[38] = 98'h3c8fd484ed7728819e416336a;
    stim[39] = 98'h3c59073b1efa693928ee5e4a7;
    stim[40] = 98'h2dd9be479e4ada3a301f3a9b3;
    stim[41] = 98'h0abdc3036289682a703252025;
    stim[42] = 98'h3e816a6c7cb305a7a01614b7f;
    stim[43] = 98'h0969e8c9690c4505ba6ff7361;
    stim[44] = 98'h0a0299dfe93653b8d32184073;
    stim[45] = 98'h0cbee770d5700bcb8fcf4b158;
    stim[46] = 98'h0b05951b2d96b5f393253bc48;
    stim[47] = 98'h2a0e82393ab2d4a14230a1e49;
    stim[48] = 98'h1c1e4a5bef095c8058f4c9f45;
    stim[49] = 98'h08d5ae8792f87e717cde5feb3;
    stim[50] = 98'h2cf62b088a0b236a191392233;
    stim[51] = 98'h13f7a0212f6283eca0f7dd995;
    stim[52] = 98'h0971471434a8b5dbed7d96dcb;
    stim[53] = 98'h2ad036f2b1d6ce1ef611dc126;
    stim[54] = 98'h3b150fcb6983f15731248ebfa;
    stim[55] = 98'h19fc180cb40a5b6e5ad2318db;
    stim[56] = 98'h2893172cea0de629370d16268;
    stim[57] = 98'h283af77e40cc15e5b6b6648dc;
    stim[58] = 98'h190ac32d8399599ffffa8027c;
    stim[59] = 98'h287534304a3d0808a533a409e;
    stim[60] = 98'h081f5a1eb8338924b5fd49d08;
    stim[61] = 98'h1842c4c7d54430007684c71b4;
    stim[62] = 98'h3b81ff9de9d17526eaa860e19;
    stim[63] = 98'h0e2ae60efde4ced8417272138;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 167'h000000000000000000000000800000007800000000;
      expv[1] = 167'h000000000000000000000000800000007800000000;
      expv[2] = 167'h000000000000000000000000800000007800000000;
      expv[3] = 167'h000000000000000000000000800000007800000000;
      expv[4] = 167'h000000000000000000000000800000007800000000;
      expv[5] = 167'h000000000000000000000000800000007800000000;
      expv[6] = 167'h000000000000000000000000800000007800000000;
      expv[7] = 167'h000000000000000000000000800000007800000000;
      expv[8] = 167'h000000000000000000000000800000007800000000;
      expv[9] = 167'h000000000000000000000000800000007800000000;
      expv[10] = 167'h000000000000000000000000800000007800000000;
      expv[11] = 167'h000000000000000000000000800000007800000000;
      expv[12] = 167'h000000000000000000000000800000007800000000;
      expv[13] = 167'h000000000000000000000000800000007800000000;
      expv[14] = 167'h000000000000000000000000800000007800000000;
      expv[15] = 167'h000000000000000000000000800000007800000000;
      expv[16] = 167'h000000000000000000000000800000007800000000;
      expv[17] = 167'h000000000000000000000000800000007800000000;
      expv[18] = 167'h000000000000000000000000800000007800000000;
      expv[19] = 167'h000000000000000000000000800000007800000000;
      expv[20] = 167'h000000000000000000000000800000007800000000;
      expv[21] = 167'h000000000000000000000000800000007800000000;
      expv[22] = 167'h000000000000000000000000800000007800000000;
      expv[23] = 167'h000000000000000000000000800000007800000000;
      expv[24] = 167'h000000000000000000000000800000007800000000;
      expv[25] = 167'h000000000000000000000000800000007800000000;
      expv[26] = 167'h000000000000000000000000800000007800000000;
      expv[27] = 167'h000000000000000000000000800000007800000000;
      expv[28] = 167'h000000000000000000000000800000007800000000;
      expv[29] = 167'h000000000000000000000000800000007800000000;
      expv[30] = 167'h000000000000000000000000800000007800000000;
      expv[31] = 167'h000000000000000000000000800000007800000000;
      expv[32] = 167'h000000000000000000000000800000007800000000;
      expv[33] = 167'h000000000000000000000000800000007800000000;
      expv[34] = 167'h000000000000000000000000800000007800000000;
      expv[35] = 167'h000000000000000000000000800000007800000000;
      expv[36] = 167'h000000000000000000000000800000007800000000;
      expv[37] = 167'h000000000000000000000000800000007800000000;
      expv[38] = 167'h000000000000000000000000800000007800000000;
      expv[39] = 167'h000000000000000000000000800000007800000000;
      expv[40] = 167'h000000000000000000000000800000007800000000;
      expv[41] = 167'h000000000000000000000000800000007800000000;
      expv[42] = 167'h000000000000000000000000800000007800000000;
      expv[43] = 167'h000000000000000000000000800000007800000000;
      expv[44] = 167'h000000000000000000000000800000007800000000;
      expv[45] = 167'h000000000000000000000000800000007800000000;
      expv[46] = 167'h000000000000000000000000800000007800000000;
      expv[47] = 167'h000000000000000000000000800000007800000000;
      expv[48] = 167'h000000000000000000000000800000007800000000;
      expv[49] = 167'h000000000000000000000000800000007800000000;
      expv[50] = 167'h000000000000000000000000800000007800000000;
      expv[51] = 167'h000000000000000000000000800000007800000000;
      expv[52] = 167'h000000000000000000000000800000007800000000;
      expv[53] = 167'h000000000000000000000000800000007800000000;
      expv[54] = 167'h000000000000000000000000800000007800000000;
      expv[55] = 167'h000000000000000000000000800000007800000000;
      expv[56] = 167'h000000000000000000000000800000007800000000;
      expv[57] = 167'h000000000000000000000000800000007800000000;
      expv[58] = 167'h000000000000000000000000800000007800000000;
      expv[59] = 167'h000000000000000000000000800000007800000000;
      expv[60] = 167'h000000000000000000000000800000007800000000;
      expv[61] = 167'h000000000000000000000000800000007800000000;
      expv[62] = 167'h000000000000000000000000800000007800000000;
      expv[63] = 167'h000000000000000000000000800000007800000000;
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
