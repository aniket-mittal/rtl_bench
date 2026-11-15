// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072730 dut (
    .clock(clk),
    .clock_b(in_vec[9:9]),
    .resetn(in_vec[8:8]),
    .ps2_out(in_vec[7:0]),
    .stableKey(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h093;
    stim[1] = 10'h249;
    stim[2] = 10'h1d0;
    stim[3] = 10'h1c1;
    stim[4] = 10'h3f4;
    stim[5] = 10'h11e;
    stim[6] = 10'h133;
    stim[7] = 10'h199;
    stim[8] = 10'h11f;
    stim[9] = 10'h3ea;
    stim[10] = 10'h34e;
    stim[11] = 10'h320;
    stim[12] = 10'h3bc;
    stim[13] = 10'h11e;
    stim[14] = 10'h1b1;
    stim[15] = 10'h1f0;
    stim[16] = 10'h3f4;
    stim[17] = 10'h3e5;
    stim[18] = 10'h39f;
    stim[19] = 10'h3bc;
    stim[20] = 10'h312;
    stim[21] = 10'h198;
    stim[22] = 10'h38c;
    stim[23] = 10'h1e3;
    stim[24] = 10'h32d;
    stim[25] = 10'h187;
    stim[26] = 10'h0c2;
    stim[27] = 10'h370;
    stim[28] = 10'h18a;
    stim[29] = 10'h1b6;
    stim[30] = 10'h18e;
    stim[31] = 10'h170;
    stim[32] = 10'h391;
    stim[33] = 10'h171;
    stim[34] = 10'h367;
    stim[35] = 10'h16b;
    stim[36] = 10'h18d;
    stim[37] = 10'h188;
    stim[38] = 10'h147;
    stim[39] = 10'h1ba;
    stim[40] = 10'h144;
    stim[41] = 10'h109;
    stim[42] = 10'h1e9;
    stim[43] = 10'h386;
    stim[44] = 10'h313;
    stim[45] = 10'h3ff;
    stim[46] = 10'h3aa;
    stim[47] = 10'h1f4;
    stim[48] = 10'h3c5;
    stim[49] = 10'h1d7;
    stim[50] = 10'h14b;
    stim[51] = 10'h37d;
    stim[52] = 10'h3d9;
    stim[53] = 10'h311;
    stim[54] = 10'h30f;
    stim[55] = 10'h317;
    stim[56] = 10'h312;
    stim[57] = 10'h380;
    stim[58] = 10'h1dd;
    stim[59] = 10'h33d;
    stim[60] = 10'h3a3;
    stim[61] = 10'h1fe;
    stim[62] = 10'h3b2;
    stim[63] = 10'h329;
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
      expv[0] = 8'hxx;
      expv[1] = 8'h93;
      expv[2] = 8'h93;
      expv[3] = 8'h93;
      expv[4] = 8'hc1;
      expv[5] = 8'hc1;
      expv[6] = 8'hc1;
      expv[7] = 8'hc1;
      expv[8] = 8'hc1;
      expv[9] = 8'hc1;
      expv[10] = 8'hc1;
      expv[11] = 8'hc1;
      expv[12] = 8'hc1;
      expv[13] = 8'hc1;
      expv[14] = 8'hc1;
      expv[15] = 8'hc1;
      expv[16] = 8'hc1;
      expv[17] = 8'hc1;
      expv[18] = 8'hc1;
      expv[19] = 8'hc1;
      expv[20] = 8'hc1;
      expv[21] = 8'hc1;
      expv[22] = 8'hc1;
      expv[23] = 8'hc1;
      expv[24] = 8'hc1;
      expv[25] = 8'hc1;
      expv[26] = 8'hc1;
      expv[27] = 8'hc1;
      expv[28] = 8'hc1;
      expv[29] = 8'hc1;
      expv[30] = 8'hc1;
      expv[31] = 8'hc1;
      expv[32] = 8'hc1;
      expv[33] = 8'hc1;
      expv[34] = 8'hc1;
      expv[35] = 8'hc1;
      expv[36] = 8'hc1;
      expv[37] = 8'hc1;
      expv[38] = 8'hc1;
      expv[39] = 8'hc1;
      expv[40] = 8'hc1;
      expv[41] = 8'hc1;
      expv[42] = 8'hc1;
      expv[43] = 8'hc1;
      expv[44] = 8'hc1;
      expv[45] = 8'hc1;
      expv[46] = 8'hc1;
      expv[47] = 8'hc1;
      expv[48] = 8'hc1;
      expv[49] = 8'hc1;
      expv[50] = 8'hc1;
      expv[51] = 8'hc1;
      expv[52] = 8'hc1;
      expv[53] = 8'hc1;
      expv[54] = 8'hc1;
      expv[55] = 8'hc1;
      expv[56] = 8'hc1;
      expv[57] = 8'hc1;
      expv[58] = 8'hc1;
      expv[59] = 8'hc1;
      expv[60] = 8'hc1;
      expv[61] = 8'hc1;
      expv[62] = 8'hc1;
      expv[63] = 8'hc1;
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
