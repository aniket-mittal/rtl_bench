// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_216143 dut (
    .wclk(clk),
    .wrst(in_vec[12:12]),
    .winc(in_vec[11:11]),
    .wdata(in_vec[10:3]),
    .rclk(in_vec[2:2]),
    .rrst(in_vec[1:1]),
    .rinc(in_vec[0:0]),
    .wfull(out_vec[9:9]),
    .rdata(out_vec[8:1]),
    .rempty(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h1d17;
    stim[1] = 13'h1467;
    stim[2] = 13'h037f;
    stim[3] = 13'h0081;
    stim[4] = 13'h032a;
    stim[5] = 13'h0682;
    stim[6] = 13'h04bf;
    stim[7] = 13'h03ee;
    stim[8] = 13'h001b;
    stim[9] = 13'h0e4e;
    stim[10] = 13'h0fd3;
    stim[11] = 13'h08a9;
    stim[12] = 13'h01fc;
    stim[13] = 13'h0135;
    stim[14] = 13'h0a05;
    stim[15] = 13'h0d4d;
    stim[16] = 13'h05d7;
    stim[17] = 13'h0713;
    stim[18] = 13'h05fb;
    stim[19] = 13'h0516;
    stim[20] = 13'h0d79;
    stim[21] = 13'h0007;
    stim[22] = 13'h0695;
    stim[23] = 13'h0c82;
    stim[24] = 13'h0cbd;
    stim[25] = 13'h0207;
    stim[26] = 13'h0394;
    stim[27] = 13'h0c83;
    stim[28] = 13'h03bb;
    stim[29] = 13'h0e4e;
    stim[30] = 13'h0c7c;
    stim[31] = 13'h0055;
    stim[32] = 13'h04f8;
    stim[33] = 13'h0b7d;
    stim[34] = 13'h0495;
    stim[35] = 13'h017d;
    stim[36] = 13'h0169;
    stim[37] = 13'h05aa;
    stim[38] = 13'h041c;
    stim[39] = 13'h021f;
    stim[40] = 13'h06e6;
    stim[41] = 13'h05b5;
    stim[42] = 13'h0057;
    stim[43] = 13'h0126;
    stim[44] = 13'h07b3;
    stim[45] = 13'h0c93;
    stim[46] = 13'h0ba5;
    stim[47] = 13'h05b7;
    stim[48] = 13'h0d36;
    stim[49] = 13'h0256;
    stim[50] = 13'h07ad;
    stim[51] = 13'h0342;
    stim[52] = 13'h04a0;
    stim[53] = 13'h03ac;
    stim[54] = 13'h0b87;
    stim[55] = 13'h052f;
    stim[56] = 13'h02dc;
    stim[57] = 13'h07f7;
    stim[58] = 13'h0059;
    stim[59] = 13'h0ca8;
    stim[60] = 13'h1da5;
    stim[61] = 13'h0254;
    stim[62] = 13'h02ba;
    stim[63] = 13'h071c;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'hxxx;
      expv[2] = 10'hxxx;
      expv[3] = 10'hxxx;
      expv[4] = 10'hxxx;
      expv[5] = 10'hxxx;
      expv[6] = 10'hxxx;
      expv[7] = 10'hxxx;
      expv[8] = 10'hxxx;
      expv[9] = 10'hxxx;
      expv[10] = 10'h19x;
      expv[11] = 10'h19x;
      expv[12] = 10'h193;
      expv[13] = 10'h193;
      expv[14] = 10'h193;
      expv[15] = 10'h193;
      expv[16] = 10'h193;
      expv[17] = 10'h193;
      expv[18] = 10'h193;
      expv[19] = 10'h193;
      expv[20] = 10'h193;
      expv[21] = 10'h193;
      expv[22] = 10'h193;
      expv[23] = 10'h193;
      expv[24] = 10'h193;
      expv[25] = 10'h193;
      expv[26] = 10'h193;
      expv[27] = 10'h193;
      expv[28] = 10'h193;
      expv[29] = 10'h193;
      expv[30] = 10'h193;
      expv[31] = 10'h193;
      expv[32] = 10'h193;
      expv[33] = 10'h193;
      expv[34] = 10'h193;
      expv[35] = 10'h193;
      expv[36] = 10'h193;
      expv[37] = 10'h393;
      expv[38] = 10'h393;
      expv[39] = 10'h393;
      expv[40] = 10'h393;
      expv[41] = 10'h393;
      expv[42] = 10'h393;
      expv[43] = 10'h393;
      expv[44] = 10'h393;
      expv[45] = 10'h393;
      expv[46] = 10'h393;
      expv[47] = 10'h393;
      expv[48] = 10'h393;
      expv[49] = 10'h393;
      expv[50] = 10'h393;
      expv[51] = 10'h393;
      expv[52] = 10'h393;
      expv[53] = 10'h393;
      expv[54] = 10'h393;
      expv[55] = 10'h393;
      expv[56] = 10'h393;
      expv[57] = 10'h393;
      expv[58] = 10'h393;
      expv[59] = 10'h393;
      expv[60] = 10'h193;
      expv[61] = 10'h193;
      expv[62] = 10'h193;
      expv[63] = 10'h193;
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
