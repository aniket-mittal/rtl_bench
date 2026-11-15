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

  mg_00242 dut (
    .mantissa(in_vec[9:0]),
    .count(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h232;
    stim[1] = 10'h030;
    stim[2] = 10'h106;
    stim[3] = 10'h233;
    stim[4] = 10'h3a7;
    stim[5] = 10'h25b;
    stim[6] = 10'h37a;
    stim[7] = 10'h26f;
    stim[8] = 10'h049;
    stim[9] = 10'h349;
    stim[10] = 10'h1eb;
    stim[11] = 10'h199;
    stim[12] = 10'h032;
    stim[13] = 10'h059;
    stim[14] = 10'h1bf;
    stim[15] = 10'h3cc;
    stim[16] = 10'h020;
    stim[17] = 10'h3d6;
    stim[18] = 10'h09a;
    stim[19] = 10'h152;
    stim[20] = 10'h1d0;
    stim[21] = 10'h115;
    stim[22] = 10'h224;
    stim[23] = 10'h0f5;
    stim[24] = 10'h0d9;
    stim[25] = 10'h39c;
    stim[26] = 10'h205;
    stim[27] = 10'h2d6;
    stim[28] = 10'h34c;
    stim[29] = 10'h280;
    stim[30] = 10'h07d;
    stim[31] = 10'h091;
    stim[32] = 10'h2c3;
    stim[33] = 10'h215;
    stim[34] = 10'h1ca;
    stim[35] = 10'h15f;
    stim[36] = 10'h2d4;
    stim[37] = 10'h286;
    stim[38] = 10'h2ff;
    stim[39] = 10'h131;
    stim[40] = 10'h027;
    stim[41] = 10'h29d;
    stim[42] = 10'h35a;
    stim[43] = 10'h204;
    stim[44] = 10'h131;
    stim[45] = 10'h340;
    stim[46] = 10'h076;
    stim[47] = 10'h3c7;
    stim[48] = 10'h236;
    stim[49] = 10'h2d3;
    stim[50] = 10'h12a;
    stim[51] = 10'h1c3;
    stim[52] = 10'h12e;
    stim[53] = 10'h00a;
    stim[54] = 10'h3f7;
    stim[55] = 10'h3f6;
    stim[56] = 10'h281;
    stim[57] = 10'h325;
    stim[58] = 10'h3b4;
    stim[59] = 10'h098;
    stim[60] = 10'h170;
    stim[61] = 10'h12a;
    stim[62] = 10'h188;
    stim[63] = 10'h17d;
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
      expv[1] = 4'h4;
      expv[2] = 4'h1;
      expv[3] = 4'h0;
      expv[4] = 4'h0;
      expv[5] = 4'h0;
      expv[6] = 4'h0;
      expv[7] = 4'h0;
      expv[8] = 4'h3;
      expv[9] = 4'h0;
      expv[10] = 4'h1;
      expv[11] = 4'h1;
      expv[12] = 4'h4;
      expv[13] = 4'h3;
      expv[14] = 4'h1;
      expv[15] = 4'h0;
      expv[16] = 4'h4;
      expv[17] = 4'h0;
      expv[18] = 4'h2;
      expv[19] = 4'h1;
      expv[20] = 4'h1;
      expv[21] = 4'h1;
      expv[22] = 4'h0;
      expv[23] = 4'h2;
      expv[24] = 4'h2;
      expv[25] = 4'h0;
      expv[26] = 4'h0;
      expv[27] = 4'h0;
      expv[28] = 4'h0;
      expv[29] = 4'h0;
      expv[30] = 4'h3;
      expv[31] = 4'h2;
      expv[32] = 4'h0;
      expv[33] = 4'h0;
      expv[34] = 4'h1;
      expv[35] = 4'h1;
      expv[36] = 4'h0;
      expv[37] = 4'h0;
      expv[38] = 4'h0;
      expv[39] = 4'h1;
      expv[40] = 4'h4;
      expv[41] = 4'h0;
      expv[42] = 4'h0;
      expv[43] = 4'h0;
      expv[44] = 4'h1;
      expv[45] = 4'h0;
      expv[46] = 4'h3;
      expv[47] = 4'h0;
      expv[48] = 4'h0;
      expv[49] = 4'h0;
      expv[50] = 4'h1;
      expv[51] = 4'h1;
      expv[52] = 4'h1;
      expv[53] = 4'h6;
      expv[54] = 4'h0;
      expv[55] = 4'h0;
      expv[56] = 4'h0;
      expv[57] = 4'h0;
      expv[58] = 4'h0;
      expv[59] = 4'h2;
      expv[60] = 4'h1;
      expv[61] = 4'h1;
      expv[62] = 4'h1;
      expv[63] = 4'h1;
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
