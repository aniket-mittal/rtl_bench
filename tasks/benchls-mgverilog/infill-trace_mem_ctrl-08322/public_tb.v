// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 53;
  localparam OW = 47;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08322 dut (
    .clk(clk),
    .jrst_n(in_vec[52:52]),
    .trc_ctrl(in_vec[51:36]),
    .tw(in_vec[35:0]),
    .tracemem_on(out_vec[46:46]),
    .tracemem_trcdata(out_vec[45:10]),
    .tracemem_tw(out_vec[9:9]),
    .trc_im_addr(out_vec[8:2]),
    .trc_wrap(out_vec[1:1]),
    .xbrk_wrap_traceoff(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 53'h0f36f82d8230f6;
    stim[1] = 53'h06e3adecfd34dc;
    stim[2] = 53'h1d5a898dad3a75;
    stim[3] = 53'h1a8abf0fc88691;
    stim[4] = 53'h17cd4610139fd2;
    stim[5] = 53'h1a10c42483e020;
    stim[6] = 53'h15578269e672f3;
    stim[7] = 53'h1f6be23c29338d;
    stim[8] = 53'h1c7241493e7788;
    stim[9] = 53'h15fa88d6d4f480;
    stim[10] = 53'h10bc7d2e96a11f;
    stim[11] = 53'h1c044baf0b5c67;
    stim[12] = 53'h135d0ab02b1d5f;
    stim[13] = 53'h1be11fb0021419;
    stim[14] = 53'h181f3f0a2b76ed;
    stim[15] = 53'h15d96b887a4abf;
    stim[16] = 53'h1a022053a38acf;
    stim[17] = 53'h12685824d3f1e5;
    stim[18] = 53'h178c57d1d0cf03;
    stim[19] = 53'h1eae56dd0baae0;
    stim[20] = 53'h135d9aa872b3d0;
    stim[21] = 53'h16c4d15cc7283b;
    stim[22] = 53'h1714f85e67415a;
    stim[23] = 53'h197260f4c094e0;
    stim[24] = 53'h12e50e4c534759;
    stim[25] = 53'h1d6b276caea61a;
    stim[26] = 53'h10f104294e4c54;
    stim[27] = 53'h1998fb4a87e62c;
    stim[28] = 53'h16ac4d0728bef7;
    stim[29] = 53'h1d44b9e0d189f7;
    stim[30] = 53'h13e65a2beb5ff8;
    stim[31] = 53'h19674a034fac3d;
    stim[32] = 53'h178a0b1e688a68;
    stim[33] = 53'h1157c1c9bcd65b;
    stim[34] = 53'h1dc09e6a8735e7;
    stim[35] = 53'h13574d5c8d239d;
    stim[36] = 53'h13ca2112f5b67d;
    stim[37] = 53'h1dbb9278517bdf;
    stim[38] = 53'h12a399274a51d4;
    stim[39] = 53'h14450f944a408f;
    stim[40] = 53'h1a44b9dc076299;
    stim[41] = 53'h1f2cf2a8b8f178;
    stim[42] = 53'h1bb1f08840e7d7;
    stim[43] = 53'h186a5191aab688;
    stim[44] = 53'h172fb9a43a9ab4;
    stim[45] = 53'h130b317caa14ae;
    stim[46] = 53'h17443fbe848071;
    stim[47] = 53'h1ac73d87df2d99;
    stim[48] = 53'h1ef3cff6f6a22e;
    stim[49] = 53'h1a0bd8c94eafe3;
    stim[50] = 53'h1bedabd2005120;
    stim[51] = 53'h125e82e9760437;
    stim[52] = 53'h19903c98fe69a4;
    stim[53] = 53'h1d0796b2235582;
    stim[54] = 53'h10090200c31bdf;
    stim[55] = 53'h1ca2cfa82600b6;
    stim[56] = 53'h1aaec1426aba43;
    stim[57] = 53'h1ff296460ff11c;
    stim[58] = 53'h105ad6479ce19f;
    stim[59] = 53'h15d08a19d3ef32;
    stim[60] = 53'h195dd994dc586a;
    stim[61] = 53'h1070c9cd15fb4c;
    stim[62] = 53'h14a75540e99332;
    stim[63] = 53'h12baf2c04d17be;
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
      expv[0] = 47'hx00000000x00;
      expv[1] = 47'hx00000000x00;
      expv[2] = 47'hx00000000x00;
      expv[3] = 47'hx00000000x00;
      expv[4] = 47'hx00000000x00;
      expv[5] = 47'hx00000000x00;
      expv[6] = 47'hx00000000x00;
      expv[7] = 47'hx00000000x00;
      expv[8] = 47'hx00000000x00;
      expv[9] = 47'hx00000000x00;
      expv[10] = 47'hx00000000x00;
      expv[11] = 47'hx00000000x00;
      expv[12] = 47'hx00000000x00;
      expv[13] = 47'hx00000000x00;
      expv[14] = 47'hx00000000x00;
      expv[15] = 47'hx00000000x00;
      expv[16] = 47'hx00000000x00;
      expv[17] = 47'hx00000000x00;
      expv[18] = 47'hx00000000x00;
      expv[19] = 47'hx00000000x00;
      expv[20] = 47'hx00000000x00;
      expv[21] = 47'hx00000000x00;
      expv[22] = 47'hx00000000x00;
      expv[23] = 47'hx00000000x00;
      expv[24] = 47'hx00000000x00;
      expv[25] = 47'hx00000000x00;
      expv[26] = 47'hx00000000x00;
      expv[27] = 47'hx00000000x00;
      expv[28] = 47'hx00000000x00;
      expv[29] = 47'hx00000000x00;
      expv[30] = 47'hx00000000x00;
      expv[31] = 47'hx00000000x00;
      expv[32] = 47'hx00000000x00;
      expv[33] = 47'hx00000000x00;
      expv[34] = 47'hx00000000x00;
      expv[35] = 47'hx00000000x00;
      expv[36] = 47'hx00000000x00;
      expv[37] = 47'hx00000000x00;
      expv[38] = 47'hx00000000x00;
      expv[39] = 47'hx00000000x00;
      expv[40] = 47'hx00000000x00;
      expv[41] = 47'hx00000000x00;
      expv[42] = 47'hx00000000x00;
      expv[43] = 47'hx00000000x00;
      expv[44] = 47'hx00000000x00;
      expv[45] = 47'hx00000000x00;
      expv[46] = 47'hx00000000x00;
      expv[47] = 47'hx00000000x00;
      expv[48] = 47'hx00000000x00;
      expv[49] = 47'hx00000000x00;
      expv[50] = 47'hx00000000x00;
      expv[51] = 47'hx00000000x00;
      expv[52] = 47'hx00000000x00;
      expv[53] = 47'hx00000000x00;
      expv[54] = 47'hx00000000x00;
      expv[55] = 47'hx00000000x00;
      expv[56] = 47'hx00000000x00;
      expv[57] = 47'hx00000000x00;
      expv[58] = 47'hx00000000x00;
      expv[59] = 47'hx00000000x00;
      expv[60] = 47'hx00000000x00;
      expv[61] = 47'hx00000000x00;
      expv[62] = 47'hx00000000x00;
      expv[63] = 47'hx00000000x00;
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
