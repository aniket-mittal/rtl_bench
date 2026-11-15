// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  spi dut (
    .clk(clk),
    .rst(in_vec[10:10]),
    .req(in_vec[9:9]),
    .din(in_vec[8:1]),
    .cmd(in_vec[0:0]),
    .J(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h549;
    stim[1] = 11'h5e9;
    stim[2] = 11'h096;
    stim[3] = 11'h389;
    stim[4] = 11'h13e;
    stim[5] = 11'h2ad;
    stim[6] = 11'h35f;
    stim[7] = 11'h275;
    stim[8] = 11'h3d8;
    stim[9] = 11'h1e8;
    stim[10] = 11'h292;
    stim[11] = 11'h080;
    stim[12] = 11'h27c;
    stim[13] = 11'h05e;
    stim[14] = 11'h05b;
    stim[15] = 11'h0ee;
    stim[16] = 11'h145;
    stim[17] = 11'h0ca;
    stim[18] = 11'h16c;
    stim[19] = 11'h20e;
    stim[20] = 11'h346;
    stim[21] = 11'h3d0;
    stim[22] = 11'h1af;
    stim[23] = 11'h1a7;
    stim[24] = 11'h02b;
    stim[25] = 11'h3bd;
    stim[26] = 11'h1c1;
    stim[27] = 11'h345;
    stim[28] = 11'h12e;
    stim[29] = 11'h39d;
    stim[30] = 11'h093;
    stim[31] = 11'h10c;
    stim[32] = 11'h0e7;
    stim[33] = 11'h0d1;
    stim[34] = 11'h3ad;
    stim[35] = 11'h179;
    stim[36] = 11'h2e7;
    stim[37] = 11'h2f6;
    stim[38] = 11'h187;
    stim[39] = 11'h0f0;
    stim[40] = 11'h2c5;
    stim[41] = 11'h1d3;
    stim[42] = 11'h026;
    stim[43] = 11'h05f;
    stim[44] = 11'h37a;
    stim[45] = 11'h0ef;
    stim[46] = 11'h1e2;
    stim[47] = 11'h028;
    stim[48] = 11'h174;
    stim[49] = 11'h157;
    stim[50] = 11'h28a;
    stim[51] = 11'h25c;
    stim[52] = 11'h07d;
    stim[53] = 11'h16c;
    stim[54] = 11'h0e2;
    stim[55] = 11'h11e;
    stim[56] = 11'h268;
    stim[57] = 11'h34e;
    stim[58] = 11'h22e;
    stim[59] = 11'h185;
    stim[60] = 11'h06a;
    stim[61] = 11'h257;
    stim[62] = 11'h3ee;
    stim[63] = 11'h202;
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
      expv[0] = 4'h9;
      expv[1] = 4'h9;
      expv[2] = 4'h9;
      expv[3] = 4'h9;
      expv[4] = 4'ha;
      expv[5] = 4'h6;
      expv[6] = 4'he;
      expv[7] = 4'h6;
      expv[8] = 4'he;
      expv[9] = 4'h2;
      expv[10] = 4'ha;
      expv[11] = 4'h2;
      expv[12] = 4'ha;
      expv[13] = 4'h2;
      expv[14] = 4'ha;
      expv[15] = 4'h6;
      expv[16] = 4'he;
      expv[17] = 4'h2;
      expv[18] = 4'ha;
      expv[19] = 4'h2;
      expv[20] = 4'ha;
      expv[21] = 4'h9;
      expv[22] = 4'h8;
      expv[23] = 4'h4;
      expv[24] = 4'hc;
      expv[25] = 4'h4;
      expv[26] = 4'hc;
      expv[27] = 4'h4;
      expv[28] = 4'hc;
      expv[29] = 4'h0;
      expv[30] = 4'h8;
      expv[31] = 4'h4;
      expv[32] = 4'hc;
      expv[33] = 4'h0;
      expv[34] = 4'h8;
      expv[35] = 4'h0;
      expv[36] = 4'h8;
      expv[37] = 4'h0;
      expv[38] = 4'h8;
      expv[39] = 4'h9;
      expv[40] = 4'h9;
      expv[41] = 4'ha;
      expv[42] = 4'h2;
      expv[43] = 4'ha;
      expv[44] = 4'h6;
      expv[45] = 4'he;
      expv[46] = 4'h6;
      expv[47] = 4'he;
      expv[48] = 4'h2;
      expv[49] = 4'ha;
      expv[50] = 4'h2;
      expv[51] = 4'ha;
      expv[52] = 4'h2;
      expv[53] = 4'ha;
      expv[54] = 4'h6;
      expv[55] = 4'he;
      expv[56] = 4'h2;
      expv[57] = 4'ha;
      expv[58] = 4'h9;
      expv[59] = 4'h8;
      expv[60] = 4'h0;
      expv[61] = 4'h8;
      expv[62] = 4'h0;
      expv[63] = 4'h8;
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
