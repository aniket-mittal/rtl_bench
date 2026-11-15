// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00462 dut (
    .sample(in_vec[13:6]),
    .volume(in_vec[5:0]),
    .out(out_vec[13:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h2660;
    stim[1] = 14'h26f2;
    stim[2] = 14'h3d54;
    stim[3] = 14'h10a1;
    stim[4] = 14'h3014;
    stim[5] = 14'h3d71;
    stim[6] = 14'h1f98;
    stim[7] = 14'h200f;
    stim[8] = 14'h1dd5;
    stim[9] = 14'h10c2;
    stim[10] = 14'h2797;
    stim[11] = 14'h39a6;
    stim[12] = 14'h3881;
    stim[13] = 14'h1b1b;
    stim[14] = 14'h0fe3;
    stim[15] = 14'h2c97;
    stim[16] = 14'h35a0;
    stim[17] = 14'h270e;
    stim[18] = 14'h078d;
    stim[19] = 14'h144b;
    stim[20] = 14'h3c0c;
    stim[21] = 14'h1ab7;
    stim[22] = 14'h281a;
    stim[23] = 14'h2308;
    stim[24] = 14'h0337;
    stim[25] = 14'h2e75;
    stim[26] = 14'h023b;
    stim[27] = 14'h02db;
    stim[28] = 14'h333b;
    stim[29] = 14'h0c63;
    stim[30] = 14'h3b8c;
    stim[31] = 14'h107e;
    stim[32] = 14'h3fe1;
    stim[33] = 14'h2205;
    stim[34] = 14'h007c;
    stim[35] = 14'h0c5a;
    stim[36] = 14'h1ff2;
    stim[37] = 14'h0c29;
    stim[38] = 14'h0582;
    stim[39] = 14'h2c9a;
    stim[40] = 14'h29cc;
    stim[41] = 14'h05a3;
    stim[42] = 14'h0fd8;
    stim[43] = 14'h2f8a;
    stim[44] = 14'h05bd;
    stim[45] = 14'h3bb3;
    stim[46] = 14'h38e3;
    stim[47] = 14'h24cf;
    stim[48] = 14'h393c;
    stim[49] = 14'h0381;
    stim[50] = 14'h2d71;
    stim[51] = 14'h164f;
    stim[52] = 14'h1e7d;
    stim[53] = 14'h1b25;
    stim[54] = 14'h0d1b;
    stim[55] = 14'h1a41;
    stim[56] = 14'h2fda;
    stim[57] = 14'h20c4;
    stim[58] = 14'h0cc2;
    stim[59] = 14'h1f85;
    stim[60] = 14'h0dd6;
    stim[61] = 14'h38e8;
    stim[62] = 14'h0d67;
    stim[63] = 14'h272c;
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
      expv[0] = 14'h3320;
      expv[1] = 14'h2c46;
      expv[2] = 14'h3f24;
      expv[3] = 14'h0882;
      expv[4] = 14'h3b00;
      expv[5] = 14'h3de5;
      expv[6] = 14'h0bd0;
      expv[7] = 14'h3880;
      expv[8] = 14'h09c3;
      expv[9] = 14'h0086;
      expv[10] = 14'h3732;
      expv[11] = 14'h3c24;
      expv[12] = 14'h3fe2;
      expv[13] = 14'h0b64;
      expv[14] = 14'h089d;
      expv[15] = 14'h38fe;
      expv[16] = 14'h3ac0;
      expv[17] = 14'h3a88;
      expv[18] = 14'h0186;
      expv[19] = 14'h037b;
      expv[20] = 14'h3f40;
      expv[21] = 14'h16c6;
      expv[22] = 14'h3640;
      expv[23] = 14'h3c60;
      expv[24] = 14'h0294;
      expv[25] = 14'h314d;
      expv[26] = 14'h01d8;
      expv[27] = 14'h0129;
      expv[28] = 14'h3404;
      expv[29] = 14'h06b3;
      expv[30] = 14'h3f28;
      expv[31] = 14'h0fbe;
      expv[32] = 14'h3fdf;
      expv[33] = 14'h3da8;
      expv[34] = 14'h003c;
      expv[35] = 14'h04fa;
      expv[36] = 14'h18ce;
      expv[37] = 14'h07b0;
      expv[38] = 14'h002c;
      expv[39] = 14'h3814;
      expv[40] = 14'h3bd4;
      expv[41] = 14'h0302;
      expv[42] = 14'h05e8;
      expv[43] = 14'h3d6c;
      expv[44] = 14'h053e;
      expv[45] = 14'h3c6a;
      expv[46] = 14'h3c09;
      expv[47] = 14'h399d;
      expv[48] = 14'h3970;
      expv[49] = 14'h000e;
      expv[50] = 14'h31a5;
      expv[51] = 14'h0537;
      expv[52] = 14'h1cd5;
      expv[53] = 14'h0f9c;
      expv[54] = 14'h057c;
      expv[55] = 14'h0069;
      expv[56] = 14'h3966;
      expv[57] = 14'h3e0c;
      expv[58] = 14'h0066;
      expv[59] = 14'h0276;
      expv[60] = 14'h04ba;
      expv[61] = 14'h3b78;
      expv[62] = 14'h0813;
      expv[63] = 14'h2ed0;
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
