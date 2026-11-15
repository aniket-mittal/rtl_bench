// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02037 dut (
    .clk_i(clk),
    .rst_i(in_vec[33:33]),
    .pcm_data_i(in_vec[32:1]),
    .pcm_fifo_empty_i(in_vec[0:0]),
    .pcm_fifo_rd_o(out_vec[4:4]),
    .pcm_fifo_ur_o(out_vec[3:3]),
    .bclk_o(out_vec[2:2]),
    .ws_o(out_vec[1:1]),
    .data_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h3e06704d0;
    stim[1] = 34'h2accf1d2c;
    stim[2] = 34'h0060c2b75;
    stim[3] = 34'h0e3a82997;
    stim[4] = 34'h1a26c9b1f;
    stim[5] = 34'h10ad1b301;
    stim[6] = 34'h10f82e13e;
    stim[7] = 34'h0dbfe7a90;
    stim[8] = 34'h17bbaff46;
    stim[9] = 34'h00616341b;
    stim[10] = 34'h028271bce;
    stim[11] = 34'h157df580a;
    stim[12] = 34'h099d9564c;
    stim[13] = 34'h09708017a;
    stim[14] = 34'h1b384a2f9;
    stim[15] = 34'h250b98e3e;
    stim[16] = 34'h0bab7a2a4;
    stim[17] = 34'h0338d85a2;
    stim[18] = 34'h0dfecc942;
    stim[19] = 34'h000abd02a;
    stim[20] = 34'h0cd618b5d;
    stim[21] = 34'h1c163705b;
    stim[22] = 34'h37d560bdf;
    stim[23] = 34'h0b03cbaa8;
    stim[24] = 34'h1106da25e;
    stim[25] = 34'h18691cee7;
    stim[26] = 34'h1380d7c39;
    stim[27] = 34'h01fbbe1a6;
    stim[28] = 34'h1db5258ee;
    stim[29] = 34'h1d87f4988;
    stim[30] = 34'h00d3ea13b;
    stim[31] = 34'h07244ec97;
    stim[32] = 34'h192dd1eab;
    stim[33] = 34'h0af3968ff;
    stim[34] = 34'h18ab406cd;
    stim[35] = 34'h1fe7ec358;
    stim[36] = 34'h1a8a542c4;
    stim[37] = 34'h07c00a95a;
    stim[38] = 34'h145303bc9;
    stim[39] = 34'h1f6a662fc;
    stim[40] = 34'h120167ff7;
    stim[41] = 34'h0adc34362;
    stim[42] = 34'h1ca20e448;
    stim[43] = 34'h0dc9b5f49;
    stim[44] = 34'h087015b3b;
    stim[45] = 34'h09254758c;
    stim[46] = 34'h0a84acdcd;
    stim[47] = 34'h190922408;
    stim[48] = 34'h1010d848f;
    stim[49] = 34'h06a348778;
    stim[50] = 34'h1af22cde9;
    stim[51] = 34'h141ebf3e0;
    stim[52] = 34'h178ac0d72;
    stim[53] = 34'h1f90ae72f;
    stim[54] = 34'h10d2073ed;
    stim[55] = 34'h137abb1db;
    stim[56] = 34'h016a14eca;
    stim[57] = 34'h0710a7052;
    stim[58] = 34'h0b333d19f;
    stim[59] = 34'h0658e51e2;
    stim[60] = 34'h19e5c9e69;
    stim[61] = 34'h0777c109a;
    stim[62] = 34'h0c9d70bfc;
    stim[63] = 34'h11911ef25;
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
      expv[0] = 5'h0x;
      expv[1] = 5'h0x;
      expv[2] = 5'h0x;
      expv[3] = 5'h0x;
      expv[4] = 5'h0x;
      expv[5] = 5'h0x;
      expv[6] = 5'h0x;
      expv[7] = 5'h0x;
      expv[8] = 5'h0x;
      expv[9] = 5'h04;
      expv[10] = 5'h04;
      expv[11] = 5'h04;
      expv[12] = 5'h04;
      expv[13] = 5'h04;
      expv[14] = 5'h04;
      expv[15] = 5'h00;
      expv[16] = 5'h00;
      expv[17] = 5'h00;
      expv[18] = 5'h00;
      expv[19] = 5'h00;
      expv[20] = 5'h00;
      expv[21] = 5'h00;
      expv[22] = 5'h00;
      expv[23] = 5'h00;
      expv[24] = 5'h00;
      expv[25] = 5'h00;
      expv[26] = 5'h00;
      expv[27] = 5'h00;
      expv[28] = 5'h00;
      expv[29] = 5'h00;
      expv[30] = 5'h04;
      expv[31] = 5'h04;
      expv[32] = 5'h04;
      expv[33] = 5'h04;
      expv[34] = 5'h04;
      expv[35] = 5'h04;
      expv[36] = 5'h12;
      expv[37] = 5'h02;
      expv[38] = 5'h02;
      expv[39] = 5'h02;
      expv[40] = 5'h02;
      expv[41] = 5'h02;
      expv[42] = 5'h06;
      expv[43] = 5'h06;
      expv[44] = 5'h06;
      expv[45] = 5'h06;
      expv[46] = 5'h06;
      expv[47] = 5'h06;
      expv[48] = 5'h02;
      expv[49] = 5'h02;
      expv[50] = 5'h02;
      expv[51] = 5'h02;
      expv[52] = 5'h02;
      expv[53] = 5'h02;
      expv[54] = 5'h06;
      expv[55] = 5'h06;
      expv[56] = 5'h06;
      expv[57] = 5'h06;
      expv[58] = 5'h06;
      expv[59] = 5'h06;
      expv[60] = 5'h03;
      expv[61] = 5'h03;
      expv[62] = 5'h03;
      expv[63] = 5'h03;
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
