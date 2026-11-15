// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10431 dut (
    .CLK(clk),
    .INP(in_vec[16:9]),
    .INN(in_vec[8:1]),
    .PWRDN(in_vec[0:0]),
    .GREATER(out_vec[1:1]),
    .EQUAL(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h0cf9a;
    stim[1] = 17'h14c70;
    stim[2] = 17'h0e58b;
    stim[3] = 17'h075b4;
    stim[4] = 17'h0b7b6;
    stim[5] = 17'h09246;
    stim[6] = 17'h0d373;
    stim[7] = 17'h02725;
    stim[8] = 17'h084a4;
    stim[9] = 17'h1c445;
    stim[10] = 17'h12736;
    stim[11] = 17'h028e6;
    stim[12] = 17'h1d116;
    stim[13] = 17'h1f523;
    stim[14] = 17'h0e325;
    stim[15] = 17'h017ac;
    stim[16] = 17'h15370;
    stim[17] = 17'h0a6b4;
    stim[18] = 17'h13692;
    stim[19] = 17'h0e022;
    stim[20] = 17'h0effa;
    stim[21] = 17'h08261;
    stim[22] = 17'h18390;
    stim[23] = 17'h1b070;
    stim[24] = 17'h130fe;
    stim[25] = 17'h0f8df;
    stim[26] = 17'h1bd9c;
    stim[27] = 17'h16a67;
    stim[28] = 17'h1ec22;
    stim[29] = 17'h0523b;
    stim[30] = 17'h0d0df;
    stim[31] = 17'h13d02;
    stim[32] = 17'h1beb3;
    stim[33] = 17'h07665;
    stim[34] = 17'h045f0;
    stim[35] = 17'h15969;
    stim[36] = 17'h00d20;
    stim[37] = 17'h12fc8;
    stim[38] = 17'h19027;
    stim[39] = 17'h03b58;
    stim[40] = 17'h1b039;
    stim[41] = 17'h0144b;
    stim[42] = 17'h1b589;
    stim[43] = 17'h194f6;
    stim[44] = 17'h0f7a3;
    stim[45] = 17'h0b3b1;
    stim[46] = 17'h04b32;
    stim[47] = 17'h0a97c;
    stim[48] = 17'h16a99;
    stim[49] = 17'h10c39;
    stim[50] = 17'h14677;
    stim[51] = 17'h180bf;
    stim[52] = 17'h1961c;
    stim[53] = 17'h12c6c;
    stim[54] = 17'h1ec7f;
    stim[55] = 17'h1bc49;
    stim[56] = 17'h1bbbc;
    stim[57] = 17'h08e4d;
    stim[58] = 17'h07aac;
    stim[59] = 17'h02d96;
    stim[60] = 17'h1d805;
    stim[61] = 17'h11f10;
    stim[62] = 17'h1e242;
    stim[63] = 17'h01c2f;
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
      expv[2] = 2'h2;
      expv[3] = 2'h0;
      expv[4] = 2'h0;
      expv[5] = 2'h0;
      expv[6] = 2'h2;
      expv[7] = 2'h0;
      expv[8] = 2'h0;
      expv[9] = 2'h0;
      expv[10] = 2'h2;
      expv[11] = 2'h0;
      expv[12] = 2'h0;
      expv[13] = 2'h2;
      expv[14] = 2'h2;
      expv[15] = 2'h0;
      expv[16] = 2'h0;
      expv[17] = 2'h0;
      expv[18] = 2'h0;
      expv[19] = 2'h2;
      expv[20] = 2'h2;
      expv[21] = 2'h0;
      expv[22] = 2'h2;
      expv[23] = 2'h0;
      expv[24] = 2'h2;
      expv[25] = 2'h2;
      expv[26] = 2'h2;
      expv[27] = 2'h2;
      expv[28] = 2'h2;
      expv[29] = 2'h2;
      expv[30] = 2'h2;
      expv[31] = 2'h0;
      expv[32] = 2'h2;
      expv[33] = 2'h2;
      expv[34] = 2'h2;
      expv[35] = 2'h0;
      expv[36] = 2'h0;
      expv[37] = 2'h0;
      expv[38] = 2'h0;
      expv[39] = 2'h2;
      expv[40] = 2'h0;
      expv[41] = 2'h2;
      expv[42] = 2'h0;
      expv[43] = 2'h2;
      expv[44] = 2'h2;
      expv[45] = 2'h0;
      expv[46] = 2'h0;
      expv[47] = 2'h0;
      expv[48] = 2'h0;
      expv[49] = 2'h2;
      expv[50] = 2'h2;
      expv[51] = 2'h2;
      expv[52] = 2'h2;
      expv[53] = 2'h2;
      expv[54] = 2'h2;
      expv[55] = 2'h2;
      expv[56] = 2'h2;
      expv[57] = 2'h0;
      expv[58] = 2'h2;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h2;
      expv[62] = 2'h2;
      expv[63] = 2'h2;
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
