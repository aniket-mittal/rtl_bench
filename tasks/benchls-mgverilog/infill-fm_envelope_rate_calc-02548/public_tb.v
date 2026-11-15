// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 29;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02548 dut (
    .attack(in_vec[28:28]),
    .base_rate(in_vec[27:23]),
    .keycode(in_vec[22:18]),
    .eg_cnt(in_vec[17:3]),
    .cnt_in(in_vec[2:2]),
    .ks(in_vec[1:0]),
    .cnt_lsb(out_vec[8:8]),
    .step(out_vec[7:7]),
    .rate(out_vec[6:1]),
    .sum_up(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 29'h0f579c41;
    stim[1] = 29'h0a908e6f;
    stim[2] = 29'h101a1bad;
    stim[3] = 29'h0eabd1ed;
    stim[4] = 29'h0b0f1fd6;
    stim[5] = 29'h0b7fab30;
    stim[6] = 29'h020841b5;
    stim[7] = 29'h18ce10e4;
    stim[8] = 29'h0041bf88;
    stim[9] = 29'h10d6b1d1;
    stim[10] = 29'h1e7967d7;
    stim[11] = 29'h02f20852;
    stim[12] = 29'h113051df;
    stim[13] = 29'h010585d5;
    stim[14] = 29'h18b6c564;
    stim[15] = 29'h0012c92b;
    stim[16] = 29'h180c434b;
    stim[17] = 29'h0d90deb7;
    stim[18] = 29'h1769a167;
    stim[19] = 29'h1917dade;
    stim[20] = 29'h1922f19a;
    stim[21] = 29'h07569253;
    stim[22] = 29'h1f3b4c8f;
    stim[23] = 29'h1b7c2ed9;
    stim[24] = 29'h0d9a5b46;
    stim[25] = 29'h0950c2be;
    stim[26] = 29'h1f2be7eb;
    stim[27] = 29'h1501724b;
    stim[28] = 29'h053a62b4;
    stim[29] = 29'h0e3927eb;
    stim[30] = 29'h09c2931c;
    stim[31] = 29'h0edce1f7;
    stim[32] = 29'h1fd8a073;
    stim[33] = 29'h19ea5ca6;
    stim[34] = 29'h17425ab4;
    stim[35] = 29'h18a89976;
    stim[36] = 29'h17c85229;
    stim[37] = 29'h080c3c0e;
    stim[38] = 29'h0a866920;
    stim[39] = 29'h00ad8c17;
    stim[40] = 29'h0d0f5bfe;
    stim[41] = 29'h0a4d0d65;
    stim[42] = 29'h1d928b90;
    stim[43] = 29'h17c81495;
    stim[44] = 29'h1865167b;
    stim[45] = 29'h0bd2e158;
    stim[46] = 29'h1f8b9185;
    stim[47] = 29'h074e7067;
    stim[48] = 29'h0c7d5d0b;
    stim[49] = 29'h0e130882;
    stim[50] = 29'h104de5fd;
    stim[51] = 29'h17e322b5;
    stim[52] = 29'h1c4863a4;
    stim[53] = 29'h1bda6179;
    stim[54] = 29'h07783370;
    stim[55] = 29'h10fa35f6;
    stim[56] = 29'h05bce76f;
    stim[57] = 29'h10d47eac;
    stim[58] = 29'h11ba4ffe;
    stim[59] = 29'h0f7d47a8;
    stim[60] = 29'h167931b5;
    stim[61] = 29'h07f7cf14;
    stim[62] = 29'h16e12cc5;
    stim[63] = 29'h0c80c52f;
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
      expv[0] = 9'h07e;
      expv[1] = 9'h0dd;
      expv[2] = 9'h001;
      expv[3] = 9'h178;
      expv[4] = 9'h1da;
      expv[5] = 9'h1df;
      expv[6] = 9'h011;
      expv[7] = 9'h1c8;
      expv[8] = 9'h101;
      expv[9] = 9'h18f;
      expv[10] = 9'h0ff;
      expv[11] = 9'h030;
      expv[12] = 9'h021;
      expv[13] = 9'h009;
      expv[14] = 9'h1c6;
      expv[15] = 9'h101;
      expv[16] = 9'h1c7;
      expv[17] = 9'h075;
      expv[18] = 9'h06d;
      expv[19] = 9'h0cd;
      expv[20] = 9'h1d1;
      expv[21] = 9'h062;
      expv[22] = 9'h1fe;
      expv[23] = 9'h1e7;
      expv[24] = 9'h073;
      expv[25] = 9'h1dc;
      expv[26] = 9'h1ff;
      expv[27] = 9'h1a9;
      expv[28] = 9'h02b;
      expv[29] = 9'h1ff;
      expv[30] = 9'h051;
      expv[31] = 9'h0ff;
      expv[32] = 9'h0fe;
      expv[33] = 9'h067;
      expv[34] = 9'h1bc;
      expv[35] = 9'h1ce;
      expv[36] = 9'h044;
      expv[37] = 9'h043;
      expv[38] = 9'h1d5;
      expv[39] = 9'h01b;
      expv[40] = 9'h1ea;
      expv[41] = 9'h059;
      expv[42] = 9'h06c;
      expv[43] = 9'h0c5;
      expv[44] = 9'h1f3;
      expv[45] = 9'h161;
      expv[46] = 9'h0fd;
      expv[47] = 9'h0df;
      expv[48] = 9'h1ff;
      expv[49] = 9'h074;
      expv[50] = 9'h100;
      expv[51] = 9'h1c8;
      expv[52] = 9'h065;
      expv[53] = 9'h1e7;
      expv[54] = 9'h1bf;
      expv[55] = 9'h1a2;
      expv[56] = 9'h1ca;
      expv[57] = 9'h188;
      expv[58] = 9'h19a;
      expv[59] = 9'h1ff;
      expv[60] = 9'h1be;
      expv[61] = 9'h0c3;
      expv[62] = 9'h1c0;
      expv[63] = 9'h1e4;
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
