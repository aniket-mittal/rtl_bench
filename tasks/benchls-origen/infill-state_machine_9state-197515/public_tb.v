// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_197515 dut (
    .KEY(clk),
    .SW(in_vec[9:0]),
    .LEDR(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h1f0;
    stim[1] = 10'h073;
    stim[2] = 10'h0ba;
    stim[3] = 10'h1f6;
    stim[4] = 10'h01c;
    stim[5] = 10'h1d4;
    stim[6] = 10'h1cd;
    stim[7] = 10'h016;
    stim[8] = 10'h291;
    stim[9] = 10'h369;
    stim[10] = 10'h2e0;
    stim[11] = 10'h0aa;
    stim[12] = 10'h076;
    stim[13] = 10'h059;
    stim[14] = 10'h200;
    stim[15] = 10'h197;
    stim[16] = 10'h3df;
    stim[17] = 10'h3d4;
    stim[18] = 10'h2fc;
    stim[19] = 10'h12c;
    stim[20] = 10'h2d6;
    stim[21] = 10'h243;
    stim[22] = 10'h025;
    stim[23] = 10'h33b;
    stim[24] = 10'h3dd;
    stim[25] = 10'h109;
    stim[26] = 10'h383;
    stim[27] = 10'h154;
    stim[28] = 10'h197;
    stim[29] = 10'h13b;
    stim[30] = 10'h0e6;
    stim[31] = 10'h03b;
    stim[32] = 10'h132;
    stim[33] = 10'h027;
    stim[34] = 10'h008;
    stim[35] = 10'h162;
    stim[36] = 10'h26d;
    stim[37] = 10'h1f9;
    stim[38] = 10'h290;
    stim[39] = 10'h124;
    stim[40] = 10'h026;
    stim[41] = 10'h268;
    stim[42] = 10'h181;
    stim[43] = 10'h006;
    stim[44] = 10'h318;
    stim[45] = 10'h184;
    stim[46] = 10'h195;
    stim[47] = 10'h01c;
    stim[48] = 10'h0e8;
    stim[49] = 10'h18f;
    stim[50] = 10'h287;
    stim[51] = 10'h034;
    stim[52] = 10'h0e0;
    stim[53] = 10'h01c;
    stim[54] = 10'h0c8;
    stim[55] = 10'h230;
    stim[56] = 10'h312;
    stim[57] = 10'h152;
    stim[58] = 10'h15a;
    stim[59] = 10'h210;
    stim[60] = 10'h37e;
    stim[61] = 10'h1c9;
    stim[62] = 10'h19d;
    stim[63] = 10'h01c;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h001;
      expv[2] = 10'h001;
      expv[3] = 10'h002;
      expv[4] = 10'h004;
      expv[5] = 10'h002;
      expv[6] = 10'h001;
      expv[7] = 10'h001;
      expv[8] = 10'h001;
      expv[9] = 10'h001;
      expv[10] = 10'h001;
      expv[11] = 10'h001;
      expv[12] = 10'h002;
      expv[13] = 10'h001;
      expv[14] = 10'h001;
      expv[15] = 10'h001;
      expv[16] = 10'h001;
      expv[17] = 10'h001;
      expv[18] = 10'h001;
      expv[19] = 10'h001;
      expv[20] = 10'h001;
      expv[21] = 10'h001;
      expv[22] = 10'h001;
      expv[23] = 10'h001;
      expv[24] = 10'h001;
      expv[25] = 10'h001;
      expv[26] = 10'h001;
      expv[27] = 10'h001;
      expv[28] = 10'h001;
      expv[29] = 10'h001;
      expv[30] = 10'h001;
      expv[31] = 10'h001;
      expv[32] = 10'h001;
      expv[33] = 10'h001;
      expv[34] = 10'h001;
      expv[35] = 10'h001;
      expv[36] = 10'h001;
      expv[37] = 10'h001;
      expv[38] = 10'h001;
      expv[39] = 10'h001;
      expv[40] = 10'h001;
      expv[41] = 10'h002;
      expv[42] = 10'h001;
      expv[43] = 10'h001;
      expv[44] = 10'h002;
      expv[45] = 10'h001;
      expv[46] = 10'h001;
      expv[47] = 10'h001;
      expv[48] = 10'h001;
      expv[49] = 10'h001;
      expv[50] = 10'h001;
      expv[51] = 10'h001;
      expv[52] = 10'h001;
      expv[53] = 10'h001;
      expv[54] = 10'h001;
      expv[55] = 10'h001;
      expv[56] = 10'h001;
      expv[57] = 10'h002;
      expv[58] = 10'h004;
      expv[59] = 10'h008;
      expv[60] = 10'h004;
      expv[61] = 10'h001;
      expv[62] = 10'h001;
      expv[63] = 10'h001;
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
