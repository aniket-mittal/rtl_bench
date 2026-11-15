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

  SDP_C_mgc_in_wire_wait_v1 dut (
    .ld(in_vec[9:9]),
    .vz(in_vec[8:8]),
    .z(in_vec[7:0]),
    .vd(out_vec[9:9]),
    .d(out_vec[8:1]),
    .lz(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h2f9;
    stim[1] = 10'h210;
    stim[2] = 10'h13d;
    stim[3] = 10'h322;
    stim[4] = 10'h3b3;
    stim[5] = 10'h267;
    stim[6] = 10'h101;
    stim[7] = 10'h2f0;
    stim[8] = 10'h345;
    stim[9] = 10'h09d;
    stim[10] = 10'h357;
    stim[11] = 10'h3a4;
    stim[12] = 10'h397;
    stim[13] = 10'h2c5;
    stim[14] = 10'h20b;
    stim[15] = 10'h3f4;
    stim[16] = 10'h15b;
    stim[17] = 10'h1fb;
    stim[18] = 10'h302;
    stim[19] = 10'h1b6;
    stim[20] = 10'h3fe;
    stim[21] = 10'h067;
    stim[22] = 10'h1fc;
    stim[23] = 10'h04c;
    stim[24] = 10'h17b;
    stim[25] = 10'h2a6;
    stim[26] = 10'h344;
    stim[27] = 10'h1fd;
    stim[28] = 10'h347;
    stim[29] = 10'h319;
    stim[30] = 10'h232;
    stim[31] = 10'h351;
    stim[32] = 10'h340;
    stim[33] = 10'h13f;
    stim[34] = 10'h021;
    stim[35] = 10'h0c8;
    stim[36] = 10'h231;
    stim[37] = 10'h2cb;
    stim[38] = 10'h0a1;
    stim[39] = 10'h0f1;
    stim[40] = 10'h280;
    stim[41] = 10'h2c0;
    stim[42] = 10'h258;
    stim[43] = 10'h0b4;
    stim[44] = 10'h00a;
    stim[45] = 10'h387;
    stim[46] = 10'h28c;
    stim[47] = 10'h2a2;
    stim[48] = 10'h342;
    stim[49] = 10'h377;
    stim[50] = 10'h21d;
    stim[51] = 10'h03a;
    stim[52] = 10'h37c;
    stim[53] = 10'h36a;
    stim[54] = 10'h137;
    stim[55] = 10'h015;
    stim[56] = 10'h01a;
    stim[57] = 10'h01a;
    stim[58] = 10'h193;
    stim[59] = 10'h1a0;
    stim[60] = 10'h2d4;
    stim[61] = 10'h2d0;
    stim[62] = 10'h355;
    stim[63] = 10'h350;
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
      expv[0] = 10'h1f3;
      expv[1] = 10'h021;
      expv[2] = 10'h27a;
      expv[3] = 10'h245;
      expv[4] = 10'h367;
      expv[5] = 10'h0cf;
      expv[6] = 10'h202;
      expv[7] = 10'h1e1;
      expv[8] = 10'h28b;
      expv[9] = 10'h13a;
      expv[10] = 10'h2af;
      expv[11] = 10'h349;
      expv[12] = 10'h32f;
      expv[13] = 10'h18b;
      expv[14] = 10'h017;
      expv[15] = 10'h3e9;
      expv[16] = 10'h2b6;
      expv[17] = 10'h3f6;
      expv[18] = 10'h205;
      expv[19] = 10'h36c;
      expv[20] = 10'h3fd;
      expv[21] = 10'h0ce;
      expv[22] = 10'h3f8;
      expv[23] = 10'h098;
      expv[24] = 10'h2f6;
      expv[25] = 10'h14d;
      expv[26] = 10'h289;
      expv[27] = 10'h3fa;
      expv[28] = 10'h28f;
      expv[29] = 10'h233;
      expv[30] = 10'h065;
      expv[31] = 10'h2a3;
      expv[32] = 10'h281;
      expv[33] = 10'h27e;
      expv[34] = 10'h042;
      expv[35] = 10'h190;
      expv[36] = 10'h063;
      expv[37] = 10'h197;
      expv[38] = 10'h142;
      expv[39] = 10'h1e2;
      expv[40] = 10'h101;
      expv[41] = 10'h181;
      expv[42] = 10'h0b1;
      expv[43] = 10'h168;
      expv[44] = 10'h014;
      expv[45] = 10'h30f;
      expv[46] = 10'h119;
      expv[47] = 10'h145;
      expv[48] = 10'h285;
      expv[49] = 10'h2ef;
      expv[50] = 10'h03b;
      expv[51] = 10'h074;
      expv[52] = 10'h2f9;
      expv[53] = 10'h2d5;
      expv[54] = 10'h26e;
      expv[55] = 10'h02a;
      expv[56] = 10'h034;
      expv[57] = 10'h034;
      expv[58] = 10'h326;
      expv[59] = 10'h340;
      expv[60] = 10'h1a9;
      expv[61] = 10'h1a1;
      expv[62] = 10'h2ab;
      expv[63] = 10'h2a1;
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
