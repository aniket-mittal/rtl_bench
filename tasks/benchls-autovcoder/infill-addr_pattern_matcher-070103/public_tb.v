// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_070103 dut (
    .clk(clk),
    .rst(in_vec[10:10]),
    .addr(in_vec[9:0]),
    .match(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h4f3;
    stim[1] = 11'h763;
    stim[2] = 11'h16e;
    stim[3] = 11'h247;
    stim[4] = 11'h300;
    stim[5] = 11'h0f4;
    stim[6] = 11'h16f;
    stim[7] = 11'h16b;
    stim[8] = 11'h047;
    stim[9] = 11'h337;
    stim[10] = 11'h06f;
    stim[11] = 11'h30d;
    stim[12] = 11'h0ff;
    stim[13] = 11'h326;
    stim[14] = 11'h088;
    stim[15] = 11'h150;
    stim[16] = 11'h2af;
    stim[17] = 11'h11d;
    stim[18] = 11'h078;
    stim[19] = 11'h0d7;
    stim[20] = 11'h074;
    stim[21] = 11'h2be;
    stim[22] = 11'h0db;
    stim[23] = 11'h1e1;
    stim[24] = 11'h0ac;
    stim[25] = 11'h38f;
    stim[26] = 11'h231;
    stim[27] = 11'h3f7;
    stim[28] = 11'h1e7;
    stim[29] = 11'h3b5;
    stim[30] = 11'h0d5;
    stim[31] = 11'h1c5;
    stim[32] = 11'h19b;
    stim[33] = 11'h08f;
    stim[34] = 11'h006;
    stim[35] = 11'h39b;
    stim[36] = 11'h16a;
    stim[37] = 11'h303;
    stim[38] = 11'h263;
    stim[39] = 11'h280;
    stim[40] = 11'h136;
    stim[41] = 11'h5e9;
    stim[42] = 11'h3ef;
    stim[43] = 11'h096;
    stim[44] = 11'h297;
    stim[45] = 11'h2e5;
    stim[46] = 11'h2cb;
    stim[47] = 11'h264;
    stim[48] = 11'h346;
    stim[49] = 11'h1a9;
    stim[50] = 11'h1a9;
    stim[51] = 11'h070;
    stim[52] = 11'h14f;
    stim[53] = 11'h2fc;
    stim[54] = 11'h32e;
    stim[55] = 11'h14d;
    stim[56] = 11'h13d;
    stim[57] = 11'h3a3;
    stim[58] = 11'h156;
    stim[59] = 11'h1ec;
    stim[60] = 11'h0f1;
    stim[61] = 11'h187;
    stim[62] = 11'h02f;
    stim[63] = 11'h234;
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
      expv[0] = 1'hx;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h1;
      expv[10] = 1'h0;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h0;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
