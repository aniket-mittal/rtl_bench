// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 46;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06486 dut (
    .clk(clk),
    .addr(in_vec[4:0]),
    .ph(out_vec[45:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h04;
    stim[1] = 5'h08;
    stim[2] = 5'h1b;
    stim[3] = 5'h16;
    stim[4] = 5'h0d;
    stim[5] = 5'h0e;
    stim[6] = 5'h0e;
    stim[7] = 5'h0a;
    stim[8] = 5'h0a;
    stim[9] = 5'h00;
    stim[10] = 5'h02;
    stim[11] = 5'h15;
    stim[12] = 5'h16;
    stim[13] = 5'h0f;
    stim[14] = 5'h08;
    stim[15] = 5'h13;
    stim[16] = 5'h09;
    stim[17] = 5'h08;
    stim[18] = 5'h02;
    stim[19] = 5'h00;
    stim[20] = 5'h04;
    stim[21] = 5'h18;
    stim[22] = 5'h1e;
    stim[23] = 5'h1b;
    stim[24] = 5'h03;
    stim[25] = 5'h1e;
    stim[26] = 5'h09;
    stim[27] = 5'h16;
    stim[28] = 5'h10;
    stim[29] = 5'h09;
    stim[30] = 5'h19;
    stim[31] = 5'h05;
    stim[32] = 5'h12;
    stim[33] = 5'h1b;
    stim[34] = 5'h1b;
    stim[35] = 5'h1a;
    stim[36] = 5'h0f;
    stim[37] = 5'h12;
    stim[38] = 5'h0b;
    stim[39] = 5'h13;
    stim[40] = 5'h02;
    stim[41] = 5'h10;
    stim[42] = 5'h15;
    stim[43] = 5'h1f;
    stim[44] = 5'h17;
    stim[45] = 5'h00;
    stim[46] = 5'h0e;
    stim[47] = 5'h0e;
    stim[48] = 5'h1d;
    stim[49] = 5'h0e;
    stim[50] = 5'h07;
    stim[51] = 5'h11;
    stim[52] = 5'h1d;
    stim[53] = 5'h19;
    stim[54] = 5'h11;
    stim[55] = 5'h08;
    stim[56] = 5'h19;
    stim[57] = 5'h06;
    stim[58] = 5'h11;
    stim[59] = 5'h1e;
    stim[60] = 5'h19;
    stim[61] = 5'h02;
    stim[62] = 5'h06;
    stim[63] = 5'h08;
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
      expv[0] = 46'hxxxxxxxxxxxx;
      expv[1] = 46'h07040c0ba369;
      expv[2] = 46'h070e01cae377;
      expv[3] = 46'h2826ad761c9a;
      expv[4] = 46'h1c2057155597;
      expv[5] = 46'h121511271f2a;
      expv[6] = 46'h121515b7e946;
      expv[7] = 46'h121515b7e946;
      expv[8] = 46'h070f1863c27a;
      expv[9] = 46'h070f1863c27a;
      expv[10] = 46'h0609110aaa52;
      expv[11] = 46'h060d04c8b360;
      expv[12] = 46'h133b5ad7950f;
      expv[13] = 46'h1c2057155597;
      expv[14] = 46'h123808656b79;
      expv[15] = 46'h070e01cae377;
      expv[16] = 46'h13330b7aed81;
      expv[17] = 46'h070e14e1d6a6;
      expv[18] = 46'h070e01cae377;
      expv[19] = 46'h060d04c8b360;
      expv[20] = 46'h0609110aaa52;
      expv[21] = 46'h07040c0ba369;
      expv[22] = 46'h1c2d68b08419;
      expv[23] = 46'h2d74fb784ca1;
      expv[24] = 46'h2826ad761c9a;
      expv[25] = 46'h070400cb1372;
      expv[26] = 46'h2d74fb784ca1;
      expv[27] = 46'h070e14e1d6a6;
      expv[28] = 46'h1c2057155597;
      expv[29] = 46'h123908ae52ef;
      expv[30] = 46'h070e14e1d6a6;
      expv[31] = 46'h1d26647a4492;
      expv[32] = 46'h070509880b7a;
      expv[33] = 46'h133207a82ebf;
      expv[34] = 46'h2826ad761c9a;
      expv[35] = 46'h2826ad761c9a;
      expv[36] = 46'h1d2ea5940d23;
      expv[37] = 46'h123808656b79;
      expv[38] = 46'h133207a82ebf;
      expv[39] = 46'h070f1ce6b277;
      expv[40] = 46'h13330b7aed81;
      expv[41] = 46'h060d04c8b360;
      expv[42] = 46'h123908ae52ef;
      expv[43] = 46'h133b5ad7950f;
      expv[44] = 46'h39bc7b9e1da7;
      expv[45] = 46'h1c2157df54bb;
      expv[46] = 46'h0609110aaa52;
      expv[47] = 46'h121515b7e946;
      expv[48] = 46'h121515b7e946;
      expv[49] = 46'h297d323395a0;
      expv[50] = 46'h121515b7e946;
      expv[51] = 46'h0707054b8bfc;
      expv[52] = 46'h123b076816b1;
      expv[53] = 46'h297d323395a0;
      expv[54] = 46'h1d26647a4492;
      expv[55] = 46'h123b076816b1;
      expv[56] = 46'h070e01cae377;
      expv[57] = 46'h1d26647a4492;
      expv[58] = 46'h07050d89335a;
      expv[59] = 46'h123b076816b1;
      expv[60] = 46'h2d74fb784ca1;
      expv[61] = 46'h1d26647a4492;
      expv[62] = 46'h060d04c8b360;
      expv[63] = 46'h07050d89335a;
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
