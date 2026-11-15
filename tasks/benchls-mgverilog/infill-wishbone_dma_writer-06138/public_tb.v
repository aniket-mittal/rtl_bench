// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 110;
  localparam OW = 68;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06138 dut (
    .sys_clk(clk),
    .sys_rst(in_vec[109:109]),
    .dma_en(in_vec[108:108]),
    .dma_base(in_vec[107:79]),
    .x(in_vec[78:72]),
    .y(in_vec[71:65]),
    .dma_d1(in_vec[64:33]),
    .dma_d2(in_vec[32:1]),
    .wbm_ack_i(in_vec[0:0]),
    .ack(out_vec[67:67]),
    .busy(out_vec[66:66]),
    .wbm_dat_o(out_vec[65:34]),
    .wbm_adr_o(out_vec[33:2]),
    .wbm_cyc_o(out_vec[1:1]),
    .wbm_stb_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 110'h2e53a86811948b3035f467f92955;
    stim[1] = 110'h3dfed9ebda942477bafd809c030e;
    stim[2] = 110'h02dfe2f487f0328f51e208d3fa7d;
    stim[3] = 110'h19cbca235b7029ac2055293f0fca;
    stim[4] = 110'h11df9c887db164ad7bfd7f5bd39a;
    stim[5] = 110'h1270601861ec3c76ee5c6cc33a96;
    stim[6] = 110'h137f689570cc93d88d33fa0016c1;
    stim[7] = 110'h14bd40609a66f08ca7312947c410;
    stim[8] = 110'h049860b0e7f37508c534c2451ca8;
    stim[9] = 110'h02eee035a870bbf7d3f1a08090fa;
    stim[10] = 110'h083846d0a10d9fd3bee993d77aec;
    stim[11] = 110'h093903a7f1bcd1e638c33b4a92ef;
    stim[12] = 110'h125f94d8fe9de7f7e895261f5310;
    stim[13] = 110'h1de3fa84358dead282e9d309b59f;
    stim[14] = 110'h1ad6518d96c984d9d2e5a0df09d9;
    stim[15] = 110'h1e71544c8f419218ace69aeb77c6;
    stim[16] = 110'h0b4569a82cddc53483f10c0095bb;
    stim[17] = 110'h1fc8cb8f240306ee22450791f439;
    stim[18] = 110'h0066719b22296840970d201dd892;
    stim[19] = 110'h1e0f01b9a2d7b3e713b34f684d9a;
    stim[20] = 110'h09a917187ee8860ef79e3fd7e176;
    stim[21] = 110'h05c6af02b2874321e18abd5e6e2e;
    stim[22] = 110'h0c7a5df56c08b70d328f10257207;
    stim[23] = 110'h213796851e8118ae152e1dd67f9f;
    stim[24] = 110'h02f1c155603e7daa4fe71ce602b7;
    stim[25] = 110'h0384ebd152d9b817791ad9166f88;
    stim[26] = 110'h1fced4bab5cad5e682261e737dbb;
    stim[27] = 110'h18af7c06092e6c9c186ab2868230;
    stim[28] = 110'h0ed0fc607cc9a0561b9bbf9fe6dc;
    stim[29] = 110'h0ffabaffad93394c7ded10eb6020;
    stim[30] = 110'h03eb420d2f6db5f08c8c78b1dccb;
    stim[31] = 110'h0abf1018a4c27f2584ad60ae2d9e;
    stim[32] = 110'h0914fdd84a087eab4f8342f5f8a8;
    stim[33] = 110'h12b2966dea1731387f65e99d8b16;
    stim[34] = 110'h0828e05b9e552f1a51bbe113d64c;
    stim[35] = 110'h14625bc5a80934260752d2e03bcb;
    stim[36] = 110'h16d3983b78eaa723b03331e0c2d5;
    stim[37] = 110'h03f334ca0742602d17c69302de99;
    stim[38] = 110'h06505d02cbffe73dd3ef5e137cf8;
    stim[39] = 110'h17da0c48e820e755793e32b50dca;
    stim[40] = 110'h071e5eb5c923b2ab4555e198deb6;
    stim[41] = 110'h1f83c7a9d1ef09a56943b1c5d6ae;
    stim[42] = 110'h064c492bcf47725948b9f2bf6fe8;
    stim[43] = 110'h0a06f91ea32fd97caa7b958eb0d1;
    stim[44] = 110'h15871f97f1049c06b90c5e18105e;
    stim[45] = 110'h0263f985d9c54b946d84c490decd;
    stim[46] = 110'h005cc901e5caeb0badefead21eec;
    stim[47] = 110'h1b1d9cdc5fcdc2184fd45e8c4c3e;
    stim[48] = 110'h04730c70ae3c25a2c021163c08e3;
    stim[49] = 110'h1b1e805e18ba2f711d722cbf3d45;
    stim[50] = 110'h128d541bdcd974fb47186d2fd2a0;
    stim[51] = 110'h1aba41e61b6cc35b272a52352eb8;
    stim[52] = 110'h1cabeb38ddb7fc92a7c7381af66c;
    stim[53] = 110'h1686719d630be54ad4c551bb675d;
    stim[54] = 110'h0a28b6520236acace5df0bc53da3;
    stim[55] = 110'h09df7644dec88be22613c1a01e52;
    stim[56] = 110'h110fac8003ba92f27d6531f78f97;
    stim[57] = 110'h1827370adb327a9a522bb06e5f25;
    stim[58] = 110'h05dd07215a63311a15fb2524b270;
    stim[59] = 110'h134088f5cfa9e234bd9f73167299;
    stim[60] = 110'h330e1fae331dd93fa3b2d4ec0475;
    stim[61] = 110'h08cf593db111ab7404cd5a6861b1;
    stim[62] = 110'h030153854076a7158633357b2a4d;
    stim[63] = 110'h096bcce963d80036b4a0e7a98bc9;
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
      expv[0] = 68'hxxxxxxxxxxxxxxxxx;
      expv[1] = 68'hxxxxxxxxx00000000;
      expv[2] = 68'hxxxxxxxxx00000000;
      expv[3] = 68'hxxxxxxxxx00000010;
      expv[4] = 68'h4535840aa72f61423;
      expv[5] = 68'h6c95af7f877ecb1a3;
      expv[6] = 68'h478eddcb89c1f7223;
      expv[7] = 68'h7f4002d80dfe09353;
      expv[8] = 68'h5e1194e612f534b63;
      expv[9] = 68'h5e1194e612f534b63;
      expv[10] = 68'h5e1194e612f534b63;
      expv[11] = 68'h5e1194e612f534b63;
      expv[12] = 68'h6528f88212f534b73;
      expv[13] = 68'h7cfefd12897ea25e3;
      expv[14] = 68'h7a6136b3f790307b3;
      expv[15] = 68'hb09b3a5cab59aa620;
      expv[16] = 68'h7243159cf9c571503;
      expv[17] = 68'h535d6ef8f9c571513;
      expv[18] = 68'ha0ddc448bf232f840;
      expv[19] = 68'ha0ddc448bf232f840;
      expv[20] = 68'h767ce276783c722a3;
      expv[21] = 68'h767ce276783c722a3;
      expv[22] = 68'h767ce276783c722a3;
      expv[23] = 68'h69ed09b3783c722b3;
      expv[24] = 68'hb67ce276400000000;
      expv[25] = 68'ha9ed09b3400000010;
      expv[26] = 68'ha9ed09b3400000010;
      expv[27] = 68'h9abcd044ff3bb8540;
      expv[28] = 68'h4d93830d62be072a3;
      expv[29] = 68'h4d93830d62be072a3;
      expv[30] = 68'h4d93830d62be072a3;
      expv[31] = 68'h5650d04622be072b3;
      expv[32] = 68'h5650d04622be072b3;
      expv[33] = 68'h5650d04622be072b3;
      expv[34] = 68'h66270fec8aca658a3;
      expv[35] = 68'h66270fec8aca658a3;
      expv[36] = 68'h5a5c0779518973673;
      expv[37] = 68'h94e476065b4ed6dc0;
      expv[38] = 68'ha63c185a9b4ed6dd0;
      expv[39] = 68'ha63c185a9b4ed6dd0;
      expv[40] = 68'h5ceaaf27df6841f23;
      expv[41] = 68'h5ceaaf27df6841f23;
      expv[42] = 68'h6134ad287e0f96483;
      expv[43] = 68'h6134ad287e0f96483;
      expv[44] = 68'h7638bad5fe0f96493;
      expv[45] = 68'h5380d721961c81403;
      expv[46] = 68'h4bc3020bd61c81413;
      expv[47] = 68'h4bc3020bd61c81413;
      expv[48] = 68'h784309faac76da2e3;
      expv[49] = 68'h4bd18987ec76da2f3;
      expv[50] = 68'h85ee23ae6c7a5ea80;
      expv[51] = 68'h6e9f68e30a35bd263;
      expv[52] = 68'h586b64e56ae93dce3;
      expv[53] = 68'h7f9254f8f2b0089c3;
      expv[54] = 68'h6a376ceb9a19cc3b3;
      expv[55] = 68'haa376ceb9a19cc3b0;
      expv[56] = 68'haa376ceb9a19cc3b0;
      expv[57] = 68'h925e4fac843f0f060;
      expv[58] = 68'h760dcbe4a09cf5e13;
      expv[59] = 68'h760dcbe4a09cf5e13;
      expv[60] = 68'hbc4697b3cd0278740;
      expv[61] = 68'hbc4697b3c00000000;
      expv[62] = 68'hae62ce53000000010;
      expv[63] = 68'hae62ce53000000010;
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
