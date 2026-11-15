// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_011425 dut (
    .in(in_vec[8:1]),
    .enable(in_vec[0:0]),
    .out(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h153;
    stim[1] = 9'h0b7;
    stim[2] = 9'h09b;
    stim[3] = 9'h0fd;
    stim[4] = 9'h133;
    stim[5] = 9'h149;
    stim[6] = 9'h09a;
    stim[7] = 9'h1bf;
    stim[8] = 9'h0f6;
    stim[9] = 9'h11f;
    stim[10] = 9'h058;
    stim[11] = 9'h01f;
    stim[12] = 9'h141;
    stim[13] = 9'h0e9;
    stim[14] = 9'h173;
    stim[15] = 9'h12b;
    stim[16] = 9'h01c;
    stim[17] = 9'h0b0;
    stim[18] = 9'h1aa;
    stim[19] = 9'h00d;
    stim[20] = 9'h161;
    stim[21] = 9'h036;
    stim[22] = 9'h191;
    stim[23] = 9'h0e6;
    stim[24] = 9'h04f;
    stim[25] = 9'h1dd;
    stim[26] = 9'h085;
    stim[27] = 9'h1c7;
    stim[28] = 9'h028;
    stim[29] = 9'h1bd;
    stim[30] = 9'h0f3;
    stim[31] = 9'h19f;
    stim[32] = 9'h13d;
    stim[33] = 9'h188;
    stim[34] = 9'h112;
    stim[35] = 9'h051;
    stim[36] = 9'h059;
    stim[37] = 9'h154;
    stim[38] = 9'h0ae;
    stim[39] = 9'h17d;
    stim[40] = 9'h019;
    stim[41] = 9'h1c7;
    stim[42] = 9'h0ba;
    stim[43] = 9'h0e0;
    stim[44] = 9'h182;
    stim[45] = 9'h167;
    stim[46] = 9'h058;
    stim[47] = 9'h0f5;
    stim[48] = 9'h06e;
    stim[49] = 9'h1bf;
    stim[50] = 9'h18a;
    stim[51] = 9'h115;
    stim[52] = 9'h066;
    stim[53] = 9'h118;
    stim[54] = 9'h184;
    stim[55] = 9'h157;
    stim[56] = 9'h101;
    stim[57] = 9'h078;
    stim[58] = 9'h012;
    stim[59] = 9'h0bd;
    stim[60] = 9'h02f;
    stim[61] = 9'h0d7;
    stim[62] = 9'h15e;
    stim[63] = 9'h0d2;
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
      expv[0] = 3'h7;
      expv[1] = 3'h6;
      expv[2] = 3'h6;
      expv[3] = 3'h6;
      expv[4] = 3'h7;
      expv[5] = 3'h7;
      expv[6] = 3'h0;
      expv[7] = 3'h7;
      expv[8] = 3'h0;
      expv[9] = 3'h7;
      expv[10] = 3'h0;
      expv[11] = 3'h3;
      expv[12] = 3'h7;
      expv[13] = 3'h6;
      expv[14] = 3'h7;
      expv[15] = 3'h7;
      expv[16] = 3'h0;
      expv[17] = 3'h0;
      expv[18] = 3'h0;
      expv[19] = 3'h2;
      expv[20] = 3'h7;
      expv[21] = 3'h0;
      expv[22] = 3'h7;
      expv[23] = 3'h0;
      expv[24] = 3'h5;
      expv[25] = 3'h7;
      expv[26] = 3'h6;
      expv[27] = 3'h7;
      expv[28] = 3'h0;
      expv[29] = 3'h7;
      expv[30] = 3'h6;
      expv[31] = 3'h7;
      expv[32] = 3'h7;
      expv[33] = 3'h0;
      expv[34] = 3'h0;
      expv[35] = 3'h5;
      expv[36] = 3'h5;
      expv[37] = 3'h0;
      expv[38] = 3'h0;
      expv[39] = 3'h7;
      expv[40] = 3'h3;
      expv[41] = 3'h7;
      expv[42] = 3'h0;
      expv[43] = 3'h0;
      expv[44] = 3'h0;
      expv[45] = 3'h7;
      expv[46] = 3'h0;
      expv[47] = 3'h6;
      expv[48] = 3'h0;
      expv[49] = 3'h7;
      expv[50] = 3'h0;
      expv[51] = 3'h7;
      expv[52] = 3'h0;
      expv[53] = 3'h0;
      expv[54] = 3'h0;
      expv[55] = 3'h7;
      expv[56] = 3'h7;
      expv[57] = 3'h0;
      expv[58] = 3'h0;
      expv[59] = 3'h6;
      expv[60] = 3'h4;
      expv[61] = 3'h6;
      expv[62] = 3'h0;
      expv[63] = 3'h0;
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
