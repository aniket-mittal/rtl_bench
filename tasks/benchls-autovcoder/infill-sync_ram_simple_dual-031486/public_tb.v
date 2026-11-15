// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_031486 dut (
    .clk(clk),
    .wea(in_vec[48:48]),
    .addra(in_vec[47:40]),
    .addrb(in_vec[39:32]),
    .dia(in_vec[31:0]),
    .dob(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h1ddab86d6c3f2;
    stim[1] = 49'h16be516408cd7;
    stim[2] = 49'h14b37660e3e11;
    stim[3] = 49'h15741eba3fb5a;
    stim[4] = 49'h199ebd80ec248;
    stim[5] = 49'h0d3f3bc0fb797;
    stim[6] = 49'h0357a76cb802f;
    stim[7] = 49'h1d0bce078ac98;
    stim[8] = 49'h0009790ded0bd;
    stim[9] = 49'h1588f964ea957;
    stim[10] = 49'h08d436cb939cf;
    stim[11] = 49'h136e6acd69c73;
    stim[12] = 49'h159e157aa0708;
    stim[13] = 49'h14e5cffe65d1d;
    stim[14] = 49'h01b5b0859b599;
    stim[15] = 49'h06739f406747f;
    stim[16] = 49'h136b35e0744de;
    stim[17] = 49'h09ce6c2dfea8d;
    stim[18] = 49'h056e43b4435b3;
    stim[19] = 49'h1bd51f30b33df;
    stim[20] = 49'h00d3ae222b0db;
    stim[21] = 49'h1ac0ab0ab5e2c;
    stim[22] = 49'h06ac59aa51a25;
    stim[23] = 49'h0195c80efe513;
    stim[24] = 49'h0aa51e82efb35;
    stim[25] = 49'h072db5f3ce038;
    stim[26] = 49'h0c19051c416ad;
    stim[27] = 49'h01a2437719a36;
    stim[28] = 49'h07a8aa007bf67;
    stim[29] = 49'h0517835f7f01e;
    stim[30] = 49'h0e9a1e18d277b;
    stim[31] = 49'h1ad9e56b702ad;
    stim[32] = 49'h070dca65a0387;
    stim[33] = 49'h0234a423e2f53;
    stim[34] = 49'h04b3eba776254;
    stim[35] = 49'h062671f224411;
    stim[36] = 49'h06291d4695245;
    stim[37] = 49'h04cc21e67a44a;
    stim[38] = 49'h01b5736467d78;
    stim[39] = 49'h035b3d10945bd;
    stim[40] = 49'h03f573cc5f536;
    stim[41] = 49'h1b429a90596f3;
    stim[42] = 49'h13fe8c2c05891;
    stim[43] = 49'h1fcf7c3aff9cf;
    stim[44] = 49'h140e02080178c;
    stim[45] = 49'h1ea077f7c7d79;
    stim[46] = 49'h1c0ab0af523e1;
    stim[47] = 49'h05343bbb8737b;
    stim[48] = 49'h0f07101374862;
    stim[49] = 49'h0397d65cae11a;
    stim[50] = 49'h0f95e060d6c20;
    stim[51] = 49'h10a7a7b38b1e2;
    stim[52] = 49'h07eb5329d49ec;
    stim[53] = 49'h1b70ac8831e5e;
    stim[54] = 49'h012f42420875e;
    stim[55] = 49'h054af9899f8c5;
    stim[56] = 49'h1cce65cb2a824;
    stim[57] = 49'h13e6cc8017c01;
    stim[58] = 49'h115a88878d723;
    stim[59] = 49'h09e7b3eb12854;
    stim[60] = 49'h14de519db0513;
    stim[61] = 49'h1b2994177bff9;
    stim[62] = 49'h1a3802f7be63b;
    stim[63] = 49'h1bc38bfffa968;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'heba3fb5a;
      expv[42] = 32'h00000000;
      expv[43] = 32'heba3fb5a;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h7b38b1e2;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000000;
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
