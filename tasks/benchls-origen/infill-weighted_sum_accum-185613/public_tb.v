// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_185613 dut (
    .clk(clk),
    .reset_b(in_vec[9:9]),
    .start_multiply(in_vec[8:8]),
    .partial_product(in_vec[7:0]),
    .weighted_sum(out_vec[12:1]),
    .add_bias(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h137;
    stim[1] = 10'h0b3;
    stim[2] = 10'h26a;
    stim[3] = 10'h2f0;
    stim[4] = 10'h23c;
    stim[5] = 10'h3f7;
    stim[6] = 10'h3a9;
    stim[7] = 10'h317;
    stim[8] = 10'h39a;
    stim[9] = 10'h2ab;
    stim[10] = 10'h272;
    stim[11] = 10'h363;
    stim[12] = 10'h3d1;
    stim[13] = 10'h2b7;
    stim[14] = 10'h24c;
    stim[15] = 10'h3d7;
    stim[16] = 10'h380;
    stim[17] = 10'h02b;
    stim[18] = 10'h3ef;
    stim[19] = 10'h3e8;
    stim[20] = 10'h3c4;
    stim[21] = 10'h23e;
    stim[22] = 10'h26e;
    stim[23] = 10'h2e1;
    stim[24] = 10'h366;
    stim[25] = 10'h2fc;
    stim[26] = 10'h24a;
    stim[27] = 10'h2c3;
    stim[28] = 10'h288;
    stim[29] = 10'h2d7;
    stim[30] = 10'h2af;
    stim[31] = 10'h222;
    stim[32] = 10'h396;
    stim[33] = 10'h33a;
    stim[34] = 10'h38c;
    stim[35] = 10'h354;
    stim[36] = 10'h3f7;
    stim[37] = 10'h31f;
    stim[38] = 10'h2ad;
    stim[39] = 10'h33f;
    stim[40] = 10'h2b7;
    stim[41] = 10'h354;
    stim[42] = 10'h392;
    stim[43] = 10'h327;
    stim[44] = 10'h07a;
    stim[45] = 10'h3c3;
    stim[46] = 10'h346;
    stim[47] = 10'h237;
    stim[48] = 10'h346;
    stim[49] = 10'h299;
    stim[50] = 10'h3e0;
    stim[51] = 10'h390;
    stim[52] = 10'h28a;
    stim[53] = 10'h212;
    stim[54] = 10'h251;
    stim[55] = 10'h27a;
    stim[56] = 10'h251;
    stim[57] = 10'h2c9;
    stim[58] = 10'h246;
    stim[59] = 10'h27c;
    stim[60] = 10'h313;
    stim[61] = 10'h208;
    stim[62] = 10'h3f8;
    stim[63] = 10'h253;
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
      expv[0] = 13'h0000;
      expv[1] = 13'h0000;
      expv[2] = 13'h0000;
      expv[3] = 13'h0000;
      expv[4] = 13'h0000;
      expv[5] = 13'h0000;
      expv[6] = 13'h1fee;
      expv[7] = 13'h0140;
      expv[8] = 13'h016e;
      expv[9] = 13'h02a2;
      expv[10] = 13'h03f8;
      expv[11] = 13'h04dc;
      expv[12] = 13'h05a2;
      expv[13] = 13'h0744;
      expv[14] = 13'h08b2;
      expv[15] = 13'h094a;
      expv[16] = 13'h0af8;
      expv[17] = 13'h0000;
      expv[18] = 13'h0000;
      expv[19] = 13'h1fde;
      expv[20] = 13'h01ae;
      expv[21] = 13'h0336;
      expv[22] = 13'h03b2;
      expv[23] = 13'h048e;
      expv[24] = 13'h0650;
      expv[25] = 13'h071c;
      expv[26] = 13'h0914;
      expv[27] = 13'h09a8;
      expv[28] = 13'h0b2e;
      expv[29] = 13'h0c3e;
      expv[30] = 13'h0dec;
      expv[31] = 13'h0f4a;
      expv[32] = 13'h0f8e;
      expv[33] = 13'h10ba;
      expv[34] = 13'h112e;
      expv[35] = 13'h1247;
      expv[36] = 13'h00a8;
      expv[37] = 13'h0296;
      expv[38] = 13'h02d4;
      expv[39] = 13'h042e;
      expv[40] = 13'h04ac;
      expv[41] = 13'h061a;
      expv[42] = 13'h06c2;
      expv[43] = 13'h07e6;
      expv[44] = 13'h0000;
      expv[45] = 13'h0000;
      expv[46] = 13'h1f86;
      expv[47] = 13'h0012;
      expv[48] = 13'h0080;
      expv[49] = 13'h010c;
      expv[50] = 13'h023e;
      expv[51] = 13'h03fe;
      expv[52] = 13'h051e;
      expv[53] = 13'h0632;
      expv[54] = 13'h0656;
      expv[55] = 13'h06f8;
      expv[56] = 13'h07ec;
      expv[57] = 13'h088e;
      expv[58] = 13'h0a20;
      expv[59] = 13'h0aac;
      expv[60] = 13'h0ba4;
      expv[61] = 13'h0bca;
      expv[62] = 13'h0bdb;
      expv[63] = 13'h1ff0;
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
