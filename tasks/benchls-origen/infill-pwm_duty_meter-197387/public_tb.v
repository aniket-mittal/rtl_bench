// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 114;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_197387 dut (
    .clk(clk),
    .rst_n(in_vec[33:33]),
    .sig_in(in_vec[32:32]),
    .pinlv(in_vec[31:0]),
    .duty(out_vec[113:98]),
    .cnt_high(out_vec[97:66]),
    .cnt_low(out_vec[65:34]),
    .high_pulse(out_vec[33:33]),
    .low_pulse(out_vec[32:32]),
    .duty_alter(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h025f56ffc;
    stim[1] = 34'h0f613bb86;
    stim[2] = 34'h3a72f143a;
    stim[3] = 34'h32e67dcd3;
    stim[4] = 34'h3c58db74f;
    stim[5] = 34'h253fbcafa;
    stim[6] = 34'h3ce216a37;
    stim[7] = 34'h324248f1c;
    stim[8] = 34'h2e0da68a7;
    stim[9] = 34'h2e1b0f38d;
    stim[10] = 34'h3223e2a83;
    stim[11] = 34'h3ed8647ef;
    stim[12] = 34'h21b0e7973;
    stim[13] = 34'h2295583bf;
    stim[14] = 34'h2e76d4364;
    stim[15] = 34'h2b6fb2a09;
    stim[16] = 34'h245574927;
    stim[17] = 34'h2db99d6eb;
    stim[18] = 34'h3d585fc96;
    stim[19] = 34'h25be67d4f;
    stim[20] = 34'h3ad4c0968;
    stim[21] = 34'h22c41e2d2;
    stim[22] = 34'h37477f51c;
    stim[23] = 34'h3898cae75;
    stim[24] = 34'h3f5b9d7c6;
    stim[25] = 34'h28c0d615e;
    stim[26] = 34'h274d08450;
    stim[27] = 34'h3590bdb24;
    stim[28] = 34'h3857c8532;
    stim[29] = 34'h28eefa9a8;
    stim[30] = 34'h2235fb24d;
    stim[31] = 34'h3d98913ab;
    stim[32] = 34'h357d3ad96;
    stim[33] = 34'h2fa8f7911;
    stim[34] = 34'h20c87f302;
    stim[35] = 34'h201ec8768;
    stim[36] = 34'h2ff0ce6b9;
    stim[37] = 34'h2e97fbe82;
    stim[38] = 34'h22c4d6530;
    stim[39] = 34'h36678cbfc;
    stim[40] = 34'h26aa740e8;
    stim[41] = 34'h31fe12e9c;
    stim[42] = 34'h2b018e7fb;
    stim[43] = 34'h23799f92c;
    stim[44] = 34'h37c2021cc;
    stim[45] = 34'h3504dab51;
    stim[46] = 34'h30ed31884;
    stim[47] = 34'h367bfe4c0;
    stim[48] = 34'h28825d476;
    stim[49] = 34'h25d30e20f;
    stim[50] = 34'h30b132801;
    stim[51] = 34'h38cbf1a4d;
    stim[52] = 34'h3602d76aa;
    stim[53] = 34'h2fca93eec;
    stim[54] = 34'h3bef8430e;
    stim[55] = 34'h394105a4c;
    stim[56] = 34'h32d168f9e;
    stim[57] = 34'h3a0e1621e;
    stim[58] = 34'h2317c5924;
    stim[59] = 34'h2cccc74c3;
    stim[60] = 34'h23708537a;
    stim[61] = 34'h22d7b3dde;
    stim[62] = 34'h2716cc641;
    stim[63] = 34'h39ca6daf6;
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
      expv[0] = 114'h00000000000000000000000000000;
      expv[1] = 114'h00000000000000000000000000000;
      expv[2] = 114'h00000000000000000000000000000;
      expv[3] = 114'h00000000000000000000000000000;
      expv[4] = 114'h00000000000000000000200000000;
      expv[5] = 114'h00000000000000000000000000000;
      expv[6] = 114'h00000000000000000000000000000;
      expv[7] = 114'h00000000000000000000100000000;
      expv[8] = 114'h00000000000000000000200000000;
      expv[9] = 114'h00000000000000000000000000000;
      expv[10] = 114'h00000000000000000000100000000;
      expv[11] = 114'h00000000000000000000000000000;
      expv[12] = 114'h00000000000000000000200000000;
      expv[13] = 114'h00000000000000000000000000000;
      expv[14] = 114'h00000000000000000000100000000;
      expv[15] = 114'h00000000000000000000000000000;
      expv[16] = 114'h00000000000000000000000000000;
      expv[17] = 114'h00000000000000000000000000000;
      expv[18] = 114'h00000000000000000000000000000;
      expv[19] = 114'h00000000000000000000000000000;
      expv[20] = 114'h00000000000000000000200000000;
      expv[21] = 114'h00000000000000000000100000000;
      expv[22] = 114'h00000000000000000000200000000;
      expv[23] = 114'h00000000000000000000100000000;
      expv[24] = 114'h00000000000000000000200000000;
      expv[25] = 114'h00000000000000000000000000000;
      expv[26] = 114'h00000000000000000000000000000;
      expv[27] = 114'h00000000000000000000100000000;
      expv[28] = 114'h00000000000000000000000000000;
      expv[29] = 114'h00000000000000000000200000000;
      expv[30] = 114'h00000000000000000000000000000;
      expv[31] = 114'h00000000000000000000100000000;
      expv[32] = 114'h00000000000000000000000000000;
      expv[33] = 114'h00000000000000000000200000000;
      expv[34] = 114'h00000000000000000000000000000;
      expv[35] = 114'h00000000000000000000100000000;
      expv[36] = 114'h00000000000000000000000000000;
      expv[37] = 114'h00000000000000000000000000000;
      expv[38] = 114'h00000000000000000000000000000;
      expv[39] = 114'h00000000000000000000000000000;
      expv[40] = 114'h00000000000000000000000000000;
      expv[41] = 114'h00000000000000000000200000000;
      expv[42] = 114'h00000000000000000000100000000;
      expv[43] = 114'h00000000000000000000200000000;
      expv[44] = 114'h00000000000000000000100000000;
      expv[45] = 114'h00000000000000000000000000000;
      expv[46] = 114'h00000000000000000000200000000;
      expv[47] = 114'h00000000000000000000000000000;
      expv[48] = 114'h00000000000000000000000000000;
      expv[49] = 114'h00000000000000000000000000000;
      expv[50] = 114'h00000000000000000000100000000;
      expv[51] = 114'h00000000000000000000000000000;
      expv[52] = 114'h00000000000000000000200000000;
      expv[53] = 114'h00000000000000000000000000000;
      expv[54] = 114'h00000000000000000000000000000;
      expv[55] = 114'h00000000000000000000100000000;
      expv[56] = 114'h00000000000000000000200000000;
      expv[57] = 114'h00000000000000000000000000000;
      expv[58] = 114'h00000000000000000000000000000;
      expv[59] = 114'h00000000000000000000000000000;
      expv[60] = 114'h00000000000000000000100000000;
      expv[61] = 114'h00000000000000000000000000000;
      expv[62] = 114'h00000000000000000000000000000;
      expv[63] = 114'h00000000000000000000000000000;
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
