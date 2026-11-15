// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_053315 dut (
    .a(in_vec[9:6]),
    .b(in_vec[5:2]),
    .c_in(in_vec[1:1]),
    .z(in_vec[0:0]),
    .d(out_vec[9:6]),
    .c_out(out_vec[5:5]),
    .x(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h074;
    stim[1] = 10'h344;
    stim[2] = 10'h06d;
    stim[3] = 10'h225;
    stim[4] = 10'h144;
    stim[5] = 10'h02e;
    stim[6] = 10'h166;
    stim[7] = 10'h3ea;
    stim[8] = 10'h117;
    stim[9] = 10'h1be;
    stim[10] = 10'h3d2;
    stim[11] = 10'h26f;
    stim[12] = 10'h314;
    stim[13] = 10'h353;
    stim[14] = 10'h036;
    stim[15] = 10'h2e0;
    stim[16] = 10'h37e;
    stim[17] = 10'h266;
    stim[18] = 10'h220;
    stim[19] = 10'h0f8;
    stim[20] = 10'h160;
    stim[21] = 10'h2ed;
    stim[22] = 10'h07d;
    stim[23] = 10'h1d8;
    stim[24] = 10'h31c;
    stim[25] = 10'h29f;
    stim[26] = 10'h1b1;
    stim[27] = 10'h147;
    stim[28] = 10'h0b9;
    stim[29] = 10'h2d7;
    stim[30] = 10'h2dd;
    stim[31] = 10'h16f;
    stim[32] = 10'h163;
    stim[33] = 10'h186;
    stim[34] = 10'h144;
    stim[35] = 10'h30b;
    stim[36] = 10'h0f8;
    stim[37] = 10'h02c;
    stim[38] = 10'h0d2;
    stim[39] = 10'h323;
    stim[40] = 10'h3da;
    stim[41] = 10'h18b;
    stim[42] = 10'h3c3;
    stim[43] = 10'h03a;
    stim[44] = 10'h11d;
    stim[45] = 10'h341;
    stim[46] = 10'h344;
    stim[47] = 10'h062;
    stim[48] = 10'h055;
    stim[49] = 10'h321;
    stim[50] = 10'h082;
    stim[51] = 10'h211;
    stim[52] = 10'h3bd;
    stim[53] = 10'h32c;
    stim[54] = 10'h3b8;
    stim[55] = 10'h3d8;
    stim[56] = 10'h037;
    stim[57] = 10'h009;
    stim[58] = 10'h2ab;
    stim[59] = 10'h350;
    stim[60] = 10'h14e;
    stim[61] = 10'h128;
    stim[62] = 10'h3db;
    stim[63] = 10'h114;
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
      expv[0] = 10'h134;
      expv[1] = 10'h134;
      expv[2] = 10'h30c;
      expv[3] = 10'h30c;
      expv[4] = 10'h104;
      expv[5] = 10'h104;
      expv[6] = 10'h104;
      expv[7] = 10'h104;
      expv[8] = 10'h28a;
      expv[9] = 10'h238;
      expv[10] = 10'h238;
      expv[11] = 10'h175;
      expv[12] = 10'h1c7;
      expv[13] = 10'h0b2;
      expv[14] = 10'h134;
      expv[15] = 10'h134;
      expv[16] = 10'h134;
      expv[17] = 10'h134;
      expv[18] = 10'h134;
      expv[19] = 10'h134;
      expv[20] = 10'h134;
      expv[21] = 10'h1b6;
      expv[22] = 10'h1b6;
      expv[23] = 10'h041;
      expv[24] = 10'h041;
      expv[25] = 10'h0b2;
      expv[26] = 10'h0b2;
      expv[27] = 10'h0b2;
      expv[28] = 10'h0b2;
      expv[29] = 10'h0b2;
      expv[30] = 10'h0b2;
      expv[31] = 10'h0b2;
      expv[32] = 10'h0b2;
      expv[33] = 10'h186;
      expv[34] = 10'h186;
      expv[35] = 10'h3cf;
      expv[36] = 10'h175;
      expv[37] = 10'h175;
      expv[38] = 10'h175;
      expv[39] = 10'h175;
      expv[40] = 10'h28a;
      expv[41] = 10'h249;
      expv[42] = 10'h249;
      expv[43] = 10'h0f3;
      expv[44] = 10'h2cb;
      expv[45] = 10'h2cb;
      expv[46] = 10'h30c;
      expv[47] = 10'h30c;
      expv[48] = 10'h186;
      expv[49] = 10'h186;
      expv[50] = 10'h0c3;
      expv[51] = 10'h30c;
      expv[52] = 10'h30c;
      expv[53] = 10'h041;
      expv[54] = 10'h041;
      expv[55] = 10'h041;
      expv[56] = 10'h38e;
      expv[57] = 10'h38e;
      expv[58] = 10'h38e;
      expv[59] = 10'h249;
      expv[60] = 10'h249;
      expv[61] = 10'h249;
      expv[62] = 10'h1b6;
      expv[63] = 10'h3ff;
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
