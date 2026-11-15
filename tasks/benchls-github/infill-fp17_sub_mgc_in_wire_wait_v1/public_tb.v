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

  FP17_SUB_mgc_in_wire_wait_v1 dut (
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
    stim[0] = 10'h399;
    stim[1] = 10'h1d0;
    stim[2] = 10'h204;
    stim[3] = 10'h304;
    stim[4] = 10'h315;
    stim[5] = 10'h051;
    stim[6] = 10'h3ca;
    stim[7] = 10'h325;
    stim[8] = 10'h25d;
    stim[9] = 10'h170;
    stim[10] = 10'h2d0;
    stim[11] = 10'h0f9;
    stim[12] = 10'h364;
    stim[13] = 10'h103;
    stim[14] = 10'h319;
    stim[15] = 10'h302;
    stim[16] = 10'h12b;
    stim[17] = 10'h24d;
    stim[18] = 10'h266;
    stim[19] = 10'h3fc;
    stim[20] = 10'h184;
    stim[21] = 10'h2c8;
    stim[22] = 10'h09e;
    stim[23] = 10'h27a;
    stim[24] = 10'h1cd;
    stim[25] = 10'h0e1;
    stim[26] = 10'h080;
    stim[27] = 10'h07a;
    stim[28] = 10'h13f;
    stim[29] = 10'h045;
    stim[30] = 10'h354;
    stim[31] = 10'h1af;
    stim[32] = 10'h08f;
    stim[33] = 10'h315;
    stim[34] = 10'h037;
    stim[35] = 10'h3c6;
    stim[36] = 10'h199;
    stim[37] = 10'h2e0;
    stim[38] = 10'h054;
    stim[39] = 10'h260;
    stim[40] = 10'h265;
    stim[41] = 10'h26c;
    stim[42] = 10'h09d;
    stim[43] = 10'h30e;
    stim[44] = 10'h22d;
    stim[45] = 10'h387;
    stim[46] = 10'h114;
    stim[47] = 10'h0bb;
    stim[48] = 10'h3a7;
    stim[49] = 10'h13e;
    stim[50] = 10'h2f3;
    stim[51] = 10'h257;
    stim[52] = 10'h3ef;
    stim[53] = 10'h2b9;
    stim[54] = 10'h170;
    stim[55] = 10'h154;
    stim[56] = 10'h262;
    stim[57] = 10'h042;
    stim[58] = 10'h366;
    stim[59] = 10'h3be;
    stim[60] = 10'h269;
    stim[61] = 10'h2ec;
    stim[62] = 10'h363;
    stim[63] = 10'h2a0;
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
      expv[0] = 10'h333;
      expv[1] = 10'h3a0;
      expv[2] = 10'h009;
      expv[3] = 10'h209;
      expv[4] = 10'h22b;
      expv[5] = 10'h0a2;
      expv[6] = 10'h395;
      expv[7] = 10'h24b;
      expv[8] = 10'h0bb;
      expv[9] = 10'h2e0;
      expv[10] = 10'h1a1;
      expv[11] = 10'h1f2;
      expv[12] = 10'h2c9;
      expv[13] = 10'h206;
      expv[14] = 10'h233;
      expv[15] = 10'h205;
      expv[16] = 10'h256;
      expv[17] = 10'h09b;
      expv[18] = 10'h0cd;
      expv[19] = 10'h3f9;
      expv[20] = 10'h308;
      expv[21] = 10'h191;
      expv[22] = 10'h13c;
      expv[23] = 10'h0f5;
      expv[24] = 10'h39a;
      expv[25] = 10'h1c2;
      expv[26] = 10'h100;
      expv[27] = 10'h0f4;
      expv[28] = 10'h27e;
      expv[29] = 10'h08a;
      expv[30] = 10'h2a9;
      expv[31] = 10'h35e;
      expv[32] = 10'h11e;
      expv[33] = 10'h22b;
      expv[34] = 10'h06e;
      expv[35] = 10'h38d;
      expv[36] = 10'h332;
      expv[37] = 10'h1c1;
      expv[38] = 10'h0a8;
      expv[39] = 10'h0c1;
      expv[40] = 10'h0cb;
      expv[41] = 10'h0d9;
      expv[42] = 10'h13a;
      expv[43] = 10'h21d;
      expv[44] = 10'h05b;
      expv[45] = 10'h30f;
      expv[46] = 10'h228;
      expv[47] = 10'h176;
      expv[48] = 10'h34f;
      expv[49] = 10'h27c;
      expv[50] = 10'h1e7;
      expv[51] = 10'h0af;
      expv[52] = 10'h3df;
      expv[53] = 10'h173;
      expv[54] = 10'h2e0;
      expv[55] = 10'h2a8;
      expv[56] = 10'h0c5;
      expv[57] = 10'h084;
      expv[58] = 10'h2cd;
      expv[59] = 10'h37d;
      expv[60] = 10'h0d3;
      expv[61] = 10'h1d9;
      expv[62] = 10'h2c7;
      expv[63] = 10'h141;
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
