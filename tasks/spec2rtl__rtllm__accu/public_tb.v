// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  accu dut (
    .clk(clk),
    .rst_n(in_vec[9:9]),
    .data_in(in_vec[8:1]),
    .valid_in(in_vec[0:0]),
    .valid_out(out_vec[10:10]),
    .data_out(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h147;
    stim[1] = 10'h1ce;
    stim[2] = 10'h2b6;
    stim[3] = 10'h25f;
    stim[4] = 10'h272;
    stim[5] = 10'h2aa;
    stim[6] = 10'h2a7;
    stim[7] = 10'h06b;
    stim[8] = 10'h3ba;
    stim[9] = 10'h2bc;
    stim[10] = 10'h3fb;
    stim[11] = 10'h2f9;
    stim[12] = 10'h280;
    stim[13] = 10'h2d3;
    stim[14] = 10'h3fa;
    stim[15] = 10'h3a1;
    stim[16] = 10'h2d2;
    stim[17] = 10'h2ee;
    stim[18] = 10'h33f;
    stim[19] = 10'h29b;
    stim[20] = 10'h349;
    stim[21] = 10'h311;
    stim[22] = 10'h351;
    stim[23] = 10'h385;
    stim[24] = 10'h3f7;
    stim[25] = 10'h21a;
    stim[26] = 10'h13d;
    stim[27] = 10'h3b3;
    stim[28] = 10'h333;
    stim[29] = 10'h378;
    stim[30] = 10'h2dd;
    stim[31] = 10'h273;
    stim[32] = 10'h224;
    stim[33] = 10'h280;
    stim[34] = 10'h3af;
    stim[35] = 10'h3f6;
    stim[36] = 10'h2fc;
    stim[37] = 10'h339;
    stim[38] = 10'h34f;
    stim[39] = 10'h21e;
    stim[40] = 10'h295;
    stim[41] = 10'h328;
    stim[42] = 10'h304;
    stim[43] = 10'h28d;
    stim[44] = 10'h358;
    stim[45] = 10'h2cd;
    stim[46] = 10'h22d;
    stim[47] = 10'h290;
    stim[48] = 10'h3d5;
    stim[49] = 10'h2b3;
    stim[50] = 10'h2e4;
    stim[51] = 10'h27e;
    stim[52] = 10'h355;
    stim[53] = 10'h316;
    stim[54] = 10'h239;
    stim[55] = 10'h2b0;
    stim[56] = 10'h32b;
    stim[57] = 10'h1f7;
    stim[58] = 10'h226;
    stim[59] = 10'h3bf;
    stim[60] = 10'h21a;
    stim[61] = 10'h396;
    stim[62] = 10'h2fe;
    stim[63] = 10'h2e0;
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
      expv[0] = 11'h000;
      expv[1] = 11'h000;
      expv[2] = 11'h000;
      expv[3] = 11'h05b;
      expv[4] = 11'h08a;
      expv[5] = 11'h0c3;
      expv[6] = 11'h518;
      expv[7] = 11'h000;
      expv[8] = 11'h000;
      expv[9] = 11'h0dd;
      expv[10] = 11'h13b;
      expv[11] = 11'h238;
      expv[12] = 11'h6b4;
      expv[13] = 11'h2b4;
      expv[14] = 11'h069;
      expv[15] = 11'h166;
      expv[16] = 11'h236;
      expv[17] = 11'h69f;
      expv[18] = 11'h29f;
      expv[19] = 11'h09f;
      expv[20] = 11'h0ec;
      expv[21] = 11'h190;
      expv[22] = 11'h618;
      expv[23] = 11'h0a8;
      expv[24] = 11'h16a;
      expv[25] = 11'h265;
      expv[26] = 11'h000;
      expv[27] = 11'h000;
      expv[28] = 11'h0d9;
      expv[29] = 11'h172;
      expv[30] = 11'h22e;
      expv[31] = 11'h69c;
      expv[32] = 11'h039;
      expv[33] = 11'h04b;
      expv[34] = 11'h08b;
      expv[35] = 11'h562;
      expv[36] = 11'h162;
      expv[37] = 11'h07e;
      expv[38] = 11'h11a;
      expv[39] = 11'h1c1;
      expv[40] = 11'h5d0;
      expv[41] = 11'h04a;
      expv[42] = 11'h0de;
      expv[43] = 11'h160;
      expv[44] = 11'h5a6;
      expv[45] = 11'h1a6;
      expv[46] = 11'h066;
      expv[47] = 11'h07c;
      expv[48] = 11'h0c4;
      expv[49] = 11'h5ae;
      expv[50] = 11'h059;
      expv[51] = 11'h0cb;
      expv[52] = 11'h10a;
      expv[53] = 11'h5b4;
      expv[54] = 11'h1b4;
      expv[55] = 11'h01c;
      expv[56] = 11'h074;
      expv[57] = 11'h000;
      expv[58] = 11'h000;
      expv[59] = 11'h013;
      expv[60] = 11'h0f2;
      expv[61] = 11'h0ff;
      expv[62] = 11'h5ca;
      expv[63] = 11'h1ca;
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
