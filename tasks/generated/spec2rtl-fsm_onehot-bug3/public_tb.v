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
    stim[0] = 11'h5cf;
    stim[1] = 11'h2fe;
    stim[2] = 11'h2d2;
    stim[3] = 11'h411;
    stim[4] = 11'h116;
    stim[5] = 11'h4e5;
    stim[6] = 11'h05f;
    stim[7] = 11'h270;
    stim[8] = 11'h4fc;
    stim[9] = 11'h7b8;
    stim[10] = 11'h1d6;
    stim[11] = 11'h24d;
    stim[12] = 11'h661;
    stim[13] = 11'h2cb;
    stim[14] = 11'h3cc;
    stim[15] = 11'h501;
    stim[16] = 11'h52b;
    stim[17] = 11'h517;
    stim[18] = 11'h106;
    stim[19] = 11'h787;
    stim[20] = 11'h3b0;
    stim[21] = 11'h6cc;
    stim[22] = 11'h301;
    stim[23] = 11'h5fb;
    stim[24] = 11'h0bf;
    stim[25] = 11'h616;
    stim[26] = 11'h3cb;
    stim[27] = 11'h137;
    stim[28] = 11'h145;
    stim[29] = 11'h6c4;
    stim[30] = 11'h4a3;
    stim[31] = 11'h4ff;
    stim[32] = 11'h521;
    stim[33] = 11'h3d8;
    stim[34] = 11'h1bd;
    stim[35] = 11'h4c7;
    stim[36] = 11'h262;
    stim[37] = 11'h08a;
    stim[38] = 11'h262;
    stim[39] = 11'h266;
    stim[40] = 11'h63c;
    stim[41] = 11'h6d3;
    stim[42] = 11'h27d;
    stim[43] = 11'h212;
    stim[44] = 11'h6dd;
    stim[45] = 11'h2ee;
    stim[46] = 11'h340;
    stim[47] = 11'h7ca;
    stim[48] = 11'h193;
    stim[49] = 11'h4d8;
    stim[50] = 11'h538;
    stim[51] = 11'h2e1;
    stim[52] = 11'h397;
    stim[53] = 11'h059;
    stim[54] = 11'h78f;
    stim[55] = 11'h287;
    stim[56] = 11'h4a7;
    stim[57] = 11'h236;
    stim[58] = 11'h4dc;
    stim[59] = 11'h09c;
    stim[60] = 11'h483;
    stim[61] = 11'h47e;
    stim[62] = 11'h65f;
    stim[63] = 11'h741;
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
      expv[0] = 12'h279;
      expv[1] = 12'hc05;
      expv[2] = 12'h805;
      expv[3] = 12'h088;
      expv[4] = 12'h004;
      expv[5] = 12'h329;
      expv[6] = 12'h804;
      expv[7] = 12'hc05;
      expv[8] = 12'h3e1;
      expv[9] = 12'h3cb;
      expv[10] = 12'h805;
      expv[11] = 12'h805;
      expv[12] = 12'h309;
      expv[13] = 12'h805;
      expv[14] = 12'h807;
      expv[15] = 12'h008;
      expv[16] = 12'h158;
      expv[17] = 12'h0b8;
      expv[18] = 12'h004;
      expv[19] = 12'h23b;
      expv[20] = 12'h407;
      expv[21] = 12'h269;
      expv[22] = 12'h007;
      expv[23] = 12'h3d9;
      expv[24] = 12'h405;
      expv[25] = 12'h0b9;
      expv[26] = 12'h807;
      expv[27] = 12'h404;
      expv[28] = 12'h804;
      expv[29] = 12'h229;
      expv[30] = 12'h319;
      expv[31] = 12'h3f9;
      expv[32] = 12'h108;
      expv[33] = 12'h807;
      expv[34] = 12'h405;
      expv[35] = 12'h239;
      expv[36] = 12'hc05;
      expv[37] = 12'h005;
      expv[38] = 12'hc05;
      expv[39] = 12'hc05;
      expv[40] = 12'h1e9;
      expv[41] = 12'h299;
      expv[42] = 12'hc05;
      expv[43] = 12'h005;
      expv[44] = 12'h2e9;
      expv[45] = 12'hc05;
      expv[46] = 12'h807;
      expv[47] = 12'h25b;
      expv[48] = 12'h005;
      expv[49] = 12'h2c1;
      expv[50] = 12'h1c8;
      expv[51] = 12'hc05;
      expv[52] = 12'h007;
      expv[53] = 12'h804;
      expv[54] = 12'h27b;
      expv[55] = 12'h005;
      expv[56] = 12'h339;
      expv[57] = 12'h405;
      expv[58] = 12'h2e1;
      expv[59] = 12'h005;
      expv[60] = 12'h219;
      expv[61] = 12'h3f0;
      expv[62] = 12'h2f9;
      expv[63] = 12'h20b;
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
