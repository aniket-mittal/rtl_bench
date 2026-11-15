// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_099473 dut (
    .Clk(clk),
    .Reset(in_vec[10:10]),
    .player_health(in_vec[9:0]),
    .player_digit_1(out_vec[7:4]),
    .player_digit_2(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h7d6;
    stim[1] = 11'h53b;
    stim[2] = 11'h1a6;
    stim[3] = 11'h1dc;
    stim[4] = 11'h091;
    stim[5] = 11'h38b;
    stim[6] = 11'h09c;
    stim[7] = 11'h2b7;
    stim[8] = 11'h23f;
    stim[9] = 11'h2bd;
    stim[10] = 11'h103;
    stim[11] = 11'h047;
    stim[12] = 11'h1a2;
    stim[13] = 11'h116;
    stim[14] = 11'h689;
    stim[15] = 11'h1f1;
    stim[16] = 11'h32f;
    stim[17] = 11'h0fa;
    stim[18] = 11'h3ee;
    stim[19] = 11'h0a9;
    stim[20] = 11'h24d;
    stim[21] = 11'h366;
    stim[22] = 11'h13a;
    stim[23] = 11'h225;
    stim[24] = 11'h383;
    stim[25] = 11'h04f;
    stim[26] = 11'h043;
    stim[27] = 11'h397;
    stim[28] = 11'h059;
    stim[29] = 11'h3ed;
    stim[30] = 11'h1c9;
    stim[31] = 11'h3ee;
    stim[32] = 11'h2bf;
    stim[33] = 11'h23f;
    stim[34] = 11'h299;
    stim[35] = 11'h1e4;
    stim[36] = 11'h172;
    stim[37] = 11'h28e;
    stim[38] = 11'h01d;
    stim[39] = 11'h23d;
    stim[40] = 11'h1a3;
    stim[41] = 11'h25d;
    stim[42] = 11'h315;
    stim[43] = 11'h3fd;
    stim[44] = 11'h251;
    stim[45] = 11'h249;
    stim[46] = 11'h38d;
    stim[47] = 11'h0f5;
    stim[48] = 11'h0fa;
    stim[49] = 11'h051;
    stim[50] = 11'h272;
    stim[51] = 11'h040;
    stim[52] = 11'h39c;
    stim[53] = 11'h246;
    stim[54] = 11'h7a7;
    stim[55] = 11'h374;
    stim[56] = 11'h0ba;
    stim[57] = 11'h2c0;
    stim[58] = 11'h089;
    stim[59] = 11'h3d7;
    stim[60] = 11'h3cc;
    stim[61] = 11'h206;
    stim[62] = 11'h275;
    stim[63] = 11'h13e;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
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
