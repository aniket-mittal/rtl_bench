// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 30;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  jesd204_lmfc dut (
    .clk(clk),
    .reset(in_vec[29:29]),
    .sysref(in_vec[28:28]),
    .cfg_octets_per_multiframe(in_vec[27:18]),
    .cfg_beats_per_multiframe(in_vec[17:10]),
    .cfg_lmfc_offset(in_vec[9:2]),
    .cfg_sysref_oneshot(in_vec[1:1]),
    .cfg_sysref_disable(in_vec[0:0]),
    .lmfc_edge(out_vec[14:14]),
    .lmfc_clk(out_vec[13:13]),
    .lmfc_counter(out_vec[12:5]),
    .lmc_edge(out_vec[4:4]),
    .lmc_quarter_edge(out_vec[3:3]),
    .eoemb(out_vec[2:2]),
    .sysref_edge(out_vec[1:1]),
    .sysref_alignment_error(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 30'h3fbb0387;
    stim[1] = 30'h3932c80a;
    stim[2] = 30'h1d2fc7b8;
    stim[3] = 30'h094de18b;
    stim[4] = 30'h177932ec;
    stim[5] = 30'h10ba9acb;
    stim[6] = 30'h0bb8a38e;
    stim[7] = 30'h0289bd48;
    stim[8] = 30'h038aebc9;
    stim[9] = 30'h1b0ac7b8;
    stim[10] = 30'h0dfd654e;
    stim[11] = 30'h0e5aafc7;
    stim[12] = 30'h1a899407;
    stim[13] = 30'h03e84952;
    stim[14] = 30'h1ee8c3b0;
    stim[15] = 30'h0949595e;
    stim[16] = 30'h00a1699b;
    stim[17] = 30'h1ef0c954;
    stim[18] = 30'h12569ed0;
    stim[19] = 30'h11ecb812;
    stim[20] = 30'h021cbd78;
    stim[21] = 30'h1298415f;
    stim[22] = 30'h0ba5842d;
    stim[23] = 30'h158ffad5;
    stim[24] = 30'h04e6e45d;
    stim[25] = 30'h063fe684;
    stim[26] = 30'h1cc12b28;
    stim[27] = 30'h133e7f9b;
    stim[28] = 30'h15b30385;
    stim[29] = 30'h0d57b3b7;
    stim[30] = 30'h0ed8518d;
    stim[31] = 30'h1d4ed257;
    stim[32] = 30'h02694f95;
    stim[33] = 30'h1d7f5888;
    stim[34] = 30'h05bf7cf7;
    stim[35] = 30'h05df66b1;
    stim[36] = 30'h10f0f12a;
    stim[37] = 30'h17581b57;
    stim[38] = 30'h1f5a1855;
    stim[39] = 30'h05172b9d;
    stim[40] = 30'h2f4bd462;
    stim[41] = 30'h0dd550f7;
    stim[42] = 30'h0a03bf5a;
    stim[43] = 30'h1d2ef7dc;
    stim[44] = 30'h04517590;
    stim[45] = 30'h14358c17;
    stim[46] = 30'h0c5ef86e;
    stim[47] = 30'h086dd930;
    stim[48] = 30'h0359fc07;
    stim[49] = 30'h120030d6;
    stim[50] = 30'h1016aca5;
    stim[51] = 30'h086c1dd3;
    stim[52] = 30'h1cc434c4;
    stim[53] = 30'h150b1bbc;
    stim[54] = 30'h154485e3;
    stim[55] = 30'h1a36b68b;
    stim[56] = 30'h11431cb3;
    stim[57] = 30'h1a869551;
    stim[58] = 30'h0cce51e0;
    stim[59] = 30'h0cdef1bf;
    stim[60] = 30'h16853b9f;
    stim[61] = 30'h14ef85e3;
    stim[62] = 30'h06985228;
    stim[63] = 30'h00b4c96c;
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
      expv[0] = 15'hxxxx;
      expv[1] = 15'h2020;
      expv[2] = 15'h0020;
      expv[3] = 15'h0040;
      expv[4] = 15'h0060;
      expv[5] = 15'h0080;
      expv[6] = 15'h00a0;
      expv[7] = 15'h00c0;
      expv[8] = 15'h00e2;
      expv[9] = 15'h1e40;
      expv[10] = 15'h1e60;
      expv[11] = 15'h1e80;
      expv[12] = 15'h1ea0;
      expv[13] = 15'h1ec0;
      expv[14] = 15'h1ee0;
      expv[15] = 15'h1f00;
      expv[16] = 15'h1f2a;
      expv[17] = 15'h1f41;
      expv[18] = 15'h1f62;
      expv[19] = 15'h1681;
      expv[20] = 15'h16a0;
      expv[21] = 15'h16c2;
      expv[22] = 15'h16e1;
      expv[23] = 15'h1700;
      expv[24] = 15'h1728;
      expv[25] = 15'h0004;
      expv[26] = 15'h6038;
      expv[27] = 15'h2042;
      expv[28] = 15'h2061;
      expv[29] = 15'h2080;
      expv[30] = 15'h20a0;
      expv[31] = 15'h20c4;
      expv[32] = 15'h20e0;
      expv[33] = 15'h2100;
      expv[34] = 15'h2128;
      expv[35] = 15'h2140;
      expv[36] = 15'h2160;
      expv[37] = 15'h2182;
      expv[38] = 15'h21a5;
      expv[39] = 15'h21c0;
      expv[40] = 15'h21e0;
      expv[41] = 15'h2020;
      expv[42] = 15'h0040;
      expv[43] = 15'h0060;
      expv[44] = 15'h0080;
      expv[45] = 15'h00a0;
      expv[46] = 15'h00c0;
      expv[47] = 15'h00e2;
      expv[48] = 15'h0980;
      expv[49] = 15'h09a0;
      expv[50] = 15'h09c0;
      expv[51] = 15'h09e0;
      expv[52] = 15'h0a00;
      expv[53] = 15'h0a2a;
      expv[54] = 15'h1de1;
      expv[55] = 15'h1e00;
      expv[56] = 15'h1e28;
      expv[57] = 15'h1e40;
      expv[58] = 15'h1e60;
      expv[59] = 15'h1e80;
      expv[60] = 15'h1ea0;
      expv[61] = 15'h1ec0;
      expv[62] = 15'h1ee4;
      expv[63] = 15'h1f00;
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
