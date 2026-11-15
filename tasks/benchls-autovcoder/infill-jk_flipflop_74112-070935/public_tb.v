// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_070935 dut (
    .clk1_b(clk),
    .pr1_b(in_vec[8:8]),
    .cl1_b(in_vec[7:7]),
    .j1(in_vec[6:6]),
    .k1(in_vec[5:5]),
    .pr2_b(in_vec[4:4]),
    .cl2_b(in_vec[3:3]),
    .clk2_b(in_vec[2:2]),
    .j2(in_vec[1:1]),
    .k2(in_vec[0:0]),
    .q1(out_vec[3:3]),
    .q1_b(out_vec[2:2]),
    .q2(out_vec[1:1]),
    .q2_b(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h1d1;
    stim[1] = 9'h096;
    stim[2] = 9'h0ea;
    stim[3] = 9'h1c7;
    stim[4] = 9'h11c;
    stim[5] = 9'h0d5;
    stim[6] = 9'h0ff;
    stim[7] = 9'h0b3;
    stim[8] = 9'h103;
    stim[9] = 9'h005;
    stim[10] = 9'h0b4;
    stim[11] = 9'h147;
    stim[12] = 9'h0ef;
    stim[13] = 9'h130;
    stim[14] = 9'h0d7;
    stim[15] = 9'h02a;
    stim[16] = 9'h175;
    stim[17] = 9'h181;
    stim[18] = 9'h061;
    stim[19] = 9'h160;
    stim[20] = 9'h03b;
    stim[21] = 9'h0cc;
    stim[22] = 9'h122;
    stim[23] = 9'h108;
    stim[24] = 9'h02a;
    stim[25] = 9'h105;
    stim[26] = 9'h06a;
    stim[27] = 9'h186;
    stim[28] = 9'h0a4;
    stim[29] = 9'h040;
    stim[30] = 9'h0dd;
    stim[31] = 9'h027;
    stim[32] = 9'h1ef;
    stim[33] = 9'h0b0;
    stim[34] = 9'h0bb;
    stim[35] = 9'h15b;
    stim[36] = 9'h1ed;
    stim[37] = 9'h1ea;
    stim[38] = 9'h112;
    stim[39] = 9'h090;
    stim[40] = 9'h164;
    stim[41] = 9'h119;
    stim[42] = 9'h13a;
    stim[43] = 9'h1e8;
    stim[44] = 9'h1a2;
    stim[45] = 9'h1d3;
    stim[46] = 9'h12c;
    stim[47] = 9'h16f;
    stim[48] = 9'h0c8;
    stim[49] = 9'h15f;
    stim[50] = 9'h054;
    stim[51] = 9'h01b;
    stim[52] = 9'h0ae;
    stim[53] = 9'h0a5;
    stim[54] = 9'h1c5;
    stim[55] = 9'h047;
    stim[56] = 9'h1e8;
    stim[57] = 9'h1d8;
    stim[58] = 9'h023;
    stim[59] = 9'h0ce;
    stim[60] = 9'h097;
    stim[61] = 9'h126;
    stim[62] = 9'h053;
    stim[63] = 9'h144;
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
      expv[0] = 4'hx;
      expv[1] = 4'hx;
      expv[2] = 4'ha;
      expv[3] = 4'ha;
      expv[4] = 4'ha;
      expv[5] = 4'ha;
      expv[6] = 4'ha;
      expv[7] = 4'h9;
      expv[8] = 4'h9;
      expv[9] = 4'h9;
      expv[10] = 4'ha;
      expv[11] = 4'ha;
      expv[12] = 4'ha;
      expv[13] = 4'ha;
      expv[14] = 4'ha;
      expv[15] = 4'h9;
      expv[16] = 4'h9;
      expv[17] = 4'h9;
      expv[18] = 4'h9;
      expv[19] = 4'ha;
      expv[20] = 4'ha;
      expv[21] = 4'ha;
      expv[22] = 4'ha;
      expv[23] = 4'ha;
      expv[24] = 4'h6;
      expv[25] = 4'h6;
      expv[26] = 4'h6;
      expv[27] = 4'h6;
      expv[28] = 4'ha;
      expv[29] = 4'ha;
      expv[30] = 4'ha;
      expv[31] = 4'ha;
      expv[32] = 4'ha;
      expv[33] = 4'ha;
      expv[34] = 4'ha;
      expv[35] = 4'h9;
      expv[36] = 4'h9;
      expv[37] = 4'h9;
      expv[38] = 4'ha;
      expv[39] = 4'ha;
      expv[40] = 4'h9;
      expv[41] = 4'h9;
      expv[42] = 4'h5;
      expv[43] = 4'h5;
      expv[44] = 4'h5;
      expv[45] = 4'h6;
      expv[46] = 4'h6;
      expv[47] = 4'h6;
      expv[48] = 4'h6;
      expv[49] = 4'h6;
      expv[50] = 4'h6;
      expv[51] = 4'h6;
      expv[52] = 4'ha;
      expv[53] = 4'ha;
      expv[54] = 4'ha;
      expv[55] = 4'ha;
      expv[56] = 4'ha;
      expv[57] = 4'ha;
      expv[58] = 4'ha;
      expv[59] = 4'ha;
      expv[60] = 4'ha;
      expv[61] = 4'ha;
      expv[62] = 4'ha;
      expv[63] = 4'ha;
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
