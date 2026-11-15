// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_215200 dut (
    .ID_rs(in_vec[37:33]),
    .ID_rt(in_vec[32:28]),
    .EX_rs(in_vec[27:23]),
    .EX_rt(in_vec[22:18]),
    .MEM_rt(in_vec[17:13]),
    .MEM_RW(in_vec[12:8]),
    .WB_RW(in_vec[7:3]),
    .MEM_ramwe(in_vec[2:2]),
    .MEM_regwe(in_vec[1:1]),
    .WB_regwe(in_vec[0:0]),
    .ID_forwardA(out_vec[8:7]),
    .ID_forwardB(out_vec[6:5]),
    .EX_forwardA(out_vec[4:3]),
    .EX_forwardB(out_vec[2:1]),
    .MEM_forward(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h3c9ca643ef;
    stim[1] = 38'h2e02172b90;
    stim[2] = 38'h25b172bee2;
    stim[3] = 38'h24f274a445;
    stim[4] = 38'h1325d5d4e9;
    stim[5] = 38'h1a384f67c4;
    stim[6] = 38'h13e945ffe1;
    stim[7] = 38'h37a1a1c395;
    stim[8] = 38'h3f2253e132;
    stim[9] = 38'h38448523fe;
    stim[10] = 38'h20dad3e90f;
    stim[11] = 38'h1ea496df49;
    stim[12] = 38'h28b40d3128;
    stim[13] = 38'h23b6c99b8f;
    stim[14] = 38'h1f1f486d51;
    stim[15] = 38'h2d12f05cf2;
    stim[16] = 38'h36a7cc3830;
    stim[17] = 38'h327e684026;
    stim[18] = 38'h3d1b8fe784;
    stim[19] = 38'h0660ff3288;
    stim[20] = 38'h090f4b4668;
    stim[21] = 38'h0f923ca5a0;
    stim[22] = 38'h23ebd64fd0;
    stim[23] = 38'h1dc4fefc1d;
    stim[24] = 38'h01bc3903e7;
    stim[25] = 38'h2a726019f7;
    stim[26] = 38'h3d0cff5f96;
    stim[27] = 38'h37ee443311;
    stim[28] = 38'h06dc9cf901;
    stim[29] = 38'h103d79f058;
    stim[30] = 38'h0458575a77;
    stim[31] = 38'h252df0a443;
    stim[32] = 38'h3a04e2853d;
    stim[33] = 38'h062048cada;
    stim[34] = 38'h2a50ee3eb1;
    stim[35] = 38'h279fb7d7f9;
    stim[36] = 38'h26b141b333;
    stim[37] = 38'h2018b70201;
    stim[38] = 38'h3dfc9657a5;
    stim[39] = 38'h2150af1e4e;
    stim[40] = 38'h3667660537;
    stim[41] = 38'h381773bc73;
    stim[42] = 38'h3055b2c182;
    stim[43] = 38'h2635e53540;
    stim[44] = 38'h25146a58dc;
    stim[45] = 38'h004d99d8fb;
    stim[46] = 38'h27cfc98fdd;
    stim[47] = 38'h33191c04d3;
    stim[48] = 38'h1dbac93853;
    stim[49] = 38'h22690836e4;
    stim[50] = 38'h3226d46394;
    stim[51] = 38'h28f5d5fde1;
    stim[52] = 38'h2e976ce2fd;
    stim[53] = 38'h2abeb66eaa;
    stim[54] = 38'h2a2d0955ad;
    stim[55] = 38'h3079d2ad47;
    stim[56] = 38'h3738c55e71;
    stim[57] = 38'h257e1ee407;
    stim[58] = 38'h0b8001cc9d;
    stim[59] = 38'h3f87f9288a;
    stim[60] = 38'h103eee72bc;
    stim[61] = 38'h372f1d1663;
    stim[62] = 38'h37b2b5bcbe;
    stim[63] = 38'h3f090f2ab1;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h000;
      expv[5] = 9'h000;
      expv[6] = 9'h000;
      expv[7] = 9'h000;
      expv[8] = 9'h000;
      expv[9] = 9'h000;
      expv[10] = 9'h000;
      expv[11] = 9'h008;
      expv[12] = 9'h000;
      expv[13] = 9'h0c0;
      expv[14] = 9'h000;
      expv[15] = 9'h004;
      expv[16] = 9'h000;
      expv[17] = 9'h000;
      expv[18] = 9'h000;
      expv[19] = 9'h000;
      expv[20] = 9'h000;
      expv[21] = 9'h000;
      expv[22] = 9'h000;
      expv[23] = 9'h000;
      expv[24] = 9'h000;
      expv[25] = 9'h000;
      expv[26] = 9'h004;
      expv[27] = 9'h000;
      expv[28] = 9'h000;
      expv[29] = 9'h000;
      expv[30] = 9'h000;
      expv[31] = 9'h000;
      expv[32] = 9'h000;
      expv[33] = 9'h000;
      expv[34] = 9'h000;
      expv[35] = 9'h008;
      expv[36] = 9'h100;
      expv[37] = 9'h000;
      expv[38] = 9'h000;
      expv[39] = 9'h000;
      expv[40] = 9'h020;
      expv[41] = 9'h10c;
      expv[42] = 9'h000;
      expv[43] = 9'h000;
      expv[44] = 9'h000;
      expv[45] = 9'h000;
      expv[46] = 9'h000;
      expv[47] = 9'h000;
      expv[48] = 9'h000;
      expv[49] = 9'h000;
      expv[50] = 9'h000;
      expv[51] = 9'h000;
      expv[52] = 9'h000;
      expv[53] = 9'h000;
      expv[54] = 9'h080;
      expv[55] = 9'h000;
      expv[56] = 9'h000;
      expv[57] = 9'h000;
      expv[58] = 9'h000;
      expv[59] = 9'h000;
      expv[60] = 9'h000;
      expv[61] = 9'h000;
      expv[62] = 9'h000;
      expv[63] = 9'h000;
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
