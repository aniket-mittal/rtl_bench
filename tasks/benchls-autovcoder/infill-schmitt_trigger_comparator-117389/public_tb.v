// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 50;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_117389 dut (
    .Clk(clk),
    .nReset(in_vec[49:49]),
    .Input(in_vec[48:33]),
    .Level(in_vec[32:17]),
    .Hyst(in_vec[16:1]),
    .Slope(in_vec[0:0]),
    .Output(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 50'h3785cb281d86d;
    stim[1] = 50'h3fa4ba25525d4;
    stim[2] = 50'h158d4ae27c9c0;
    stim[3] = 50'h103d3949cbb5a;
    stim[4] = 50'h0a90db3152197;
    stim[5] = 50'h1ae926379f366;
    stim[6] = 50'h107b00bd48f65;
    stim[7] = 50'h0e8b110e7ba96;
    stim[8] = 50'h07031bbcab577;
    stim[9] = 50'h1953685d81d68;
    stim[10] = 50'h018d053d2b832;
    stim[11] = 50'h16259594913e8;
    stim[12] = 50'h0f50d42260c9a;
    stim[13] = 50'h0d3221eb0cd7c;
    stim[14] = 50'h15becba950168;
    stim[15] = 50'h0497398e35bde;
    stim[16] = 50'h063e27b0760a0;
    stim[17] = 50'h0e39e021fcdae;
    stim[18] = 50'h0336c00d276d4;
    stim[19] = 50'h1704e8c5021ea;
    stim[20] = 50'h1038b861b532b;
    stim[21] = 50'h19e009955875b;
    stim[22] = 50'h1e510eee3775e;
    stim[23] = 50'h0e0e8be0b794d;
    stim[24] = 50'h0539ab6d82e0c;
    stim[25] = 50'h1fc5e2b0babd4;
    stim[26] = 50'h1e7959cf67a50;
    stim[27] = 50'h088197368a977;
    stim[28] = 50'h07ddb22d5396d;
    stim[29] = 50'h19f48896e672e;
    stim[30] = 50'h0c94b272d12ea;
    stim[31] = 50'h1831790b852c2;
    stim[32] = 50'h1784f84b1ace4;
    stim[33] = 50'h19af75a349709;
    stim[34] = 50'h05bef01408a00;
    stim[35] = 50'h0de61e8f2d665;
    stim[36] = 50'h11e459e3c0d77;
    stim[37] = 50'h020a637998219;
    stim[38] = 50'h1721d162e9ac7;
    stim[39] = 50'h0860ab7f4bb34;
    stim[40] = 50'h19bbffb44cba3;
    stim[41] = 50'h1b8e8f05086e4;
    stim[42] = 50'h1f405914e3d20;
    stim[43] = 50'h0faf2e896f55e;
    stim[44] = 50'h03d5d7eba40ba;
    stim[45] = 50'h1a93fdaaf5bd1;
    stim[46] = 50'h01d2fc7f85483;
    stim[47] = 50'h0c5a1597fffef;
    stim[48] = 50'h0b778ab8e7f54;
    stim[49] = 50'h055e27b297416;
    stim[50] = 50'h0452ec59cbf8b;
    stim[51] = 50'h06cdd5a56efac;
    stim[52] = 50'h125e1ba9b2225;
    stim[53] = 50'h132ae45aba904;
    stim[54] = 50'h1801e09512627;
    stim[55] = 50'h1bbfe9f733d97;
    stim[56] = 50'h0e647344ba548;
    stim[57] = 50'h17e3e8b2c4b8c;
    stim[58] = 50'h1523893810eb0;
    stim[59] = 50'h1878949b90640;
    stim[60] = 50'h016f88013d8a2;
    stim[61] = 50'h1f4aae59bd0c0;
    stim[62] = 50'h0bce17b894657;
    stim[63] = 50'h06b35bb4300b9;
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
      expv[0] = 1'h0;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h0;
      expv[5] = 1'h1;
      expv[6] = 1'h0;
      expv[7] = 1'h1;
      expv[8] = 1'h0;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h1;
      expv[23] = 1'h0;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h0;
      expv[34] = 1'h1;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h1;
      expv[40] = 1'h0;
      expv[41] = 1'h1;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h0;
      expv[51] = 1'h1;
      expv[52] = 1'h0;
      expv[53] = 1'h1;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
