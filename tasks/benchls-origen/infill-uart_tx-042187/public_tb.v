// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_042187 dut (
    .clockIN(clk),
    .nTxResetIN(in_vec[9:9]),
    .txDataIN(in_vec[8:1]),
    .txLoadIN(in_vec[0:0]),
    .txIdleOUT(out_vec[2:2]),
    .txReadyOUT(out_vec[1:1]),
    .txOUT(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h175;
    stim[1] = 10'h0d0;
    stim[2] = 10'h1d6;
    stim[3] = 10'h304;
    stim[4] = 10'h22e;
    stim[5] = 10'h22e;
    stim[6] = 10'h3b6;
    stim[7] = 10'h1cb;
    stim[8] = 10'h3a4;
    stim[9] = 10'h247;
    stim[10] = 10'h266;
    stim[11] = 10'h325;
    stim[12] = 10'h2b9;
    stim[13] = 10'h2f3;
    stim[14] = 10'h2c3;
    stim[15] = 10'h3f6;
    stim[16] = 10'h330;
    stim[17] = 10'h262;
    stim[18] = 10'h3fe;
    stim[19] = 10'h349;
    stim[20] = 10'h34f;
    stim[21] = 10'h3ee;
    stim[22] = 10'h25a;
    stim[23] = 10'h213;
    stim[24] = 10'h3c7;
    stim[25] = 10'h34e;
    stim[26] = 10'h2ab;
    stim[27] = 10'h369;
    stim[28] = 10'h252;
    stim[29] = 10'h2d1;
    stim[30] = 10'h332;
    stim[31] = 10'h233;
    stim[32] = 10'h384;
    stim[33] = 10'h3b1;
    stim[34] = 10'h276;
    stim[35] = 10'h201;
    stim[36] = 10'h30e;
    stim[37] = 10'h32e;
    stim[38] = 10'h3d3;
    stim[39] = 10'h3b8;
    stim[40] = 10'h2ff;
    stim[41] = 10'h340;
    stim[42] = 10'h34e;
    stim[43] = 10'h37b;
    stim[44] = 10'h26d;
    stim[45] = 10'h2fe;
    stim[46] = 10'h2d1;
    stim[47] = 10'h3c4;
    stim[48] = 10'h32f;
    stim[49] = 10'h3a5;
    stim[50] = 10'h2be;
    stim[51] = 10'h322;
    stim[52] = 10'h2f6;
    stim[53] = 10'h357;
    stim[54] = 10'h29a;
    stim[55] = 10'h2a6;
    stim[56] = 10'h269;
    stim[57] = 10'h25c;
    stim[58] = 10'h327;
    stim[59] = 10'h3d8;
    stim[60] = 10'h274;
    stim[61] = 10'h339;
    stim[62] = 10'h366;
    stim[63] = 10'h27d;
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
      expv[0] = 3'h7;
      expv[1] = 3'h7;
      expv[2] = 3'h7;
      expv[3] = 3'h7;
      expv[4] = 3'h7;
      expv[5] = 3'h7;
      expv[6] = 3'h7;
      expv[7] = 3'h7;
      expv[8] = 3'h7;
      expv[9] = 3'h7;
      expv[10] = 3'h0;
      expv[11] = 3'h0;
      expv[12] = 3'h0;
      expv[13] = 3'h0;
      expv[14] = 3'h0;
      expv[15] = 3'h0;
      expv[16] = 3'h0;
      expv[17] = 3'h0;
      expv[18] = 3'h0;
      expv[19] = 3'h0;
      expv[20] = 3'h0;
      expv[21] = 3'h0;
      expv[22] = 3'h0;
      expv[23] = 3'h0;
      expv[24] = 3'h0;
      expv[25] = 3'h0;
      expv[26] = 3'h0;
      expv[27] = 3'h0;
      expv[28] = 3'h0;
      expv[29] = 3'h0;
      expv[30] = 3'h0;
      expv[31] = 3'h0;
      expv[32] = 3'h0;
      expv[33] = 3'h0;
      expv[34] = 3'h0;
      expv[35] = 3'h0;
      expv[36] = 3'h0;
      expv[37] = 3'h0;
      expv[38] = 3'h0;
      expv[39] = 3'h0;
      expv[40] = 3'h0;
      expv[41] = 3'h0;
      expv[42] = 3'h0;
      expv[43] = 3'h0;
      expv[44] = 3'h0;
      expv[45] = 3'h0;
      expv[46] = 3'h0;
      expv[47] = 3'h0;
      expv[48] = 3'h0;
      expv[49] = 3'h0;
      expv[50] = 3'h0;
      expv[51] = 3'h0;
      expv[52] = 3'h0;
      expv[53] = 3'h0;
      expv[54] = 3'h0;
      expv[55] = 3'h0;
      expv[56] = 3'h0;
      expv[57] = 3'h0;
      expv[58] = 3'h0;
      expv[59] = 3'h0;
      expv[60] = 3'h0;
      expv[61] = 3'h0;
      expv[62] = 3'h0;
      expv[63] = 3'h0;
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
