// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[10:10]),
    .state(in_vec[9:0]),
    .next_state(out_vec[11:2]),
    .out1(out_vec[1:1]),
    .out2(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h5b4;
    stim[1] = 11'h681;
    stim[2] = 11'h4fc;
    stim[3] = 11'h778;
    stim[4] = 11'h3d0;
    stim[5] = 11'h0f1;
    stim[6] = 11'h75a;
    stim[7] = 11'h139;
    stim[8] = 11'h386;
    stim[9] = 11'h48b;
    stim[10] = 11'h6d8;
    stim[11] = 11'h4f0;
    stim[12] = 11'h159;
    stim[13] = 11'h1d0;
    stim[14] = 11'h1db;
    stim[15] = 11'h104;
    stim[16] = 11'h17f;
    stim[17] = 11'h7cd;
    stim[18] = 11'h61f;
    stim[19] = 11'h1b2;
    stim[20] = 11'h5ee;
    stim[21] = 11'h028;
    stim[22] = 11'h419;
    stim[23] = 11'h2c9;
    stim[24] = 11'h7f6;
    stim[25] = 11'h607;
    stim[26] = 11'h160;
    stim[27] = 11'h49e;
    stim[28] = 11'h047;
    stim[29] = 11'h100;
    stim[30] = 11'h6d2;
    stim[31] = 11'h25b;
    stim[32] = 11'h3c2;
    stim[33] = 11'h61e;
    stim[34] = 11'h7b2;
    stim[35] = 11'h093;
    stim[36] = 11'h1bd;
    stim[37] = 11'h788;
    stim[38] = 11'h6d1;
    stim[39] = 11'h407;
    stim[40] = 11'h1aa;
    stim[41] = 11'h4b2;
    stim[42] = 11'h1f4;
    stim[43] = 11'h062;
    stim[44] = 11'h431;
    stim[45] = 11'h4b7;
    stim[46] = 11'h1ce;
    stim[47] = 11'h386;
    stim[48] = 11'h1ad;
    stim[49] = 11'h535;
    stim[50] = 11'h151;
    stim[51] = 11'h258;
    stim[52] = 11'h754;
    stim[53] = 11'h4c8;
    stim[54] = 11'h1f6;
    stim[55] = 11'h3f0;
    stim[56] = 11'h715;
    stim[57] = 11'h670;
    stim[58] = 11'h3ef;
    stim[59] = 11'h5f1;
    stim[60] = 11'h702;
    stim[61] = 11'h1d5;
    stim[62] = 11'h5a4;
    stim[63] = 11'h266;
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
      expv[0] = 12'h3ab;
      expv[1] = 12'h20b;
      expv[2] = 12'h3e1;
      expv[3] = 12'h3cb;
      expv[4] = 12'h807;
      expv[5] = 12'hc05;
      expv[6] = 12'h2db;
      expv[7] = 12'h406;
      expv[8] = 12'h007;
      expv[9] = 12'h259;
      expv[10] = 12'h2c3;
      expv[11] = 12'h381;
      expv[12] = 12'h806;
      expv[13] = 12'h807;
      expv[14] = 12'h807;
      expv[15] = 12'h006;
      expv[16] = 12'hc06;
      expv[17] = 12'h26b;
      expv[18] = 12'h0fb;
      expv[19] = 12'h407;
      expv[20] = 12'h37b;
      expv[21] = 12'h404;
      expv[22] = 12'h0c8;
      expv[23] = 12'h807;
      expv[24] = 12'h3bb;
      expv[25] = 12'h03b;
      expv[26] = 12'hc06;
      expv[27] = 12'h2f1;
      expv[28] = 12'h804;
      expv[29] = 12'h006;
      expv[30] = 12'h293;
      expv[31] = 12'h807;
      expv[32] = 12'h807;
      expv[33] = 12'h0f3;
      expv[34] = 12'h39b;
      expv[35] = 12'h005;
      expv[36] = 12'h407;
      expv[37] = 12'h24b;
      expv[38] = 12'h28b;
      expv[39] = 12'h038;
      expv[40] = 12'h407;
      expv[41] = 12'h391;
      expv[42] = 12'hc07;
      expv[43] = 12'hc04;
      expv[44] = 12'h188;
      expv[45] = 12'h3b9;
      expv[46] = 12'h807;
      expv[47] = 12'h007;
      expv[48] = 12'h407;
      expv[49] = 12'h1aa;
      expv[50] = 12'h806;
      expv[51] = 12'h807;
      expv[52] = 12'h2ab;
      expv[53] = 12'h241;
      expv[54] = 12'hc07;
      expv[55] = 12'hc07;
      expv[56] = 12'h0ab;
      expv[57] = 12'h383;
      expv[58] = 12'hc07;
      expv[59] = 12'h38b;
      expv[60] = 12'h01b;
      expv[61] = 12'h807;
      expv[62] = 12'h32b;
      expv[63] = 12'hc07;
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
