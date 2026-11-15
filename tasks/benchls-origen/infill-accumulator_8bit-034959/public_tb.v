// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_034959 dut (
    .clk(clk),
    .accin(in_vec[9:2]),
    .cin(in_vec[1:1]),
    .clear(in_vec[0:0]),
    .accout(out_vec[8:1]),
    .cout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h321;
    stim[1] = 10'h07d;
    stim[2] = 10'h370;
    stim[3] = 10'h3e2;
    stim[4] = 10'h370;
    stim[5] = 10'h34e;
    stim[6] = 10'h0f4;
    stim[7] = 10'h168;
    stim[8] = 10'h01e;
    stim[9] = 10'h328;
    stim[10] = 10'h32b;
    stim[11] = 10'h2dc;
    stim[12] = 10'h36c;
    stim[13] = 10'h058;
    stim[14] = 10'h3b4;
    stim[15] = 10'h262;
    stim[16] = 10'h326;
    stim[17] = 10'h028;
    stim[18] = 10'h24a;
    stim[19] = 10'h03e;
    stim[20] = 10'h1d0;
    stim[21] = 10'h172;
    stim[22] = 10'h184;
    stim[23] = 10'h246;
    stim[24] = 10'h22a;
    stim[25] = 10'h0a2;
    stim[26] = 10'h172;
    stim[27] = 10'h080;
    stim[28] = 10'h21a;
    stim[29] = 10'h350;
    stim[30] = 10'h22c;
    stim[31] = 10'h208;
    stim[32] = 10'h00a;
    stim[33] = 10'h0ca;
    stim[34] = 10'h1ba;
    stim[35] = 10'h38c;
    stim[36] = 10'h04a;
    stim[37] = 10'h306;
    stim[38] = 10'h0a4;
    stim[39] = 10'h2f1;
    stim[40] = 10'h05e;
    stim[41] = 10'h1e2;
    stim[42] = 10'h09a;
    stim[43] = 10'h2d4;
    stim[44] = 10'h13a;
    stim[45] = 10'h2f0;
    stim[46] = 10'h2ae;
    stim[47] = 10'h230;
    stim[48] = 10'h3a8;
    stim[49] = 10'h302;
    stim[50] = 10'h0f4;
    stim[51] = 10'h290;
    stim[52] = 10'h1f8;
    stim[53] = 10'h1fb;
    stim[54] = 10'h016;
    stim[55] = 10'h212;
    stim[56] = 10'h2c0;
    stim[57] = 10'h014;
    stim[58] = 10'h070;
    stim[59] = 10'h110;
    stim[60] = 10'h03a;
    stim[61] = 10'h024;
    stim[62] = 10'h16c;
    stim[63] = 10'h2a4;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h1b9;
      expv[4] = 9'h1ab;
      expv[5] = 9'h163;
      expv[6] = 9'h10a;
      expv[7] = 9'h185;
      expv[8] = 9'h038;
      expv[9] = 9'h048;
      expv[10] = 9'h000;
      expv[11] = 9'h000;
      expv[12] = 9'h16f;
      expv[13] = 9'h124;
      expv[14] = 9'h151;
      expv[15] = 9'h12b;
      expv[16] = 9'h05c;
      expv[17] = 9'h1f1;
      expv[18] = 9'h004;
      expv[19] = 9'h12a;
      expv[20] = 9'h14b;
      expv[21] = 9'h032;
      expv[22] = 9'h0ec;
      expv[23] = 9'h1af;
      expv[24] = 9'h0d2;
      expv[25] = 9'h1e9;
      expv[26] = 9'h03a;
      expv[27] = 9'h0f4;
      expv[28] = 9'h135;
      expv[29] = 9'h042;
      expv[30] = 9'h1eb;
      expv[31] = 9'h101;
      expv[32] = 9'h004;
      expv[33] = 9'h00a;
      expv[34] = 9'h070;
      expv[35] = 9'h14f;
      expv[36] = 9'h114;
      expv[37] = 9'h13b;
      expv[38] = 9'h0be;
      expv[39] = 9'h000;
      expv[40] = 9'h000;
      expv[41] = 9'h030;
      expv[42] = 9'h122;
      expv[43] = 9'h171;
      expv[44] = 9'h0da;
      expv[45] = 9'h179;
      expv[46] = 9'h0f1;
      expv[47] = 9'h048;
      expv[48] = 9'h161;
      expv[49] = 9'h135;
      expv[50] = 9'h0b6;
      expv[51] = 9'h131;
      expv[52] = 9'h078;
      expv[53] = 9'h000;
      expv[54] = 9'h000;
      expv[55] = 9'h00c;
      expv[56] = 9'h117;
      expv[57] = 9'h076;
      expv[58] = 9'h080;
      expv[59] = 9'h0b8;
      expv[60] = 9'h140;
      expv[61] = 9'h15e;
      expv[62] = 9'h171;
      expv[63] = 9'h026;
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
