// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_197959 dut (
    .clk(clk),
    .reset(in_vec[9:9]),
    .X(in_vec[8:6]),
    .Y(in_vec[5:3]),
    .Z(in_vec[2:0]),
    .T(out_vec[15:11]),
    .state(out_vec[10:7]),
    .i(out_vec[6:5]),
    .R(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h347;
    stim[1] = 10'h2e7;
    stim[2] = 10'h043;
    stim[3] = 10'h02c;
    stim[4] = 10'h081;
    stim[5] = 10'h016;
    stim[6] = 10'h18d;
    stim[7] = 10'h1b8;
    stim[8] = 10'h0be;
    stim[9] = 10'h0df;
    stim[10] = 10'h047;
    stim[11] = 10'h07b;
    stim[12] = 10'h0d2;
    stim[13] = 10'h058;
    stim[14] = 10'h08d;
    stim[15] = 10'h105;
    stim[16] = 10'h0ac;
    stim[17] = 10'h210;
    stim[18] = 10'h032;
    stim[19] = 10'h1b0;
    stim[20] = 10'h10f;
    stim[21] = 10'h15f;
    stim[22] = 10'h18a;
    stim[23] = 10'h1f6;
    stim[24] = 10'h180;
    stim[25] = 10'h122;
    stim[26] = 10'h1de;
    stim[27] = 10'h15d;
    stim[28] = 10'h038;
    stim[29] = 10'h0d4;
    stim[30] = 10'h108;
    stim[31] = 10'h040;
    stim[32] = 10'h38d;
    stim[33] = 10'h1ec;
    stim[34] = 10'h099;
    stim[35] = 10'h0b2;
    stim[36] = 10'h148;
    stim[37] = 10'h146;
    stim[38] = 10'h06e;
    stim[39] = 10'h054;
    stim[40] = 10'h1d5;
    stim[41] = 10'h0d3;
    stim[42] = 10'h0b7;
    stim[43] = 10'h03b;
    stim[44] = 10'h0bb;
    stim[45] = 10'h0a4;
    stim[46] = 10'h0bd;
    stim[47] = 10'h175;
    stim[48] = 10'h0a8;
    stim[49] = 10'h0df;
    stim[50] = 10'h187;
    stim[51] = 10'h13c;
    stim[52] = 10'h13a;
    stim[53] = 10'h010;
    stim[54] = 10'h197;
    stim[55] = 10'h0e6;
    stim[56] = 10'h1cc;
    stim[57] = 10'h12d;
    stim[58] = 10'h175;
    stim[59] = 10'h00f;
    stim[60] = 10'h1c6;
    stim[61] = 10'h049;
    stim[62] = 10'h040;
    stim[63] = 10'h1c0;
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
      expv[0] = 16'h0060;
      expv[1] = 16'h0060;
      expv[2] = 16'h0060;
      expv[3] = 16'h0060;
      expv[4] = 16'h0060;
      expv[5] = 16'h0060;
      expv[6] = 16'h0060;
      expv[7] = 16'h0060;
      expv[8] = 16'h0060;
      expv[9] = 16'h0060;
      expv[10] = 16'h0060;
      expv[11] = 16'h0060;
      expv[12] = 16'h0060;
      expv[13] = 16'h0060;
      expv[14] = 16'h0060;
      expv[15] = 16'h0060;
      expv[16] = 16'h0060;
      expv[17] = 16'h0060;
      expv[18] = 16'h0060;
      expv[19] = 16'h0060;
      expv[20] = 16'h0060;
      expv[21] = 16'h0060;
      expv[22] = 16'h0060;
      expv[23] = 16'h0060;
      expv[24] = 16'h0060;
      expv[25] = 16'h0060;
      expv[26] = 16'h0060;
      expv[27] = 16'h0060;
      expv[28] = 16'h0060;
      expv[29] = 16'h0060;
      expv[30] = 16'h0060;
      expv[31] = 16'h0060;
      expv[32] = 16'h0060;
      expv[33] = 16'h0060;
      expv[34] = 16'h0060;
      expv[35] = 16'h0060;
      expv[36] = 16'h0060;
      expv[37] = 16'h0060;
      expv[38] = 16'h0060;
      expv[39] = 16'h0060;
      expv[40] = 16'h0060;
      expv[41] = 16'h0060;
      expv[42] = 16'h0060;
      expv[43] = 16'h0060;
      expv[44] = 16'h0060;
      expv[45] = 16'h0060;
      expv[46] = 16'h0060;
      expv[47] = 16'h0060;
      expv[48] = 16'h0060;
      expv[49] = 16'h0060;
      expv[50] = 16'h0060;
      expv[51] = 16'h0060;
      expv[52] = 16'h0060;
      expv[53] = 16'h0060;
      expv[54] = 16'h0060;
      expv[55] = 16'h0060;
      expv[56] = 16'h0060;
      expv[57] = 16'h0060;
      expv[58] = 16'h0060;
      expv[59] = 16'h0060;
      expv[60] = 16'h0060;
      expv[61] = 16'h0060;
      expv[62] = 16'h0060;
      expv[63] = 16'h0060;
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
