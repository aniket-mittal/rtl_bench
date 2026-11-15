// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 39;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_102254 dut (
    .clok(clk),
    .resetm(in_vec[17:17]),
    .new_char(in_vec[16:16]),
    .new_key(in_vec[15:15]),
    .start_over(in_vec[14:14]),
    .char_recieved(in_vec[13:6]),
    .char_count(in_vec[5:0]),
    .LEDS(out_vec[38:29]),
    .found_key(out_vec[28:28]),
    .matched_cont(out_vec[27:27]),
    .done(out_vec[26:26]),
    .last_key(out_vec[25:25]),
    .key(out_vec[24:1]),
    .compared_char(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h38c99;
    stim[1] = 18'h25009;
    stim[2] = 18'h123fa;
    stim[3] = 18'h0d25d;
    stim[4] = 18'h09b3a;
    stim[5] = 18'h03a9c;
    stim[6] = 18'h099fe;
    stim[7] = 18'h1bce9;
    stim[8] = 18'h18a2e;
    stim[9] = 18'h1de67;
    stim[10] = 18'h0c6a1;
    stim[11] = 18'h0f4e3;
    stim[12] = 18'h062f5;
    stim[13] = 18'h11e89;
    stim[14] = 18'h1e6f1;
    stim[15] = 18'h1b0c3;
    stim[16] = 18'h0bc86;
    stim[17] = 18'h00f94;
    stim[18] = 18'h02619;
    stim[19] = 18'h0d45e;
    stim[20] = 18'h1d1e3;
    stim[21] = 18'h24a06;
    stim[22] = 18'h08128;
    stim[23] = 18'h08370;
    stim[24] = 18'h0e823;
    stim[25] = 18'h1d8f1;
    stim[26] = 18'h1322e;
    stim[27] = 18'h15cc1;
    stim[28] = 18'h1669c;
    stim[29] = 18'h096a6;
    stim[30] = 18'h0652b;
    stim[31] = 18'h157cd;
    stim[32] = 18'h02a7d;
    stim[33] = 18'h1c07c;
    stim[34] = 18'h0aa81;
    stim[35] = 18'h17f5f;
    stim[36] = 18'h0a444;
    stim[37] = 18'h0ad85;
    stim[38] = 18'h08052;
    stim[39] = 18'h1c280;
    stim[40] = 18'h01053;
    stim[41] = 18'h01fad;
    stim[42] = 18'h1de10;
    stim[43] = 18'h1c068;
    stim[44] = 18'h169e4;
    stim[45] = 18'h02d86;
    stim[46] = 18'h14341;
    stim[47] = 18'h0a589;
    stim[48] = 18'h06042;
    stim[49] = 18'h05dc2;
    stim[50] = 18'h08b29;
    stim[51] = 18'h1eeb8;
    stim[52] = 18'h034b9;
    stim[53] = 18'h1798a;
    stim[54] = 18'h10b88;
    stim[55] = 18'h0c034;
    stim[56] = 18'h0f490;
    stim[57] = 18'h0bbc1;
    stim[58] = 18'h0bd82;
    stim[59] = 18'h17a34;
    stim[60] = 18'h0b0da;
    stim[61] = 18'h1811d;
    stim[62] = 18'h1a1d4;
    stim[63] = 18'h00c1a;
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
      expv[0] = 39'h0000000000;
      expv[1] = 39'h0000000000;
      expv[2] = 39'h0000000000;
      expv[3] = 39'h0000000001;
      expv[4] = 39'h1100000000;
      expv[5] = 39'h4100000002;
      expv[6] = 39'h3100000002;
      expv[7] = 39'h0100000002;
      expv[8] = 39'h0100000003;
      expv[9] = 39'h1200000002;
      expv[10] = 39'h4301fffffc;
      expv[11] = 39'h3401fffffc;
      expv[12] = 39'h0401fffffc;
      expv[13] = 39'h0401fffffc;
      expv[14] = 39'h0401fffffd;
      expv[15] = 39'h1501fffffc;
      expv[16] = 39'h4601fffffe;
      expv[17] = 39'h3701fffffe;
      expv[18] = 39'h0701fffffe;
      expv[19] = 39'h0701fffffe;
      expv[20] = 39'h0701fffffe;
      expv[21] = 39'h0000000000;
      expv[22] = 39'h0000000000;
      expv[23] = 39'h0000000000;
      expv[24] = 39'h0000000000;
      expv[25] = 39'h0000000000;
      expv[26] = 39'h0000000001;
      expv[27] = 39'h1100000000;
      expv[28] = 39'h4201fffffe;
      expv[29] = 39'h3301fffffe;
      expv[30] = 39'h0401fffffe;
      expv[31] = 39'h0401fffffe;
      expv[32] = 39'h0401ffffff;
      expv[33] = 39'h1501fffffe;
      expv[34] = 39'h4500000000;
      expv[35] = 39'h3600000000;
      expv[36] = 39'h0600000001;
      expv[37] = 39'h1700000000;
      expv[38] = 39'h4700000002;
      expv[39] = 39'h3700000002;
      expv[40] = 39'h0700000003;
      expv[41] = 39'h1800000002;
      expv[42] = 39'h4800000002;
      expv[43] = 39'h4801fffffc;
      expv[44] = 39'h3901fffffc;
      expv[45] = 39'h0a01fffffd;
      expv[46] = 39'h1b01fffffc;
      expv[47] = 39'h4b00000002;
      expv[48] = 39'h3c00000002;
      expv[49] = 39'h0c00000002;
      expv[50] = 39'h0c00000002;
      expv[51] = 39'h0c00000002;
      expv[52] = 39'h0c00000003;
      expv[53] = 39'h1d00000002;
      expv[54] = 39'h4d01fffffc;
      expv[55] = 39'h3e01fffffc;
      expv[56] = 39'h0f01fffffc;
      expv[57] = 39'h0f01fffffc;
      expv[58] = 39'h0f01fffffc;
      expv[59] = 39'h0f01fffffc;
      expv[60] = 39'h0f01fffffd;
      expv[61] = 39'h1001fffffc;
      expv[62] = 39'h4001fffffe;
      expv[63] = 39'h3101fffffe;
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
