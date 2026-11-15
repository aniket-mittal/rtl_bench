// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_072779 dut (
    .clk(clk),
    .reset(in_vec[9:9]),
    .lp_in(in_vec[8:8]),
    .din(in_vec[7:0]),
    .lane_valid(out_vec[9:9]),
    .lane_dat(out_vec[8:1]),
    .lane_flag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h3b5;
    stim[1] = 10'h3a3;
    stim[2] = 10'h167;
    stim[3] = 10'h09d;
    stim[4] = 10'h140;
    stim[5] = 10'h07b;
    stim[6] = 10'h031;
    stim[7] = 10'h163;
    stim[8] = 10'h1b8;
    stim[9] = 10'h0ee;
    stim[10] = 10'h00f;
    stim[11] = 10'h0b5;
    stim[12] = 10'h081;
    stim[13] = 10'h12b;
    stim[14] = 10'h08a;
    stim[15] = 10'h15c;
    stim[16] = 10'h03f;
    stim[17] = 10'h045;
    stim[18] = 10'h0b4;
    stim[19] = 10'h072;
    stim[20] = 10'h067;
    stim[21] = 10'h047;
    stim[22] = 10'h00e;
    stim[23] = 10'h011;
    stim[24] = 10'h08e;
    stim[25] = 10'h07d;
    stim[26] = 10'h027;
    stim[27] = 10'h076;
    stim[28] = 10'h1ef;
    stim[29] = 10'h16c;
    stim[30] = 10'h032;
    stim[31] = 10'h072;
    stim[32] = 10'h0cb;
    stim[33] = 10'h0a8;
    stim[34] = 10'h1d8;
    stim[35] = 10'h1e1;
    stim[36] = 10'h153;
    stim[37] = 10'h03f;
    stim[38] = 10'h05a;
    stim[39] = 10'h06d;
    stim[40] = 10'h160;
    stim[41] = 10'h039;
    stim[42] = 10'h0d2;
    stim[43] = 10'h0e2;
    stim[44] = 10'h11b;
    stim[45] = 10'h0b9;
    stim[46] = 10'h04f;
    stim[47] = 10'h167;
    stim[48] = 10'h0b7;
    stim[49] = 10'h19f;
    stim[50] = 10'h038;
    stim[51] = 10'h142;
    stim[52] = 10'h134;
    stim[53] = 10'h029;
    stim[54] = 10'h044;
    stim[55] = 10'h1f3;
    stim[56] = 10'h193;
    stim[57] = 10'h16d;
    stim[58] = 10'h103;
    stim[59] = 10'h145;
    stim[60] = 10'h115;
    stim[61] = 10'h0dc;
    stim[62] = 10'h018;
    stim[63] = 10'h029;
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
      expv[3] = 10'hxxx;
      expv[4] = 10'h18a;
      expv[5] = 10'h1cc;
      expv[6] = 10'h172;
      expv[7] = 10'h004;
      expv[8] = 10'h1bc;
      expv[9] = 10'h118;
      expv[10] = 10'h18c;
      expv[11] = 10'h03a;
      expv[12] = 10'h0ef;
      expv[13] = 10'h306;
      expv[14] = 10'h2de;
      expv[15] = 10'h01a;
      expv[16] = 10'h148;
      expv[17] = 10'h11c;
      expv[18] = 10'h1a4;
      expv[19] = 10'h1c2;
      expv[20] = 10'h02e;
      expv[21] = 10'h0da;
      expv[22] = 10'h0e2;
      expv[23] = 10'h064;
      expv[24] = 10'h02e;
      expv[25] = 10'h10e;
      expv[26] = 10'h086;
      expv[27] = 10'h118;
      expv[28] = 10'h1e6;
      expv[29] = 10'h04a;
      expv[30] = 10'h0ee;
      expv[31] = 10'h176;
      expv[32] = 10'h16e;
      expv[33] = 10'h0c2;
      expv[34] = 10'h0e4;
      expv[35] = 10'h134;
      expv[36] = 10'h15c;
      expv[37] = 10'h1b0;
      expv[38] = 10'h070;
      expv[39] = 10'h0a8;
      expv[40] = 10'h1cc;
      expv[41] = 10'h1ae;
      expv[42] = 10'h164;
      expv[43] = 10'h06a;
      expv[44] = 10'h1c0;
      expv[45] = 10'h0b8;
      expv[46] = 10'h074;
      expv[47] = 10'h184;
      expv[48] = 10'h1dc;
      expv[49] = 10'h128;
      expv[50] = 10'h06e;
      expv[51] = 10'h0de;
      expv[52] = 10'h19e;
      expv[53] = 10'h1ce;
      expv[54] = 10'h020;
      expv[55] = 10'h0c4;
      expv[56] = 10'h142;
      expv[57] = 10'h028;
      expv[58] = 10'h0f2;
      expv[59] = 10'h09c;
      expv[60] = 10'h16c;
      expv[61] = 10'h00a;
      expv[62] = 10'h02c;
      expv[63] = 10'h08a;
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
