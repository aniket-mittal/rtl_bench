// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_081087 dut (
    .B(in_vec[10:8]),
    .A(in_vec[7:0]),
    .gen(out_vec[9:1]),
    .sign(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h111;
    stim[1] = 11'h693;
    stim[2] = 11'h249;
    stim[3] = 11'h565;
    stim[4] = 11'h5ad;
    stim[5] = 11'h1d7;
    stim[6] = 11'h37b;
    stim[7] = 11'h657;
    stim[8] = 11'h3d6;
    stim[9] = 11'h4a0;
    stim[10] = 11'h512;
    stim[11] = 11'h5bd;
    stim[12] = 11'h7a8;
    stim[13] = 11'h08c;
    stim[14] = 11'h7c6;
    stim[15] = 11'h40a;
    stim[16] = 11'h5a6;
    stim[17] = 11'h643;
    stim[18] = 11'h043;
    stim[19] = 11'h415;
    stim[20] = 11'h5f9;
    stim[21] = 11'h1dc;
    stim[22] = 11'h4e3;
    stim[23] = 11'h357;
    stim[24] = 11'h654;
    stim[25] = 11'h7f6;
    stim[26] = 11'h612;
    stim[27] = 11'h73f;
    stim[28] = 11'h254;
    stim[29] = 11'h6ab;
    stim[30] = 11'h21f;
    stim[31] = 11'h7ec;
    stim[32] = 11'h5dd;
    stim[33] = 11'h5ab;
    stim[34] = 11'h50a;
    stim[35] = 11'h6fe;
    stim[36] = 11'h3c0;
    stim[37] = 11'h4d1;
    stim[38] = 11'h3b1;
    stim[39] = 11'h3f6;
    stim[40] = 11'h2ca;
    stim[41] = 11'h6d7;
    stim[42] = 11'h3eb;
    stim[43] = 11'h2c6;
    stim[44] = 11'h5c0;
    stim[45] = 11'h541;
    stim[46] = 11'h11a;
    stim[47] = 11'h2e7;
    stim[48] = 11'h2eb;
    stim[49] = 11'h3dd;
    stim[50] = 11'h39b;
    stim[51] = 11'h4a4;
    stim[52] = 11'h654;
    stim[53] = 11'h3e0;
    stim[54] = 11'h792;
    stim[55] = 11'h54e;
    stim[56] = 11'h256;
    stim[57] = 11'h733;
    stim[58] = 11'h4f9;
    stim[59] = 11'h542;
    stim[60] = 11'h23a;
    stim[61] = 11'h677;
    stim[62] = 11'h708;
    stim[63] = 11'h768;
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
      expv[0] = 10'h022;
      expv[1] = 10'h2d9;
      expv[2] = 10'h092;
      expv[3] = 10'h335;
      expv[4] = 10'h2a5;
      expv[5] = 10'h1ae;
      expv[6] = 10'h1ec;
      expv[7] = 10'h351;
      expv[8] = 10'h358;
      expv[9] = 10'h17f;
      expv[10] = 10'h3db;
      expv[11] = 10'h285;
      expv[12] = 10'h000;
      expv[13] = 10'h000;
      expv[14] = 10'h000;
      expv[15] = 10'h3d7;
      expv[16] = 10'h2b3;
      expv[17] = 10'h379;
      expv[18] = 10'h000;
      expv[19] = 10'h3ab;
      expv[20] = 10'h20d;
      expv[21] = 10'h1b8;
      expv[22] = 10'h073;
      expv[23] = 10'h15c;
      expv[24] = 10'h357;
      expv[25] = 10'h000;
      expv[26] = 10'h3db;
      expv[27] = 10'h000;
      expv[28] = 10'h0a8;
      expv[29] = 10'h2a9;
      expv[30] = 10'h03e;
      expv[31] = 10'h000;
      expv[32] = 10'h245;
      expv[33] = 10'h2a9;
      expv[34] = 10'h3eb;
      expv[35] = 10'h203;
      expv[36] = 10'h300;
      expv[37] = 10'h0bb;
      expv[38] = 10'h2c4;
      expv[39] = 10'h3d8;
      expv[40] = 10'h194;
      expv[41] = 10'h251;
      expv[42] = 10'h3ac;
      expv[43] = 10'h18c;
      expv[44] = 10'h27f;
      expv[45] = 10'h37d;
      expv[46] = 10'h034;
      expv[47] = 10'h1ce;
      expv[48] = 10'h1d6;
      expv[49] = 10'h374;
      expv[50] = 10'h26c;
      expv[51] = 10'h16f;
      expv[52] = 10'h357;
      expv[53] = 10'h380;
      expv[54] = 10'h000;
      expv[55] = 10'h363;
      expv[56] = 10'h0ac;
      expv[57] = 10'h000;
      expv[58] = 10'h01b;
      expv[59] = 10'h37b;
      expv[60] = 10'h074;
      expv[61] = 10'h311;
      expv[62] = 10'h000;
      expv[63] = 10'h000;
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
