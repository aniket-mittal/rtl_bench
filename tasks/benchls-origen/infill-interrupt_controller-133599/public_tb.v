// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_133599 dut (
    .clk(clk),
    .rst(in_vec[41:41]),
    .int_signals(in_vec[40:33]),
    .int_enables(in_vec[32:25]),
    .pri(in_vec[24:1]),
    .ack(in_vec[0:0]),
    .intout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h38def6930fc;
    stim[1] = 42'h2adbba09d29;
    stim[2] = 42'h05786c7769c;
    stim[3] = 42'h1c90495b101;
    stim[4] = 42'h0c902357e03;
    stim[5] = 42'h1084ecfc84e;
    stim[6] = 42'h189e4a920c5;
    stim[7] = 42'h19f9a732713;
    stim[8] = 42'h0dde7c5dfe6;
    stim[9] = 42'h07c36812a57;
    stim[10] = 42'h1e4fe0289f9;
    stim[11] = 42'h156d7d53573;
    stim[12] = 42'h0b8371490b6;
    stim[13] = 42'h193348b953c;
    stim[14] = 42'h01dd04755c2;
    stim[15] = 42'h086ae69f97f;
    stim[16] = 42'h05d260ec247;
    stim[17] = 42'h0b6bbfbc3eb;
    stim[18] = 42'h0e2c852de9c;
    stim[19] = 42'h0a8b12c1612;
    stim[20] = 42'h0795414988b;
    stim[21] = 42'h00c71ba3f47;
    stim[22] = 42'h0873cdb77f9;
    stim[23] = 42'h148e75de67a;
    stim[24] = 42'h1530749db46;
    stim[25] = 42'h03a9cf4393a;
    stim[26] = 42'h1bf6d8afff0;
    stim[27] = 42'h02e17524557;
    stim[28] = 42'h0e4a21e1c61;
    stim[29] = 42'h1d0cbd03753;
    stim[30] = 42'h0ba773fde34;
    stim[31] = 42'h0e4b116e1ec;
    stim[32] = 42'h0c00eddc3b1;
    stim[33] = 42'h02269e32693;
    stim[34] = 42'h19fe92c28e8;
    stim[35] = 42'h18e24a55b5d;
    stim[36] = 42'h00688d31709;
    stim[37] = 42'h14e0f897aa7;
    stim[38] = 42'h1f865ccff17;
    stim[39] = 42'h0d45eeb7848;
    stim[40] = 42'h1a5c1e963ac;
    stim[41] = 42'h10af0925f34;
    stim[42] = 42'h0d9394ca972;
    stim[43] = 42'h1fcad53050d;
    stim[44] = 42'h17391f0a529;
    stim[45] = 42'h11969efdf35;
    stim[46] = 42'h02a453c3abb;
    stim[47] = 42'h0f8eae009a6;
    stim[48] = 42'h3073b3663da;
    stim[49] = 42'h0dc0d2b28e0;
    stim[50] = 42'h15998b0c0a9;
    stim[51] = 42'h131082e8f34;
    stim[52] = 42'h13f4728d5a6;
    stim[53] = 42'h11bc045addf;
    stim[54] = 42'h00885fb04aa;
    stim[55] = 42'h1ced0d911d7;
    stim[56] = 42'h102e78217bf;
    stim[57] = 42'h1954f41decb;
    stim[58] = 42'h0e5e5a2f766;
    stim[59] = 42'h0662023b22a;
    stim[60] = 42'h165a67625db;
    stim[61] = 42'h14bf83122c8;
    stim[62] = 42'h142712f82f5;
    stim[63] = 42'h02e02e485c8;
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
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h0;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
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
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h0;
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
      expv[34] = 1'h0;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h0;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h1;
      expv[43] = 1'h0;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h1;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h0;
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
