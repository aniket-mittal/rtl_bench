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

  FP17_TO_FP32_mgc_out_stdreg_wait_v1 dut (
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
    stim[0] = 10'h112;
    stim[1] = 10'h383;
    stim[2] = 10'h19e;
    stim[3] = 10'h358;
    stim[4] = 10'h070;
    stim[5] = 10'h004;
    stim[6] = 10'h397;
    stim[7] = 10'h1fa;
    stim[8] = 10'h33b;
    stim[9] = 10'h107;
    stim[10] = 10'h3a8;
    stim[11] = 10'h021;
    stim[12] = 10'h267;
    stim[13] = 10'h11c;
    stim[14] = 10'h135;
    stim[15] = 10'h25a;
    stim[16] = 10'h332;
    stim[17] = 10'h11e;
    stim[18] = 10'h252;
    stim[19] = 10'h005;
    stim[20] = 10'h0e5;
    stim[21] = 10'h2d8;
    stim[22] = 10'h290;
    stim[23] = 10'h2e3;
    stim[24] = 10'h3fb;
    stim[25] = 10'h3a9;
    stim[26] = 10'h13f;
    stim[27] = 10'h0fc;
    stim[28] = 10'h3e3;
    stim[29] = 10'h03a;
    stim[30] = 10'h3ac;
    stim[31] = 10'h260;
    stim[32] = 10'h053;
    stim[33] = 10'h1ef;
    stim[34] = 10'h1ba;
    stim[35] = 10'h1dd;
    stim[36] = 10'h2fc;
    stim[37] = 10'h2e4;
    stim[38] = 10'h197;
    stim[39] = 10'h324;
    stim[40] = 10'h12a;
    stim[41] = 10'h27e;
    stim[42] = 10'h1f9;
    stim[43] = 10'h391;
    stim[44] = 10'h028;
    stim[45] = 10'h028;
    stim[46] = 10'h107;
    stim[47] = 10'h230;
    stim[48] = 10'h3f1;
    stim[49] = 10'h137;
    stim[50] = 10'h35a;
    stim[51] = 10'h33c;
    stim[52] = 10'h2f2;
    stim[53] = 10'h280;
    stim[54] = 10'h26a;
    stim[55] = 10'h20f;
    stim[56] = 10'h2c4;
    stim[57] = 10'h0d3;
    stim[58] = 10'h1a8;
    stim[59] = 10'h312;
    stim[60] = 10'h128;
    stim[61] = 10'h181;
    stim[62] = 10'h1fa;
    stim[63] = 10'h091;
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
      expv[0] = 10'h089;
      expv[1] = 10'h3c1;
      expv[2] = 10'h0cf;
      expv[3] = 10'h1ac;
      expv[4] = 10'h038;
      expv[5] = 10'h002;
      expv[6] = 10'h3cb;
      expv[7] = 10'h0fd;
      expv[8] = 10'h39d;
      expv[9] = 10'h283;
      expv[10] = 10'h1d4;
      expv[11] = 10'h210;
      expv[12] = 10'h333;
      expv[13] = 10'h08e;
      expv[14] = 10'h29a;
      expv[15] = 10'h12d;
      expv[16] = 10'h199;
      expv[17] = 10'h08f;
      expv[18] = 10'h129;
      expv[19] = 10'h202;
      expv[20] = 10'h272;
      expv[21] = 10'h16c;
      expv[22] = 10'h148;
      expv[23] = 10'h371;
      expv[24] = 10'h3fd;
      expv[25] = 10'h3d4;
      expv[26] = 10'h29f;
      expv[27] = 10'h07e;
      expv[28] = 10'h3f1;
      expv[29] = 10'h01d;
      expv[30] = 10'h1d6;
      expv[31] = 10'h130;
      expv[32] = 10'h229;
      expv[33] = 10'h2f7;
      expv[34] = 10'h0dd;
      expv[35] = 10'h2ee;
      expv[36] = 10'h17e;
      expv[37] = 10'h172;
      expv[38] = 10'h2cb;
      expv[39] = 10'h192;
      expv[40] = 10'h095;
      expv[41] = 10'h13f;
      expv[42] = 10'h2fc;
      expv[43] = 10'h3c8;
      expv[44] = 10'h014;
      expv[45] = 10'h014;
      expv[46] = 10'h283;
      expv[47] = 10'h118;
      expv[48] = 10'h3f8;
      expv[49] = 10'h29b;
      expv[50] = 10'h1ad;
      expv[51] = 10'h19e;
      expv[52] = 10'h179;
      expv[53] = 10'h140;
      expv[54] = 10'h135;
      expv[55] = 10'h307;
      expv[56] = 10'h162;
      expv[57] = 10'h269;
      expv[58] = 10'h0d4;
      expv[59] = 10'h189;
      expv[60] = 10'h094;
      expv[61] = 10'h2c0;
      expv[62] = 10'h0fd;
      expv[63] = 10'h248;
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
