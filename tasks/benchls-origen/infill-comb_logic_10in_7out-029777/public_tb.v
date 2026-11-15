// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_029777 dut (
    .x0(in_vec[9:9]),
    .x1(in_vec[8:8]),
    .x2(in_vec[7:7]),
    .x3(in_vec[6:6]),
    .x4(in_vec[5:5]),
    .x5(in_vec[4:4]),
    .x6(in_vec[3:3]),
    .x7(in_vec[2:2]),
    .x8(in_vec[1:1]),
    .x9(in_vec[0:0]),
    .z0(out_vec[6:6]),
    .z1(out_vec[5:5]),
    .z2(out_vec[4:4]),
    .z3(out_vec[3:3]),
    .z4(out_vec[2:2]),
    .z5(out_vec[1:1]),
    .z6(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h1f6;
    stim[1] = 10'h18f;
    stim[2] = 10'h02a;
    stim[3] = 10'h1e2;
    stim[4] = 10'h0aa;
    stim[5] = 10'h094;
    stim[6] = 10'h332;
    stim[7] = 10'h1a7;
    stim[8] = 10'h3d7;
    stim[9] = 10'h0e6;
    stim[10] = 10'h175;
    stim[11] = 10'h29a;
    stim[12] = 10'h047;
    stim[13] = 10'h10d;
    stim[14] = 10'h3e1;
    stim[15] = 10'h278;
    stim[16] = 10'h264;
    stim[17] = 10'h39c;
    stim[18] = 10'h1ac;
    stim[19] = 10'h0dd;
    stim[20] = 10'h2b2;
    stim[21] = 10'h1f2;
    stim[22] = 10'h3ac;
    stim[23] = 10'h343;
    stim[24] = 10'h304;
    stim[25] = 10'h2c5;
    stim[26] = 10'h275;
    stim[27] = 10'h20c;
    stim[28] = 10'h0a2;
    stim[29] = 10'h07c;
    stim[30] = 10'h198;
    stim[31] = 10'h1d9;
    stim[32] = 10'h091;
    stim[33] = 10'h38a;
    stim[34] = 10'h167;
    stim[35] = 10'h0d0;
    stim[36] = 10'h04b;
    stim[37] = 10'h21b;
    stim[38] = 10'h231;
    stim[39] = 10'h2e5;
    stim[40] = 10'h1eb;
    stim[41] = 10'h2fe;
    stim[42] = 10'h16e;
    stim[43] = 10'h26b;
    stim[44] = 10'h233;
    stim[45] = 10'h05c;
    stim[46] = 10'h30c;
    stim[47] = 10'h0a0;
    stim[48] = 10'h068;
    stim[49] = 10'h157;
    stim[50] = 10'h0ba;
    stim[51] = 10'h076;
    stim[52] = 10'h298;
    stim[53] = 10'h119;
    stim[54] = 10'h1de;
    stim[55] = 10'h23c;
    stim[56] = 10'h1c7;
    stim[57] = 10'h1d3;
    stim[58] = 10'h199;
    stim[59] = 10'h1c0;
    stim[60] = 10'h27d;
    stim[61] = 10'h302;
    stim[62] = 10'h027;
    stim[63] = 10'h1d1;
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
      expv[0] = 7'h0e;
      expv[1] = 7'h78;
      expv[2] = 7'h2c;
      expv[3] = 7'h0e;
      expv[4] = 7'h2c;
      expv[5] = 7'h4c;
      expv[6] = 7'h0c;
      expv[7] = 7'h4c;
      expv[8] = 7'h4c;
      expv[9] = 7'h0e;
      expv[10] = 7'h4e;
      expv[11] = 7'h2c;
      expv[12] = 7'h4c;
      expv[13] = 7'h58;
      expv[14] = 7'h4e;
      expv[15] = 7'h3d;
      expv[16] = 7'h4e;
      expv[17] = 7'h48;
      expv[18] = 7'h48;
      expv[19] = 7'h58;
      expv[20] = 7'h0c;
      expv[21] = 7'h0e;
      expv[22] = 7'h48;
      expv[23] = 7'h4c;
      expv[24] = 7'h4c;
      expv[25] = 7'h4c;
      expv[26] = 7'h4e;
      expv[27] = 7'h48;
      expv[28] = 7'h0c;
      expv[29] = 7'h48;
      expv[30] = 7'h3c;
      expv[31] = 7'h78;
      expv[32] = 7'h4c;
      expv[33] = 7'h2c;
      expv[34] = 7'h4f;
      expv[35] = 7'h1c;
      expv[36] = 7'h78;
      expv[37] = 7'h78;
      expv[38] = 7'h4c;
      expv[39] = 7'h4e;
      expv[40] = 7'h7b;
      expv[41] = 7'h0a;
      expv[42] = 7'h0a;
      expv[43] = 7'h7b;
      expv[44] = 7'h4c;
      expv[45] = 7'h48;
      expv[46] = 7'h48;
      expv[47] = 7'h1c;
      expv[48] = 7'h3d;
      expv[49] = 7'h4c;
      expv[50] = 7'h2c;
      expv[51] = 7'h0e;
      expv[52] = 7'h3c;
      expv[53] = 7'h78;
      expv[54] = 7'h08;
      expv[55] = 7'h48;
      expv[56] = 7'h4c;
      expv[57] = 7'h4c;
      expv[58] = 7'h78;
      expv[59] = 7'h1c;
      expv[60] = 7'h59;
      expv[61] = 7'h0c;
      expv[62] = 7'h4c;
      expv[63] = 7'h4c;
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
