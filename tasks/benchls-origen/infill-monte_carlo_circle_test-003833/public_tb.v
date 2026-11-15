// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_003833 dut (
    .clk(clk),
    .rst(in_vec[33:33]),
    .rand_num(in_vec[32:1]),
    .rand_valid(in_vec[0:0]),
    .op_lt_1_out(out_vec[1:1]),
    .coord_valid_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h2f70f75dc;
    stim[1] = 34'h332e1bd05;
    stim[2] = 34'h020f0172f;
    stim[3] = 34'h07797e2d1;
    stim[4] = 34'h1a100ad65;
    stim[5] = 34'h14325202b;
    stim[6] = 34'h0c69a102c;
    stim[7] = 34'h1082bc13d;
    stim[8] = 34'h090475ce9;
    stim[9] = 34'h1c0e8b620;
    stim[10] = 34'h09a40305a;
    stim[11] = 34'h1fc3c5b7e;
    stim[12] = 34'h1cbf94237;
    stim[13] = 34'h1ebe57705;
    stim[14] = 34'h17b5ac991;
    stim[15] = 34'h0da931f6a;
    stim[16] = 34'h19ca0521e;
    stim[17] = 34'h03885151f;
    stim[18] = 34'h08f417c29;
    stim[19] = 34'h1888bfa74;
    stim[20] = 34'h1f4577739;
    stim[21] = 34'h1c8d67ef7;
    stim[22] = 34'h138b227b1;
    stim[23] = 34'h1c6c16120;
    stim[24] = 34'h0937685ee;
    stim[25] = 34'h15fc45dda;
    stim[26] = 34'h086d71b4f;
    stim[27] = 34'h064686ead;
    stim[28] = 34'h004f818bd;
    stim[29] = 34'h01d94a745;
    stim[30] = 34'h0e3943763;
    stim[31] = 34'h1cf8b41a3;
    stim[32] = 34'h07df5f51d;
    stim[33] = 34'h04faaaca5;
    stim[34] = 34'h1739fd8df;
    stim[35] = 34'h08665618a;
    stim[36] = 34'h0c61ab3be;
    stim[37] = 34'h0fe002965;
    stim[38] = 34'h18642b0b2;
    stim[39] = 34'h0c470dab5;
    stim[40] = 34'h1fd65c040;
    stim[41] = 34'h1c42a8c24;
    stim[42] = 34'h037487fef;
    stim[43] = 34'h18fb60867;
    stim[44] = 34'h0a0f0ab6b;
    stim[45] = 34'h03b9255c9;
    stim[46] = 34'h35b0869c4;
    stim[47] = 34'h13e98d78e;
    stim[48] = 34'h05019e18a;
    stim[49] = 34'h140437a27;
    stim[50] = 34'h169a28b8b;
    stim[51] = 34'h0b8eb4c28;
    stim[52] = 34'h175d0d892;
    stim[53] = 34'h0d0d83c54;
    stim[54] = 34'h178287795;
    stim[55] = 34'h0421d276e;
    stim[56] = 34'h12856a72a;
    stim[57] = 34'h1fd284984;
    stim[58] = 34'h0a2ca9e4c;
    stim[59] = 34'h143f074ac;
    stim[60] = 34'h0cd63200d;
    stim[61] = 34'h0446677f9;
    stim[62] = 34'h04f7c3304;
    stim[63] = 34'h0b6cff397;
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
      expv[0] = 2'h0;
      expv[1] = 2'h0;
      expv[2] = 2'h0;
      expv[3] = 2'h2;
      expv[4] = 2'h2;
      expv[5] = 2'h2;
      expv[6] = 2'h3;
      expv[7] = 2'h0;
      expv[8] = 2'h3;
      expv[9] = 2'h2;
      expv[10] = 2'h2;
      expv[11] = 2'h3;
      expv[12] = 2'h2;
      expv[13] = 2'h2;
      expv[14] = 2'h2;
      expv[15] = 2'h2;
      expv[16] = 2'h1;
      expv[17] = 2'h0;
      expv[18] = 2'h0;
      expv[19] = 2'h0;
      expv[20] = 2'h1;
      expv[21] = 2'h2;
      expv[22] = 2'h2;
      expv[23] = 2'h3;
      expv[24] = 2'h2;
      expv[25] = 2'h3;
      expv[26] = 2'h2;
      expv[27] = 2'h2;
      expv[28] = 2'h2;
      expv[29] = 2'h2;
      expv[30] = 2'h3;
      expv[31] = 2'h2;
      expv[32] = 2'h3;
      expv[33] = 2'h0;
      expv[34] = 2'h1;
      expv[35] = 2'h0;
      expv[36] = 2'h3;
      expv[37] = 2'h2;
      expv[38] = 2'h0;
      expv[39] = 2'h0;
      expv[40] = 2'h1;
      expv[41] = 2'h0;
      expv[42] = 2'h0;
      expv[43] = 2'h0;
      expv[44] = 2'h0;
      expv[45] = 2'h1;
      expv[46] = 2'h0;
      expv[47] = 2'h0;
      expv[48] = 2'h2;
      expv[49] = 2'h2;
      expv[50] = 2'h2;
      expv[51] = 2'h2;
      expv[52] = 2'h2;
      expv[53] = 2'h3;
      expv[54] = 2'h2;
      expv[55] = 2'h2;
      expv[56] = 2'h2;
      expv[57] = 2'h2;
      expv[58] = 2'h2;
      expv[59] = 2'h2;
      expv[60] = 2'h2;
      expv[61] = 2'h2;
      expv[62] = 2'h2;
      expv[63] = 2'h3;
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
