// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06428 dut (
    .clock(clk),
    .reset(in_vec[18:18]),
    .op(in_vec[17:16]),
    .writeData(in_vec[15:0]),
    .data(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h47969;
    stim[1] = 19'h5033f;
    stim[2] = 19'h2594b;
    stim[3] = 19'h3f87e;
    stim[4] = 19'h0009a;
    stim[5] = 19'h0fcb1;
    stim[6] = 19'h14644;
    stim[7] = 19'h19280;
    stim[8] = 19'h23b36;
    stim[9] = 19'h1b5ce;
    stim[10] = 19'h0b137;
    stim[11] = 19'h3c05f;
    stim[12] = 19'h303ff;
    stim[13] = 19'h279c9;
    stim[14] = 19'h28523;
    stim[15] = 19'h09d6a;
    stim[16] = 19'h059b6;
    stim[17] = 19'h3b96b;
    stim[18] = 19'h240fa;
    stim[19] = 19'h37782;
    stim[20] = 19'h05b0e;
    stim[21] = 19'h29538;
    stim[22] = 19'h29c06;
    stim[23] = 19'h1007e;
    stim[24] = 19'h3dc4e;
    stim[25] = 19'h30ca2;
    stim[26] = 19'h21900;
    stim[27] = 19'h24c61;
    stim[28] = 19'h296d2;
    stim[29] = 19'h0762a;
    stim[30] = 19'h1493c;
    stim[31] = 19'h0b406;
    stim[32] = 19'h00451;
    stim[33] = 19'h0b135;
    stim[34] = 19'h5d05c;
    stim[35] = 19'h3f7ba;
    stim[36] = 19'h22f01;
    stim[37] = 19'h002cf;
    stim[38] = 19'h02bdb;
    stim[39] = 19'h38896;
    stim[40] = 19'h0f4dc;
    stim[41] = 19'h368cb;
    stim[42] = 19'h3b2d3;
    stim[43] = 19'h34a95;
    stim[44] = 19'h128cc;
    stim[45] = 19'h26c58;
    stim[46] = 19'h28773;
    stim[47] = 19'h2daa0;
    stim[48] = 19'h10042;
    stim[49] = 19'h2cc93;
    stim[50] = 19'h11586;
    stim[51] = 19'h2ca99;
    stim[52] = 19'h11ede;
    stim[53] = 19'h28224;
    stim[54] = 19'h2652a;
    stim[55] = 19'h202a1;
    stim[56] = 19'h3299d;
    stim[57] = 19'h31446;
    stim[58] = 19'h20c00;
    stim[59] = 19'h2959f;
    stim[60] = 19'h077f0;
    stim[61] = 19'h3e6bf;
    stim[62] = 19'h3ca05;
    stim[63] = 19'h0840f;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h594b;
      expv[4] = 16'h594b;
      expv[5] = 16'h594c;
      expv[6] = 16'h594d;
      expv[7] = 16'h594c;
      expv[8] = 16'h594b;
      expv[9] = 16'h3b36;
      expv[10] = 16'h3b35;
      expv[11] = 16'h3b36;
      expv[12] = 16'h3b36;
      expv[13] = 16'h3b36;
      expv[14] = 16'h79c9;
      expv[15] = 16'h8523;
      expv[16] = 16'h8524;
      expv[17] = 16'h8525;
      expv[18] = 16'h8525;
      expv[19] = 16'h40fa;
      expv[20] = 16'h40fa;
      expv[21] = 16'h40fb;
      expv[22] = 16'h9538;
      expv[23] = 16'h9c06;
      expv[24] = 16'h9c05;
      expv[25] = 16'h9c05;
      expv[26] = 16'h9c05;
      expv[27] = 16'h1900;
      expv[28] = 16'h4c61;
      expv[29] = 16'h96d2;
      expv[30] = 16'h96d3;
      expv[31] = 16'h96d2;
      expv[32] = 16'h96d3;
      expv[33] = 16'h96d4;
      expv[34] = 16'h96d5;
      expv[35] = 16'h0000;
      expv[36] = 16'h0000;
      expv[37] = 16'h2f01;
      expv[38] = 16'h2f02;
      expv[39] = 16'h2f03;
      expv[40] = 16'h2f03;
      expv[41] = 16'h2f04;
      expv[42] = 16'h2f04;
      expv[43] = 16'h2f04;
      expv[44] = 16'h2f04;
      expv[45] = 16'h2f03;
      expv[46] = 16'h6c58;
      expv[47] = 16'h8773;
      expv[48] = 16'hdaa0;
      expv[49] = 16'hda9f;
      expv[50] = 16'hcc93;
      expv[51] = 16'hcc92;
      expv[52] = 16'hca99;
      expv[53] = 16'hca98;
      expv[54] = 16'h8224;
      expv[55] = 16'h652a;
      expv[56] = 16'h02a1;
      expv[57] = 16'h02a1;
      expv[58] = 16'h02a1;
      expv[59] = 16'h0c00;
      expv[60] = 16'h959f;
      expv[61] = 16'h95a0;
      expv[62] = 16'h95a0;
      expv[63] = 16'h95a0;
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
