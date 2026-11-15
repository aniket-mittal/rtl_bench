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

  FP16_TO_FP17_mgc_out_stdreg_wait_v1 dut (
    .ld(in_vec[9:9]),
    .d(in_vec[8:1]),
    .vz(in_vec[0:0]),
    .vd(out_vec[9:9]),
    .lz(out_vec[8:8]),
    .z(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h175;
    stim[1] = 10'h1e8;
    stim[2] = 10'h2d8;
    stim[3] = 10'h127;
    stim[4] = 10'h2b1;
    stim[5] = 10'h18e;
    stim[6] = 10'h0db;
    stim[7] = 10'h022;
    stim[8] = 10'h356;
    stim[9] = 10'h393;
    stim[10] = 10'h20d;
    stim[11] = 10'h20c;
    stim[12] = 10'h214;
    stim[13] = 10'h16b;
    stim[14] = 10'h1c7;
    stim[15] = 10'h22c;
    stim[16] = 10'h3cc;
    stim[17] = 10'h008;
    stim[18] = 10'h118;
    stim[19] = 10'h0ec;
    stim[20] = 10'h15f;
    stim[21] = 10'h26d;
    stim[22] = 10'h067;
    stim[23] = 10'h1ab;
    stim[24] = 10'h11e;
    stim[25] = 10'h0e8;
    stim[26] = 10'h12a;
    stim[27] = 10'h318;
    stim[28] = 10'h00a;
    stim[29] = 10'h3cb;
    stim[30] = 10'h03a;
    stim[31] = 10'h011;
    stim[32] = 10'h11b;
    stim[33] = 10'h343;
    stim[34] = 10'h0de;
    stim[35] = 10'h02d;
    stim[36] = 10'h1e8;
    stim[37] = 10'h17b;
    stim[38] = 10'h22f;
    stim[39] = 10'h193;
    stim[40] = 10'h25d;
    stim[41] = 10'h052;
    stim[42] = 10'h2bf;
    stim[43] = 10'h002;
    stim[44] = 10'h1a0;
    stim[45] = 10'h359;
    stim[46] = 10'h3cc;
    stim[47] = 10'h311;
    stim[48] = 10'h0ff;
    stim[49] = 10'h0c3;
    stim[50] = 10'h147;
    stim[51] = 10'h3cc;
    stim[52] = 10'h2dc;
    stim[53] = 10'h211;
    stim[54] = 10'h03f;
    stim[55] = 10'h1e0;
    stim[56] = 10'h2cc;
    stim[57] = 10'h272;
    stim[58] = 10'h007;
    stim[59] = 10'h390;
    stim[60] = 10'h0fa;
    stim[61] = 10'h0d3;
    stim[62] = 10'h1c2;
    stim[63] = 10'h0bc;
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
      expv[0] = 10'h2ba;
      expv[1] = 10'h0f4;
      expv[2] = 10'h16c;
      expv[3] = 10'h293;
      expv[4] = 10'h358;
      expv[5] = 10'h0c7;
      expv[6] = 10'h26d;
      expv[7] = 10'h011;
      expv[8] = 10'h1ab;
      expv[9] = 10'h3c9;
      expv[10] = 10'h306;
      expv[11] = 10'h106;
      expv[12] = 10'h10a;
      expv[13] = 10'h2b5;
      expv[14] = 10'h2e3;
      expv[15] = 10'h116;
      expv[16] = 10'h1e6;
      expv[17] = 10'h004;
      expv[18] = 10'h08c;
      expv[19] = 10'h076;
      expv[20] = 10'h2af;
      expv[21] = 10'h336;
      expv[22] = 10'h233;
      expv[23] = 10'h2d5;
      expv[24] = 10'h08f;
      expv[25] = 10'h074;
      expv[26] = 10'h095;
      expv[27] = 10'h18c;
      expv[28] = 10'h005;
      expv[29] = 10'h3e5;
      expv[30] = 10'h01d;
      expv[31] = 10'h208;
      expv[32] = 10'h28d;
      expv[33] = 10'h3a1;
      expv[34] = 10'h06f;
      expv[35] = 10'h216;
      expv[36] = 10'h0f4;
      expv[37] = 10'h2bd;
      expv[38] = 10'h317;
      expv[39] = 10'h2c9;
      expv[40] = 10'h32e;
      expv[41] = 10'h029;
      expv[42] = 10'h35f;
      expv[43] = 10'h001;
      expv[44] = 10'h0d0;
      expv[45] = 10'h3ac;
      expv[46] = 10'h1e6;
      expv[47] = 10'h388;
      expv[48] = 10'h27f;
      expv[49] = 10'h261;
      expv[50] = 10'h2a3;
      expv[51] = 10'h1e6;
      expv[52] = 10'h16e;
      expv[53] = 10'h308;
      expv[54] = 10'h21f;
      expv[55] = 10'h0f0;
      expv[56] = 10'h166;
      expv[57] = 10'h139;
      expv[58] = 10'h203;
      expv[59] = 10'h1c8;
      expv[60] = 10'h07d;
      expv[61] = 10'h269;
      expv[62] = 10'h0e1;
      expv[63] = 10'h05e;
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
