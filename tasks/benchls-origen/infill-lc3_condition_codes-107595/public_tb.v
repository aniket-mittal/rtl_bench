// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_107595 dut (
    .Clk(clk),
    .Reset(in_vec[17:17]),
    .Bus(in_vec[16:1]),
    .LD_CC(in_vec[0:0]),
    .n(out_vec[2:2]),
    .z(out_vec[1:1]),
    .p(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h2c414;
    stim[1] = 18'h2a246;
    stim[2] = 18'h1c80d;
    stim[3] = 18'h16d9e;
    stim[4] = 18'h0e618;
    stim[5] = 18'h0ee55;
    stim[6] = 18'h110da;
    stim[7] = 18'h12a8e;
    stim[8] = 18'h07e46;
    stim[9] = 18'h03337;
    stim[10] = 18'h0b36a;
    stim[11] = 18'h123ae;
    stim[12] = 18'h0e040;
    stim[13] = 18'h1e0da;
    stim[14] = 18'h1d7ab;
    stim[15] = 18'h01039;
    stim[16] = 18'h122cd;
    stim[17] = 18'h1adbf;
    stim[18] = 18'h0f7db;
    stim[19] = 18'h10e4e;
    stim[20] = 18'h0013b;
    stim[21] = 18'h1eb2c;
    stim[22] = 18'h1bf79;
    stim[23] = 18'h17e43;
    stim[24] = 18'h10004;
    stim[25] = 18'h1b4a6;
    stim[26] = 18'h13fdb;
    stim[27] = 18'h0c5dc;
    stim[28] = 18'h1c27c;
    stim[29] = 18'h03b2b;
    stim[30] = 18'h1d78f;
    stim[31] = 18'h19e77;
    stim[32] = 18'h0b2c2;
    stim[33] = 18'h0b0b9;
    stim[34] = 18'h16b01;
    stim[35] = 18'h05147;
    stim[36] = 18'h14281;
    stim[37] = 18'h072e2;
    stim[38] = 18'h088bd;
    stim[39] = 18'h0005a;
    stim[40] = 18'h10646;
    stim[41] = 18'h116a6;
    stim[42] = 18'h08561;
    stim[43] = 18'h09177;
    stim[44] = 18'h05b5c;
    stim[45] = 18'h0803f;
    stim[46] = 18'h0c3e8;
    stim[47] = 18'h12cee;
    stim[48] = 18'h14ccb;
    stim[49] = 18'h0fc7d;
    stim[50] = 18'h1193e;
    stim[51] = 18'h0c2b5;
    stim[52] = 18'h0d461;
    stim[53] = 18'h1b26d;
    stim[54] = 18'h1861f;
    stim[55] = 18'h00968;
    stim[56] = 18'h0a27b;
    stim[57] = 18'h03e87;
    stim[58] = 18'h0d1cc;
    stim[59] = 18'h02363;
    stim[60] = 18'h1e4d0;
    stim[61] = 18'h0eb40;
    stim[62] = 18'h079b5;
    stim[63] = 18'h138f2;
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
      expv[0] = 3'h0;
      expv[1] = 3'h0;
      expv[2] = 3'h0;
      expv[3] = 3'h4;
      expv[4] = 3'h4;
      expv[5] = 3'h4;
      expv[6] = 3'h1;
      expv[7] = 3'h1;
      expv[8] = 3'h1;
      expv[9] = 3'h1;
      expv[10] = 3'h1;
      expv[11] = 3'h1;
      expv[12] = 3'h1;
      expv[13] = 3'h1;
      expv[14] = 3'h1;
      expv[15] = 3'h4;
      expv[16] = 3'h1;
      expv[17] = 3'h4;
      expv[18] = 3'h4;
      expv[19] = 3'h1;
      expv[20] = 3'h1;
      expv[21] = 3'h1;
      expv[22] = 3'h1;
      expv[23] = 3'h4;
      expv[24] = 3'h4;
      expv[25] = 3'h4;
      expv[26] = 3'h4;
      expv[27] = 3'h4;
      expv[28] = 3'h4;
      expv[29] = 3'h4;
      expv[30] = 3'h1;
      expv[31] = 3'h4;
      expv[32] = 3'h4;
      expv[33] = 3'h4;
      expv[34] = 3'h1;
      expv[35] = 3'h4;
      expv[36] = 3'h1;
      expv[37] = 3'h4;
      expv[38] = 3'h4;
      expv[39] = 3'h1;
      expv[40] = 3'h1;
      expv[41] = 3'h1;
      expv[42] = 3'h1;
      expv[43] = 3'h1;
      expv[44] = 3'h1;
      expv[45] = 3'h1;
      expv[46] = 3'h1;
      expv[47] = 3'h1;
      expv[48] = 3'h1;
      expv[49] = 3'h4;
      expv[50] = 3'h1;
      expv[51] = 3'h1;
      expv[52] = 3'h1;
      expv[53] = 3'h1;
      expv[54] = 3'h4;
      expv[55] = 3'h4;
      expv[56] = 3'h4;
      expv[57] = 3'h1;
      expv[58] = 3'h1;
      expv[59] = 3'h1;
      expv[60] = 3'h1;
      expv[61] = 3'h1;
      expv[62] = 3'h1;
      expv[63] = 3'h1;
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
