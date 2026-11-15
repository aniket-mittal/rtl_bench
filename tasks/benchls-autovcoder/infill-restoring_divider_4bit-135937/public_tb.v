// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_135937 dut (
    .clk(clk),
    .rst(in_vec[8:8]),
    .dividend(in_vec[7:4]),
    .divisor(in_vec[3:0]),
    .quotient(out_vec[8:5]),
    .remainder(out_vec[4:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h16f;
    stim[1] = 9'h19e;
    stim[2] = 9'h00a;
    stim[3] = 9'h053;
    stim[4] = 9'h093;
    stim[5] = 9'h165;
    stim[6] = 9'h0dc;
    stim[7] = 9'h045;
    stim[8] = 9'h0b1;
    stim[9] = 9'h094;
    stim[10] = 9'h0f5;
    stim[11] = 9'h0f0;
    stim[12] = 9'h09d;
    stim[13] = 9'h0a0;
    stim[14] = 9'h04d;
    stim[15] = 9'h015;
    stim[16] = 9'h01f;
    stim[17] = 9'h030;
    stim[18] = 9'h01e;
    stim[19] = 9'h0b2;
    stim[20] = 9'h033;
    stim[21] = 9'h06a;
    stim[22] = 9'h068;
    stim[23] = 9'h08c;
    stim[24] = 9'h0a5;
    stim[25] = 9'h046;
    stim[26] = 9'h093;
    stim[27] = 9'h073;
    stim[28] = 9'h05e;
    stim[29] = 9'h00e;
    stim[30] = 9'h06a;
    stim[31] = 9'h0ad;
    stim[32] = 9'h05c;
    stim[33] = 9'h0a4;
    stim[34] = 9'h01b;
    stim[35] = 9'h022;
    stim[36] = 9'h035;
    stim[37] = 9'h0da;
    stim[38] = 9'h0de;
    stim[39] = 9'h06b;
    stim[40] = 9'h04d;
    stim[41] = 9'h0a3;
    stim[42] = 9'h055;
    stim[43] = 9'h0bb;
    stim[44] = 9'h0a9;
    stim[45] = 9'h0b8;
    stim[46] = 9'h0e7;
    stim[47] = 9'h052;
    stim[48] = 9'h0a8;
    stim[49] = 9'h03b;
    stim[50] = 9'h0d5;
    stim[51] = 9'h066;
    stim[52] = 9'h069;
    stim[53] = 9'h05a;
    stim[54] = 9'h09c;
    stim[55] = 9'h0ac;
    stim[56] = 9'h03e;
    stim[57] = 9'h18b;
    stim[58] = 9'h0a1;
    stim[59] = 9'h083;
    stim[60] = 9'h010;
    stim[61] = 9'h012;
    stim[62] = 9'h000;
    stim[63] = 9'h0e4;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h000;
      expv[5] = 9'h000;
      expv[6] = 9'h000;
      expv[7] = 9'h000;
      expv[8] = 9'h000;
      expv[9] = 9'h000;
      expv[10] = 9'h000;
      expv[11] = 9'h141;
      expv[12] = 9'h141;
      expv[13] = 9'h141;
      expv[14] = 9'h141;
      expv[15] = 9'h141;
      expv[16] = 9'h141;
      expv[17] = 9'h141;
      expv[18] = 9'h141;
      expv[19] = 9'h141;
      expv[20] = 9'h141;
      expv[21] = 9'h141;
      expv[22] = 9'h141;
      expv[23] = 9'h141;
      expv[24] = 9'h141;
      expv[25] = 9'h141;
      expv[26] = 9'h141;
      expv[27] = 9'h141;
      expv[28] = 9'h141;
      expv[29] = 9'h141;
      expv[30] = 9'h141;
      expv[31] = 9'h141;
      expv[32] = 9'h141;
      expv[33] = 9'h141;
      expv[34] = 9'h141;
      expv[35] = 9'h141;
      expv[36] = 9'h141;
      expv[37] = 9'h141;
      expv[38] = 9'h141;
      expv[39] = 9'h141;
      expv[40] = 9'h141;
      expv[41] = 9'h141;
      expv[42] = 9'h141;
      expv[43] = 9'h141;
      expv[44] = 9'h141;
      expv[45] = 9'h141;
      expv[46] = 9'h141;
      expv[47] = 9'h141;
      expv[48] = 9'h141;
      expv[49] = 9'h141;
      expv[50] = 9'h141;
      expv[51] = 9'h141;
      expv[52] = 9'h141;
      expv[53] = 9'h141;
      expv[54] = 9'h141;
      expv[55] = 9'h141;
      expv[56] = 9'h141;
      expv[57] = 9'h000;
      expv[58] = 9'h000;
      expv[59] = 9'h000;
      expv[60] = 9'h000;
      expv[61] = 9'h000;
      expv[62] = 9'h000;
      expv[63] = 9'h1b5;
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
