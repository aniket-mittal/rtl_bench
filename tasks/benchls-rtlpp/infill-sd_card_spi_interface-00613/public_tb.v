// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00613 dut (
    .CLOCK(clk),
    .nRESET(in_vec[13:13]),
    .CLKEN(in_vec[12:12]),
    .ENABLE(in_vec[11:11]),
    .RS(in_vec[10:10]),
    .nWR(in_vec[9:9]),
    .DI(in_vec[8:1]),
    .SD_MISO(in_vec[0:0]),
    .DO(out_vec[12:5]),
    .SD_CS0(out_vec[4:4]),
    .SD_CS1(out_vec[3:3]),
    .SD_WCS(out_vec[2:2]),
    .SD_CLK(out_vec[1:1]),
    .SD_MOSI(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h39a0;
    stim[1] = 14'h2019;
    stim[2] = 14'h17b0;
    stim[3] = 14'h1685;
    stim[4] = 14'h0cc5;
    stim[5] = 14'h0a09;
    stim[6] = 14'h15de;
    stim[7] = 14'h0724;
    stim[8] = 14'h031e;
    stim[9] = 14'h0df3;
    stim[10] = 14'h0833;
    stim[11] = 14'h0f7d;
    stim[12] = 14'h18f7;
    stim[13] = 14'h1532;
    stim[14] = 14'h1037;
    stim[15] = 14'h0e80;
    stim[16] = 14'h1b34;
    stim[17] = 14'h15ab;
    stim[18] = 14'h14d2;
    stim[19] = 14'h1885;
    stim[20] = 14'h1d13;
    stim[21] = 14'h124f;
    stim[22] = 14'h0b91;
    stim[23] = 14'h1514;
    stim[24] = 14'h18be;
    stim[25] = 14'h102c;
    stim[26] = 14'h1733;
    stim[27] = 14'h1a46;
    stim[28] = 14'h0f5c;
    stim[29] = 14'h1029;
    stim[30] = 14'h14a5;
    stim[31] = 14'h0e1e;
    stim[32] = 14'h1661;
    stim[33] = 14'h0926;
    stim[34] = 14'h150c;
    stim[35] = 14'h040a;
    stim[36] = 14'h1454;
    stim[37] = 14'h093a;
    stim[38] = 14'h051b;
    stim[39] = 14'h0c2f;
    stim[40] = 14'h1a3e;
    stim[41] = 14'h0154;
    stim[42] = 14'h0c0d;
    stim[43] = 14'h0059;
    stim[44] = 14'h1f4f;
    stim[45] = 14'h062b;
    stim[46] = 14'h17e6;
    stim[47] = 14'h0e74;
    stim[48] = 14'h00c0;
    stim[49] = 14'h0b16;
    stim[50] = 14'h0de3;
    stim[51] = 14'h0c4f;
    stim[52] = 14'h1367;
    stim[53] = 14'h07f6;
    stim[54] = 14'h07a7;
    stim[55] = 14'h09cd;
    stim[56] = 14'h189f;
    stim[57] = 14'h0f91;
    stim[58] = 14'h11f7;
    stim[59] = 14'h135c;
    stim[60] = 14'h1735;
    stim[61] = 14'h1e20;
    stim[62] = 14'h1b9e;
    stim[63] = 14'h15da;
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
      expv[0] = 13'h0xxx;
      expv[1] = 13'h0axx;
      expv[2] = 13'hxxxx;
      expv[3] = 13'h1fff;
      expv[4] = 13'h1fff;
      expv[5] = 13'h0b7f;
      expv[6] = 13'h1fff;
      expv[7] = 13'h1fff;
      expv[8] = 13'h0b7f;
      expv[9] = 13'h1fff;
      expv[10] = 13'h0b7f;
      expv[11] = 13'h1fff;
      expv[12] = 13'h0b7f;
      expv[13] = 13'h1fff;
      expv[14] = 13'h0b7f;
      expv[15] = 13'h1fff;
      expv[16] = 13'h0b7f;
      expv[17] = 13'h1fff;
      expv[18] = 13'h1fff;
      expv[19] = 13'h0b7f;
      expv[20] = 13'h1fff;
      expv[21] = 13'h0b7f;
      expv[22] = 13'h0b7f;
      expv[23] = 13'h1fff;
      expv[24] = 13'h0b7f;
      expv[25] = 13'h0b7f;
      expv[26] = 13'h1fff;
      expv[27] = 13'h0b7f;
      expv[28] = 13'h1fff;
      expv[29] = 13'h0b7f;
      expv[30] = 13'h1fff;
      expv[31] = 13'h1fff;
      expv[32] = 13'h1fff;
      expv[33] = 13'h0b7f;
      expv[34] = 13'h1fff;
      expv[35] = 13'h1fff;
      expv[36] = 13'h1fff;
      expv[37] = 13'h0b7f;
      expv[38] = 13'h1fff;
      expv[39] = 13'h1fff;
      expv[40] = 13'h0b7f;
      expv[41] = 13'h0b7f;
      expv[42] = 13'h1fff;
      expv[43] = 13'h0b7f;
      expv[44] = 13'h1fff;
      expv[45] = 13'h1fff;
      expv[46] = 13'h1fff;
      expv[47] = 13'h1fff;
      expv[48] = 13'h0b7f;
      expv[49] = 13'h0b7f;
      expv[50] = 13'h1fff;
      expv[51] = 13'h1fff;
      expv[52] = 13'h0b7f;
      expv[53] = 13'h1fff;
      expv[54] = 13'h1fff;
      expv[55] = 13'h0b7f;
      expv[56] = 13'h0b7f;
      expv[57] = 13'h1fff;
      expv[58] = 13'h0b7f;
      expv[59] = 13'h0b7f;
      expv[60] = 13'h1fff;
      expv[61] = 13'h1fff;
      expv[62] = 13'h0b7f;
      expv[63] = 13'h1fff;
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
