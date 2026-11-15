// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06547 dut (
    .addr(in_vec[32:1]),
    .cs_(in_vec[0:0]),
    .cs0(out_vec[7:7]),
    .cs1(out_vec[6:6]),
    .cs2(out_vec[5:5]),
    .cs3(out_vec[4:4]),
    .cs4(out_vec[3:3]),
    .cs5(out_vec[2:2]),
    .cs6(out_vec[1:1]),
    .cs7(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1b1fb1cff;
    stim[1] = 33'h0fcae37ea;
    stim[2] = 33'h0d780afd5;
    stim[3] = 33'h0c7594b12;
    stim[4] = 33'h03c844004;
    stim[5] = 33'h10d03bcd2;
    stim[6] = 33'h16f4bbbf5;
    stim[7] = 33'h16ab224c1;
    stim[8] = 33'h0d16da98f;
    stim[9] = 33'h19b50e6ce;
    stim[10] = 33'h0aa0cc9e0;
    stim[11] = 33'h06875a8ef;
    stim[12] = 33'h0a6dfb36f;
    stim[13] = 33'h19c4d9768;
    stim[14] = 33'h11fa19070;
    stim[15] = 33'h1d12925bb;
    stim[16] = 33'h0825764f8;
    stim[17] = 33'h0b17e7e42;
    stim[18] = 33'h0ecb804ac;
    stim[19] = 33'h0b349bd9a;
    stim[20] = 33'h1d9f6cf35;
    stim[21] = 33'h0507677c5;
    stim[22] = 33'h1d6263a5b;
    stim[23] = 33'h18f35266f;
    stim[24] = 33'h066ae79a6;
    stim[25] = 33'h19f015c1b;
    stim[26] = 33'h0a71fac92;
    stim[27] = 33'h1f4c3fa69;
    stim[28] = 33'h069590150;
    stim[29] = 33'h1fa42a961;
    stim[30] = 33'h06aa0e655;
    stim[31] = 33'h0935d3730;
    stim[32] = 33'h1cc5d73e5;
    stim[33] = 33'h0fd8c848f;
    stim[34] = 33'h188adb07b;
    stim[35] = 33'h0d012d0f2;
    stim[36] = 33'h1fe538640;
    stim[37] = 33'h1c4033aed;
    stim[38] = 33'h1e6d407ad;
    stim[39] = 33'h0bbb428f7;
    stim[40] = 33'h082cb5a31;
    stim[41] = 33'h14bb012a2;
    stim[42] = 33'h1d9da4b72;
    stim[43] = 33'h148946db1;
    stim[44] = 33'h0404ec996;
    stim[45] = 33'h112ffa162;
    stim[46] = 33'h120a09685;
    stim[47] = 33'h1b56a92a2;
    stim[48] = 33'h092876e08;
    stim[49] = 33'h13987f531;
    stim[50] = 33'h16b24ef57;
    stim[51] = 33'h12b04c1c2;
    stim[52] = 33'h094113edf;
    stim[53] = 33'h077e793f5;
    stim[54] = 33'h06cf3672d;
    stim[55] = 33'h1c91ce0ce;
    stim[56] = 33'h1010c9fc6;
    stim[57] = 33'h0fdd026df;
    stim[58] = 33'h08936a639;
    stim[59] = 33'h1e7c2fd94;
    stim[60] = 33'h0a2d5cd9d;
    stim[61] = 33'h08510c604;
    stim[62] = 33'h16242d687;
    stim[63] = 33'h1773599aa;
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
      expv[0] = 8'hff;
      expv[1] = 8'hff;
      expv[2] = 8'hff;
      expv[3] = 8'hff;
      expv[4] = 8'hff;
      expv[5] = 8'hff;
      expv[6] = 8'hff;
      expv[7] = 8'hff;
      expv[8] = 8'hff;
      expv[9] = 8'hff;
      expv[10] = 8'hff;
      expv[11] = 8'hff;
      expv[12] = 8'hff;
      expv[13] = 8'hff;
      expv[14] = 8'hff;
      expv[15] = 8'hff;
      expv[16] = 8'hff;
      expv[17] = 8'hff;
      expv[18] = 8'hff;
      expv[19] = 8'hff;
      expv[20] = 8'hff;
      expv[21] = 8'hff;
      expv[22] = 8'hff;
      expv[23] = 8'hff;
      expv[24] = 8'hff;
      expv[25] = 8'hff;
      expv[26] = 8'hff;
      expv[27] = 8'hff;
      expv[28] = 8'hff;
      expv[29] = 8'hff;
      expv[30] = 8'hff;
      expv[31] = 8'hff;
      expv[32] = 8'hff;
      expv[33] = 8'hff;
      expv[34] = 8'hff;
      expv[35] = 8'hff;
      expv[36] = 8'hff;
      expv[37] = 8'hff;
      expv[38] = 8'hff;
      expv[39] = 8'hff;
      expv[40] = 8'hff;
      expv[41] = 8'hff;
      expv[42] = 8'hff;
      expv[43] = 8'hff;
      expv[44] = 8'hff;
      expv[45] = 8'hff;
      expv[46] = 8'hff;
      expv[47] = 8'hff;
      expv[48] = 8'hff;
      expv[49] = 8'hff;
      expv[50] = 8'hff;
      expv[51] = 8'hff;
      expv[52] = 8'hff;
      expv[53] = 8'hff;
      expv[54] = 8'hff;
      expv[55] = 8'hff;
      expv[56] = 8'hff;
      expv[57] = 8'hff;
      expv[58] = 8'hff;
      expv[59] = 8'hff;
      expv[60] = 8'hff;
      expv[61] = 8'hff;
      expv[62] = 8'hff;
      expv[63] = 8'hff;
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
