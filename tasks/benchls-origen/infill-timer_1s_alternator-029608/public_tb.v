// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_029608 dut (
    .clk(clk),
    .rst_n(in_vec[16:16]),
    .DEVICE_SDCMT(in_vec[15:8]),
    .DEVICE_SDCMH(in_vec[7:0]),
    .DEVICE_SDCMD(out_vec[8:1]),
    .timer_1s_en(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h0f9fe;
    stim[1] = 17'h054bb;
    stim[2] = 17'h13fd3;
    stim[3] = 17'h1297f;
    stim[4] = 17'h16483;
    stim[5] = 17'h16935;
    stim[6] = 17'h1f318;
    stim[7] = 17'h1c780;
    stim[8] = 17'h1f040;
    stim[9] = 17'h1b033;
    stim[10] = 17'h14203;
    stim[11] = 17'h1503f;
    stim[12] = 17'h157f8;
    stim[13] = 17'h1ac95;
    stim[14] = 17'h1ead8;
    stim[15] = 17'h1490f;
    stim[16] = 17'h0e9f0;
    stim[17] = 17'h1fcd2;
    stim[18] = 17'h14fb9;
    stim[19] = 17'h13eb5;
    stim[20] = 17'h080a8;
    stim[21] = 17'h11f9f;
    stim[22] = 17'h1d656;
    stim[23] = 17'h14c6a;
    stim[24] = 17'h1bc4a;
    stim[25] = 17'h16ae1;
    stim[26] = 17'h1e383;
    stim[27] = 17'h17fd0;
    stim[28] = 17'h16f2c;
    stim[29] = 17'h14e03;
    stim[30] = 17'h15fa0;
    stim[31] = 17'h1ca3f;
    stim[32] = 17'h179fc;
    stim[33] = 17'h19d72;
    stim[34] = 17'h112d4;
    stim[35] = 17'h19d60;
    stim[36] = 17'h1ee9b;
    stim[37] = 17'h188ac;
    stim[38] = 17'h18e9d;
    stim[39] = 17'h1c68e;
    stim[40] = 17'h10c99;
    stim[41] = 17'h19f98;
    stim[42] = 17'h137a3;
    stim[43] = 17'h18485;
    stim[44] = 17'h1633c;
    stim[45] = 17'h1b3dd;
    stim[46] = 17'h1bfa4;
    stim[47] = 17'h154af;
    stim[48] = 17'h1fe26;
    stim[49] = 17'h11971;
    stim[50] = 17'h1f59e;
    stim[51] = 17'h143c7;
    stim[52] = 17'h16725;
    stim[53] = 17'h14967;
    stim[54] = 17'h106fd;
    stim[55] = 17'h1d7bd;
    stim[56] = 17'h135b9;
    stim[57] = 17'h10d07;
    stim[58] = 17'h1aeec;
    stim[59] = 17'h1c9ec;
    stim[60] = 17'h18422;
    stim[61] = 17'h1c6e7;
    stim[62] = 17'h13a41;
    stim[63] = 17'h1df2e;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h07e;
      expv[4] = 9'h052;
      expv[5] = 9'h0c8;
      expv[6] = 9'h0d2;
      expv[7] = 9'h1e6;
      expv[8] = 9'h18e;
      expv[9] = 9'h1e0;
      expv[10] = 9'h160;
      expv[11] = 9'h084;
      expv[12] = 9'h0a0;
      expv[13] = 9'h0ae;
      expv[14] = 9'h158;
      expv[15] = 9'h1d4;
      expv[16] = 9'h000;
      expv[17] = 9'h000;
      expv[18] = 9'h1f8;
      expv[19] = 9'h09e;
      expv[20] = 9'h000;
      expv[21] = 9'h000;
      expv[22] = 9'h03e;
      expv[23] = 9'h1ac;
      expv[24] = 9'h098;
      expv[25] = 9'h178;
      expv[26] = 9'h0d4;
      expv[27] = 9'h1c6;
      expv[28] = 9'h0fe;
      expv[29] = 9'h0de;
      expv[30] = 9'h09c;
      expv[31] = 9'h0be;
      expv[32] = 9'h194;
      expv[33] = 9'h0f2;
      expv[34] = 9'h13a;
      expv[35] = 9'h024;
      expv[36] = 9'h13a;
      expv[37] = 9'h1dc;
      expv[38] = 9'h110;
      expv[39] = 9'h11c;
      expv[40] = 9'h18c;
      expv[41] = 9'h018;
      expv[42] = 9'h13e;
      expv[43] = 9'h06e;
      expv[44] = 9'h108;
      expv[45] = 9'h0c6;
      expv[46] = 9'h166;
      expv[47] = 9'h17e;
      expv[48] = 9'h0a8;
      expv[49] = 9'h1fc;
      expv[50] = 9'h032;
      expv[51] = 9'h1ea;
      expv[52] = 9'h086;
      expv[53] = 9'h0ce;
      expv[54] = 9'h092;
      expv[55] = 9'h00c;
      expv[56] = 9'h1ae;
      expv[57] = 9'h06a;
      expv[58] = 9'h01a;
      expv[59] = 9'h15c;
      expv[60] = 9'h192;
      expv[61] = 9'h108;
      expv[62] = 9'h18c;
      expv[63] = 9'h074;
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
