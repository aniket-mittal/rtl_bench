// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .do_sub(in_vec[16:16]),
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .out(out_vec[8:1]),
    .result_is_zero(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1233b;
    stim[1] = 17'h1cf24;
    stim[2] = 17'h1a437;
    stim[3] = 17'h1bf48;
    stim[4] = 17'h01eee;
    stim[5] = 17'h1d3aa;
    stim[6] = 17'h19ff2;
    stim[7] = 17'h1d7ff;
    stim[8] = 17'h069ec;
    stim[9] = 17'h08dfa;
    stim[10] = 17'h05420;
    stim[11] = 17'h03926;
    stim[12] = 17'h148ff;
    stim[13] = 17'h03b9e;
    stim[14] = 17'h0980d;
    stim[15] = 17'h18aed;
    stim[16] = 17'h1034c;
    stim[17] = 17'h133f6;
    stim[18] = 17'h02cda;
    stim[19] = 17'h10526;
    stim[20] = 17'h0f3b4;
    stim[21] = 17'h0f123;
    stim[22] = 17'h11dba;
    stim[23] = 17'h1cb28;
    stim[24] = 17'h0f7f2;
    stim[25] = 17'h0284b;
    stim[26] = 17'h11366;
    stim[27] = 17'h07b8e;
    stim[28] = 17'h1e772;
    stim[29] = 17'h0932a;
    stim[30] = 17'h04308;
    stim[31] = 17'h051b7;
    stim[32] = 17'h19f85;
    stim[33] = 17'h17b8c;
    stim[34] = 17'h0fc85;
    stim[35] = 17'h0ffdf;
    stim[36] = 17'h0d51c;
    stim[37] = 17'h079db;
    stim[38] = 17'h07cf0;
    stim[39] = 17'h0453b;
    stim[40] = 17'h18772;
    stim[41] = 17'h0980b;
    stim[42] = 17'h05fd4;
    stim[43] = 17'h06b97;
    stim[44] = 17'h1c305;
    stim[45] = 17'h0ca40;
    stim[46] = 17'h184ad;
    stim[47] = 17'h0de50;
    stim[48] = 17'h16120;
    stim[49] = 17'h1bd1a;
    stim[50] = 17'h1fde1;
    stim[51] = 17'h1370f;
    stim[52] = 17'h149a1;
    stim[53] = 17'h1ac85;
    stim[54] = 17'h1ec37;
    stim[55] = 17'h1dc3e;
    stim[56] = 17'h12978;
    stim[57] = 17'h15f26;
    stim[58] = 17'h0918e;
    stim[59] = 17'h099f6;
    stim[60] = 17'h19fb9;
    stim[61] = 17'h1528a;
    stim[62] = 17'h1a90f;
    stim[63] = 17'h12b49;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 9'h1d0;
      expv[1] = 9'h156;
      expv[2] = 9'h0da;
      expv[3] = 9'h0ee;
      expv[4] = 9'h018;
      expv[5] = 9'h052;
      expv[6] = 9'h15a;
      expv[7] = 9'h1b0;
      expv[8] = 9'h0aa;
      expv[9] = 9'h10e;
      expv[10] = 9'h0e8;
      expv[11] = 9'h0be;
      expv[12] = 9'h092;
      expv[13] = 9'h1b2;
      expv[14] = 9'h14a;
      expv[15] = 9'h13a;
      expv[16] = 9'h16e;
      expv[17] = 9'h07a;
      expv[18] = 9'h00c;
      expv[19] = 9'h1be;
      expv[20] = 9'h14e;
      expv[21] = 9'h028;
      expv[22] = 9'h0c6;
      expv[23] = 9'h146;
      expv[24] = 9'h1d2;
      expv[25] = 9'h0e6;
      expv[26] = 9'h15a;
      expv[27] = 9'h012;
      expv[28] = 9'h0ea;
      expv[29] = 9'h17a;
      expv[30] = 9'h096;
      expv[31] = 9'h010;
      expv[32] = 9'h034;
      expv[33] = 9'h1de;
      expv[34] = 9'h102;
      expv[35] = 9'h1bc;
      expv[36] = 9'h1e2;
      expv[37] = 9'h0a8;
      expv[38] = 9'h0d8;
      expv[39] = 9'h100;
      expv[40] = 9'h02a;
      expv[41] = 9'h146;
      expv[42] = 9'h066;
      expv[43] = 9'h004;
      expv[44] = 9'h17c;
      expv[45] = 9'h014;
      expv[46] = 9'h1ae;
      expv[47] = 9'h05c;
      expv[48] = 9'h082;
      expv[49] = 9'h146;
      expv[50] = 9'h038;
      expv[51] = 9'h050;
      expv[52] = 9'h150;
      expv[53] = 9'h04e;
      expv[54] = 9'h16a;
      expv[55] = 9'h13c;
      expv[56] = 9'h162;
      expv[57] = 9'h072;
      expv[58] = 9'h03e;
      expv[59] = 9'h11e;
      expv[60] = 9'h1cc;
      expv[61] = 9'h190;
      expv[62] = 9'h134;
      expv[63] = 9'h1c4;
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
