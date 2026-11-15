// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_011148 dut (
    .i_Clock(clk),
    .i_TX_Byte(in_vec[8:1]),
    .i_TX_DV(in_vec[0:0]),
    .o_TX_Serial(out_vec[2:2]),
    .o_TX_Active(out_vec[1:1]),
    .o_TX_Done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h0d1;
    stim[1] = 9'h1b6;
    stim[2] = 9'h1e6;
    stim[3] = 9'h052;
    stim[4] = 9'h129;
    stim[5] = 9'h0a0;
    stim[6] = 9'h130;
    stim[7] = 9'h09b;
    stim[8] = 9'h1be;
    stim[9] = 9'h0e3;
    stim[10] = 9'h189;
    stim[11] = 9'h059;
    stim[12] = 9'h18b;
    stim[13] = 9'h1cc;
    stim[14] = 9'h1d1;
    stim[15] = 9'h187;
    stim[16] = 9'h012;
    stim[17] = 9'h0e5;
    stim[18] = 9'h17a;
    stim[19] = 9'h0aa;
    stim[20] = 9'h17f;
    stim[21] = 9'h06a;
    stim[22] = 9'h09a;
    stim[23] = 9'h0a2;
    stim[24] = 9'h162;
    stim[25] = 9'h147;
    stim[26] = 9'h1f9;
    stim[27] = 9'h0e1;
    stim[28] = 9'h0e9;
    stim[29] = 9'h02b;
    stim[30] = 9'h14d;
    stim[31] = 9'h157;
    stim[32] = 9'h00a;
    stim[33] = 9'h04a;
    stim[34] = 9'h164;
    stim[35] = 9'h18e;
    stim[36] = 9'h06b;
    stim[37] = 9'h1e0;
    stim[38] = 9'h197;
    stim[39] = 9'h07b;
    stim[40] = 9'h147;
    stim[41] = 9'h1fb;
    stim[42] = 9'h1cb;
    stim[43] = 9'h1af;
    stim[44] = 9'h174;
    stim[45] = 9'h08b;
    stim[46] = 9'h062;
    stim[47] = 9'h176;
    stim[48] = 9'h115;
    stim[49] = 9'h0ff;
    stim[50] = 9'h0f6;
    stim[51] = 9'h1f1;
    stim[52] = 9'h105;
    stim[53] = 9'h100;
    stim[54] = 9'h18b;
    stim[55] = 9'h193;
    stim[56] = 9'h062;
    stim[57] = 9'h17f;
    stim[58] = 9'h0c1;
    stim[59] = 9'h07c;
    stim[60] = 9'h1b0;
    stim[61] = 9'h057;
    stim[62] = 9'h16f;
    stim[63] = 9'h11b;
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
      expv[0] = 3'hx;
      expv[1] = 3'h6;
      expv[2] = 3'h2;
      expv[3] = 3'h2;
      expv[4] = 3'h2;
      expv[5] = 3'h2;
      expv[6] = 3'h2;
      expv[7] = 3'h2;
      expv[8] = 3'h2;
      expv[9] = 3'h2;
      expv[10] = 3'h2;
      expv[11] = 3'h2;
      expv[12] = 3'h2;
      expv[13] = 3'h2;
      expv[14] = 3'h2;
      expv[15] = 3'h2;
      expv[16] = 3'h2;
      expv[17] = 3'h2;
      expv[18] = 3'h2;
      expv[19] = 3'h2;
      expv[20] = 3'h2;
      expv[21] = 3'h2;
      expv[22] = 3'h2;
      expv[23] = 3'h2;
      expv[24] = 3'h2;
      expv[25] = 3'h2;
      expv[26] = 3'h2;
      expv[27] = 3'h2;
      expv[28] = 3'h2;
      expv[29] = 3'h2;
      expv[30] = 3'h2;
      expv[31] = 3'h2;
      expv[32] = 3'h2;
      expv[33] = 3'h2;
      expv[34] = 3'h2;
      expv[35] = 3'h2;
      expv[36] = 3'h2;
      expv[37] = 3'h2;
      expv[38] = 3'h2;
      expv[39] = 3'h2;
      expv[40] = 3'h2;
      expv[41] = 3'h2;
      expv[42] = 3'h2;
      expv[43] = 3'h2;
      expv[44] = 3'h2;
      expv[45] = 3'h2;
      expv[46] = 3'h2;
      expv[47] = 3'h2;
      expv[48] = 3'h2;
      expv[49] = 3'h2;
      expv[50] = 3'h2;
      expv[51] = 3'h2;
      expv[52] = 3'h2;
      expv[53] = 3'h2;
      expv[54] = 3'h2;
      expv[55] = 3'h2;
      expv[56] = 3'h2;
      expv[57] = 3'h2;
      expv[58] = 3'h2;
      expv[59] = 3'h2;
      expv[60] = 3'h2;
      expv[61] = 3'h2;
      expv[62] = 3'h2;
      expv[63] = 3'h2;
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
