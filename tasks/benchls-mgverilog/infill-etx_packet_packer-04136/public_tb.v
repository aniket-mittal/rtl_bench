// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 107;
  localparam OW = 77;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04136 dut (
    .tx_lclk_par(clk),
    .reset(in_vec[106:106]),
    .etx_access(in_vec[105:105]),
    .etx_write(in_vec[104:104]),
    .etx_datamode(in_vec[103:102]),
    .etx_ctrlmode(in_vec[101:98]),
    .etx_dstaddr(in_vec[97:66]),
    .etx_srcaddr(in_vec[65:34]),
    .etx_data(in_vec[33:2]),
    .tx_rd_wait(in_vec[1:1]),
    .tx_wr_wait(in_vec[0:0]),
    .etx_rd_wait(out_vec[76:76]),
    .etx_wr_wait(out_vec[75:75]),
    .etx_ack(out_vec[74:74]),
    .tx_frame_par(out_vec[73:66]),
    .tx_data_par(out_vec[65:2]),
    .ecfg_tx_datain(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 107'h761c09bc59a0c857e84856fccbd;
    stim[1] = 107'h6f47bf2ef2e8512fc857b8e885d;
    stim[2] = 107'h1404a03fd7a9ea6f435311f1b53;
    stim[3] = 107'h3d2cc2974f62575c0574a4b81ff;
    stim[4] = 107'h231d793fde9c1f6bef9518905b0;
    stim[5] = 107'h048a1ed3859a7a9fac2234aaa18;
    stim[6] = 107'h20278df3417dcda7cbd72eb0f67;
    stim[7] = 107'h2be57665c97ad3175cfa408d4c5;
    stim[8] = 107'h1258e9c9f3c16751a552b745d05;
    stim[9] = 107'h311eac17fe7c50b28bd9037dfc0;
    stim[10] = 107'h32b3a6016a27177c453a7194ed9;
    stim[11] = 107'h0125e06fdb535e3f83b752e2ed2;
    stim[12] = 107'h25d63ac9adb5654a90e888b703b;
    stim[13] = 107'h0d08d563b61d1fe67deaf56d41f;
    stim[14] = 107'h0f33379bb3641961af2122177ac;
    stim[15] = 107'h24d32fdc666f5e4bc9378cd2565;
    stim[16] = 107'h3153b9b7fd6db2e03ba06ac366d;
    stim[17] = 107'h0fd5f8b697a9c37d85f0caf10c6;
    stim[18] = 107'h0d8f6a6931bb40edf83c816fe4a;
    stim[19] = 107'h3f1cb355488dd610d22fe99c3ff;
    stim[20] = 107'h251fbf59b4dad0c7f683cbbfda4;
    stim[21] = 107'h0eb5555b305f45fe95babaab5ba;
    stim[22] = 107'h27c0a77040966dec7fb5cf97e8a;
    stim[23] = 107'h18092e48099e134774b8a618b6a;
    stim[24] = 107'h3bc9666f651bd8d9c38a2bc38ad;
    stim[25] = 107'h3dc1d999484d937ae52f8bb66bc;
    stim[26] = 107'h3a7fe172678498a1f7726b84b05;
    stim[27] = 107'h1dfe7214f83937deefe80c16496;
    stim[28] = 107'h3193aefd04c0ca0b08bce71ca97;
    stim[29] = 107'h3ccff42274174f37b87afd47341;
    stim[30] = 107'h2d9b52112d004d0fcff4c0d8f5e;
    stim[31] = 107'h0f685352c30683d999285ec5b8f;
    stim[32] = 107'h3140ef06f8b7eeb04a214152d9d;
    stim[33] = 107'h19706ffe451522eeeba612c02d0;
    stim[34] = 107'h07c0d07b064c327878cc12f2507;
    stim[35] = 107'h26120cebca41c6569d5909ca0b2;
    stim[36] = 107'h0127a3a71d0b0bcc486f8cf3a25;
    stim[37] = 107'h3464acc475bf9171984b50a1c09;
    stim[38] = 107'h25622c0c00e784f21b595a4fc21;
    stim[39] = 107'h1fae37ff1a1c59e6d99653f387e;
    stim[40] = 107'h12b304f19f66c81b285960361d3;
    stim[41] = 107'h1ee85a684f7f1093eb63036462f;
    stim[42] = 107'h112ce78387bfe4e7d691d303faf;
    stim[43] = 107'h125a8f2adf83cc51e05fdaf48d4;
    stim[44] = 107'h18dcde07e6044d6f242a9da06b3;
    stim[45] = 107'h1f5e3b12fa631e9693f34b44cc3;
    stim[46] = 107'h1f1fcc8ac02f098c0ab9fff6179;
    stim[47] = 107'h3b6f9f0ce84ad7b1629bfcf623e;
    stim[48] = 107'h026f3b69abeed3809fff450cb09;
    stim[49] = 107'h1bf4391b90387d86aa000c93432;
    stim[50] = 107'h38d2e3210cf3207b3d1729a4d48;
    stim[51] = 107'h0b45c476077c4b436f94d0c2650;
    stim[52] = 107'h059156446f3a8dad92cdcbb5055;
    stim[53] = 107'h157bcea589794cab94422c5a9be;
    stim[54] = 107'h17d307a251baf25feed195729c3;
    stim[55] = 107'h3533b4ab1cbc53ad03a932b8312;
    stim[56] = 107'h1b76e17eb4b7fa6ae23c0cb3f32;
    stim[57] = 107'h05ac46046dbf64586c7dd63b94d;
    stim[58] = 107'h1eb4e10bbc2627a5bd8009b70a4;
    stim[59] = 107'h26bd2d970b551c710447308d853;
    stim[60] = 107'h1f5f5e99301d3fa718daba85677;
    stim[61] = 107'h2108ddc29067f16c5ba7f6cd343;
    stim[62] = 107'h1de59745f39422d8b02eb941666;
    stim[63] = 107'h2ef95e5a93b4a8e4ef9ccce1412;
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
      expv[0] = 77'hxx00000000000000000x;
      expv[1] = 77'hxx00000000000000000x;
      expv[2] = 77'h08000000000000000002;
      expv[3] = 77'h08000000000000000002;
      expv[4] = 77'h1cfc0000012cc2974f7f;
      expv[5] = 77'h1bfd518905b1c1f6befb;
      expv[6] = 77'h00000000000000000000;
      expv[7] = 77'h04fc000200278df34144;
      expv[8] = 77'h1bffa408d4c7ad3175cf;
      expv[9] = 77'h08000000000000000002;
      expv[10] = 77'h0cfc0000011eac17fe4e;
      expv[11] = 77'h03ffa7194eda7177c450;
      expv[12] = 77'h08000000000000000002;
      expv[13] = 77'h14fc000201d63ac9ad95;
      expv[14] = 77'h1bfeaf56d41dd1fe67df;
      expv[15] = 77'h18000000000000000003;
      expv[16] = 77'h04fc000200d32fdc6654;
      expv[17] = 77'h0bfe06ac366edb2e03ba;
      expv[18] = 77'h08000000000000000002;
      expv[19] = 77'h10000000000000000001;
      expv[20] = 77'h14fc0000031cb35548bd;
      expv[21] = 77'h1bfc3cbbfda5ad0c7f6b;
      expv[22] = 77'h00000000000000000000;
      expv[23] = 77'h14fc000203c0a7704095;
      expv[24] = 77'h13ff8a618b69e1347749;
      expv[25] = 77'h14fc000003c9666f652d;
      expv[26] = 77'h0bfef8bb66bcd937ae52;
      expv[27] = 77'h04fc0000027fe17267ac;
      expv[28] = 77'h0bfe80c16497937deefe;
      expv[29] = 77'h14fc00000193aefd04cd;
      expv[30] = 77'h1bffafd4734174f37b87;
      expv[31] = 77'h0cfc0002019b52112d36;
      expv[32] = 77'h13fe85ec5b8c683d9991;
      expv[33] = 77'h1cfc00000140ef06f88f;
      expv[34] = 77'h0bfe612c02d1522eeeba;
      expv[35] = 77'h00000000000000000000;
      expv[36] = 77'h1cfc000202120cebca57;
      expv[37] = 77'h13fef8cf3a24b0bcc485;
      expv[38] = 77'h0cfc00000064acc4759e;
      expv[39] = 77'h0bfd95a4fc22784f21b6;
      expv[40] = 77'h08000000000000000002;
      expv[41] = 77'h10000000000000000001;
      expv[42] = 77'h18000000000000000003;
      expv[43] = 77'h18000000000000000003;
      expv[44] = 77'h18000000000000000003;
      expv[45] = 77'h00000000000000000000;
      expv[46] = 77'h18000000000000000003;
      expv[47] = 77'h18000000000000000003;
      expv[48] = 77'h0cfc0000036f9f0ce86e;
      expv[49] = 77'h13fff450cb0aed3809fd;
      expv[50] = 77'h08000000000000000002;
      expv[51] = 77'h14fc000000d2e3210ced;
      expv[52] = 77'h03fd4d0c2653c4b436f8;
      expv[53] = 77'h00000000000000000000;
      expv[54] = 77'h08000000000000000002;
      expv[55] = 77'h10000000000000000001;
      expv[56] = 77'h1cfc00000133b4ab1c9f;
      expv[57] = 77'h13ffc0cb3f337fa6ae21;
      expv[58] = 77'h10000000000000000001;
      expv[59] = 77'h08000000000000000002;
      expv[60] = 77'h04fc000202bd2d970b54;
      expv[61] = 77'h1bfdaba85675d3fa718f;
      expv[62] = 77'h1cfc00020108ddc29047;
      expv[63] = 77'h1bfeeb941665422d8b03;
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
