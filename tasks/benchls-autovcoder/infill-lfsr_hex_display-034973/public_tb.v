// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_034973 dut (
    .clk(clk),
    .HEX0(out_vec[13:7]),
    .HEX1(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 1'h0;
    stim[1] = 1'h0;
    stim[2] = 1'h0;
    stim[3] = 1'h0;
    stim[4] = 1'h0;
    stim[5] = 1'h0;
    stim[6] = 1'h0;
    stim[7] = 1'h0;
    stim[8] = 1'h0;
    stim[9] = 1'h0;
    stim[10] = 1'h0;
    stim[11] = 1'h0;
    stim[12] = 1'h0;
    stim[13] = 1'h0;
    stim[14] = 1'h0;
    stim[15] = 1'h0;
    stim[16] = 1'h0;
    stim[17] = 1'h0;
    stim[18] = 1'h0;
    stim[19] = 1'h0;
    stim[20] = 1'h0;
    stim[21] = 1'h0;
    stim[22] = 1'h0;
    stim[23] = 1'h0;
    stim[24] = 1'h0;
    stim[25] = 1'h0;
    stim[26] = 1'h0;
    stim[27] = 1'h0;
    stim[28] = 1'h0;
    stim[29] = 1'h0;
    stim[30] = 1'h0;
    stim[31] = 1'h0;
    stim[32] = 1'h0;
    stim[33] = 1'h0;
    stim[34] = 1'h0;
    stim[35] = 1'h0;
    stim[36] = 1'h0;
    stim[37] = 1'h0;
    stim[38] = 1'h0;
    stim[39] = 1'h0;
    stim[40] = 1'h0;
    stim[41] = 1'h0;
    stim[42] = 1'h0;
    stim[43] = 1'h0;
    stim[44] = 1'h0;
    stim[45] = 1'h0;
    stim[46] = 1'h0;
    stim[47] = 1'h0;
    stim[48] = 1'h0;
    stim[49] = 1'h0;
    stim[50] = 1'h0;
    stim[51] = 1'h0;
    stim[52] = 1'h0;
    stim[53] = 1'h0;
    stim[54] = 1'h0;
    stim[55] = 1'h0;
    stim[56] = 1'h0;
    stim[57] = 1'h0;
    stim[58] = 1'h0;
    stim[59] = 1'h0;
    stim[60] = 1'h0;
    stim[61] = 1'h0;
    stim[62] = 1'h0;
    stim[63] = 1'h0;
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
      expv[0] = 14'hxxxx;
      expv[1] = 14'h2000;
      expv[2] = 14'h2019;
      expv[3] = 14'h2024;
      expv[4] = 14'h2079;
      expv[5] = 14'h0000;
      expv[6] = 14'h0cb0;
      expv[7] = 14'h1206;
      expv[8] = 14'h3cf8;
      expv[9] = 14'h0030;
      expv[10] = 14'h1879;
      expv[11] = 14'h0300;
      expv[12] = 14'h3c19;
      expv[13] = 14'h1824;
      expv[14] = 14'h3c90;
      expv[15] = 14'h0019;
      expv[16] = 14'h0c88;
      expv[17] = 14'h1221;
      expv[18] = 14'h0806;
      expv[19] = 14'h0cf8;
      expv[20] = 14'h0430;
      expv[21] = 14'h10f9;
      expv[22] = 14'h0340;
      expv[23] = 14'h3c40;
      expv[24] = 14'h1840;
      expv[25] = 14'h3c80;
      expv[26] = 14'h2030;
      expv[27] = 14'h2002;
      expv[28] = 14'h2030;
      expv[29] = 14'h0010;
      expv[30] = 14'h1819;
      expv[31] = 14'h0124;
      expv[32] = 14'h1810;
      expv[33] = 14'h0819;
      expv[34] = 14'h0ca4;
      expv[35] = 14'h1210;
      expv[36] = 14'h0830;
      expv[37] = 14'h0c82;
      expv[38] = 14'h1246;
      expv[39] = 14'h0821;
      expv[40] = 14'h1806;
      expv[41] = 14'h0178;
      expv[42] = 14'h2330;
      expv[43] = 14'h1090;
      expv[44] = 14'h0319;
      expv[45] = 14'h3c24;
      expv[46] = 14'h1879;
      expv[47] = 14'h0840;
      expv[48] = 14'h0cc0;
      expv[49] = 14'h1200;
      expv[50] = 14'h3c99;
      expv[51] = 14'h2008;
      expv[52] = 14'h2012;
      expv[53] = 14'h0008;
      expv[54] = 14'h0ca1;
      expv[55] = 14'h0402;
      expv[56] = 14'h0946;
      expv[57] = 14'h0421;
      expv[58] = 14'h1082;
      expv[59] = 14'h0146;
      expv[60] = 14'h2312;
      expv[61] = 14'h1088;
      expv[62] = 14'h0121;
      expv[63] = 14'h2302;
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
