// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09195 dut (
    .clk(clk),
    .reset(in_vec[16:16]),
    .data(in_vec[15:0]),
    .sseg(out_vec[10:4]),
    .an(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h19c1c;
    stim[1] = 17'h1baa8;
    stim[2] = 17'h015a2;
    stim[3] = 17'h04f5f;
    stim[4] = 17'h0fa55;
    stim[5] = 17'h090e4;
    stim[6] = 17'h0ec63;
    stim[7] = 17'h0a9d5;
    stim[8] = 17'h0783c;
    stim[9] = 17'h089ff;
    stim[10] = 17'h0a9e0;
    stim[11] = 17'h00c51;
    stim[12] = 17'h04e7f;
    stim[13] = 17'h1a82e;
    stim[14] = 17'h0c622;
    stim[15] = 17'h0239b;
    stim[16] = 17'h05351;
    stim[17] = 17'h1dfe4;
    stim[18] = 17'h00651;
    stim[19] = 17'h0fa12;
    stim[20] = 17'h02af2;
    stim[21] = 17'h0ddce;
    stim[22] = 17'h0f0d2;
    stim[23] = 17'h03b47;
    stim[24] = 17'h08e12;
    stim[25] = 17'h06d0b;
    stim[26] = 17'h0aaf1;
    stim[27] = 17'h00a23;
    stim[28] = 17'h0acf0;
    stim[29] = 17'h03440;
    stim[30] = 17'h002c4;
    stim[31] = 17'h0b66a;
    stim[32] = 17'h08eec;
    stim[33] = 17'h0404b;
    stim[34] = 17'h03dbd;
    stim[35] = 17'h0b786;
    stim[36] = 17'h00607;
    stim[37] = 17'h05379;
    stim[38] = 17'h0d98e;
    stim[39] = 17'h0ec43;
    stim[40] = 17'h044ee;
    stim[41] = 17'h0d4f6;
    stim[42] = 17'h04733;
    stim[43] = 17'h00f47;
    stim[44] = 17'h0fafd;
    stim[45] = 17'h069db;
    stim[46] = 17'h0c519;
    stim[47] = 17'h0e02f;
    stim[48] = 17'h0c2c5;
    stim[49] = 17'h02dfc;
    stim[50] = 17'h0873e;
    stim[51] = 17'h01876;
    stim[52] = 17'h06294;
    stim[53] = 17'h0b26f;
    stim[54] = 17'h0abda;
    stim[55] = 17'h03aa3;
    stim[56] = 17'h0b2ca;
    stim[57] = 17'h02548;
    stim[58] = 17'h0d9a9;
    stim[59] = 17'h04a65;
    stim[60] = 17'h039d0;
    stim[61] = 17'h05877;
    stim[62] = 17'h05549;
    stim[63] = 17'h02f0e;
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
      expv[0] = 11'h46e;
      expv[1] = 11'h00e;
      expv[2] = 11'h24e;
      expv[3] = 11'h0ee;
      expv[4] = 11'h12e;
      expv[5] = 11'h19e;
      expv[6] = 11'h30e;
      expv[7] = 11'h12e;
      expv[8] = 11'h46e;
      expv[9] = 11'h0ee;
      expv[10] = 11'h40e;
      expv[11] = 11'h79e;
      expv[12] = 11'h0ee;
      expv[13] = 11'h06e;
      expv[14] = 11'h24e;
      expv[15] = 11'h03e;
      expv[16] = 11'h79e;
      expv[17] = 11'h19e;
      expv[18] = 11'h79e;
      expv[19] = 11'h24e;
      expv[20] = 11'h24e;
      expv[21] = 11'h06e;
      expv[22] = 11'h24e;
      expv[23] = 11'h78e;
      expv[24] = 11'h24e;
      expv[25] = 11'h03e;
      expv[26] = 11'h79e;
      expv[27] = 11'h30e;
      expv[28] = 11'h40e;
      expv[29] = 11'h40e;
      expv[30] = 11'h19e;
      expv[31] = 11'h08e;
      expv[32] = 11'h46e;
      expv[33] = 11'h03e;
      expv[34] = 11'h21e;
      expv[35] = 11'h02e;
      expv[36] = 11'h78e;
      expv[37] = 11'h10e;
      expv[38] = 11'h06e;
      expv[39] = 11'h30e;
      expv[40] = 11'h06e;
      expv[41] = 11'h02e;
      expv[42] = 11'h30e;
      expv[43] = 11'h78e;
      expv[44] = 11'h21e;
      expv[45] = 11'h03e;
      expv[46] = 11'h10e;
      expv[47] = 11'h0ee;
      expv[48] = 11'h12e;
      expv[49] = 11'h46e;
      expv[50] = 11'h06e;
      expv[51] = 11'h02e;
      expv[52] = 11'h19e;
      expv[53] = 11'h0ee;
      expv[54] = 11'h08e;
      expv[55] = 11'h30e;
      expv[56] = 11'h08e;
      expv[57] = 11'h00e;
      expv[58] = 11'h10e;
      expv[59] = 11'h12e;
      expv[60] = 11'h40e;
      expv[61] = 11'h78e;
      expv[62] = 11'h10e;
      expv[63] = 11'h06e;
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
