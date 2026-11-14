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
    stim[0] = 11'h62a;
    stim[1] = 11'h785;
    stim[2] = 11'h52b;
    stim[3] = 11'h3fd;
    stim[4] = 11'h3ab;
    stim[5] = 11'h59e;
    stim[6] = 11'h4ac;
    stim[7] = 11'h03c;
    stim[8] = 11'h3fe;
    stim[9] = 11'h4f1;
    stim[10] = 11'h76f;
    stim[11] = 11'h5bc;
    stim[12] = 11'h0d9;
    stim[13] = 11'h5ce;
    stim[14] = 11'h450;
    stim[15] = 11'h451;
    stim[16] = 11'h389;
    stim[17] = 11'h1fe;
    stim[18] = 11'h37b;
    stim[19] = 11'h203;
    stim[20] = 11'h351;
    stim[21] = 11'h5db;
    stim[22] = 11'h7e3;
    stim[23] = 11'h490;
    stim[24] = 11'h234;
    stim[25] = 11'h0ea;
    stim[26] = 11'h410;
    stim[27] = 11'h570;
    stim[28] = 11'h5fd;
    stim[29] = 11'h47b;
    stim[30] = 11'h4a6;
    stim[31] = 11'h06e;
    stim[32] = 11'h7fc;
    stim[33] = 11'h041;
    stim[34] = 11'h7d9;
    stim[35] = 11'h69a;
    stim[36] = 11'h6eb;
    stim[37] = 11'h7f5;
    stim[38] = 11'h7a1;
    stim[39] = 11'h1df;
    stim[40] = 11'h551;
    stim[41] = 11'h04e;
    stim[42] = 11'h0fc;
    stim[43] = 11'h1cc;
    stim[44] = 11'h11a;
    stim[45] = 11'h0ab;
    stim[46] = 11'h22c;
    stim[47] = 11'h2c5;
    stim[48] = 11'h3d1;
    stim[49] = 11'h003;
    stim[50] = 11'h267;
    stim[51] = 11'h6b0;
    stim[52] = 11'h028;
    stim[53] = 11'h52d;
    stim[54] = 11'h6d7;
    stim[55] = 11'h6c4;
    stim[56] = 11'h1b8;
    stim[57] = 11'h0eb;
    stim[58] = 11'h566;
    stim[59] = 11'h598;
    stim[60] = 11'h400;
    stim[61] = 11'h3ec;
    stim[62] = 11'h54a;
    stim[63] = 11'h720;
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
      expv[0] = 12'h153;
      expv[1] = 12'h22b;
      expv[2] = 12'h15a;
      expv[3] = 12'hc07;
      expv[4] = 12'h407;
      expv[5] = 12'h2fb;
      expv[6] = 12'h361;
      expv[7] = 12'h404;
      expv[8] = 12'hc07;
      expv[9] = 12'h389;
      expv[10] = 12'h37b;
      expv[11] = 12'h3eb;
      expv[12] = 12'h805;
      expv[13] = 12'h27b;
      expv[14] = 12'h280;
      expv[15] = 12'h288;
      expv[16] = 12'h007;
      expv[17] = 12'hc07;
      expv[18] = 12'hc07;
      expv[19] = 12'h007;
      expv[20] = 12'h807;
      expv[21] = 12'h2db;
      expv[22] = 12'h31b;
      expv[23] = 12'h281;
      expv[24] = 12'h407;
      expv[25] = 12'hc05;
      expv[26] = 12'h080;
      expv[27] = 12'h38a;
      expv[28] = 12'h3eb;
      expv[29] = 12'h3d8;
      expv[30] = 12'h331;
      expv[31] = 12'hc04;
      expv[32] = 12'h3eb;
      expv[33] = 12'h804;
      expv[34] = 12'h2cb;
      expv[35] = 12'h2d3;
      expv[36] = 12'h35b;
      expv[37] = 12'h3ab;
      expv[38] = 12'h30b;
      expv[39] = 12'h807;
      expv[40] = 12'h28a;
      expv[41] = 12'h804;
      expv[42] = 12'hc05;
      expv[43] = 12'h807;
      expv[44] = 12'h006;
      expv[45] = 12'h405;
      expv[46] = 12'h407;
      expv[47] = 12'h807;
      expv[48] = 12'h807;
      expv[49] = 12'h004;
      expv[50] = 12'hc07;
      expv[51] = 12'h383;
      expv[52] = 12'h404;
      expv[53] = 12'h16a;
      expv[54] = 12'h2bb;
      expv[55] = 12'h223;
      expv[56] = 12'h407;
      expv[57] = 12'hc05;
      expv[58] = 12'h33a;
      expv[59] = 12'h2cb;
      expv[60] = 12'h000;
      expv[61] = 12'hc07;
      expv[62] = 12'h25a;
      expv[63] = 12'h10b;
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
