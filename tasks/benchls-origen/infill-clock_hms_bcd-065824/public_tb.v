// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_065824 dut (
    .CLK_1Hz(clk),
    .reset(in_vec[11:11]),
    .select_enable(in_vec[10:10]),
    .select(in_vec[9:7]),
    .num(in_vec[6:3]),
    .change1(in_vec[2:2]),
    .change2(in_vec[1:1]),
    .change3(in_vec[0:0]),
    .second_d(out_vec[23:20]),
    .second_g(out_vec[19:16]),
    .minute_d(out_vec[15:12]),
    .minute_g(out_vec[11:8]),
    .hour_d(out_vec[7:4]),
    .hour_g(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h8fb;
    stim[1] = 12'hc6e;
    stim[2] = 12'h196;
    stim[3] = 12'h081;
    stim[4] = 12'h772;
    stim[5] = 12'h6a6;
    stim[6] = 12'h49b;
    stim[7] = 12'h5b7;
    stim[8] = 12'h072;
    stim[9] = 12'h58d;
    stim[10] = 12'h103;
    stim[11] = 12'h4af;
    stim[12] = 12'h141;
    stim[13] = 12'h3f5;
    stim[14] = 12'h324;
    stim[15] = 12'h007;
    stim[16] = 12'h0a3;
    stim[17] = 12'h338;
    stim[18] = 12'h9b9;
    stim[19] = 12'h5f6;
    stim[20] = 12'h684;
    stim[21] = 12'h788;
    stim[22] = 12'h41a;
    stim[23] = 12'h167;
    stim[24] = 12'h0cf;
    stim[25] = 12'h541;
    stim[26] = 12'h7cb;
    stim[27] = 12'h629;
    stim[28] = 12'h4b5;
    stim[29] = 12'h01b;
    stim[30] = 12'h39e;
    stim[31] = 12'h46b;
    stim[32] = 12'h3a3;
    stim[33] = 12'h45c;
    stim[34] = 12'h060;
    stim[35] = 12'h184;
    stim[36] = 12'h6d6;
    stim[37] = 12'h321;
    stim[38] = 12'h675;
    stim[39] = 12'h48e;
    stim[40] = 12'h795;
    stim[41] = 12'h6e4;
    stim[42] = 12'h018;
    stim[43] = 12'h74e;
    stim[44] = 12'h74b;
    stim[45] = 12'h2a7;
    stim[46] = 12'h3d4;
    stim[47] = 12'h0b9;
    stim[48] = 12'hc83;
    stim[49] = 12'h7f6;
    stim[50] = 12'h2e6;
    stim[51] = 12'h060;
    stim[52] = 12'h53d;
    stim[53] = 12'h266;
    stim[54] = 12'h70d;
    stim[55] = 12'h314;
    stim[56] = 12'h7ff;
    stim[57] = 12'h4bd;
    stim[58] = 12'h74c;
    stim[59] = 12'h16b;
    stim[60] = 12'h035;
    stim[61] = 12'h5f2;
    stim[62] = 12'h613;
    stim[63] = 12'h64f;
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
      expv[0] = 24'h509510;
      expv[1] = 24'h655930;
      expv[2] = 24'h509510;
      expv[3] = 24'h509510;
      expv[4] = 24'h509510;
      expv[5] = 24'h509510;
      expv[6] = 24'h509510;
      expv[7] = 24'h509510;
      expv[8] = 24'h509510;
      expv[9] = 24'h509510;
      expv[10] = 24'h509510;
      expv[11] = 24'h509510;
      expv[12] = 24'h509510;
      expv[13] = 24'h509510;
      expv[14] = 24'h509510;
      expv[15] = 24'h509510;
      expv[16] = 24'h509510;
      expv[17] = 24'h509510;
      expv[18] = 24'h509510;
      expv[19] = 24'h509510;
      expv[20] = 24'h509510;
      expv[21] = 24'h509510;
      expv[22] = 24'h509510;
      expv[23] = 24'h509510;
      expv[24] = 24'h509510;
      expv[25] = 24'h509510;
      expv[26] = 24'h509510;
      expv[27] = 24'h509510;
      expv[28] = 24'h509510;
      expv[29] = 24'h509510;
      expv[30] = 24'h509510;
      expv[31] = 24'h509510;
      expv[32] = 24'h509510;
      expv[33] = 24'h509510;
      expv[34] = 24'h509510;
      expv[35] = 24'h509510;
      expv[36] = 24'h509510;
      expv[37] = 24'h509510;
      expv[38] = 24'h509510;
      expv[39] = 24'h509510;
      expv[40] = 24'h509510;
      expv[41] = 24'h509510;
      expv[42] = 24'h509510;
      expv[43] = 24'h509510;
      expv[44] = 24'h509510;
      expv[45] = 24'h509510;
      expv[46] = 24'h509510;
      expv[47] = 24'h509510;
      expv[48] = 24'h509510;
      expv[49] = 24'h509510;
      expv[50] = 24'h509510;
      expv[51] = 24'h509510;
      expv[52] = 24'h509510;
      expv[53] = 24'h509510;
      expv[54] = 24'h509510;
      expv[55] = 24'h509510;
      expv[56] = 24'h509510;
      expv[57] = 24'h509510;
      expv[58] = 24'h509510;
      expv[59] = 24'h509510;
      expv[60] = 24'h509510;
      expv[61] = 24'h509510;
      expv[62] = 24'h509510;
      expv[63] = 24'h509510;
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
