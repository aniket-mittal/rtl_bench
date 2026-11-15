// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 30;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05667 dut (
    .background_data(in_vec[69:40]),
    .foreground_data(in_vec[39:0]),
    .new_red(out_vec[29:20]),
    .new_green(out_vec[19:10]),
    .new_blue(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h08324d7abe5fd0eddf;
    stim[1] = 70'h115c0c25794bddcc89;
    stim[2] = 70'h147ecaf6a01703225f;
    stim[3] = 70'h2a03e9e0d93001d407;
    stim[4] = 70'h2bf22e34519d82122a;
    stim[5] = 70'h304d5af5a245bb122c;
    stim[6] = 70'h34ebb819018fe9872a;
    stim[7] = 70'h1d15c6ed5ceedf2d5e;
    stim[8] = 70'h2598f194f387466c42;
    stim[9] = 70'h09b28be2880485b3f2;
    stim[10] = 70'h074770134872b812b8;
    stim[11] = 70'h2463ac9713a981e5e0;
    stim[12] = 70'h3d961e58a33d6e4f1b;
    stim[13] = 70'h3153f282ebed578606;
    stim[14] = 70'h2574193274242dbaeb;
    stim[15] = 70'h081c1173b53a23b263;
    stim[16] = 70'h05d12f90f9b81d272b;
    stim[17] = 70'h30a3958685bcc27f44;
    stim[18] = 70'h16f262c7a7c27b753e;
    stim[19] = 70'h01f7807ebca4147157;
    stim[20] = 70'h11765532f6aa921c50;
    stim[21] = 70'h111f5a0faa20e3bd0d;
    stim[22] = 70'h112e109f8fa94f3e69;
    stim[23] = 70'h3d2906eaa066fd9c8b;
    stim[24] = 70'h1aa27e85d3397e4538;
    stim[25] = 70'h395801ff2473278fa6;
    stim[26] = 70'h2ddb1551fea00b8aa6;
    stim[27] = 70'h31e9c4c9e7038500f0;
    stim[28] = 70'h16653cda998954373f;
    stim[29] = 70'h2c6ec3c7c67cc2b946;
    stim[30] = 70'h30018e67525d6fb575;
    stim[31] = 70'h366b24d5eecb584a17;
    stim[32] = 70'h0f054353cd4cea9a00;
    stim[33] = 70'h2edef3e1bda250d7f4;
    stim[34] = 70'h1335517ed4e3162343;
    stim[35] = 70'h3f00064afafe447a38;
    stim[36] = 70'h1ce26d58fe3ae551f8;
    stim[37] = 70'h154066145b68819c61;
    stim[38] = 70'h0170ad780bc7443d36;
    stim[39] = 70'h0d53ea6ce06900ad76;
    stim[40] = 70'h1909a90c41ff0bddfd;
    stim[41] = 70'h075d44d13151110724;
    stim[42] = 70'h1e57ee1b566c3283a6;
    stim[43] = 70'h20f5ab7fc73683adb3;
    stim[44] = 70'h24dcfaeacf9220e6de;
    stim[45] = 70'h1353f86c6176db55ce;
    stim[46] = 70'h313fcc6d7d6cbb558e;
    stim[47] = 70'h37789415edce936fdd;
    stim[48] = 70'h17fed5529d4dac0008;
    stim[49] = 70'h1f02c3ce704d22e0e1;
    stim[50] = 70'h2f714a0356ea7d2b70;
    stim[51] = 70'h27354fdad51794a008;
    stim[52] = 70'h2ce67eb690327fa90b;
    stim[53] = 70'h13bf06255a17266606;
    stim[54] = 70'h2f54d062d8eda5fcae;
    stim[55] = 70'h059d9ab70ed576ebc7;
    stim[56] = 70'h11eef68911a2f76e0c;
    stim[57] = 70'h051d1c9b28d94a1484;
    stim[58] = 70'h0d9a3a7d4bbd950f7f;
    stim[59] = 70'h0b3f091b306a0a1214;
    stim[60] = 70'h334db8fd9e7466a1f0;
    stim[61] = 70'h15f338bbf584979e58;
    stim[62] = 70'h372c0adb9207f52613;
    stim[63] = 70'h37414d914968c5c9b1;
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
      expv[0] = 30'h1fd0eddf;
      expv[1] = 30'h115c0c25;
      expv[2] = 30'h1703225f;
      expv[3] = 30'h3001d407;
      expv[4] = 30'h2bf22e34;
      expv[5] = 30'h05bb122c;
      expv[6] = 30'h34ebb819;
      expv[7] = 30'h1d15c6ed;
      expv[8] = 30'h07466c42;
      expv[9] = 30'h0485b3f2;
      expv[10] = 30'h07477013;
      expv[11] = 30'h2463ac97;
      expv[12] = 30'h3d6e4f1b;
      expv[13] = 30'h2d578606;
      expv[14] = 30'h25741932;
      expv[15] = 30'h3a23b263;
      expv[16] = 30'h381d272b;
      expv[17] = 30'h3cc27f44;
      expv[18] = 30'h027b753e;
      expv[19] = 30'h24147157;
      expv[20] = 30'h2a921c50;
      expv[21] = 30'h20e3bd0d;
      expv[22] = 30'h294f3e69;
      expv[23] = 30'h26fd9c8b;
      expv[24] = 30'h397e4538;
      expv[25] = 30'h395801ff;
      expv[26] = 30'h200b8aa6;
      expv[27] = 30'h038500f0;
      expv[28] = 30'h0954373f;
      expv[29] = 30'h3cc2b946;
      expv[30] = 30'h30018e67;
      expv[31] = 30'h0b584a17;
      expv[32] = 30'h0cea9a00;
      expv[33] = 30'h2250d7f4;
      expv[34] = 30'h23162343;
      expv[35] = 30'h3e447a38;
      expv[36] = 30'h3ae551f8;
      expv[37] = 30'h15406614;
      expv[38] = 30'h0170ad78;
      expv[39] = 30'h2900ad76;
      expv[40] = 30'h1909a90c;
      expv[41] = 30'h075d44d1;
      expv[42] = 30'h1e57ee1b;
      expv[43] = 30'h3683adb3;
      expv[44] = 30'h1220e6de;
      expv[45] = 30'h1353f86c;
      expv[46] = 30'h313fcc6d;
      expv[47] = 30'h0e936fdd;
      expv[48] = 30'h0dac0008;
      expv[49] = 30'h1f02c3ce;
      expv[50] = 30'h2f714a03;
      expv[51] = 30'h1794a008;
      expv[52] = 30'h327fa90b;
      expv[53] = 30'h13bf0625;
      expv[54] = 30'h2da5fcae;
      expv[55] = 30'h059d9ab7;
      expv[56] = 30'h11eef689;
      expv[57] = 30'h051d1c9b;
      expv[58] = 30'h0d9a3a7d;
      expv[59] = 30'h0b3f091b;
      expv[60] = 30'h3466a1f0;
      expv[61] = 30'h04979e58;
      expv[62] = 30'h07f52613;
      expv[63] = 30'h37414d91;
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
