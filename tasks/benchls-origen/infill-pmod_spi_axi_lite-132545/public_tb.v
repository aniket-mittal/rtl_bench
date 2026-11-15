// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 57;
  localparam OW = 51;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_132545 dut (
    .s_axi_aclk(clk),
    .ext_spi_clk(in_vec[56:56]),
    .s_axi_aresetn(in_vec[55:55]),
    .AXI_LITE_SPI_araddr(in_vec[54:48]),
    .AXI_LITE_SPI_arvalid(in_vec[47:47]),
    .AXI_LITE_SPI_awaddr(in_vec[46:40]),
    .AXI_LITE_SPI_awvalid(in_vec[39:39]),
    .AXI_LITE_SPI_bready(in_vec[38:38]),
    .AXI_LITE_SPI_rready(in_vec[37:37]),
    .AXI_LITE_SPI_wdata(in_vec[36:5]),
    .AXI_LITE_SPI_wstrb(in_vec[4:1]),
    .AXI_LITE_SPI_wvalid(in_vec[0:0]),
    .Pmod_out_pin1(out_vec[50:50]),
    .Pmod_out_pin2(out_vec[49:49]),
    .Pmod_out_pin3(out_vec[48:48]),
    .Pmod_out_pin4(out_vec[47:47]),
    .Pmod_out_pin5(out_vec[46:46]),
    .Pmod_out_pin6(out_vec[45:45]),
    .Pmod_out_pin7(out_vec[44:44]),
    .Pmod_out_pin8(out_vec[43:43]),
    .Pmod_out_pin9(out_vec[42:42]),
    .Pmod_out_pin10(out_vec[41:41]),
    .AXI_LITE_SPI_arready(out_vec[40:40]),
    .AXI_LITE_SPI_awready(out_vec[39:39]),
    .AXI_LITE_SPI_bresp(out_vec[38:37]),
    .AXI_LITE_SPI_bvalid(out_vec[36:36]),
    .AXI_LITE_SPI_rdata(out_vec[35:4]),
    .AXI_LITE_SPI_rresp(out_vec[3:2]),
    .AXI_LITE_SPI_rvalid(out_vec[1:1]),
    .AXI_LITE_SPI_wready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 57'h0621b48aa21e83f;
    stim[1] = 57'h1620454b9c2ff18;
    stim[2] = 57'h1d0970916efc188;
    stim[3] = 57'h08ef359f88bd1f7;
    stim[4] = 57'h0f6ccd8b56cf9a6;
    stim[5] = 57'h1c8d2bedad036bc;
    stim[6] = 57'h1d71880ae3bdd2e;
    stim[7] = 57'h1cf1930ae3358c9;
    stim[8] = 57'h182a70f4d90d66b;
    stim[9] = 57'h1c692bc7dd5e2ae;
    stim[10] = 57'h1a067e586edb976;
    stim[11] = 57'h1cee142ae9eceb0;
    stim[12] = 57'h0cbe51f9d2cbd5f;
    stim[13] = 57'h18fe4fbd36cb917;
    stim[14] = 57'h1b29e8f976f2318;
    stim[15] = 57'h1bd634f21543155;
    stim[16] = 57'h08d11e7ef4ba8ef;
    stim[17] = 57'h1c389f5600e53f8;
    stim[18] = 57'h19740f8ce281cac;
    stim[19] = 57'h1d81a40f010d7ca;
    stim[20] = 57'h1d9314a970b73d0;
    stim[21] = 57'h0a3078115909944;
    stim[22] = 57'h0c2f1c64237b519;
    stim[23] = 57'h0dd5cbdd47ff192;
    stim[24] = 57'h09dced47a13dd9f;
    stim[25] = 57'h1e650646c24028f;
    stim[26] = 57'h1d4f54030ce2401;
    stim[27] = 57'h089d421dd72bee8;
    stim[28] = 57'h1c030002e980159;
    stim[29] = 57'h18ae064d51c4661;
    stim[30] = 57'h1f4bd7e22d42edb;
    stim[31] = 57'h1f3ffa6b0b2aec3;
    stim[32] = 57'h1cb753279ae43b6;
    stim[33] = 57'h1b2adfd560721e9;
    stim[34] = 57'h1f4260570fd44d1;
    stim[35] = 57'h183799ed7685359;
    stim[36] = 57'h0ec1f13057c1f79;
    stim[37] = 57'h18fcada276d3f73;
    stim[38] = 57'h0c7de6d33372bf9;
    stim[39] = 57'h1aa1918866bff2c;
    stim[40] = 57'h0fd6214683573d8;
    stim[41] = 57'h01c323cfe0a2167;
    stim[42] = 57'h1a4df5a2a32473f;
    stim[43] = 57'h1c22fe8d320cd91;
    stim[44] = 57'h181cf35bdc0220a;
    stim[45] = 57'h187a384f00ee042;
    stim[46] = 57'h0b2e8e1dcd1380c;
    stim[47] = 57'h1872074ecff862c;
    stim[48] = 57'h19bc881eb55f1a3;
    stim[49] = 57'h0e3dbfbf439239b;
    stim[50] = 57'h09a13cb358cd404;
    stim[51] = 57'h0c12ba001274662;
    stim[52] = 57'h1b42236b7dc96e4;
    stim[53] = 57'h1ece497d9de6dd6;
    stim[54] = 57'h1d57374d15c97cb;
    stim[55] = 57'h18d0ddec9db1eaa;
    stim[56] = 57'h0d94e9fd6378975;
    stim[57] = 57'h1acd52aa8a91a4e;
    stim[58] = 57'h0957b7a9f642874;
    stim[59] = 57'h0b2d4c0dd701533;
    stim[60] = 57'h1ab1b0b83a0ab2d;
    stim[61] = 57'h0a257fc81588cbe;
    stim[62] = 57'h0d450093b906793;
    stim[63] = 57'h08785d5a46f0ddf;
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
      expv[0] = 51'h0000000000000;
      expv[1] = 51'h0000000000000;
      expv[2] = 51'h0000000000000;
      expv[3] = 51'h0010000000000;
      expv[4] = 51'h7880000000003;
      expv[5] = 51'h7899000000002;
      expv[6] = 51'h7881000000000;
      expv[7] = 51'h78890000008f2;
      expv[8] = 51'h31810000008f1;
      expv[9] = 51'h31910000008f0;
      expv[10] = 51'h3189000000c62;
      expv[11] = 51'h3180000000c60;
      expv[12] = 51'h3190000000c60;
      expv[13] = 51'h2b80000000c63;
      expv[14] = 51'h2b99000000c60;
      expv[15] = 51'h2b81000000ea2;
      expv[16] = 51'h2880000000ea3;
      expv[17] = 51'h2889000000ea0;
      expv[18] = 51'h2890000000ea0;
      expv[19] = 51'h28880000008a2;
      expv[20] = 51'h28800000008a2;
      expv[21] = 51'h28800000008a2;
      expv[22] = 51'h28880000008a2;
      expv[23] = 51'h0a900000008a3;
      expv[24] = 51'h0a890000008a0;
      expv[25] = 51'h1b90000000a83;
      expv[26] = 51'h1b81000000a80;
      expv[27] = 51'h0210000000a81;
      expv[28] = 51'h0201000000202;
      expv[29] = 51'h2801000000203;
      expv[30] = 51'h2810000000200;
      expv[31] = 51'h37000000000a3;
      expv[32] = 51'h37190000000a0;
      expv[33] = 51'h3701000000762;
      expv[34] = 51'h7818000000761;
      expv[35] = 51'h78010000000f2;
      expv[36] = 51'h2c890000000f3;
      expv[37] = 51'h2c810000000f2;
      expv[38] = 51'h6f980000000f3;
      expv[39] = 51'h6f810000000f0;
      expv[40] = 51'h6f81000000fb2;
      expv[41] = 51'h0000000000000;
      expv[42] = 51'h0000000000000;
      expv[43] = 51'h4e10000000001;
      expv[44] = 51'h4e09000000392;
      expv[45] = 51'h4e11000000390;
      expv[46] = 51'h4e09000000392;
      expv[47] = 51'h4e10000000390;
      expv[48] = 51'h4e00000000392;
      expv[49] = 51'h5898000000393;
      expv[50] = 51'h5881000000390;
      expv[51] = 51'h58880000008d2;
      expv[52] = 51'h58800000008d0;
      expv[53] = 51'h58800000008d0;
      expv[54] = 51'h58980000008d0;
      expv[55] = 51'h3e800000008d3;
      expv[56] = 51'h3e890000008d2;
      expv[57] = 51'h69010000008d3;
      expv[58] = 51'h69110000008d0;
      expv[59] = 51'h69000000004b2;
      expv[60] = 51'h4a980000004b3;
      expv[61] = 51'h4a810000004b2;
      expv[62] = 51'h4a880000004b0;
      expv[63] = 51'h1e00000000a93;
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
