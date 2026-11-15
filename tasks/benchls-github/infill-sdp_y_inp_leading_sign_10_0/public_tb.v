// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  SDP_Y_INP_leading_sign_10_0 dut (
    .mantissa(in_vec[9:0]),
    .rtn(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h3cd;
    stim[1] = 10'h3b7;
    stim[2] = 10'h241;
    stim[3] = 10'h183;
    stim[4] = 10'h105;
    stim[5] = 10'h0d0;
    stim[6] = 10'h1fa;
    stim[7] = 10'h0f3;
    stim[8] = 10'h310;
    stim[9] = 10'h3e1;
    stim[10] = 10'h32b;
    stim[11] = 10'h05e;
    stim[12] = 10'h313;
    stim[13] = 10'h399;
    stim[14] = 10'h1db;
    stim[15] = 10'h1ad;
    stim[16] = 10'h0b0;
    stim[17] = 10'h1a5;
    stim[18] = 10'h291;
    stim[19] = 10'h162;
    stim[20] = 10'h3cf;
    stim[21] = 10'h3ab;
    stim[22] = 10'h2e7;
    stim[23] = 10'h3f3;
    stim[24] = 10'h140;
    stim[25] = 10'h2e4;
    stim[26] = 10'h0fe;
    stim[27] = 10'h2f5;
    stim[28] = 10'h33c;
    stim[29] = 10'h01b;
    stim[30] = 10'h0bf;
    stim[31] = 10'h137;
    stim[32] = 10'h240;
    stim[33] = 10'h0f0;
    stim[34] = 10'h330;
    stim[35] = 10'h028;
    stim[36] = 10'h13d;
    stim[37] = 10'h2c2;
    stim[38] = 10'h250;
    stim[39] = 10'h33d;
    stim[40] = 10'h29f;
    stim[41] = 10'h0d2;
    stim[42] = 10'h3a0;
    stim[43] = 10'h0a1;
    stim[44] = 10'h011;
    stim[45] = 10'h149;
    stim[46] = 10'h0ca;
    stim[47] = 10'h0d9;
    stim[48] = 10'h19b;
    stim[49] = 10'h29e;
    stim[50] = 10'h398;
    stim[51] = 10'h1f9;
    stim[52] = 10'h380;
    stim[53] = 10'h1fa;
    stim[54] = 10'h0eb;
    stim[55] = 10'h315;
    stim[56] = 10'h2fa;
    stim[57] = 10'h092;
    stim[58] = 10'h1f4;
    stim[59] = 10'h00b;
    stim[60] = 10'h090;
    stim[61] = 10'h2e4;
    stim[62] = 10'h082;
    stim[63] = 10'h283;
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
      expv[0] = 4'h0;
      expv[1] = 4'h0;
      expv[2] = 4'h0;
      expv[3] = 4'h1;
      expv[4] = 4'h1;
      expv[5] = 4'h2;
      expv[6] = 4'h1;
      expv[7] = 4'h2;
      expv[8] = 4'h0;
      expv[9] = 4'h0;
      expv[10] = 4'h0;
      expv[11] = 4'h3;
      expv[12] = 4'h0;
      expv[13] = 4'h0;
      expv[14] = 4'h1;
      expv[15] = 4'h1;
      expv[16] = 4'h2;
      expv[17] = 4'h1;
      expv[18] = 4'h0;
      expv[19] = 4'h1;
      expv[20] = 4'h0;
      expv[21] = 4'h0;
      expv[22] = 4'h0;
      expv[23] = 4'h0;
      expv[24] = 4'h1;
      expv[25] = 4'h0;
      expv[26] = 4'h2;
      expv[27] = 4'h0;
      expv[28] = 4'h0;
      expv[29] = 4'h5;
      expv[30] = 4'h2;
      expv[31] = 4'h1;
      expv[32] = 4'h0;
      expv[33] = 4'h2;
      expv[34] = 4'h0;
      expv[35] = 4'h4;
      expv[36] = 4'h1;
      expv[37] = 4'h0;
      expv[38] = 4'h0;
      expv[39] = 4'h0;
      expv[40] = 4'h0;
      expv[41] = 4'h2;
      expv[42] = 4'h0;
      expv[43] = 4'h2;
      expv[44] = 4'h5;
      expv[45] = 4'h1;
      expv[46] = 4'h2;
      expv[47] = 4'h2;
      expv[48] = 4'h1;
      expv[49] = 4'h0;
      expv[50] = 4'h0;
      expv[51] = 4'h1;
      expv[52] = 4'h0;
      expv[53] = 4'h1;
      expv[54] = 4'h2;
      expv[55] = 4'h0;
      expv[56] = 4'h0;
      expv[57] = 4'h2;
      expv[58] = 4'h1;
      expv[59] = 4'h6;
      expv[60] = 4'h2;
      expv[61] = 4'h0;
      expv[62] = 4'h2;
      expv[63] = 4'h0;
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
