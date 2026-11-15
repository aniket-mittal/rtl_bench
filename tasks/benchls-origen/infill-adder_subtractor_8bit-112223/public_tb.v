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

  origen_112223 dut (
    .A(in_vec[16:9]),
    .B(in_vec[8:1]),
    .op(in_vec[0:0]),
    .S(out_vec[8:1]),
    .sinal(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h034b1;
    stim[1] = 17'h02778;
    stim[2] = 17'h02db7;
    stim[3] = 17'h13b80;
    stim[4] = 17'h0f2b5;
    stim[5] = 17'h04e7a;
    stim[6] = 17'h01da0;
    stim[7] = 17'h0630d;
    stim[8] = 17'h1acb5;
    stim[9] = 17'h1b386;
    stim[10] = 17'h1cc75;
    stim[11] = 17'h15fdf;
    stim[12] = 17'h00526;
    stim[13] = 17'h135d9;
    stim[14] = 17'h0c74c;
    stim[15] = 17'h1b5bb;
    stim[16] = 17'h1cf88;
    stim[17] = 17'h1e6da;
    stim[18] = 17'h180c2;
    stim[19] = 17'h1a86c;
    stim[20] = 17'h1d284;
    stim[21] = 17'h1d2c6;
    stim[22] = 17'h1091f;
    stim[23] = 17'h0ddbc;
    stim[24] = 17'h0ff11;
    stim[25] = 17'h0d91e;
    stim[26] = 17'h0b727;
    stim[27] = 17'h11758;
    stim[28] = 17'h03168;
    stim[29] = 17'h190f8;
    stim[30] = 17'h0a778;
    stim[31] = 17'h11da3;
    stim[32] = 17'h0f220;
    stim[33] = 17'h02309;
    stim[34] = 17'h1ec1e;
    stim[35] = 17'h19885;
    stim[36] = 17'h02f61;
    stim[37] = 17'h0b7ca;
    stim[38] = 17'h1af88;
    stim[39] = 17'h07e5d;
    stim[40] = 17'h1ad5e;
    stim[41] = 17'h1ecf9;
    stim[42] = 17'h06ffd;
    stim[43] = 17'h090de;
    stim[44] = 17'h114a6;
    stim[45] = 17'h12f6b;
    stim[46] = 17'h09233;
    stim[47] = 17'h1adee;
    stim[48] = 17'h02d5e;
    stim[49] = 17'h009c3;
    stim[50] = 17'h0bd9d;
    stim[51] = 17'h1ebf7;
    stim[52] = 17'h179ca;
    stim[53] = 17'h0a644;
    stim[54] = 17'h1f47b;
    stim[55] = 17'h1dbd1;
    stim[56] = 17'h0322f;
    stim[57] = 17'h1f072;
    stim[58] = 17'h0ee1a;
    stim[59] = 17'h12a48;
    stim[60] = 17'h0de76;
    stim[61] = 17'h04019;
    stim[62] = 17'h199dd;
    stim[63] = 17'h1ad1b;
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
      expv[0] = 9'h185;
      expv[1] = 9'h19f;
      expv[2] = 9'h076;
      expv[3] = 9'h0ba;
      expv[4] = 9'h03e;
      expv[5] = 9'h0c8;
      expv[6] = 9'h1bd;
      expv[7] = 9'h157;
      expv[8] = 9'h0f8;
      expv[9] = 9'h139;
      expv[10] = 9'h159;
      expv[11] = 9'h181;
      expv[12] = 9'h12b;
      expv[13] = 9'h15d;
      expv[14] = 9'h012;
      expv[15] = 9'h1fb;
      expv[16] = 9'h157;
      expv[17] = 9'h0c0;
      expv[18] = 9'h042;
      expv[19] = 9'h014;
      expv[20] = 9'h056;
      expv[21] = 9'h098;
      expv[22] = 9'h1eb;
      expv[23] = 9'h098;
      expv[24] = 9'h1ef;
      expv[25] = 9'h1f7;
      expv[26] = 9'h191;
      expv[27] = 9'h06e;
      expv[28] = 9'h199;
      expv[29] = 9'h088;
      expv[30] = 9'h01e;
      expv[31] = 9'h17b;
      expv[32] = 9'h113;
      expv[33] = 9'h11b;
      expv[34] = 9'h00a;
      expv[35] = 9'h115;
      expv[36] = 9'h0ce;
      expv[37] = 9'h080;
      expv[38] = 9'h137;
      expv[39] = 9'h022;
      expv[40] = 9'h10b;
      expv[41] = 9'h0f4;
      expv[42] = 9'h072;
      expv[43] = 9'h16f;
      expv[44] = 9'h1bb;
      expv[45] = 9'h1c5;
      expv[46] = 9'h060;
      expv[47] = 9'h19b;
      expv[48] = 9'h18b;
      expv[49] = 9'h046;
      expv[50] = 9'h121;
      expv[51] = 9'h1f5;
      expv[52] = 9'h143;
      expv[53] = 9'h0ea;
      expv[54] = 9'h17b;
      expv[55] = 9'h00a;
      expv[56] = 9'h004;
      expv[57] = 9'h062;
      expv[58] = 9'h109;
      expv[59] = 9'h173;
      expv[60] = 9'h155;
      expv[61] = 9'h028;
      expv[62] = 9'h1bd;
      expv[63] = 9'h092;
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
