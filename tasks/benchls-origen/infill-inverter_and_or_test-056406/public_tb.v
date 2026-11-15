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

  origen_056406 dut (
    .SW(in_vec[9:0]),
    .LEDR(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h225;
    stim[1] = 10'h006;
    stim[2] = 10'h17e;
    stim[3] = 10'h088;
    stim[4] = 10'h04a;
    stim[5] = 10'h12b;
    stim[6] = 10'h15a;
    stim[7] = 10'h281;
    stim[8] = 10'h3d4;
    stim[9] = 10'h293;
    stim[10] = 10'h371;
    stim[11] = 10'h0a7;
    stim[12] = 10'h2cd;
    stim[13] = 10'h074;
    stim[14] = 10'h07f;
    stim[15] = 10'h06b;
    stim[16] = 10'h069;
    stim[17] = 10'h3ec;
    stim[18] = 10'h1aa;
    stim[19] = 10'h051;
    stim[20] = 10'h145;
    stim[21] = 10'h02c;
    stim[22] = 10'h344;
    stim[23] = 10'h34b;
    stim[24] = 10'h18e;
    stim[25] = 10'h26c;
    stim[26] = 10'h2cd;
    stim[27] = 10'h378;
    stim[28] = 10'h1de;
    stim[29] = 10'h383;
    stim[30] = 10'h271;
    stim[31] = 10'h0f0;
    stim[32] = 10'h271;
    stim[33] = 10'h2b4;
    stim[34] = 10'h3d0;
    stim[35] = 10'h2e4;
    stim[36] = 10'h0a0;
    stim[37] = 10'h0f2;
    stim[38] = 10'h3eb;
    stim[39] = 10'h134;
    stim[40] = 10'h0ff;
    stim[41] = 10'h2ae;
    stim[42] = 10'h0b4;
    stim[43] = 10'h25e;
    stim[44] = 10'h14f;
    stim[45] = 10'h039;
    stim[46] = 10'h17c;
    stim[47] = 10'h360;
    stim[48] = 10'h179;
    stim[49] = 10'h255;
    stim[50] = 10'h399;
    stim[51] = 10'h1cd;
    stim[52] = 10'h26d;
    stim[53] = 10'h3b9;
    stim[54] = 10'h356;
    stim[55] = 10'h124;
    stim[56] = 10'h0dc;
    stim[57] = 10'h116;
    stim[58] = 10'h0ba;
    stim[59] = 10'h0b8;
    stim[60] = 10'h1f5;
    stim[61] = 10'h291;
    stim[62] = 10'h029;
    stim[63] = 10'h087;
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
      expv[0] = 10'h000;
      expv[1] = 10'h000;
      expv[2] = 10'h000;
      expv[3] = 10'h000;
      expv[4] = 10'h000;
      expv[5] = 10'h000;
      expv[6] = 10'h000;
      expv[7] = 10'h000;
      expv[8] = 10'h000;
      expv[9] = 10'h000;
      expv[10] = 10'h000;
      expv[11] = 10'h000;
      expv[12] = 10'h000;
      expv[13] = 10'h000;
      expv[14] = 10'h000;
      expv[15] = 10'h000;
      expv[16] = 10'h000;
      expv[17] = 10'h000;
      expv[18] = 10'h000;
      expv[19] = 10'h000;
      expv[20] = 10'h000;
      expv[21] = 10'h000;
      expv[22] = 10'h000;
      expv[23] = 10'h000;
      expv[24] = 10'h000;
      expv[25] = 10'h000;
      expv[26] = 10'h000;
      expv[27] = 10'h000;
      expv[28] = 10'h000;
      expv[29] = 10'h000;
      expv[30] = 10'h000;
      expv[31] = 10'h000;
      expv[32] = 10'h000;
      expv[33] = 10'h000;
      expv[34] = 10'h000;
      expv[35] = 10'h000;
      expv[36] = 10'h000;
      expv[37] = 10'h000;
      expv[38] = 10'h000;
      expv[39] = 10'h000;
      expv[40] = 10'h000;
      expv[41] = 10'h000;
      expv[42] = 10'h000;
      expv[43] = 10'h000;
      expv[44] = 10'h000;
      expv[45] = 10'h000;
      expv[46] = 10'h000;
      expv[47] = 10'h000;
      expv[48] = 10'h000;
      expv[49] = 10'h000;
      expv[50] = 10'h000;
      expv[51] = 10'h000;
      expv[52] = 10'h000;
      expv[53] = 10'h000;
      expv[54] = 10'h000;
      expv[55] = 10'h000;
      expv[56] = 10'h000;
      expv[57] = 10'h000;
      expv[58] = 10'h000;
      expv[59] = 10'h000;
      expv[60] = 10'h000;
      expv[61] = 10'h000;
      expv[62] = 10'h000;
      expv[63] = 10'h000;
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
