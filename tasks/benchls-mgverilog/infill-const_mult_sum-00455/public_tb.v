// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 56;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00455 dut (
    .clk(clk),
    .din(in_vec[55:0]),
    .dout(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 56'hac907ef1f6fa58;
    stim[1] = 56'h1c341152fb6efd;
    stim[2] = 56'h742b47e9136aa2;
    stim[3] = 56'h9186868e85ea8e;
    stim[4] = 56'h3b2877348fcd86;
    stim[5] = 56'h20847ba55679d3;
    stim[6] = 56'h51223cd54b40e2;
    stim[7] = 56'h603b2369544817;
    stim[8] = 56'h34eb3d9cadc70a;
    stim[9] = 56'h0640a0ca4691d9;
    stim[10] = 56'hee1401bca26c7a;
    stim[11] = 56'hafa661f8ad5128;
    stim[12] = 56'h8cb5bf24235c81;
    stim[13] = 56'h866337e7f6e1ef;
    stim[14] = 56'h8793bd1724ad68;
    stim[15] = 56'h775e23362d99cd;
    stim[16] = 56'h63a7cecb5de4b4;
    stim[17] = 56'h2b4304036b1b4b;
    stim[18] = 56'hb6101fbd051f43;
    stim[19] = 56'h97979c0bbece86;
    stim[20] = 56'h6f4e17d09fc7ab;
    stim[21] = 56'h7e70693edf4511;
    stim[22] = 56'he39c99da04b94a;
    stim[23] = 56'h583b6a4f0f25c8;
    stim[24] = 56'h4a872dccde49fd;
    stim[25] = 56'h4cdf99b2f1c0a5;
    stim[26] = 56'h56358935944e31;
    stim[27] = 56'hb8c0518f95f5de;
    stim[28] = 56'hd0be6b11533375;
    stim[29] = 56'ha31fe07d7a8e0b;
    stim[30] = 56'hbd3e2e288ab246;
    stim[31] = 56'ha4a11efc5bc11d;
    stim[32] = 56'hf8759cc4187bc5;
    stim[33] = 56'h43a05b13117a73;
    stim[34] = 56'he407328842020a;
    stim[35] = 56'he80f288038e5d0;
    stim[36] = 56'hec6dacfa883611;
    stim[37] = 56'hc7bcf96460cf31;
    stim[38] = 56'h10215a59390cea;
    stim[39] = 56'h83890150cd4c5f;
    stim[40] = 56'h5e3142a7dc0b82;
    stim[41] = 56'h5c8f906c6afebe;
    stim[42] = 56'h034c3a51d4ec49;
    stim[43] = 56'h0353515c5a8fef;
    stim[44] = 56'hc2e70a0f64df77;
    stim[45] = 56'hc4eb0b446f9dd0;
    stim[46] = 56'he694e50a3eefa5;
    stim[47] = 56'h59449dc0f6ae3f;
    stim[48] = 56'h4a8a6c8e881f0e;
    stim[49] = 56'ha093e6c0ede509;
    stim[50] = 56'hf0c2537751b74e;
    stim[51] = 56'haebcf8af4cf988;
    stim[52] = 56'he276c2ed27a697;
    stim[53] = 56'h15044919d8b41e;
    stim[54] = 56'h29401ca8e722c2;
    stim[55] = 56'hd8edcfc1c89fcc;
    stim[56] = 56'h854539e04197ca;
    stim[57] = 56'h0a674aa3978e29;
    stim[58] = 56'h2aaba820aec4ee;
    stim[59] = 56'h087ee45ca4d1cf;
    stim[60] = 56'hb3652ecf2a67a9;
    stim[61] = 56'hed243e67641830;
    stim[62] = 56'h70b3e115c53463;
    stim[63] = 56'hf5f271fe2f0cbf;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxxx;
      expv[3] = 16'h4433;
      expv[4] = 16'h2369;
      expv[5] = 16'h27c5;
      expv[6] = 16'h2f09;
      expv[7] = 16'h20ba;
      expv[8] = 16'h2ad7;
      expv[9] = 16'h27e0;
      expv[10] = 16'h1976;
      expv[11] = 16'h2f11;
      expv[12] = 16'h302d;
      expv[13] = 16'h27b5;
      expv[14] = 16'h39da;
      expv[15] = 16'h1c98;
      expv[16] = 16'h3c17;
      expv[17] = 16'h1bcd;
      expv[18] = 16'h12ca;
      expv[19] = 16'h39b8;
      expv[20] = 16'h0b5d;
      expv[21] = 16'h1bd9;
      expv[22] = 16'h24c9;
      expv[23] = 16'h2e9d;
      expv[24] = 16'h25d1;
      expv[25] = 16'h2f38;
      expv[26] = 16'h15ff;
      expv[27] = 16'h338e;
      expv[28] = 16'h3e80;
      expv[29] = 16'h203b;
      expv[30] = 16'h2ddd;
      expv[31] = 16'h16d0;
      expv[32] = 16'h2efd;
      expv[33] = 16'h190d;
      expv[34] = 16'h30a4;
      expv[35] = 16'h2c85;
      expv[36] = 16'h1119;
      expv[37] = 16'h1ad0;
      expv[38] = 16'h1d71;
      expv[39] = 16'h3b7a;
      expv[40] = 16'h307e;
      expv[41] = 16'h1831;
      expv[42] = 16'h1f2a;
      expv[43] = 16'h2d39;
      expv[44] = 16'h2a09;
      expv[45] = 16'h261f;
      expv[46] = 16'h1e2c;
      expv[47] = 16'h148b;
      expv[48] = 16'h1b01;
      expv[49] = 16'h211d;
      expv[50] = 16'h3d3d;
      expv[51] = 16'h28bd;
      expv[52] = 16'h451d;
      expv[53] = 16'h2438;
      expv[54] = 16'h3924;
      expv[55] = 16'h369d;
      expv[56] = 16'h1dfc;
      expv[57] = 16'h2c00;
      expv[58] = 16'h415d;
      expv[59] = 16'h2ac4;
      expv[60] = 16'h2b53;
      expv[61] = 16'h2747;
      expv[62] = 16'h31f1;
      expv[63] = 16'h25a4;
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
