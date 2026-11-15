// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 55;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_185699 dut (
    .en(clk),
    .addr(in_vec[54:49]),
    .s(in_vec[48:41]),
    .m(in_vec[40:33]),
    .h(in_vec[32:25]),
    .d(in_vec[24:17]),
    .me(in_vec[16:9]),
    .a(in_vec[8:1]),
    .rst(in_vec[0:0]),
    .AD(out_vec[12:12]),
    .CS(out_vec[11:11]),
    .RD(out_vec[10:10]),
    .WR(out_vec[9:9]),
    .Listo_inicio(out_vec[8:8]),
    .Dato(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 55'h353499f3649cb5;
    stim[1] = 55'h686b6135f5ef39;
    stim[2] = 55'h4a6985bb8aabf6;
    stim[3] = 55'h59c0f1aa225520;
    stim[4] = 55'h3f2d5a747db09a;
    stim[5] = 55'h24128813a6ae8c;
    stim[6] = 55'h4ea1df2b511f2c;
    stim[7] = 55'h032080c984c9ac;
    stim[8] = 55'h6745268f7d5562;
    stim[9] = 55'h4404453c038de6;
    stim[10] = 55'h55accaae2a0018;
    stim[11] = 55'h6452a8790cc2ec;
    stim[12] = 55'h2328a23589c0b4;
    stim[13] = 55'h1dfc15cebf03ec;
    stim[14] = 55'h6c828734628766;
    stim[15] = 55'h56df6d6546463e;
    stim[16] = 55'h64951e2625c1c8;
    stim[17] = 55'h1a757e7ddc07b6;
    stim[18] = 55'h606bfaaf93f3dc;
    stim[19] = 55'h40f5d67a093ef2;
    stim[20] = 55'h681a0db1621698;
    stim[21] = 55'h6d90778501f73e;
    stim[22] = 55'h2fb7b0c3e38942;
    stim[23] = 55'h2856e60df847ac;
    stim[24] = 55'h3611dd19b97e50;
    stim[25] = 55'h3e6b05972d1594;
    stim[26] = 55'h3aeeff406fc252;
    stim[27] = 55'h27afaa12815e26;
    stim[28] = 55'h0f44bfaba16cfe;
    stim[29] = 55'h63ee7596de6976;
    stim[30] = 55'h0155f4787d6924;
    stim[31] = 55'h6552a5119f33d4;
    stim[32] = 55'h0549b8430b516e;
    stim[33] = 55'h34ba7d01811a94;
    stim[34] = 55'h782c462080ccb4;
    stim[35] = 55'h4ebd6c4f82f840;
    stim[36] = 55'h5760a8d3694d9e;
    stim[37] = 55'h7c8034592d7a2e;
    stim[38] = 55'h4a5d0af40c9b58;
    stim[39] = 55'h5b04b0e52b5272;
    stim[40] = 55'h0c000a5e8daa9e;
    stim[41] = 55'h2218071f9ebb72;
    stim[42] = 55'h1459e916d16ee8;
    stim[43] = 55'h4d7553bc663494;
    stim[44] = 55'h027fe18a40b632;
    stim[45] = 55'h05fa7f0cdf81b2;
    stim[46] = 55'h1dc6fb572594e0;
    stim[47] = 55'h6355a9e8520514;
    stim[48] = 55'h4b33aea973e190;
    stim[49] = 55'h6d680fd6125306;
    stim[50] = 55'h6f919d78a9840c;
    stim[51] = 55'h4a7045e0b63832;
    stim[52] = 55'h198124569795ea;
    stim[53] = 55'h11748015a6b666;
    stim[54] = 55'h0a79a2848501e4;
    stim[55] = 55'h4080038f6cf690;
    stim[56] = 55'h611bcccf00b5c8;
    stim[57] = 55'h52f4b37f18e604;
    stim[58] = 55'h641e48ee7c83b5;
    stim[59] = 55'h1ae591abc6fd80;
    stim[60] = 55'h2715c43e3ea544;
    stim[61] = 55'h1904426b35b4ac;
    stim[62] = 55'h47204d1366041c;
    stim[63] = 55'h041398dcf664a4;
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
      expv[0] = 13'h1e00;
      expv[1] = 13'h1e00;
      expv[2] = 13'h1e00;
      expv[3] = 13'h1e00;
      expv[4] = 13'h1e00;
      expv[5] = 13'h1e00;
      expv[6] = 13'h1e00;
      expv[7] = 13'h1e00;
      expv[8] = 13'h0e00;
      expv[9] = 13'h1e00;
      expv[10] = 13'h1e00;
      expv[11] = 13'h1e00;
      expv[12] = 13'h1e00;
      expv[13] = 13'h1e00;
      expv[14] = 13'h1e00;
      expv[15] = 13'h1e00;
      expv[16] = 13'h1e00;
      expv[17] = 13'h1e00;
      expv[18] = 13'h1e00;
      expv[19] = 13'h1e00;
      expv[20] = 13'h1e00;
      expv[21] = 13'h1e00;
      expv[22] = 13'h1e00;
      expv[23] = 13'h1e00;
      expv[24] = 13'h1e00;
      expv[25] = 13'h1e00;
      expv[26] = 13'h1e00;
      expv[27] = 13'h1e00;
      expv[28] = 13'h1e00;
      expv[29] = 13'h1e00;
      expv[30] = 13'h1e00;
      expv[31] = 13'h1e00;
      expv[32] = 13'h1e00;
      expv[33] = 13'h0402;
      expv[34] = 13'h1e00;
      expv[35] = 13'h1e00;
      expv[36] = 13'h1e00;
      expv[37] = 13'h1e00;
      expv[38] = 13'h1e00;
      expv[39] = 13'h1e00;
      expv[40] = 13'h1e00;
      expv[41] = 13'h1400;
      expv[42] = 13'h1e00;
      expv[43] = 13'h1e10;
      expv[44] = 13'h1e00;
      expv[45] = 13'h0e00;
      expv[46] = 13'h0402;
      expv[47] = 13'h1e00;
      expv[48] = 13'h1e00;
      expv[49] = 13'h1e00;
      expv[50] = 13'h1e00;
      expv[51] = 13'h1e00;
      expv[52] = 13'h1e00;
      expv[53] = 13'h1fd2;
      expv[54] = 13'h0f00;
      expv[55] = 13'h0f10;
      expv[56] = 13'h1f00;
      expv[57] = 13'h1f00;
      expv[58] = 13'h1e00;
      expv[59] = 13'h1e00;
      expv[60] = 13'h1e00;
      expv[61] = 13'h1e00;
      expv[62] = 13'h1fd2;
      expv[63] = 13'h1f00;
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
