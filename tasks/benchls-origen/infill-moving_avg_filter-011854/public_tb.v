// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_011854 dut (
    .clk(clk),
    .X(in_vec[8:1]),
    .reset(in_vec[0:0]),
    .Y(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h05f;
    stim[1] = 9'h15b;
    stim[2] = 9'h128;
    stim[3] = 9'h04e;
    stim[4] = 9'h0fe;
    stim[5] = 9'h08e;
    stim[6] = 9'h166;
    stim[7] = 9'h092;
    stim[8] = 9'h1fe;
    stim[9] = 9'h040;
    stim[10] = 9'h18c;
    stim[11] = 9'h128;
    stim[12] = 9'h00e;
    stim[13] = 9'h1de;
    stim[14] = 9'h03e;
    stim[15] = 9'h0ab;
    stim[16] = 9'h06c;
    stim[17] = 9'h10a;
    stim[18] = 9'h040;
    stim[19] = 9'h03e;
    stim[20] = 9'h168;
    stim[21] = 9'h180;
    stim[22] = 9'h1ba;
    stim[23] = 9'h054;
    stim[24] = 9'h172;
    stim[25] = 9'h118;
    stim[26] = 9'h1de;
    stim[27] = 9'h1ce;
    stim[28] = 9'h138;
    stim[29] = 9'h1c0;
    stim[30] = 9'h008;
    stim[31] = 9'h05c;
    stim[32] = 9'h1cc;
    stim[33] = 9'h1e0;
    stim[34] = 9'h1b8;
    stim[35] = 9'h0a8;
    stim[36] = 9'h1e8;
    stim[37] = 9'h0ea;
    stim[38] = 9'h100;
    stim[39] = 9'h158;
    stim[40] = 9'h17c;
    stim[41] = 9'h164;
    stim[42] = 9'h03c;
    stim[43] = 9'h104;
    stim[44] = 9'h1d6;
    stim[45] = 9'h1b2;
    stim[46] = 9'h0b0;
    stim[47] = 9'h15a;
    stim[48] = 9'h1be;
    stim[49] = 9'h1c0;
    stim[50] = 9'h10e;
    stim[51] = 9'h1fe;
    stim[52] = 9'h08c;
    stim[53] = 9'h13e;
    stim[54] = 9'h0bc;
    stim[55] = 9'h1d4;
    stim[56] = 9'h076;
    stim[57] = 9'h1f8;
    stim[58] = 9'h04c;
    stim[59] = 9'h0d6;
    stim[60] = 9'h072;
    stim[61] = 9'h1bc;
    stim[62] = 9'h04a;
    stim[63] = 9'h116;
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
      expv[0] = 10'h000;
      expv[1] = 10'h000;
      expv[2] = 10'h000;
      expv[3] = 10'h000;
      expv[4] = 10'h012;
      expv[5] = 10'h017;
      expv[6] = 10'h027;
      expv[7] = 10'h05c;
      expv[8] = 10'h072;
      expv[9] = 10'h07b;
      expv[10] = 10'h0c1;
      expv[11] = 10'h0c5;
      expv[12] = 10'h0de;
      expv[13] = 10'h0de;
      expv[14] = 10'h0da;
      expv[15] = 10'h000;
      expv[16] = 10'h000;
      expv[17] = 10'h000;
      expv[18] = 10'h006;
      expv[19] = 10'h017;
      expv[20] = 10'h01b;
      expv[21] = 10'h01f;
      expv[22] = 10'h059;
      expv[23] = 10'h08a;
      expv[24] = 10'h0a6;
      expv[25] = 10'h0ab;
      expv[26] = 10'h0c2;
      expv[27] = 10'h0bf;
      expv[28] = 10'h13b;
      expv[29] = 10'h154;
      expv[30] = 10'h175;
      expv[31] = 10'h17b;
      expv[32] = 10'h163;
      expv[33] = 10'h13b;
      expv[34] = 10'h165;
      expv[35] = 10'h16c;
      expv[36] = 10'h176;
      expv[37] = 10'h162;
      expv[38] = 10'h164;
      expv[39] = 10'h133;
      expv[40] = 10'h134;
      expv[41] = 10'h149;
      expv[42] = 10'h18c;
      expv[43] = 10'h186;
      expv[44] = 10'h13a;
      expv[45] = 10'h131;
      expv[46] = 10'h144;
      expv[47] = 10'h140;
      expv[48] = 10'h13d;
      expv[49] = 10'h142;
      expv[50] = 10'h149;
      expv[51] = 10'h14d;
      expv[52] = 10'h14d;
      expv[53] = 10'h194;
      expv[54] = 10'h18d;
      expv[55] = 10'h173;
      expv[56] = 10'h149;
      expv[57] = 10'h186;
      expv[58] = 10'h168;
      expv[59] = 10'h16c;
      expv[60] = 10'h139;
      expv[61] = 10'h116;
      expv[62] = 10'h0fe;
      expv[63] = 10'h111;
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
