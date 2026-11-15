// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_148408 dut (
    .clk(clk),
    .rst(in_vec[33:33]),
    .start(in_vec[32:32]),
    .addr(in_vec[31:24]),
    .func(in_vec[23:16]),
    .data(in_vec[15:0]),
    .done(out_vec[16:16]),
    .resp(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h24367f5ce;
    stim[1] = 34'h2352d580b;
    stim[2] = 34'h064240613;
    stim[3] = 34'h1352e7ba8;
    stim[4] = 34'h00b0c3ed6;
    stim[5] = 34'h1b71319cd;
    stim[6] = 34'h04fc2396d;
    stim[7] = 34'h19c5f0a48;
    stim[8] = 34'h160448ac6;
    stim[9] = 34'h1210207b9;
    stim[10] = 34'h029bfda09;
    stim[11] = 34'h0d97ceee3;
    stim[12] = 34'h137892d93;
    stim[13] = 34'h15271f201;
    stim[14] = 34'h08d22e5a4;
    stim[15] = 34'h1d2f952e4;
    stim[16] = 34'h0b8cc0697;
    stim[17] = 34'h16906bea6;
    stim[18] = 34'h1a4ea1638;
    stim[19] = 34'h119a4f46d;
    stim[20] = 34'h1706a7b12;
    stim[21] = 34'h117b5ee06;
    stim[22] = 34'h037837b9c;
    stim[23] = 34'h13b3e26d2;
    stim[24] = 34'h12cea9279;
    stim[25] = 34'h1d9811e2c;
    stim[26] = 34'h36ddd2aa9;
    stim[27] = 34'h054c24c21;
    stim[28] = 34'h0177f5f8f;
    stim[29] = 34'h0a663bba9;
    stim[30] = 34'h1ce81d19a;
    stim[31] = 34'h02282cf30;
    stim[32] = 34'h1186135b1;
    stim[33] = 34'h107bd66c8;
    stim[34] = 34'h09ce04c3f;
    stim[35] = 34'h1152d34cd;
    stim[36] = 34'h09b55b451;
    stim[37] = 34'h0aba6061b;
    stim[38] = 34'h0977ee09b;
    stim[39] = 34'h13b0a885e;
    stim[40] = 34'h197d54027;
    stim[41] = 34'h153bf5df6;
    stim[42] = 34'h0f848c397;
    stim[43] = 34'h19f33f768;
    stim[44] = 34'h01c069297;
    stim[45] = 34'h053fb85b4;
    stim[46] = 34'h18ac62315;
    stim[47] = 34'h167343a5a;
    stim[48] = 34'h0da7b4d38;
    stim[49] = 34'h0fa10c608;
    stim[50] = 34'h1c1bd9e33;
    stim[51] = 34'h05b391d3f;
    stim[52] = 34'h1cde5c99e;
    stim[53] = 34'h1bd875eae;
    stim[54] = 34'h1d7cf551c;
    stim[55] = 34'h13967cf93;
    stim[56] = 34'h05dcae851;
    stim[57] = 34'h12bffeece;
    stim[58] = 34'h0a937afe5;
    stim[59] = 34'h3a77ef075;
    stim[60] = 34'h13c0ecec9;
    stim[61] = 34'h1ff63e06a;
    stim[62] = 34'h181098cbf;
    stim[63] = 34'h22d7d5e4a;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h10000;
      expv[24] = 17'h10000;
      expv[25] = 17'h10000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h10000;
      expv[51] = 17'h10000;
      expv[52] = 17'h10000;
      expv[53] = 17'h10000;
      expv[54] = 17'h10000;
      expv[55] = 17'h10000;
      expv[56] = 17'h10000;
      expv[57] = 17'h10000;
      expv[58] = 17'h10000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
