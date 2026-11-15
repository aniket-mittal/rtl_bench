// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 23;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09612 dut (
    .clock(clk),
    .reset(in_vec[18:18]),
    .i_d(in_vec[17:2]),
    .i_v(in_vec[1:1]),
    .o_b(in_vec[0:0]),
    .i_b(out_vec[22:22]),
    .o_d(out_vec[21:6]),
    .o_v(out_vec[5:5]),
    .count(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h451f7;
    stim[1] = 19'h6068c;
    stim[2] = 19'h107a2;
    stim[3] = 19'h0d20e;
    stim[4] = 19'h203c9;
    stim[5] = 19'h3d420;
    stim[6] = 19'h32613;
    stim[7] = 19'h23d6d;
    stim[8] = 19'h049cd;
    stim[9] = 19'h28504;
    stim[10] = 19'h3cf35;
    stim[11] = 19'h2f854;
    stim[12] = 19'h1750a;
    stim[13] = 19'h24fec;
    stim[14] = 19'h0d201;
    stim[15] = 19'h3ef66;
    stim[16] = 19'h0303d;
    stim[17] = 19'h1d1ac;
    stim[18] = 19'h05399;
    stim[19] = 19'h08607;
    stim[20] = 19'h3a110;
    stim[21] = 19'h0175c;
    stim[22] = 19'h29a95;
    stim[23] = 19'h07a16;
    stim[24] = 19'h0ad2a;
    stim[25] = 19'h00bcd;
    stim[26] = 19'h1877d;
    stim[27] = 19'h05037;
    stim[28] = 19'h2dde1;
    stim[29] = 19'h3804c;
    stim[30] = 19'h36f50;
    stim[31] = 19'h3e188;
    stim[32] = 19'h35e66;
    stim[33] = 19'h3ba03;
    stim[34] = 19'h19ac2;
    stim[35] = 19'h3691e;
    stim[36] = 19'h24aed;
    stim[37] = 19'h394c9;
    stim[38] = 19'h21ce2;
    stim[39] = 19'h301a5;
    stim[40] = 19'h1ea9d;
    stim[41] = 19'h1d930;
    stim[42] = 19'h36733;
    stim[43] = 19'h3c99b;
    stim[44] = 19'h2f939;
    stim[45] = 19'h0a5ee;
    stim[46] = 19'h5caff;
    stim[47] = 19'h09297;
    stim[48] = 19'h30840;
    stim[49] = 19'h3fa2a;
    stim[50] = 19'h1f813;
    stim[51] = 19'h0d2e4;
    stim[52] = 19'h23263;
    stim[53] = 19'h30d7f;
    stim[54] = 19'h3bb60;
    stim[55] = 19'h3cd71;
    stim[56] = 19'h6f0fe;
    stim[57] = 19'h0f477;
    stim[58] = 19'h2b9a9;
    stim[59] = 19'h12447;
    stim[60] = 19'h22121;
    stim[61] = 19'h1b9a6;
    stim[62] = 19'h1c81d;
    stim[63] = 19'h2ae86;
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
      expv[0] = 23'hxxxxxx;
      expv[1] = 23'h400000;
      expv[2] = 23'h400000;
      expv[3] = 23'h107a01;
      expv[4] = 23'h0d20e1;
      expv[5] = 23'h0d20e1;
      expv[6] = 23'h0d20e0;
      expv[7] = 23'h326101;
      expv[8] = 23'h326121;
      expv[9] = 23'h326121;
      expv[10] = 23'h326120;
      expv[11] = 23'h326100;
      expv[12] = 23'h326100;
      expv[13] = 23'h175081;
      expv[14] = 23'h1750a0;
      expv[15] = 23'h175080;
      expv[16] = 23'h3ef641;
      expv[17] = 23'h3ef661;
      expv[18] = 23'h3ef660;
      expv[19] = 23'h3ef640;
      expv[20] = 23'h086041;
      expv[21] = 23'h086060;
      expv[22] = 23'h086040;
      expv[23] = 23'h086040;
      expv[24] = 23'h07a141;
      expv[25] = 23'h0ad2a1;
      expv[26] = 23'h0ad2a1;
      expv[27] = 23'h0ad2a1;
      expv[28] = 23'h0ad2a2;
      expv[29] = 23'h0ad2a2;
      expv[30] = 23'h050361;
      expv[31] = 23'h050360;
      expv[32] = 23'h050340;
      expv[33] = 23'h35e641;
      expv[34] = 23'h35e662;
      expv[35] = 23'h3ba022;
      expv[36] = 23'h19ac22;
      expv[37] = 23'h19ac22;
      expv[38] = 23'h19ac22;
      expv[39] = 23'h3691e2;
      expv[40] = 23'h3691e2;
      expv[41] = 23'h3691e2;
      expv[42] = 23'h21ce21;
      expv[43] = 23'h21ce22;
      expv[44] = 23'h21ce23;
      expv[45] = 23'h21ce23;
      expv[46] = 23'h367323;
      expv[47] = 23'h400000;
      expv[48] = 23'h092941;
      expv[49] = 23'h092960;
      expv[50] = 23'h3fa281;
      expv[51] = 23'h3fa2a2;
      expv[52] = 23'h1f8121;
      expv[53] = 23'h1f8122;
      expv[54] = 23'h1f8123;
      expv[55] = 23'h232622;
      expv[56] = 23'h232622;
      expv[57] = 23'h400000;
      expv[58] = 23'h0f4741;
      expv[59] = 23'h0f4761;
      expv[60] = 23'h0f4762;
      expv[61] = 23'h0f4762;
      expv[62] = 23'h124462;
      expv[63] = 23'h124462;
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
