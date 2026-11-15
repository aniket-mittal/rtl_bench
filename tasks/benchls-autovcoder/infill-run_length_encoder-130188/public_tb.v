// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_130188 dut (
    .clk(clk),
    .reset(in_vec[17:17]),
    .audio_sample(in_vec[16:1]),
    .valid_in(in_vec[0:0]),
    .compressed_data(out_vec[16:1]),
    .valid_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h36574;
    stim[1] = 18'h3844c;
    stim[2] = 18'h1a0cd;
    stim[3] = 18'h1c9eb;
    stim[4] = 18'h0b7ba;
    stim[5] = 18'h0f9c9;
    stim[6] = 18'h1a64f;
    stim[7] = 18'h1a7b4;
    stim[8] = 18'h016b4;
    stim[9] = 18'h19d1a;
    stim[10] = 18'h1a32e;
    stim[11] = 18'h0dc89;
    stim[12] = 18'h159b9;
    stim[13] = 18'h07c4e;
    stim[14] = 18'h1528f;
    stim[15] = 18'h06463;
    stim[16] = 18'h19d27;
    stim[17] = 18'h1a06a;
    stim[18] = 18'h0e8e0;
    stim[19] = 18'h0ce50;
    stim[20] = 18'h393dd;
    stim[21] = 18'h03d93;
    stim[22] = 18'h05e16;
    stim[23] = 18'h0c69a;
    stim[24] = 18'h0939f;
    stim[25] = 18'h1f9f9;
    stim[26] = 18'h05aa0;
    stim[27] = 18'h038d9;
    stim[28] = 18'h1b019;
    stim[29] = 18'h038f8;
    stim[30] = 18'h1ed53;
    stim[31] = 18'h0ccc4;
    stim[32] = 18'h0da90;
    stim[33] = 18'h0f57c;
    stim[34] = 18'h07893;
    stim[35] = 18'h01a15;
    stim[36] = 18'h11cf0;
    stim[37] = 18'h07e5c;
    stim[38] = 18'h14c9b;
    stim[39] = 18'h1f95c;
    stim[40] = 18'h0cb50;
    stim[41] = 18'h110b9;
    stim[42] = 18'h06f98;
    stim[43] = 18'h05f97;
    stim[44] = 18'h18630;
    stim[45] = 18'h086e0;
    stim[46] = 18'h0f05e;
    stim[47] = 18'h114a6;
    stim[48] = 18'h1bf2c;
    stim[49] = 18'h160ef;
    stim[50] = 18'h19e3f;
    stim[51] = 18'h1f5bf;
    stim[52] = 18'h062a3;
    stim[53] = 18'h0d77a;
    stim[54] = 18'h03290;
    stim[55] = 18'h0d4ac;
    stim[56] = 18'h15e05;
    stim[57] = 18'h1d1ac;
    stim[58] = 18'h1bda1;
    stim[59] = 18'h14c2b;
    stim[60] = 18'h0f7dd;
    stim[61] = 18'h14ec0;
    stim[62] = 18'h17e60;
    stim[63] = 18'h18dae;
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
      expv[0] = 17'hxxxxx;
      expv[1] = 17'hxxxxx;
      expv[2] = 17'hxxxxx;
      expv[3] = 17'hxxxxx;
      expv[4] = 17'hxxxxx;
      expv[5] = 17'hxxxxx;
      expv[6] = 17'hxxxxx;
      expv[7] = 17'h1a0cd;
      expv[8] = 17'h1a0cc;
      expv[9] = 17'h1a0cc;
      expv[10] = 17'h1a0cc;
      expv[11] = 17'h1a0cc;
      expv[12] = 17'h1a0cc;
      expv[13] = 17'h0f9c9;
      expv[14] = 17'h0f9c8;
      expv[15] = 17'h0f9c8;
      expv[16] = 17'h0dc89;
      expv[17] = 17'h0dc88;
      expv[18] = 17'h0dc88;
      expv[19] = 17'h0dc88;
      expv[20] = 17'h0dc88;
      expv[21] = 17'h0dc88;
      expv[22] = 17'h0dc88;
      expv[23] = 17'h1528f;
      expv[24] = 17'h1528e;
      expv[25] = 17'h1528e;
      expv[26] = 17'h03d93;
      expv[27] = 17'h03d92;
      expv[28] = 17'h03d92;
      expv[29] = 17'h0939f;
      expv[30] = 17'h0939e;
      expv[31] = 17'h0939e;
      expv[32] = 17'h038d9;
      expv[33] = 17'h038d8;
      expv[34] = 17'h038d8;
      expv[35] = 17'h038d8;
      expv[36] = 17'h1ed53;
      expv[37] = 17'h1ed52;
      expv[38] = 17'h1ed52;
      expv[39] = 17'h1ed52;
      expv[40] = 17'h07893;
      expv[41] = 17'h07892;
      expv[42] = 17'h07892;
      expv[43] = 17'h14c9b;
      expv[44] = 17'h14c9a;
      expv[45] = 17'h14c9a;
      expv[46] = 17'h14c9a;
      expv[47] = 17'h14c9a;
      expv[48] = 17'h14c9a;
      expv[49] = 17'h14c9a;
      expv[50] = 17'h14c9a;
      expv[51] = 17'h110b9;
      expv[52] = 17'h110b8;
      expv[53] = 17'h110b8;
      expv[54] = 17'h160ef;
      expv[55] = 17'h160ee;
      expv[56] = 17'h160ee;
      expv[57] = 17'h160ee;
      expv[58] = 17'h062a3;
      expv[59] = 17'h062a2;
      expv[60] = 17'h062a2;
      expv[61] = 17'h15e05;
      expv[62] = 17'h15e04;
      expv[63] = 17'h15e04;
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
