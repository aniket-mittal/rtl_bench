// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_076420 dut (
    .clk(clk),
    .E1(in_vec[2:2]),
    .H1(in_vec[1:1]),
    .H2(in_vec[0:0]),
    .F1(out_vec[12:12]),
    .J1(out_vec[11:11]),
    .J2(out_vec[10:10]),
    .K2(out_vec[9:9]),
    .L2(out_vec[8:8]),
    .M2(out_vec[7:7]),
    .N2(out_vec[6:6]),
    .P2(out_vec[5:5]),
    .R2(out_vec[4:4]),
    .S2(out_vec[3:3]),
    .T2(out_vec[2:2]),
    .U2(out_vec[1:1]),
    .V2(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h1;
    stim[1] = 3'h3;
    stim[2] = 3'h7;
    stim[3] = 3'h5;
    stim[4] = 3'h4;
    stim[5] = 3'h2;
    stim[6] = 3'h5;
    stim[7] = 3'h1;
    stim[8] = 3'h5;
    stim[9] = 3'h4;
    stim[10] = 3'h3;
    stim[11] = 3'h2;
    stim[12] = 3'h4;
    stim[13] = 3'h0;
    stim[14] = 3'h2;
    stim[15] = 3'h4;
    stim[16] = 3'h6;
    stim[17] = 3'h0;
    stim[18] = 3'h1;
    stim[19] = 3'h4;
    stim[20] = 3'h2;
    stim[21] = 3'h1;
    stim[22] = 3'h4;
    stim[23] = 3'h4;
    stim[24] = 3'h1;
    stim[25] = 3'h0;
    stim[26] = 3'h6;
    stim[27] = 3'h5;
    stim[28] = 3'h7;
    stim[29] = 3'h0;
    stim[30] = 3'h3;
    stim[31] = 3'h3;
    stim[32] = 3'h7;
    stim[33] = 3'h7;
    stim[34] = 3'h1;
    stim[35] = 3'h6;
    stim[36] = 3'h4;
    stim[37] = 3'h0;
    stim[38] = 3'h0;
    stim[39] = 3'h1;
    stim[40] = 3'h7;
    stim[41] = 3'h0;
    stim[42] = 3'h1;
    stim[43] = 3'h4;
    stim[44] = 3'h0;
    stim[45] = 3'h1;
    stim[46] = 3'h4;
    stim[47] = 3'h0;
    stim[48] = 3'h4;
    stim[49] = 3'h0;
    stim[50] = 3'h0;
    stim[51] = 3'h0;
    stim[52] = 3'h0;
    stim[53] = 3'h3;
    stim[54] = 3'h5;
    stim[55] = 3'h7;
    stim[56] = 3'h6;
    stim[57] = 3'h4;
    stim[58] = 3'h5;
    stim[59] = 3'h1;
    stim[60] = 3'h1;
    stim[61] = 3'h7;
    stim[62] = 3'h6;
    stim[63] = 3'h1;
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
      expv[0] = 13'hxxxx;
      expv[1] = 13'hxxxx;
      expv[2] = 13'hxxxx;
      expv[3] = 13'hxxxx;
      expv[4] = 13'hxxxx;
      expv[5] = 13'hxxxx;
      expv[6] = 13'h1xxx;
      expv[7] = 13'h1xxx;
      expv[8] = 13'h1xxx;
      expv[9] = 13'h1xxx;
      expv[10] = 13'h1xxx;
      expv[11] = 13'h1axx;
      expv[12] = 13'h1cxx;
      expv[13] = 13'h14xx;
      expv[14] = 13'h14xx;
      expv[15] = 13'h07xx;
      expv[16] = 13'h0dxx;
      expv[17] = 13'h0exx;
      expv[18] = 13'h1exx;
      expv[19] = 13'h1axx;
      expv[20] = 13'h1fxx;
      expv[21] = 13'h1exx;
      expv[22] = 13'h1bxx;
      expv[23] = 13'h1fxx;
      expv[24] = 13'h1dxx;
      expv[25] = 13'h13xx;
      expv[26] = 13'h17xx;
      expv[27] = 13'h05xx;
      expv[28] = 13'h0bxx;
      expv[29] = 13'h0axx;
      expv[30] = 13'h1dxx;
      expv[31] = 13'h1bax;
      expv[32] = 13'h1acx;
      expv[33] = 13'h19cx;
      expv[34] = 13'h194x;
      expv[35] = 13'h1afx;
      expv[36] = 13'h1ddx;
      expv[37] = 13'h156x;
      expv[38] = 13'h14ex;
      expv[39] = 13'h04ax;
      expv[40] = 13'h017x;
      expv[41] = 13'h02ex;
      expv[42] = 13'h1ebx;
      expv[43] = 13'h1a7x;
      expv[44] = 13'h1e5x;
      expv[45] = 13'h1cbx;
      expv[46] = 13'h197x;
      expv[47] = 13'h1f5x;
      expv[48] = 13'h1d3x;
      expv[49] = 13'h1f2x;
      expv[50] = 13'h1e5x;
      expv[51] = 13'h04ba;
      expv[52] = 13'h07ac;
      expv[53] = 13'h069c;
      expv[54] = 13'h0394;
      expv[55] = 13'h0b2f;
      expv[56] = 13'h0a5d;
      expv[57] = 13'h0fd6;
      expv[58] = 13'h0f4e;
      expv[59] = 13'h09ca;
      expv[60] = 13'h1997;
      expv[61] = 13'h192e;
      expv[62] = 13'h1beb;
      expv[63] = 13'h1fa7;
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
