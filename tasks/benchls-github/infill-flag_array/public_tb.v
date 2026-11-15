// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  flag_array dut (
    .clk(clk),
    .waddr_a(in_vec[17:14]),
    .waddr_b(in_vec[13:10]),
    .we_a(in_vec[9:9]),
    .we_b(in_vec[8:8]),
    .raddr_a(in_vec[7:4]),
    .raddr_b(in_vec[3:0]),
    .sel_a(out_vec[1:1]),
    .sel_b(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h3ec9a;
    stim[1] = 18'h346f0;
    stim[2] = 18'h28399;
    stim[3] = 18'h2b304;
    stim[4] = 18'h17593;
    stim[5] = 18'h1e923;
    stim[6] = 18'h1f9ef;
    stim[7] = 18'h1500c;
    stim[8] = 18'h20d3f;
    stim[9] = 18'h0702c;
    stim[10] = 18'h28e45;
    stim[11] = 18'h15e02;
    stim[12] = 18'h1f1dc;
    stim[13] = 18'h07c11;
    stim[14] = 18'h177df;
    stim[15] = 18'h1f1a0;
    stim[16] = 18'h187bb;
    stim[17] = 18'h3afa3;
    stim[18] = 18'h0dcc7;
    stim[19] = 18'h29e39;
    stim[20] = 18'h1625d;
    stim[21] = 18'h30901;
    stim[22] = 18'h32a8f;
    stim[23] = 18'h17f51;
    stim[24] = 18'h11540;
    stim[25] = 18'h2c2eb;
    stim[26] = 18'h0c360;
    stim[27] = 18'h0d73b;
    stim[28] = 18'h3c030;
    stim[29] = 18'h147af;
    stim[30] = 18'h0b9a2;
    stim[31] = 18'h2f5d6;
    stim[32] = 18'h08452;
    stim[33] = 18'h3ccd0;
    stim[34] = 18'h308f4;
    stim[35] = 18'h0856c;
    stim[36] = 18'h31d5c;
    stim[37] = 18'h140aa;
    stim[38] = 18'h0afbb;
    stim[39] = 18'h34d2b;
    stim[40] = 18'h04ead;
    stim[41] = 18'h247e4;
    stim[42] = 18'h28f47;
    stim[43] = 18'h03dca;
    stim[44] = 18'h3813f;
    stim[45] = 18'h1840f;
    stim[46] = 18'h00697;
    stim[47] = 18'h1ad8b;
    stim[48] = 18'h296a7;
    stim[49] = 18'h04be7;
    stim[50] = 18'h2b1f1;
    stim[51] = 18'h193e9;
    stim[52] = 18'h21e02;
    stim[53] = 18'h3d8bd;
    stim[54] = 18'h3ff6f;
    stim[55] = 18'h2f6a7;
    stim[56] = 18'h25aab;
    stim[57] = 18'h1644a;
    stim[58] = 18'h0d47d;
    stim[59] = 18'h21560;
    stim[60] = 18'h27d01;
    stim[61] = 18'h0024f;
    stim[62] = 18'h1b22a;
    stim[63] = 18'h1e8a5;
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
      expv[0] = 2'hx;
      expv[1] = 2'hx;
      expv[2] = 2'hx;
      expv[3] = 2'hx;
      expv[4] = 2'hx;
      expv[5] = 2'hx;
      expv[6] = 2'hx;
      expv[7] = 2'hx;
      expv[8] = 2'hx;
      expv[9] = 2'h3;
      expv[10] = 2'hx;
      expv[11] = 2'hx;
      expv[12] = 2'hx;
      expv[13] = 2'hx;
      expv[14] = 2'h3;
      expv[15] = 2'hx;
      expv[16] = 2'hx;
      expv[17] = 2'h1;
      expv[18] = 2'hx;
      expv[19] = 2'h1;
      expv[20] = 2'hx;
      expv[21] = 2'hx;
      expv[22] = 2'h1;
      expv[23] = 2'h3;
      expv[24] = 2'hx;
      expv[25] = 2'h1;
      expv[26] = 2'hx;
      expv[27] = 2'h1;
      expv[28] = 2'h1;
      expv[29] = 2'h0;
      expv[30] = 2'h1;
      expv[31] = 2'h1;
      expv[32] = 2'h1;
      expv[33] = 2'h2;
      expv[34] = 2'h1;
      expv[35] = 2'h3;
      expv[36] = 2'hx;
      expv[37] = 2'h0;
      expv[38] = 2'h0;
      expv[39] = 2'h0;
      expv[40] = 2'h0;
      expv[41] = 2'h1;
      expv[42] = 2'h1;
      expv[43] = 2'hx;
      expv[44] = 2'hx;
      expv[45] = 2'h0;
      expv[46] = 2'h3;
      expv[47] = 2'h3;
      expv[48] = 2'h1;
      expv[49] = 2'hx;
      expv[50] = 2'h1;
      expv[51] = 2'h3;
      expv[52] = 2'h2;
      expv[53] = 2'h2;
      expv[54] = 2'h1;
      expv[55] = 2'h3;
      expv[56] = 2'h1;
      expv[57] = 2'h1;
      expv[58] = 2'h0;
      expv[59] = 2'h2;
      expv[60] = 2'h3;
      expv[61] = 2'h0;
      expv[62] = 2'h0;
      expv[63] = 2'h3;
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
