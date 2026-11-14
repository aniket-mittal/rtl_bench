// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .clk(clk),
    .d(in_vec[8:1]),
    .areset(in_vec[0:0]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h1ed;
    stim[1] = 9'h1b7;
    stim[2] = 9'h1b2;
    stim[3] = 9'h0d8;
    stim[4] = 9'h148;
    stim[5] = 9'h044;
    stim[6] = 9'h00e;
    stim[7] = 9'h060;
    stim[8] = 9'h1d4;
    stim[9] = 9'h0e4;
    stim[10] = 9'h0e2;
    stim[11] = 9'h052;
    stim[12] = 9'h0ae;
    stim[13] = 9'h1f0;
    stim[14] = 9'h1de;
    stim[15] = 9'h046;
    stim[16] = 9'h130;
    stim[17] = 9'h1a6;
    stim[18] = 9'h15c;
    stim[19] = 9'h0f2;
    stim[20] = 9'h1ea;
    stim[21] = 9'h1ba;
    stim[22] = 9'h090;
    stim[23] = 9'h0d6;
    stim[24] = 9'h14a;
    stim[25] = 9'h0aa;
    stim[26] = 9'h0de;
    stim[27] = 9'h15c;
    stim[28] = 9'h0d2;
    stim[29] = 9'h148;
    stim[30] = 9'h13c;
    stim[31] = 9'h158;
    stim[32] = 9'h150;
    stim[33] = 9'h122;
    stim[34] = 9'h018;
    stim[35] = 9'h142;
    stim[36] = 9'h14e;
    stim[37] = 9'h0ce;
    stim[38] = 9'h162;
    stim[39] = 9'h06e;
    stim[40] = 9'h03c;
    stim[41] = 9'h1c2;
    stim[42] = 9'h06c;
    stim[43] = 9'h0f8;
    stim[44] = 9'h050;
    stim[45] = 9'h046;
    stim[46] = 9'h098;
    stim[47] = 9'h1ba;
    stim[48] = 9'h142;
    stim[49] = 9'h056;
    stim[50] = 9'h06a;
    stim[51] = 9'h178;
    stim[52] = 9'h006;
    stim[53] = 9'h076;
    stim[54] = 9'h0bc;
    stim[55] = 9'h13a;
    stim[56] = 9'h030;
    stim[57] = 9'h16e;
    stim[58] = 9'h0d2;
    stim[59] = 9'h1b0;
    stim[60] = 9'h0d0;
    stim[61] = 9'h100;
    stim[62] = 9'h0d6;
    stim[63] = 9'h09a;
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
      expv[0] = 8'hf6;
      expv[1] = 8'hf6;
      expv[2] = 8'hdb;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h00;
      expv[6] = 8'h00;
      expv[7] = 8'h00;
      expv[8] = 8'h00;
      expv[9] = 8'h00;
      expv[10] = 8'h00;
      expv[11] = 8'h00;
      expv[12] = 8'h00;
      expv[13] = 8'h00;
      expv[14] = 8'h00;
      expv[15] = 8'h00;
      expv[16] = 8'h00;
      expv[17] = 8'h00;
      expv[18] = 8'h00;
      expv[19] = 8'h00;
      expv[20] = 8'h00;
      expv[21] = 8'h00;
      expv[22] = 8'h00;
      expv[23] = 8'h00;
      expv[24] = 8'h00;
      expv[25] = 8'h00;
      expv[26] = 8'h00;
      expv[27] = 8'h00;
      expv[28] = 8'h00;
      expv[29] = 8'h00;
      expv[30] = 8'h00;
      expv[31] = 8'h00;
      expv[32] = 8'h00;
      expv[33] = 8'h00;
      expv[34] = 8'h00;
      expv[35] = 8'h00;
      expv[36] = 8'h00;
      expv[37] = 8'h00;
      expv[38] = 8'h00;
      expv[39] = 8'h00;
      expv[40] = 8'h00;
      expv[41] = 8'h00;
      expv[42] = 8'h00;
      expv[43] = 8'h00;
      expv[44] = 8'h00;
      expv[45] = 8'h00;
      expv[46] = 8'h00;
      expv[47] = 8'h00;
      expv[48] = 8'h00;
      expv[49] = 8'h00;
      expv[50] = 8'h00;
      expv[51] = 8'h00;
      expv[52] = 8'h00;
      expv[53] = 8'h00;
      expv[54] = 8'h00;
      expv[55] = 8'h00;
      expv[56] = 8'h00;
      expv[57] = 8'h00;
      expv[58] = 8'h00;
      expv[59] = 8'h00;
      expv[60] = 8'h00;
      expv[61] = 8'h00;
      expv[62] = 8'h00;
      expv[63] = 8'h00;
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
