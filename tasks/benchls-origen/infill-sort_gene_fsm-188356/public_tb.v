// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 76;
  localparam OW = 38;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_188356 dut (
    .CLOCK_50(clk),
    .reset(in_vec[75:75]),
    .gene(in_vec[74:67]),
    .state_controller(in_vec[66:64]),
    .compareGeneCounterFitness(in_vec[63:0]),
    .compareGeneCounter(out_vec[37:30]),
    .sortGeneCount(out_vec[29:22]),
    .sortBitCount(out_vec[21:14]),
    .sortedCounter(out_vec[13:6]),
    .state_sortFSM(out_vec[5:2]),
    .andAll(out_vec[1:1]),
    .orAll(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 76'hff0a8974505ec57440c;
    stim[1] = 76'hca4681dcc8f33a9cfe8;
    stim[2] = 76'h643a9050edde791e776;
    stim[3] = 76'h5fe597f33f5c4306485;
    stim[4] = 76'h511109b0b812144750e;
    stim[5] = 76'h093c1f2219cf90b28f9;
    stim[6] = 76'h3246aa3de2557eb22c1;
    stim[7] = 76'h345b5ca17b26c1d49e7;
    stim[8] = 76'h5f1def12f21c70919f4;
    stim[9] = 76'h03fb997a079491174cb;
    stim[10] = 76'h437681411803819e015;
    stim[11] = 76'h6f56a82c8b19769964e;
    stim[12] = 76'h4cee2bb9223c1eaa57c;
    stim[13] = 76'h27876fb5c86f8375a31;
    stim[14] = 76'h6579f70147a15a4d27e;
    stim[15] = 76'h24d293b47369df8fcb3;
    stim[16] = 76'h1c8db45b6c8ceca2e2f;
    stim[17] = 76'h26b032db2624c85c2bc;
    stim[18] = 76'h50ec47b5aa188fffc21;
    stim[19] = 76'h49492a525279aff19f1;
    stim[20] = 76'h5edcd48b6b305fbb372;
    stim[21] = 76'h665936ddc73ba4cf5bc;
    stim[22] = 76'h70937b36516a9fd64c8;
    stim[23] = 76'h435ff4e0cae0349385a;
    stim[24] = 76'h7e104b95183d064a4d6;
    stim[25] = 76'h38c788b62d43cd5f5a4;
    stim[26] = 76'h72b8e895020281a87d7;
    stim[27] = 76'h67f4c5e975547fa4dd0;
    stim[28] = 76'h4e086749caec793fe93;
    stim[29] = 76'h456970b1e41c62ff49e;
    stim[30] = 76'h01a8d8f41383f804a72;
    stim[31] = 76'h0e542ad7e956af30f58;
    stim[32] = 76'h41fd041363ac8bc3009;
    stim[33] = 76'h19cadd56e3c20b57cb1;
    stim[34] = 76'h17d638dfb6cfdd9e0f6;
    stim[35] = 76'h4cb25f15499edea59a8;
    stim[36] = 76'h7109fd40de21f2c7407;
    stim[37] = 76'h615c0e9ff4dc33de4bf;
    stim[38] = 76'h5dcf79dc11f43cafbcd;
    stim[39] = 76'h7d614abb22b991f0051;
    stim[40] = 76'h7139e5c320746db3c19;
    stim[41] = 76'h580e69b5351eae20c36;
    stim[42] = 76'h03b5495a810740061f1;
    stim[43] = 76'h7c409c51b05147216fb;
    stim[44] = 76'h4168650a60d5ee2c159;
    stim[45] = 76'h0f9cc6b4ddac8c2f705;
    stim[46] = 76'h11241a8f0eb4d7961d9;
    stim[47] = 76'h7157bf94d7270488a9c;
    stim[48] = 76'h6e00251227b3a21c093;
    stim[49] = 76'h0f4a3e4a8b3092876ca;
    stim[50] = 76'h62e45bbdb7d9f4ab8dd;
    stim[51] = 76'h69a2caaa94ebac068a9;
    stim[52] = 76'h02f302bf05f51b0fc73;
    stim[53] = 76'h7442e19d91e4196652e;
    stim[54] = 76'h6d1eb8b6670532dc2fa;
    stim[55] = 76'h2e8a096d0ca60ac7213;
    stim[56] = 76'h314fd01c1a7e5da7c94;
    stim[57] = 76'h51f9af1428c08a53311;
    stim[58] = 76'h411510d49604d32ff2f;
    stim[59] = 76'h5ad642beb9a418537f5;
    stim[60] = 76'h75d9ca7f05bd2e07a90;
    stim[61] = 76'h535f0b5dab046f6e4f2;
    stim[62] = 76'h5e2546e11393855b2ca;
    stim[63] = 76'h251915c18253c54ef05;
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
      expv[0] = 38'h000000000x;
      expv[1] = 38'h000000000x;
      expv[2] = 38'h000000000x;
      expv[3] = 38'h000000000x;
      expv[4] = 38'h000000000x;
      expv[5] = 38'h000000000x;
      expv[6] = 38'h000000000x;
      expv[7] = 38'h000000000x;
      expv[8] = 38'h000000000x;
      expv[9] = 38'h000000000x;
      expv[10] = 38'h000000000x;
      expv[11] = 38'h000000000x;
      expv[12] = 38'h000000000x;
      expv[13] = 38'h000000000x;
      expv[14] = 38'h000000000x;
      expv[15] = 38'h000000000x;
      expv[16] = 38'h000000000x;
      expv[17] = 38'h000000000x;
      expv[18] = 38'h000000000x;
      expv[19] = 38'h000000000x;
      expv[20] = 38'h000000000x;
      expv[21] = 38'h000000000x;
      expv[22] = 38'h000000000x;
      expv[23] = 38'h000000000x;
      expv[24] = 38'h000000000x;
      expv[25] = 38'h000000000x;
      expv[26] = 38'h000000000x;
      expv[27] = 38'h000000000x;
      expv[28] = 38'h000000000x;
      expv[29] = 38'h000000000x;
      expv[30] = 38'h000000000x;
      expv[31] = 38'h000000000x;
      expv[32] = 38'h000000000x;
      expv[33] = 38'h000000000x;
      expv[34] = 38'h000000000x;
      expv[35] = 38'h000000000x;
      expv[36] = 38'h000000000x;
      expv[37] = 38'h000000000x;
      expv[38] = 38'h000000000x;
      expv[39] = 38'h000000000x;
      expv[40] = 38'h000000000x;
      expv[41] = 38'h000000000x;
      expv[42] = 38'h000000000x;
      expv[43] = 38'h000000000x;
      expv[44] = 38'h000000000x;
      expv[45] = 38'h000000000x;
      expv[46] = 38'h000000000x;
      expv[47] = 38'h000000000x;
      expv[48] = 38'h000000000x;
      expv[49] = 38'h000000000x;
      expv[50] = 38'h000000000x;
      expv[51] = 38'h000000000x;
      expv[52] = 38'h000000000x;
      expv[53] = 38'h000000000x;
      expv[54] = 38'h000000000x;
      expv[55] = 38'h000000000x;
      expv[56] = 38'h000000000x;
      expv[57] = 38'h000000000x;
      expv[58] = 38'h000000000x;
      expv[59] = 38'h000000000x;
      expv[60] = 38'h000000000x;
      expv[61] = 38'h000000000x;
      expv[62] = 38'h000000000x;
      expv[63] = 38'h000000000x;
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
