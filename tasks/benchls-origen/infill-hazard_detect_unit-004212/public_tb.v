// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 29;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_004212 dut (
    .Load_signal(in_vec[28:28]),
    .rs(in_vec[27:23]),
    .rt(in_vec[22:18]),
    .rd(in_vec[17:13]),
    .how_many_ops(in_vec[12:11]),
    .ID_EXE_rt(in_vec[10:6]),
    .ID_EXE_MemRead(in_vec[5:4]),
    .op1_selector(in_vec[3:2]),
    .op2_selector(in_vec[1:0]),
    .PC_write(out_vec[3:3]),
    .IF_ID_write(out_vec[2:2]),
    .flush(out_vec[1:1]),
    .valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 29'h1ac86649;
    stim[1] = 29'h1401092a;
    stim[2] = 29'h0ecc915f;
    stim[3] = 29'h129bc4a3;
    stim[4] = 29'h09e0a7e8;
    stim[5] = 29'h0d190937;
    stim[6] = 29'h139b0f08;
    stim[7] = 29'h05de8d42;
    stim[8] = 29'h06d7eb1c;
    stim[9] = 29'h195c2590;
    stim[10] = 29'h0b88ffb9;
    stim[11] = 29'h04fb97ee;
    stim[12] = 29'h1526ec39;
    stim[13] = 29'h0ac354bd;
    stim[14] = 29'h09adc886;
    stim[15] = 29'h07dfc10b;
    stim[16] = 29'h0c08d44e;
    stim[17] = 29'h1ce77c00;
    stim[18] = 29'h1ec5e649;
    stim[19] = 29'h025fb472;
    stim[20] = 29'h1ec293a2;
    stim[21] = 29'h12ff4f77;
    stim[22] = 29'h0b1f9c64;
    stim[23] = 29'h05b812f2;
    stim[24] = 29'h0f5704b6;
    stim[25] = 29'h1e52fe76;
    stim[26] = 29'h1f827116;
    stim[27] = 29'h0d3e1d1c;
    stim[28] = 29'h07bc71ab;
    stim[29] = 29'h1eb55c82;
    stim[30] = 29'h13fb6919;
    stim[31] = 29'h100c6282;
    stim[32] = 29'h10e5ea7b;
    stim[33] = 29'h0f592690;
    stim[34] = 29'h064fc81c;
    stim[35] = 29'h18e4aa70;
    stim[36] = 29'h0324af35;
    stim[37] = 29'h1dc87771;
    stim[38] = 29'h174a3ab9;
    stim[39] = 29'h044f8fc4;
    stim[40] = 29'h1d4e0b14;
    stim[41] = 29'h14236bbc;
    stim[42] = 29'h0d6c5a7c;
    stim[43] = 29'h0bdd2193;
    stim[44] = 29'h0077c39e;
    stim[45] = 29'h041db19c;
    stim[46] = 29'h0017f9c0;
    stim[47] = 29'h1013e200;
    stim[48] = 29'h1c526362;
    stim[49] = 29'h0f33b278;
    stim[50] = 29'h15a8e152;
    stim[51] = 29'h091b4b93;
    stim[52] = 29'h16a72a1f;
    stim[53] = 29'h10514690;
    stim[54] = 29'h1b5bf69c;
    stim[55] = 29'h15028125;
    stim[56] = 29'h1133e956;
    stim[57] = 29'h1723e8f9;
    stim[58] = 29'h1556fa9b;
    stim[59] = 29'h0b03deea;
    stim[60] = 29'h0acc92d7;
    stim[61] = 29'h0af5518a;
    stim[62] = 29'h0ffcccbe;
    stim[63] = 29'h152fc785;
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
      expv[0] = 4'hd;
      expv[1] = 4'hd;
      expv[2] = 4'hd;
      expv[3] = 4'hd;
      expv[4] = 4'hd;
      expv[5] = 4'hd;
      expv[6] = 4'hd;
      expv[7] = 4'hd;
      expv[8] = 4'hd;
      expv[9] = 4'hd;
      expv[10] = 4'hd;
      expv[11] = 4'hd;
      expv[12] = 4'hd;
      expv[13] = 4'hd;
      expv[14] = 4'hd;
      expv[15] = 4'hd;
      expv[16] = 4'hd;
      expv[17] = 4'hd;
      expv[18] = 4'hd;
      expv[19] = 4'hd;
      expv[20] = 4'hd;
      expv[21] = 4'hd;
      expv[22] = 4'hd;
      expv[23] = 4'hd;
      expv[24] = 4'hd;
      expv[25] = 4'hd;
      expv[26] = 4'hd;
      expv[27] = 4'hd;
      expv[28] = 4'hd;
      expv[29] = 4'hd;
      expv[30] = 4'hd;
      expv[31] = 4'hd;
      expv[32] = 4'hd;
      expv[33] = 4'hd;
      expv[34] = 4'hd;
      expv[35] = 4'hd;
      expv[36] = 4'hd;
      expv[37] = 4'hd;
      expv[38] = 4'hd;
      expv[39] = 4'hd;
      expv[40] = 4'hd;
      expv[41] = 4'hd;
      expv[42] = 4'hd;
      expv[43] = 4'hd;
      expv[44] = 4'hd;
      expv[45] = 4'hd;
      expv[46] = 4'hd;
      expv[47] = 4'hd;
      expv[48] = 4'hd;
      expv[49] = 4'hd;
      expv[50] = 4'hd;
      expv[51] = 4'hd;
      expv[52] = 4'hd;
      expv[53] = 4'hd;
      expv[54] = 4'hd;
      expv[55] = 4'hd;
      expv[56] = 4'hd;
      expv[57] = 4'hd;
      expv[58] = 4'hd;
      expv[59] = 4'hd;
      expv[60] = 4'hd;
      expv[61] = 4'hd;
      expv[62] = 4'hd;
      expv[63] = 4'hd;
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
