// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_07023 dut (
    .clk(clk),
    .reset(in_vec[14:14]),
    .n_in(in_vec[13:6]),
    .d_in(in_vec[5:0]),
    .r_out(out_vec[13:8]),
    .q_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h70e9;
    stim[1] = 15'h7859;
    stim[2] = 15'h1ec3;
    stim[3] = 15'h339f;
    stim[4] = 15'h07ef;
    stim[5] = 15'h232b;
    stim[6] = 15'h2608;
    stim[7] = 15'h2b35;
    stim[8] = 15'h3513;
    stim[9] = 15'h057e;
    stim[10] = 15'h3b63;
    stim[11] = 15'h7e24;
    stim[12] = 15'h243a;
    stim[13] = 15'h1b70;
    stim[14] = 15'h16ba;
    stim[15] = 15'h30ad;
    stim[16] = 15'h1441;
    stim[17] = 15'h0948;
    stim[18] = 15'h33a4;
    stim[19] = 15'h33d8;
    stim[20] = 15'h1bfa;
    stim[21] = 15'h3864;
    stim[22] = 15'h161f;
    stim[23] = 15'h1081;
    stim[24] = 15'h26d0;
    stim[25] = 15'h2d78;
    stim[26] = 15'h3f6d;
    stim[27] = 15'h2cd9;
    stim[28] = 15'h1b38;
    stim[29] = 15'h0e3e;
    stim[30] = 15'h2a04;
    stim[31] = 15'h1c37;
    stim[32] = 15'h3035;
    stim[33] = 15'h3105;
    stim[34] = 15'h1f1b;
    stim[35] = 15'h1755;
    stim[36] = 15'h3e98;
    stim[37] = 15'h076f;
    stim[38] = 15'h11be;
    stim[39] = 15'h0309;
    stim[40] = 15'h0f21;
    stim[41] = 15'h10c4;
    stim[42] = 15'h1d28;
    stim[43] = 15'h0011;
    stim[44] = 15'h3e88;
    stim[45] = 15'h3faf;
    stim[46] = 15'h10ef;
    stim[47] = 15'h24be;
    stim[48] = 15'h00c0;
    stim[49] = 15'h5886;
    stim[50] = 15'h3bf0;
    stim[51] = 15'h1505;
    stim[52] = 15'h0cef;
    stim[53] = 15'h1707;
    stim[54] = 15'h1049;
    stim[55] = 15'h2b51;
    stim[56] = 15'h3078;
    stim[57] = 15'h3a5e;
    stim[58] = 15'h1e27;
    stim[59] = 15'h1a98;
    stim[60] = 15'h2423;
    stim[61] = 15'h2ff3;
    stim[62] = 15'h10fa;
    stim[63] = 15'h1736;
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
      expv[0] = 14'h0000;
      expv[1] = 14'h0000;
      expv[2] = 14'h0000;
      expv[3] = 14'h0000;
      expv[4] = 14'h0000;
      expv[5] = 14'h0000;
      expv[6] = 14'h0000;
      expv[7] = 14'h0000;
      expv[8] = 14'h0000;
      expv[9] = 14'h0000;
      expv[10] = 14'h0000;
      expv[11] = 14'h0000;
      expv[12] = 14'h0000;
      expv[13] = 14'h0000;
      expv[14] = 14'h0000;
      expv[15] = 14'h0000;
      expv[16] = 14'h0000;
      expv[17] = 14'h0000;
      expv[18] = 14'h0000;
      expv[19] = 14'h0000;
      expv[20] = 14'h0000;
      expv[21] = 14'h0000;
      expv[22] = 14'h0000;
      expv[23] = 14'h0000;
      expv[24] = 14'h0000;
      expv[25] = 14'h0000;
      expv[26] = 14'h0000;
      expv[27] = 14'h0000;
      expv[28] = 14'h0000;
      expv[29] = 14'h0000;
      expv[30] = 14'h1c02;
      expv[31] = 14'h1c02;
      expv[32] = 14'h1c02;
      expv[33] = 14'h1c02;
      expv[34] = 14'h1c02;
      expv[35] = 14'h1c02;
      expv[36] = 14'h1c02;
      expv[37] = 14'h1c02;
      expv[38] = 14'h1c02;
      expv[39] = 14'h1c02;
      expv[40] = 14'h1c02;
      expv[41] = 14'h1c02;
      expv[42] = 14'h1c02;
      expv[43] = 14'h1c02;
      expv[44] = 14'h1c02;
      expv[45] = 14'h1c02;
      expv[46] = 14'h1c02;
      expv[47] = 14'h1c02;
      expv[48] = 14'h002a;
      expv[49] = 14'h0000;
      expv[50] = 14'h0000;
      expv[51] = 14'h0000;
      expv[52] = 14'h0000;
      expv[53] = 14'h0000;
      expv[54] = 14'h0000;
      expv[55] = 14'h0000;
      expv[56] = 14'h0000;
      expv[57] = 14'h0000;
      expv[58] = 14'h0000;
      expv[59] = 14'h0000;
      expv[60] = 14'h0000;
      expv[61] = 14'h0000;
      expv[62] = 14'h0000;
      expv[63] = 14'h0000;
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
