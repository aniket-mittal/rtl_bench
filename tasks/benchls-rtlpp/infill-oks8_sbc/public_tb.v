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

  oks8_sbc dut (
    .a_i(in_vec[16:9]),
    .b_i(in_vec[8:1]),
    .c_i(in_vec[0:0]),
    .c_o(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h0aabf;
    stim[1] = 17'h14eed;
    stim[2] = 17'h12a61;
    stim[3] = 17'h0924b;
    stim[4] = 17'h088e4;
    stim[5] = 17'h01416;
    stim[6] = 17'h1199e;
    stim[7] = 17'h08a06;
    stim[8] = 17'h138f5;
    stim[9] = 17'h18549;
    stim[10] = 17'h13f93;
    stim[11] = 17'h1f6b2;
    stim[12] = 17'h19383;
    stim[13] = 17'h1d144;
    stim[14] = 17'h16e57;
    stim[15] = 17'h1c250;
    stim[16] = 17'h136e3;
    stim[17] = 17'h0b66f;
    stim[18] = 17'h131bd;
    stim[19] = 17'h17158;
    stim[20] = 17'h1241c;
    stim[21] = 17'h03d2a;
    stim[22] = 17'h051b4;
    stim[23] = 17'h021a4;
    stim[24] = 17'h1315f;
    stim[25] = 17'h03ac1;
    stim[26] = 17'h11366;
    stim[27] = 17'h19a9e;
    stim[28] = 17'h1c4cd;
    stim[29] = 17'h11577;
    stim[30] = 17'h1cd58;
    stim[31] = 17'h1720d;
    stim[32] = 17'h1efe2;
    stim[33] = 17'h1624d;
    stim[34] = 17'h03657;
    stim[35] = 17'h17cc5;
    stim[36] = 17'h00231;
    stim[37] = 17'h11f2b;
    stim[38] = 17'h1273a;
    stim[39] = 17'h0d9ad;
    stim[40] = 17'h1bb3f;
    stim[41] = 17'h10669;
    stim[42] = 17'h07813;
    stim[43] = 17'h0d055;
    stim[44] = 17'h028a1;
    stim[45] = 17'h1059a;
    stim[46] = 17'h04ba0;
    stim[47] = 17'h0f81e;
    stim[48] = 17'h1052e;
    stim[49] = 17'h1dbb6;
    stim[50] = 17'h12e0f;
    stim[51] = 17'h0573e;
    stim[52] = 17'h1c213;
    stim[53] = 17'h01929;
    stim[54] = 17'h142c7;
    stim[55] = 17'h1ae96;
    stim[56] = 17'h085cc;
    stim[57] = 17'h04639;
    stim[58] = 17'h0e7c7;
    stim[59] = 17'h05d44;
    stim[60] = 17'h06c66;
    stim[61] = 17'h057c1;
    stim[62] = 17'h16ea5;
    stim[63] = 17'h01130;
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
      expv[0] = 9'h1f5;
      expv[1] = 9'h030;
      expv[2] = 9'h064;
      expv[3] = 9'h023;
      expv[4] = 9'h1d2;
      expv[5] = 9'h1ff;
      expv[6] = 9'h1bd;
      expv[7] = 9'h042;
      expv[8] = 9'h021;
      expv[9] = 9'h01d;
      expv[10] = 9'h1d5;
      expv[11] = 9'h0a2;
      expv[12] = 9'h007;
      expv[13] = 9'h046;
      expv[14] = 9'h08b;
      expv[15] = 9'h0b9;
      expv[16] = 9'h029;
      expv[17] = 9'h023;
      expv[18] = 9'h1b9;
      expv[19] = 9'h00c;
      expv[20] = 9'h084;
      expv[21] = 9'h189;
      expv[22] = 9'h14e;
      expv[23] = 9'h13e;
      expv[24] = 9'h1e8;
      expv[25] = 9'h1bc;
      expv[26] = 9'h1d6;
      expv[27] = 9'h07e;
      expv[28] = 9'h07b;
      expv[29] = 9'h1ce;
      expv[30] = 9'h03a;
      expv[31] = 9'h0b2;
      expv[32] = 9'h006;
      expv[33] = 9'h08a;
      expv[34] = 9'h1ef;
      expv[35] = 9'h05b;
      expv[36] = 9'h1e8;
      expv[37] = 9'h1f9;
      expv[38] = 9'h1f6;
      expv[39] = 9'h195;
      expv[40] = 9'h03d;
      expv[41] = 9'h04e;
      expv[42] = 9'h032;
      expv[43] = 9'h03d;
      expv[44] = 9'h1c3;
      expv[45] = 9'h1b5;
      expv[46] = 9'h155;
      expv[47] = 9'h06d;
      expv[48] = 9'h1eb;
      expv[49] = 9'h012;
      expv[50] = 9'h08f;
      expv[51] = 9'h18c;
      expv[52] = 9'h0d7;
      expv[53] = 9'h177;
      expv[54] = 9'h03d;
      expv[55] = 9'h08c;
      expv[56] = 9'h15c;
      expv[57] = 9'h006;
      expv[58] = 9'h18f;
      expv[59] = 9'h18c;
      expv[60] = 9'h003;
      expv[61] = 9'h14a;
      expv[62] = 9'h064;
      expv[63] = 9'h170;
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
