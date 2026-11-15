// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_050866 dut (
    .CLOCK(clk),
    .Reset(in_vec[32:32]),
    .S(in_vec[31:30]),
    .P(in_vec[29:20]),
    .BeginCount(in_vec[19:10]),
    .EndCount(in_vec[9:0]),
    .Q(out_vec[10:1]),
    .TerminalCount(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1e2503b6b;
    stim[1] = 33'h1236596f6;
    stim[2] = 33'h081c137f7;
    stim[3] = 33'h0e77b3b1c;
    stim[4] = 33'h1a59f5682;
    stim[5] = 33'h05133c177;
    stim[6] = 33'h0e8804ef5;
    stim[7] = 33'h07ec82312;
    stim[8] = 33'h0f0d4f778;
    stim[9] = 33'h0f0f153fc;
    stim[10] = 33'h042273af4;
    stim[11] = 33'h0c6207139;
    stim[12] = 33'h0b6ab0725;
    stim[13] = 33'h07c7db355;
    stim[14] = 33'h025196b14;
    stim[15] = 33'h0794aef89;
    stim[16] = 33'h077cd9c2b;
    stim[17] = 33'h01979cd91;
    stim[18] = 33'h0238af807;
    stim[19] = 33'h061680674;
    stim[20] = 33'h090a00dd1;
    stim[21] = 33'h0a11a5b75;
    stim[22] = 33'h0ff80192c;
    stim[23] = 33'h01a92fdab;
    stim[24] = 33'h068830888;
    stim[25] = 33'h09b70977b;
    stim[26] = 33'h03292c896;
    stim[27] = 33'h0bd25ddf1;
    stim[28] = 33'h05e3a1e66;
    stim[29] = 33'h08c413aa9;
    stim[30] = 33'h02a5ef6d5;
    stim[31] = 33'h099d5d25b;
    stim[32] = 33'h080a6f689;
    stim[33] = 33'h0344e7794;
    stim[34] = 33'h05df68544;
    stim[35] = 33'h0aa5fcf95;
    stim[36] = 33'h066b7569e;
    stim[37] = 33'h0f6c5d8d3;
    stim[38] = 33'h07b4385af;
    stim[39] = 33'h0ba1eb555;
    stim[40] = 33'h061266f72;
    stim[41] = 33'h032373e17;
    stim[42] = 33'h09d6e4390;
    stim[43] = 33'h078d1cc01;
    stim[44] = 33'h0ac1204a0;
    stim[45] = 33'h0cd18a9b4;
    stim[46] = 33'h0e0c9c402;
    stim[47] = 33'h0b45452f9;
    stim[48] = 33'h05bba17a2;
    stim[49] = 33'h0a957470b;
    stim[50] = 33'h0783240f9;
    stim[51] = 33'h07d4e3fb7;
    stim[52] = 33'h0e4d38a90;
    stim[53] = 33'h03e8a9ca6;
    stim[54] = 33'h0c22524d0;
    stim[55] = 33'h06da00997;
    stim[56] = 33'h022ff9253;
    stim[57] = 33'h0e93055af;
    stim[58] = 33'h0e062ff5c;
    stim[59] = 33'h05735e631;
    stim[60] = 33'h028630f29;
    stim[61] = 33'h10baa0930;
    stim[62] = 33'h0f37e0338;
    stim[63] = 33'h00540615b;
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
      expv[0] = 11'h01c;
      expv[1] = 11'h01c;
      expv[2] = 11'h2ca;
      expv[3] = 11'h2c8;
      expv[4] = 11'h7ab;
      expv[5] = 11'h7aa;
      expv[6] = 11'h7ac;
      expv[7] = 11'h510;
      expv[8] = 11'h512;
      expv[9] = 11'h61a;
      expv[10] = 11'h61e;
      expv[11] = 11'h620;
      expv[12] = 11'h0c4;
      expv[13] = 11'h0c2;
      expv[14] = 11'h0c4;
      expv[15] = 11'h0c4;
      expv[16] = 11'h0c6;
      expv[17] = 11'h0c8;
      expv[18] = 11'h0c8;
      expv[19] = 11'h0c8;
      expv[20] = 11'h0ca;
      expv[21] = 11'h0c8;
      expv[22] = 11'h0c6;
      expv[23] = 11'h7f0;
      expv[24] = 11'h7f0;
      expv[25] = 11'h7f2;
      expv[26] = 11'h7f0;
      expv[27] = 11'h7f0;
      expv[28] = 11'h7ee;
      expv[29] = 11'h7f0;
      expv[30] = 11'h7ee;
      expv[31] = 11'h7ee;
      expv[32] = 11'h7ec;
      expv[33] = 11'h7ea;
      expv[34] = 11'h7ea;
      expv[35] = 11'h7ec;
      expv[36] = 11'h7ea;
      expv[37] = 11'h7ec;
      expv[38] = 11'h6d8;
      expv[39] = 11'h6da;
      expv[40] = 11'h6d8;
      expv[41] = 11'h6da;
      expv[42] = 11'h6da;
      expv[43] = 11'h6d8;
      expv[44] = 11'h6da;
      expv[45] = 11'h6d8;
      expv[46] = 11'h1a2;
      expv[47] = 11'h418;
      expv[48] = 11'h416;
      expv[49] = 11'h418;
      expv[50] = 11'h416;
      expv[51] = 11'h418;
      expv[52] = 11'h41a;
      expv[53] = 11'h49a;
      expv[54] = 11'h49a;
      expv[55] = 11'h044;
      expv[56] = 11'h046;
      expv[57] = 11'h046;
      expv[58] = 11'h526;
      expv[59] = 11'h40c;
      expv[60] = 11'h40e;
      expv[61] = 11'h504;
      expv[62] = 11'h504;
      expv[63] = 11'h66e;
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
