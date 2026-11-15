// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_104748 dut (
    .sck(clk),
    .serialDataIn(in_vec[9:9]),
    .setNewData(in_vec[8:8]),
    .dataToSend(in_vec[7:0]),
    .serialDataOut(out_vec[8:8]),
    .dataReceived(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h192;
    stim[1] = 10'h1ea;
    stim[2] = 10'h238;
    stim[3] = 10'h0e8;
    stim[4] = 10'h083;
    stim[5] = 10'h19f;
    stim[6] = 10'h388;
    stim[7] = 10'h3f2;
    stim[8] = 10'h2ec;
    stim[9] = 10'h25a;
    stim[10] = 10'h03e;
    stim[11] = 10'h39a;
    stim[12] = 10'h2bf;
    stim[13] = 10'h3fb;
    stim[14] = 10'h1c8;
    stim[15] = 10'h14b;
    stim[16] = 10'h010;
    stim[17] = 10'h144;
    stim[18] = 10'h37d;
    stim[19] = 10'h29f;
    stim[20] = 10'h0b9;
    stim[21] = 10'h213;
    stim[22] = 10'h094;
    stim[23] = 10'h104;
    stim[24] = 10'h08f;
    stim[25] = 10'h1e3;
    stim[26] = 10'h161;
    stim[27] = 10'h1f0;
    stim[28] = 10'h224;
    stim[29] = 10'h2f9;
    stim[30] = 10'h30a;
    stim[31] = 10'h386;
    stim[32] = 10'h247;
    stim[33] = 10'h34b;
    stim[34] = 10'h145;
    stim[35] = 10'h346;
    stim[36] = 10'h2f0;
    stim[37] = 10'h354;
    stim[38] = 10'h242;
    stim[39] = 10'h07f;
    stim[40] = 10'h202;
    stim[41] = 10'h031;
    stim[42] = 10'h17c;
    stim[43] = 10'h23e;
    stim[44] = 10'h016;
    stim[45] = 10'h222;
    stim[46] = 10'h317;
    stim[47] = 10'h392;
    stim[48] = 10'h238;
    stim[49] = 10'h05a;
    stim[50] = 10'h38a;
    stim[51] = 10'h02b;
    stim[52] = 10'h351;
    stim[53] = 10'h113;
    stim[54] = 10'h220;
    stim[55] = 10'h07d;
    stim[56] = 10'h2f3;
    stim[57] = 10'h059;
    stim[58] = 10'h00f;
    stim[59] = 10'h1af;
    stim[60] = 10'h2a1;
    stim[61] = 10'h20a;
    stim[62] = 10'h069;
    stim[63] = 10'h06f;
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
      expv[0] = 9'h1xx;
      expv[1] = 9'h1xx;
      expv[2] = 9'h1xx;
      expv[3] = 9'h1xx;
      expv[4] = 9'h1x2;
      expv[5] = 9'h1x4;
      expv[6] = 9'h1x8;
      expv[7] = 9'h1x1;
      expv[8] = 9'h123;
      expv[9] = 9'h147;
      expv[10] = 9'h18f;
      expv[11] = 9'h11e;
      expv[12] = 9'h13d;
      expv[13] = 9'h17b;
      expv[14] = 9'h1f7;
      expv[15] = 9'h1ee;
      expv[16] = 9'h0dc;
      expv[17] = 9'h0b8;
      expv[18] = 9'h070;
      expv[19] = 9'h0e1;
      expv[20] = 9'h1c3;
      expv[21] = 9'h186;
      expv[22] = 9'h10d;
      expv[23] = 9'h01a;
      expv[24] = 9'h034;
      expv[25] = 9'h168;
      expv[26] = 9'h1d0;
      expv[27] = 9'h0a0;
      expv[28] = 9'h140;
      expv[29] = 9'h181;
      expv[30] = 9'h003;
      expv[31] = 9'h007;
      expv[32] = 9'h10f;
      expv[33] = 9'h01f;
      expv[34] = 9'h03f;
      expv[35] = 9'h07e;
      expv[36] = 9'h0fd;
      expv[37] = 9'h0fb;
      expv[38] = 9'h0f7;
      expv[39] = 9'h1ef;
      expv[40] = 9'h0de;
      expv[41] = 9'h1bd;
      expv[42] = 9'h07a;
      expv[43] = 9'h0f4;
      expv[44] = 9'h1e9;
      expv[45] = 9'h1d2;
      expv[46] = 9'h0a5;
      expv[47] = 9'h04b;
      expv[48] = 9'h197;
      expv[49] = 9'h02f;
      expv[50] = 9'h15e;
      expv[51] = 9'h1bd;
      expv[52] = 9'h07a;
      expv[53] = 9'h0f5;
      expv[54] = 9'h0ea;
      expv[55] = 9'h0d5;
      expv[56] = 9'h0aa;
      expv[57] = 9'h155;
      expv[58] = 9'h0aa;
      expv[59] = 9'h154;
      expv[60] = 9'h1a8;
      expv[61] = 9'h051;
      expv[62] = 9'h1a3;
      expv[63] = 9'h046;
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
