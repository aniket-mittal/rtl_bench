// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02012 dut (
    .clk(clk),
    .reset(in_vec[69:69]),
    .enable(in_vec[68:68]),
    .address(in_vec[67:36]),
    .start(in_vec[35:35]),
    .waitrequest(in_vec[34:34]),
    .stall(in_vec[33:33]),
    .fifo_data(in_vec[32:1]),
    .fifo_empty(in_vec[0:0]),
    .write_data(out_vec[32:1]),
    .fifo_readack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h38826f5ac3991428a0;
    stim[1] = 70'h2da53d7638f177723c;
    stim[2] = 70'h04a1100dcd77d1c376;
    stim[3] = 70'h1f8fa19315c9f0b207;
    stim[4] = 70'h02df1b943216fbea2b;
    stim[5] = 70'h0f574c588348ac637b;
    stim[6] = 70'h1d684155dfc508eef9;
    stim[7] = 70'h149951f27ea5e24515;
    stim[8] = 70'h00bf728e8a5acbaae5;
    stim[9] = 70'h14fa6ac8384441f9eb;
    stim[10] = 70'h0f7db41030d24a7bb6;
    stim[11] = 70'h1b00f4863fd4e61e61;
    stim[12] = 70'h1853d0cefeecefc71f;
    stim[13] = 70'h020d07b77be92bc3b4;
    stim[14] = 70'h183c83dcf379724dc8;
    stim[15] = 70'h0d66df7d82decd32e7;
    stim[16] = 70'h04674313bbe9cb969f;
    stim[17] = 70'h0e26a973a26749ebe9;
    stim[18] = 70'h0be681f7b98e9b746d;
    stim[19] = 70'h078cb1492a79e98aaf;
    stim[20] = 70'h1b82afc60676786f42;
    stim[21] = 70'h1eba9e28a3aedc82d0;
    stim[22] = 70'h0dc494a9c773feeaae;
    stim[23] = 70'h0d45426adbfef8fc11;
    stim[24] = 70'h075959f48548129898;
    stim[25] = 70'h0eddefdff84a076766;
    stim[26] = 70'h0f2b844853c621dc44;
    stim[27] = 70'h03e4bdcc03f88790e5;
    stim[28] = 70'h06a28555d12dcf52b1;
    stim[29] = 70'h0c8f93f8c630ed3628;
    stim[30] = 70'h103548cb7ad17ab725;
    stim[31] = 70'h07cacf8d6a9d5dd8fb;
    stim[32] = 70'h0aedd515fb7e78eee8;
    stim[33] = 70'h04cc078322817cd53b;
    stim[34] = 70'h143f9491f7866390f4;
    stim[35] = 70'h08015db0136e09a909;
    stim[36] = 70'h1cfce4efa45c03f3a9;
    stim[37] = 70'h10663f2ca3ae89e979;
    stim[38] = 70'h15c152c2b788177861;
    stim[39] = 70'h02d56461018d134a4f;
    stim[40] = 70'h11cacbcbb8f9643906;
    stim[41] = 70'h00c9044d3f2190e4c0;
    stim[42] = 70'h1d107876b9b3371cdd;
    stim[43] = 70'h0c0e467fe240d7aa1d;
    stim[44] = 70'h0c39097ba3751225b7;
    stim[45] = 70'h0314b4a516f4efa9fb;
    stim[46] = 70'h1dd445883cb51e7a96;
    stim[47] = 70'h017daef1bf85cf6da8;
    stim[48] = 70'h067254c50be12e8dab;
    stim[49] = 70'h108dc12a371eea8bd7;
    stim[50] = 70'h04381b3542cd874e54;
    stim[51] = 70'h247bf6ec9b3ad6a032;
    stim[52] = 70'h07bee519e4a95514db;
    stim[53] = 70'h1ef973a966ed392c04;
    stim[54] = 70'h0ed0728a183c792b94;
    stim[55] = 70'h1d88bd970edb7c03fc;
    stim[56] = 70'h0d2876c1831ce34c54;
    stim[57] = 70'h0912ecc32c5bb2ed7d;
    stim[58] = 70'h2448c7033768a78ed6;
    stim[59] = 70'h1083e9327647344761;
    stim[60] = 70'h346e94d9d86303c1d8;
    stim[61] = 70'h0bd550fce0cb37535d;
    stim[62] = 70'h0084c5bfdaa29dbf17;
    stim[63] = 70'h08be64c93de7d89785;
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
      expv[0] = 33'h1991428a0;
      expv[1] = 33'h0f177723c;
      expv[2] = 33'h177d1c376;
      expv[3] = 33'h1c9f0b206;
      expv[4] = 33'h016fbea2a;
      expv[5] = 33'h148ac637a;
      expv[6] = 33'h1c508eef8;
      expv[7] = 33'h0a5e24514;
      expv[8] = 33'h05acbaae4;
      expv[9] = 33'h04441f9ea;
      expv[10] = 33'h0d24a7bb6;
      expv[11] = 33'h1d4e61e60;
      expv[12] = 33'h0ecefc71e;
      expv[13] = 33'h1e92bc3b4;
      expv[14] = 33'h179724dc8;
      expv[15] = 33'h0decd32e6;
      expv[16] = 33'h1e9cb969e;
      expv[17] = 33'h06749ebe8;
      expv[18] = 33'h18e9b746c;
      expv[19] = 33'h079e98aae;
      expv[20] = 33'h076786f42;
      expv[21] = 33'h1aedc82d0;
      expv[22] = 33'h173feeaae;
      expv[23] = 33'h1fef8fc10;
      expv[24] = 33'h148129898;
      expv[25] = 33'h04a076766;
      expv[26] = 33'h1c621dc44;
      expv[27] = 33'h1f88790e4;
      expv[28] = 33'h12dcf52b0;
      expv[29] = 33'h030ed3628;
      expv[30] = 33'h0d17ab724;
      expv[31] = 33'h09d5dd8fa;
      expv[32] = 33'h17e78eee8;
      expv[33] = 33'h0817cd53a;
      expv[34] = 33'h1866390f4;
      expv[35] = 33'h16e09a908;
      expv[36] = 33'h05c03f3a8;
      expv[37] = 33'h1ae89e978;
      expv[38] = 33'h188177860;
      expv[39] = 33'h18d134a4e;
      expv[40] = 33'h0f9643907;
      expv[41] = 33'h12190e4c0;
      expv[42] = 33'h1b3371cdc;
      expv[43] = 33'h040d7aa1c;
      expv[44] = 33'h1751225b6;
      expv[45] = 33'h0f4efa9fa;
      expv[46] = 33'h0b51e7a96;
      expv[47] = 33'h185cf6da8;
      expv[48] = 33'h1e12e8daa;
      expv[49] = 33'h11eea8bd6;
      expv[50] = 33'h0cd874e54;
      expv[51] = 33'h13ad6a032;
      expv[52] = 33'h0a95514da;
      expv[53] = 33'h0ed392c04;
      expv[54] = 33'h03c792b94;
      expv[55] = 33'h0db7c03fc;
      expv[56] = 33'h11ce34c54;
      expv[57] = 33'h05bb2ed7c;
      expv[58] = 33'h168a78ed6;
      expv[59] = 33'h047344760;
      expv[60] = 33'h06303c1d9;
      expv[61] = 33'h0cb37535c;
      expv[62] = 33'h0a29dbf16;
      expv[63] = 33'h1e7d89784;
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
