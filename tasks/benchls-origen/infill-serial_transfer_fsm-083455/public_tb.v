// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_083455 dut (
    ._clk(clk),
    ._rst(in_vec[17:17]),
    ._en(in_vec[16:16]),
    ._input_reg(in_vec[15:8]),
    ._divide_freq(in_vec[7:0]),
    ._output_wire(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h37f70;
    stim[1] = 18'h3d1e7;
    stim[2] = 18'h1532b;
    stim[3] = 18'h0de91;
    stim[4] = 18'h0679c;
    stim[5] = 18'h05bcd;
    stim[6] = 18'h26019;
    stim[7] = 18'h17382;
    stim[8] = 18'h1ab69;
    stim[9] = 18'h06bf9;
    stim[10] = 18'h1be52;
    stim[11] = 18'h0d7ea;
    stim[12] = 18'h135f7;
    stim[13] = 18'h14f2a;
    stim[14] = 18'h0114d;
    stim[15] = 18'h09a56;
    stim[16] = 18'h0f4f2;
    stim[17] = 18'h1855f;
    stim[18] = 18'h1e107;
    stim[19] = 18'h1ea5d;
    stim[20] = 18'h0865a;
    stim[21] = 18'h09b6e;
    stim[22] = 18'h0d3fa;
    stim[23] = 18'h01684;
    stim[24] = 18'h0e93a;
    stim[25] = 18'h0982e;
    stim[26] = 18'h1a4c6;
    stim[27] = 18'h1a831;
    stim[28] = 18'h0ded0;
    stim[29] = 18'h0a713;
    stim[30] = 18'h167c5;
    stim[31] = 18'h0ffcd;
    stim[32] = 18'h0c404;
    stim[33] = 18'h02c20;
    stim[34] = 18'h0d3c3;
    stim[35] = 18'h1cc56;
    stim[36] = 18'h12a57;
    stim[37] = 18'h1ad52;
    stim[38] = 18'h117b6;
    stim[39] = 18'h131d7;
    stim[40] = 18'h13330;
    stim[41] = 18'h0bb89;
    stim[42] = 18'h1efd1;
    stim[43] = 18'h18c90;
    stim[44] = 18'h157c7;
    stim[45] = 18'h04aaf;
    stim[46] = 18'h16b73;
    stim[47] = 18'h1665f;
    stim[48] = 18'h1c3f3;
    stim[49] = 18'h0f3fb;
    stim[50] = 18'h15904;
    stim[51] = 18'h03211;
    stim[52] = 18'h1e704;
    stim[53] = 18'h0e7ec;
    stim[54] = 18'h196ea;
    stim[55] = 18'h1d3a7;
    stim[56] = 18'h197c4;
    stim[57] = 18'h046ef;
    stim[58] = 18'h0b27b;
    stim[59] = 18'h151d5;
    stim[60] = 18'h05190;
    stim[61] = 18'h12975;
    stim[62] = 18'h0fd73;
    stim[63] = 18'h3d610;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
