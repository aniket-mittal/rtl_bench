// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 68;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_156706 dut (
    .pclk(clk),
    .vsync(in_vec[9:9]),
    .hsync(in_vec[8:8]),
    .din_8bit(in_vec[7:0]),
    .address(out_vec[67:49]),
    .dout_48bit(out_vec[48:1]),
    .we(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h353;
    stim[1] = 10'h043;
    stim[2] = 10'h17d;
    stim[3] = 10'h047;
    stim[4] = 10'h1a6;
    stim[5] = 10'h260;
    stim[6] = 10'h32c;
    stim[7] = 10'h314;
    stim[8] = 10'h197;
    stim[9] = 10'h310;
    stim[10] = 10'h394;
    stim[11] = 10'h28b;
    stim[12] = 10'h20f;
    stim[13] = 10'h359;
    stim[14] = 10'h0f4;
    stim[15] = 10'h386;
    stim[16] = 10'h0e3;
    stim[17] = 10'h1a6;
    stim[18] = 10'h260;
    stim[19] = 10'h042;
    stim[20] = 10'h268;
    stim[21] = 10'h15b;
    stim[22] = 10'h155;
    stim[23] = 10'h16c;
    stim[24] = 10'h3d3;
    stim[25] = 10'h37f;
    stim[26] = 10'h067;
    stim[27] = 10'h03e;
    stim[28] = 10'h162;
    stim[29] = 10'h328;
    stim[30] = 10'h1c9;
    stim[31] = 10'h278;
    stim[32] = 10'h221;
    stim[33] = 10'h38b;
    stim[34] = 10'h248;
    stim[35] = 10'h116;
    stim[36] = 10'h050;
    stim[37] = 10'h2a5;
    stim[38] = 10'h274;
    stim[39] = 10'h178;
    stim[40] = 10'h209;
    stim[41] = 10'h065;
    stim[42] = 10'h158;
    stim[43] = 10'h3aa;
    stim[44] = 10'h37a;
    stim[45] = 10'h0ff;
    stim[46] = 10'h1b8;
    stim[47] = 10'h2a9;
    stim[48] = 10'h076;
    stim[49] = 10'h258;
    stim[50] = 10'h0e2;
    stim[51] = 10'h008;
    stim[52] = 10'h3c4;
    stim[53] = 10'h19e;
    stim[54] = 10'h0d5;
    stim[55] = 10'h028;
    stim[56] = 10'h0a2;
    stim[57] = 10'h2b0;
    stim[58] = 10'h359;
    stim[59] = 10'h178;
    stim[60] = 10'h232;
    stim[61] = 10'h338;
    stim[62] = 10'h379;
    stim[63] = 10'h065;
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
      expv[0] = 68'hxxxxxxxxxxxxxxxxx;
      expv[1] = 68'hxxxxxxxxxxxxxxxxx;
      expv[2] = 68'hxxxxxxxxxxxxxxxxx;
      expv[3] = 68'hxxxxxxxxxxxxxxxxx;
      expv[4] = 68'hxxxxxxxxxxxxxxxxx;
      expv[5] = 68'h0000xxxxxfxxxxxxx;
      expv[6] = 68'h0000xxxxxfxxxxxxx;
      expv[7] = 68'h0000xxxxxfxxxxxxx;
      expv[8] = 68'h0000xxxxxfxxxxxxx;
      expv[9] = 68'h0000xxxxxfxxxxxxx;
      expv[10] = 68'h0000xxxxxfxxxxxxx;
      expv[11] = 68'h0000xxxxxfxxxxxxx;
      expv[12] = 68'h0000xxxxxfxxxxxxx;
      expv[13] = 68'h0000xxxxxfxxxxxxx;
      expv[14] = 68'h0000xxxxxfxxxxxxx;
      expv[15] = 68'h0000xxxxxfxxxxxxx;
      expv[16] = 68'h0000xxxxxfxxxxxxx;
      expv[17] = 68'h0000xxxxxfxxxxxxx;
      expv[18] = 68'h0000xxxxxfxxxxxxx;
      expv[19] = 68'h0000xxxxxfxxxxxxx;
      expv[20] = 68'h0000xxxxxfxxxxxxx;
      expv[21] = 68'h0000xxxxxfxxxxxxx;
      expv[22] = 68'h0000xxxxxfxxxxxxx;
      expv[23] = 68'h000014d2efxxxxxxx;
      expv[24] = 68'h000034d2efxxxxxxx;
      expv[25] = 68'h000034d2efxxxxxxx;
      expv[26] = 68'h000034d2efxxxxxxx;
      expv[27] = 68'h000034d2efxxxxxxx;
      expv[28] = 68'h000034d2efxxxxxxx;
      expv[29] = 68'h000034d2efxxxxxxx;
      expv[30] = 68'h000034d2efxxxxxxx;
      expv[31] = 68'h000034d2efxxxxxxx;
      expv[32] = 68'h000034d2efxxxxxxx;
      expv[33] = 68'h000034d2efxxxxxxx;
      expv[34] = 68'h000034d2efxxxxxxx;
      expv[35] = 68'h000034d2efxxxxxxx;
      expv[36] = 68'h000034d2efxxxxxxx;
      expv[37] = 68'h000034d2efxxxxxxx;
      expv[38] = 68'h000034d2efxxxxxxx;
      expv[39] = 68'h000034d2efxxxxxxx;
      expv[40] = 68'h000034d2efxxxxxxx;
      expv[41] = 68'h000034d2efxxxxxxx;
      expv[42] = 68'h000034d2efxxxxxxx;
      expv[43] = 68'h000034d2efxxxxxxx;
      expv[44] = 68'h000034d2efxxxxxxx;
      expv[45] = 68'h000034d2efxxxxxxx;
      expv[46] = 68'h000034d2efxxxxxxx;
      expv[47] = 68'h000034d2efxxxxxxx;
      expv[48] = 68'h000034d2efxxxxxxx;
      expv[49] = 68'h000034d2efxxxxxxx;
      expv[50] = 68'h000034d2efxxxxxxx;
      expv[51] = 68'h000034d2efxxxxxxx;
      expv[52] = 68'h000034d2efxxxxxxx;
      expv[53] = 68'h000034d2efxxxxxxx;
      expv[54] = 68'h000034d2efxxxxxxx;
      expv[55] = 68'h000034d2efxxxxxxx;
      expv[56] = 68'h000034d2efxxxxxxx;
      expv[57] = 68'h000034d2efxxxxxxx;
      expv[58] = 68'h000034d2efxxxxxxx;
      expv[59] = 68'h000034d2efxxxxxxx;
      expv[60] = 68'h000034d2efxxxxxxx;
      expv[61] = 68'h000034d2efxxxxxxx;
      expv[62] = 68'h000034d2efxxxxxxx;
      expv[63] = 68'h000034d2efxxxxxxx;
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
