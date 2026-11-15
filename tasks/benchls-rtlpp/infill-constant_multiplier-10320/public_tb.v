// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10320 dut (
    .clk(clk),
    .reset(in_vec[8:8]),
    .X(in_vec[7:0]),
    .Y(out_vec[19:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h16c;
    stim[1] = 9'h19f;
    stim[2] = 9'h043;
    stim[3] = 9'h0c0;
    stim[4] = 9'h085;
    stim[5] = 9'h0be;
    stim[6] = 9'h0bd;
    stim[7] = 9'h076;
    stim[8] = 9'h0bc;
    stim[9] = 9'h075;
    stim[10] = 9'h0be;
    stim[11] = 9'h02c;
    stim[12] = 9'h057;
    stim[13] = 9'h0d1;
    stim[14] = 9'h04b;
    stim[15] = 9'h0f0;
    stim[16] = 9'h094;
    stim[17] = 9'h07e;
    stim[18] = 9'h01d;
    stim[19] = 9'h0bc;
    stim[20] = 9'h067;
    stim[21] = 9'h0c0;
    stim[22] = 9'h0b4;
    stim[23] = 9'h08f;
    stim[24] = 9'h00a;
    stim[25] = 9'h020;
    stim[26] = 9'h00e;
    stim[27] = 9'h06b;
    stim[28] = 9'h035;
    stim[29] = 9'h0dc;
    stim[30] = 9'h065;
    stim[31] = 9'h047;
    stim[32] = 9'h0e3;
    stim[33] = 9'h060;
    stim[34] = 9'h05e;
    stim[35] = 9'h1df;
    stim[36] = 9'h06d;
    stim[37] = 9'h0b8;
    stim[38] = 9'h039;
    stim[39] = 9'h027;
    stim[40] = 9'h041;
    stim[41] = 9'h0a2;
    stim[42] = 9'h049;
    stim[43] = 9'h0bc;
    stim[44] = 9'h080;
    stim[45] = 9'h0a1;
    stim[46] = 9'h0b8;
    stim[47] = 9'h016;
    stim[48] = 9'h04c;
    stim[49] = 9'h036;
    stim[50] = 9'h06a;
    stim[51] = 9'h0e2;
    stim[52] = 9'h087;
    stim[53] = 9'h07a;
    stim[54] = 9'h06c;
    stim[55] = 9'h0d0;
    stim[56] = 9'h048;
    stim[57] = 9'h087;
    stim[58] = 9'h0bb;
    stim[59] = 9'h002;
    stim[60] = 9'h032;
    stim[61] = 9'h02f;
    stim[62] = 9'h0cd;
    stim[63] = 9'h09b;
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
      expv[0] = 20'h00000;
      expv[1] = 20'h00000;
      expv[2] = 20'h00000;
      expv[3] = 20'h00000;
      expv[4] = 20'h00000;
      expv[5] = 20'h00000;
      expv[6] = 20'h00000;
      expv[7] = 20'h00000;
      expv[8] = 20'h00000;
      expv[9] = 20'h00000;
      expv[10] = 20'h00000;
      expv[11] = 20'h00000;
      expv[12] = 20'h00000;
      expv[13] = 20'h00000;
      expv[14] = 20'h00000;
      expv[15] = 20'h00000;
      expv[16] = 20'h00000;
      expv[17] = 20'h00000;
      expv[18] = 20'h00000;
      expv[19] = 20'h00000;
      expv[20] = 20'h00000;
      expv[21] = 20'h00000;
      expv[22] = 20'h00000;
      expv[23] = 20'h00000;
      expv[24] = 20'h00000;
      expv[25] = 20'h00000;
      expv[26] = 20'h00000;
      expv[27] = 20'h00000;
      expv[28] = 20'h00000;
      expv[29] = 20'h00000;
      expv[30] = 20'h00000;
      expv[31] = 20'h00000;
      expv[32] = 20'h00000;
      expv[33] = 20'h00000;
      expv[34] = 20'h00000;
      expv[35] = 20'h00000;
      expv[36] = 20'h00000;
      expv[37] = 20'h00000;
      expv[38] = 20'h00000;
      expv[39] = 20'h00000;
      expv[40] = 20'h00000;
      expv[41] = 20'h00000;
      expv[42] = 20'h00000;
      expv[43] = 20'h00000;
      expv[44] = 20'h00000;
      expv[45] = 20'h00000;
      expv[46] = 20'h00000;
      expv[47] = 20'h00000;
      expv[48] = 20'h00000;
      expv[49] = 20'h00000;
      expv[50] = 20'h00000;
      expv[51] = 20'h00000;
      expv[52] = 20'h00000;
      expv[53] = 20'h00000;
      expv[54] = 20'h00000;
      expv[55] = 20'h00000;
      expv[56] = 20'h00000;
      expv[57] = 20'h00000;
      expv[58] = 20'h00000;
      expv[59] = 20'h00000;
      expv[60] = 20'h00000;
      expv[61] = 20'h00000;
      expv[62] = 20'h00000;
      expv[63] = 20'h00000;
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
