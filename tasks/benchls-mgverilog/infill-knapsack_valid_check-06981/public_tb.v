// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06981 dut (
    .A(in_vec[20:20]),
    .B(in_vec[19:19]),
    .C(in_vec[18:18]),
    .D(in_vec[17:17]),
    .E(in_vec[16:16]),
    .F(in_vec[15:15]),
    .G(in_vec[14:14]),
    .H(in_vec[13:13]),
    .I(in_vec[12:12]),
    .J(in_vec[11:11]),
    .K(in_vec[10:10]),
    .L(in_vec[9:9]),
    .M(in_vec[8:8]),
    .N(in_vec[7:7]),
    .O(in_vec[6:6]),
    .P(in_vec[5:5]),
    .Q(in_vec[4:4]),
    .R(in_vec[3:3]),
    .S(in_vec[2:2]),
    .T(in_vec[1:1]),
    .U(in_vec[0:0]),
    .valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h1fddc3;
    stim[1] = 21'h0fb542;
    stim[2] = 21'h0dabfd;
    stim[3] = 21'h039bf9;
    stim[4] = 21'h012a76;
    stim[5] = 21'h03dedb;
    stim[6] = 21'h113a34;
    stim[7] = 21'h01cb04;
    stim[8] = 21'h1bc993;
    stim[9] = 21'h0461e5;
    stim[10] = 21'h130529;
    stim[11] = 21'h02155c;
    stim[12] = 21'h037c68;
    stim[13] = 21'h04c61b;
    stim[14] = 21'h0d0314;
    stim[15] = 21'h0c1cdf;
    stim[16] = 21'h15fd50;
    stim[17] = 21'h07dec0;
    stim[18] = 21'h1de02b;
    stim[19] = 21'h05a459;
    stim[20] = 21'h0aa16a;
    stim[21] = 21'h169a6c;
    stim[22] = 21'h05d1ed;
    stim[23] = 21'h0cc343;
    stim[24] = 21'h1f21d1;
    stim[25] = 21'h1fa82e;
    stim[26] = 21'h026019;
    stim[27] = 21'h1f93b9;
    stim[28] = 21'h1af230;
    stim[29] = 21'h19c397;
    stim[30] = 21'h076f72;
    stim[31] = 21'h1414dd;
    stim[32] = 21'h074e75;
    stim[33] = 21'h1c9923;
    stim[34] = 21'h114954;
    stim[35] = 21'h08b56c;
    stim[36] = 21'h0760b0;
    stim[37] = 21'h18142a;
    stim[38] = 21'h03304f;
    stim[39] = 21'h163368;
    stim[40] = 21'h1733f4;
    stim[41] = 21'h18bd33;
    stim[42] = 21'h0c108e;
    stim[43] = 21'h1b1309;
    stim[44] = 21'h075823;
    stim[45] = 21'h111d6e;
    stim[46] = 21'h16c826;
    stim[47] = 21'h022fd6;
    stim[48] = 21'h0ebba7;
    stim[49] = 21'h039675;
    stim[50] = 21'h1a7b64;
    stim[51] = 21'h07a317;
    stim[52] = 21'h0b7c99;
    stim[53] = 21'h041fa8;
    stim[54] = 21'h02357e;
    stim[55] = 21'h05b18c;
    stim[56] = 21'h0167e6;
    stim[57] = 21'h137466;
    stim[58] = 21'h136232;
    stim[59] = 21'h0d6e7d;
    stim[60] = 21'h13b76a;
    stim[61] = 21'h177955;
    stim[62] = 21'h0b5754;
    stim[63] = 21'h1ef162;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
