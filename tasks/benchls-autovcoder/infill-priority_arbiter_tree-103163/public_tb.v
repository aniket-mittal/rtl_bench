// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_103163 dut (
    .req0_i(in_vec[8:8]),
    .req1_i(in_vec[7:7]),
    .req2_i(in_vec[6:6]),
    .req3_i(in_vec[5:5]),
    .req4_i(in_vec[4:4]),
    .req5_i(in_vec[3:3]),
    .req6_i(in_vec[2:2]),
    .req7_i(in_vec[1:1]),
    .grant_i(in_vec[0:0]),
    .grant0_o(out_vec[8:8]),
    .grant1_o(out_vec[7:7]),
    .grant2_o(out_vec[6:6]),
    .grant3_o(out_vec[5:5]),
    .grant4_o(out_vec[4:4]),
    .grant5_o(out_vec[3:3]),
    .grant6_o(out_vec[2:2]),
    .grant7_o(out_vec[1:1]),
    .req_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h1aa;
    stim[1] = 9'h1ee;
    stim[2] = 9'h1d7;
    stim[3] = 9'h02c;
    stim[4] = 9'h1ec;
    stim[5] = 9'h013;
    stim[6] = 9'h0a7;
    stim[7] = 9'h1c0;
    stim[8] = 9'h1f3;
    stim[9] = 9'h16b;
    stim[10] = 9'h0f1;
    stim[11] = 9'h0c0;
    stim[12] = 9'h1fb;
    stim[13] = 9'h1f4;
    stim[14] = 9'h032;
    stim[15] = 9'h138;
    stim[16] = 9'h153;
    stim[17] = 9'h058;
    stim[18] = 9'h1bd;
    stim[19] = 9'h147;
    stim[20] = 9'h151;
    stim[21] = 9'h198;
    stim[22] = 9'h0c0;
    stim[23] = 9'h0e3;
    stim[24] = 9'h0e2;
    stim[25] = 9'h120;
    stim[26] = 9'h185;
    stim[27] = 9'h1ed;
    stim[28] = 9'h06e;
    stim[29] = 9'h145;
    stim[30] = 9'h191;
    stim[31] = 9'h1ab;
    stim[32] = 9'h1e3;
    stim[33] = 9'h067;
    stim[34] = 9'h14b;
    stim[35] = 9'h1b2;
    stim[36] = 9'h08e;
    stim[37] = 9'h114;
    stim[38] = 9'h144;
    stim[39] = 9'h062;
    stim[40] = 9'h10e;
    stim[41] = 9'h142;
    stim[42] = 9'h0ae;
    stim[43] = 9'h04f;
    stim[44] = 9'h0a1;
    stim[45] = 9'h0c4;
    stim[46] = 9'h175;
    stim[47] = 9'h1e7;
    stim[48] = 9'h072;
    stim[49] = 9'h0be;
    stim[50] = 9'h11a;
    stim[51] = 9'h1c6;
    stim[52] = 9'h0a0;
    stim[53] = 9'h1e1;
    stim[54] = 9'h0e3;
    stim[55] = 9'h1f5;
    stim[56] = 9'h15e;
    stim[57] = 9'h1a8;
    stim[58] = 9'h032;
    stim[59] = 9'h120;
    stim[60] = 9'h123;
    stim[61] = 9'h033;
    stim[62] = 9'h0f8;
    stim[63] = 9'h1cc;
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
      expv[0] = 9'h001;
      expv[1] = 9'h001;
      expv[2] = 9'h101;
      expv[3] = 9'h001;
      expv[4] = 9'h001;
      expv[5] = 9'h011;
      expv[6] = 9'h081;
      expv[7] = 9'h001;
      expv[8] = 9'h101;
      expv[9] = 9'h101;
      expv[10] = 9'h081;
      expv[11] = 9'h001;
      expv[12] = 9'h101;
      expv[13] = 9'h001;
      expv[14] = 9'h001;
      expv[15] = 9'h001;
      expv[16] = 9'h101;
      expv[17] = 9'h001;
      expv[18] = 9'h101;
      expv[19] = 9'h101;
      expv[20] = 9'h101;
      expv[21] = 9'h001;
      expv[22] = 9'h001;
      expv[23] = 9'h081;
      expv[24] = 9'h001;
      expv[25] = 9'h001;
      expv[26] = 9'h101;
      expv[27] = 9'h101;
      expv[28] = 9'h001;
      expv[29] = 9'h101;
      expv[30] = 9'h101;
      expv[31] = 9'h101;
      expv[32] = 9'h101;
      expv[33] = 9'h041;
      expv[34] = 9'h101;
      expv[35] = 9'h001;
      expv[36] = 9'h001;
      expv[37] = 9'h001;
      expv[38] = 9'h001;
      expv[39] = 9'h001;
      expv[40] = 9'h001;
      expv[41] = 9'h001;
      expv[42] = 9'h001;
      expv[43] = 9'h041;
      expv[44] = 9'h081;
      expv[45] = 9'h001;
      expv[46] = 9'h101;
      expv[47] = 9'h101;
      expv[48] = 9'h001;
      expv[49] = 9'h001;
      expv[50] = 9'h001;
      expv[51] = 9'h001;
      expv[52] = 9'h001;
      expv[53] = 9'h101;
      expv[54] = 9'h081;
      expv[55] = 9'h101;
      expv[56] = 9'h001;
      expv[57] = 9'h001;
      expv[58] = 9'h001;
      expv[59] = 9'h001;
      expv[60] = 9'h101;
      expv[61] = 9'h021;
      expv[62] = 9'h001;
      expv[63] = 9'h001;
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
