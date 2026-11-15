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

  SDP_Y_CVT_mgc_in_wire_wait_v1 dut (
    .ld(in_vec[9:9]),
    .vz(in_vec[8:8]),
    .z(in_vec[7:0]),
    .vd(out_vec[9:9]),
    .d(out_vec[8:1]),
    .lz(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h3e2;
    stim[1] = 10'h0b2;
    stim[2] = 10'h199;
    stim[3] = 10'h1f0;
    stim[4] = 10'h06f;
    stim[5] = 10'h1c4;
    stim[6] = 10'h095;
    stim[7] = 10'h064;
    stim[8] = 10'h3b4;
    stim[9] = 10'h135;
    stim[10] = 10'h3bb;
    stim[11] = 10'h0fa;
    stim[12] = 10'h045;
    stim[13] = 10'h308;
    stim[14] = 10'h29d;
    stim[15] = 10'h3be;
    stim[16] = 10'h301;
    stim[17] = 10'h21e;
    stim[18] = 10'h130;
    stim[19] = 10'h06f;
    stim[20] = 10'h362;
    stim[21] = 10'h1ae;
    stim[22] = 10'h2e1;
    stim[23] = 10'h397;
    stim[24] = 10'h270;
    stim[25] = 10'h26a;
    stim[26] = 10'h386;
    stim[27] = 10'h257;
    stim[28] = 10'h17a;
    stim[29] = 10'h0c1;
    stim[30] = 10'h0c8;
    stim[31] = 10'h28f;
    stim[32] = 10'h33a;
    stim[33] = 10'h130;
    stim[34] = 10'h1a2;
    stim[35] = 10'h28f;
    stim[36] = 10'h222;
    stim[37] = 10'h14e;
    stim[38] = 10'h183;
    stim[39] = 10'h1e4;
    stim[40] = 10'h2e3;
    stim[41] = 10'h0e3;
    stim[42] = 10'h01d;
    stim[43] = 10'h231;
    stim[44] = 10'h15b;
    stim[45] = 10'h0ed;
    stim[46] = 10'h391;
    stim[47] = 10'h32d;
    stim[48] = 10'h368;
    stim[49] = 10'h049;
    stim[50] = 10'h1cc;
    stim[51] = 10'h1ce;
    stim[52] = 10'h05e;
    stim[53] = 10'h136;
    stim[54] = 10'h157;
    stim[55] = 10'h09c;
    stim[56] = 10'h3d8;
    stim[57] = 10'h042;
    stim[58] = 10'h279;
    stim[59] = 10'h22c;
    stim[60] = 10'h2af;
    stim[61] = 10'h350;
    stim[62] = 10'h1d0;
    stim[63] = 10'h2b6;
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
      expv[0] = 10'h3c5;
      expv[1] = 10'h164;
      expv[2] = 10'h332;
      expv[3] = 10'h3e0;
      expv[4] = 10'h0de;
      expv[5] = 10'h388;
      expv[6] = 10'h12a;
      expv[7] = 10'h0c8;
      expv[8] = 10'h369;
      expv[9] = 10'h26a;
      expv[10] = 10'h377;
      expv[11] = 10'h1f4;
      expv[12] = 10'h08a;
      expv[13] = 10'h211;
      expv[14] = 10'h13b;
      expv[15] = 10'h37d;
      expv[16] = 10'h203;
      expv[17] = 10'h03d;
      expv[18] = 10'h260;
      expv[19] = 10'h0de;
      expv[20] = 10'h2c5;
      expv[21] = 10'h35c;
      expv[22] = 10'h1c3;
      expv[23] = 10'h32f;
      expv[24] = 10'h0e1;
      expv[25] = 10'h0d5;
      expv[26] = 10'h30d;
      expv[27] = 10'h0af;
      expv[28] = 10'h2f4;
      expv[29] = 10'h182;
      expv[30] = 10'h190;
      expv[31] = 10'h11f;
      expv[32] = 10'h275;
      expv[33] = 10'h260;
      expv[34] = 10'h344;
      expv[35] = 10'h11f;
      expv[36] = 10'h045;
      expv[37] = 10'h29c;
      expv[38] = 10'h306;
      expv[39] = 10'h3c8;
      expv[40] = 10'h1c7;
      expv[41] = 10'h1c6;
      expv[42] = 10'h03a;
      expv[43] = 10'h063;
      expv[44] = 10'h2b6;
      expv[45] = 10'h1da;
      expv[46] = 10'h323;
      expv[47] = 10'h25b;
      expv[48] = 10'h2d1;
      expv[49] = 10'h092;
      expv[50] = 10'h398;
      expv[51] = 10'h39c;
      expv[52] = 10'h0bc;
      expv[53] = 10'h26c;
      expv[54] = 10'h2ae;
      expv[55] = 10'h138;
      expv[56] = 10'h3b1;
      expv[57] = 10'h084;
      expv[58] = 10'h0f3;
      expv[59] = 10'h059;
      expv[60] = 10'h15f;
      expv[61] = 10'h2a1;
      expv[62] = 10'h3a0;
      expv[63] = 10'h16d;
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
