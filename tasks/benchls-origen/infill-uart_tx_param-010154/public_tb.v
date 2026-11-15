// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_010154 dut (
    .clk(clk),
    .n_reset(in_vec[9:9]),
    .start(in_vec[8:8]),
    .data_in(in_vec[7:0]),
    .ready(out_vec[1:1]),
    .out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h3ad;
    stim[1] = 10'h35f;
    stim[2] = 10'h1e4;
    stim[3] = 10'h04a;
    stim[4] = 10'h009;
    stim[5] = 10'h137;
    stim[6] = 10'h043;
    stim[7] = 10'h168;
    stim[8] = 10'h1d8;
    stim[9] = 10'h10a;
    stim[10] = 10'h1b0;
    stim[11] = 10'h102;
    stim[12] = 10'h0d1;
    stim[13] = 10'h058;
    stim[14] = 10'h1c4;
    stim[15] = 10'h005;
    stim[16] = 10'h0b1;
    stim[17] = 10'h15e;
    stim[18] = 10'h278;
    stim[19] = 10'h09e;
    stim[20] = 10'h181;
    stim[21] = 10'h163;
    stim[22] = 10'h0eb;
    stim[23] = 10'h1fb;
    stim[24] = 10'h1de;
    stim[25] = 10'h114;
    stim[26] = 10'h183;
    stim[27] = 10'h247;
    stim[28] = 10'h1d5;
    stim[29] = 10'h13b;
    stim[30] = 10'h189;
    stim[31] = 10'h17b;
    stim[32] = 10'h395;
    stim[33] = 10'h1fc;
    stim[34] = 10'h0ac;
    stim[35] = 10'h14b;
    stim[36] = 10'h060;
    stim[37] = 10'h02f;
    stim[38] = 10'h10b;
    stim[39] = 10'h0da;
    stim[40] = 10'h014;
    stim[41] = 10'h0d0;
    stim[42] = 10'h03b;
    stim[43] = 10'h0e7;
    stim[44] = 10'h188;
    stim[45] = 10'h010;
    stim[46] = 10'h02e;
    stim[47] = 10'h1c7;
    stim[48] = 10'h1ea;
    stim[49] = 10'h1c9;
    stim[50] = 10'h0cd;
    stim[51] = 10'h12d;
    stim[52] = 10'h1e3;
    stim[53] = 10'h1f7;
    stim[54] = 10'h14c;
    stim[55] = 10'h0cd;
    stim[56] = 10'h186;
    stim[57] = 10'h1ff;
    stim[58] = 10'h010;
    stim[59] = 10'h148;
    stim[60] = 10'h04a;
    stim[61] = 10'h149;
    stim[62] = 10'h19c;
    stim[63] = 10'h017;
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
      expv[0] = 2'h3;
      expv[1] = 2'h1;
      expv[2] = 2'h3;
      expv[3] = 2'h3;
      expv[4] = 2'h3;
      expv[5] = 2'h3;
      expv[6] = 2'h3;
      expv[7] = 2'h3;
      expv[8] = 2'h3;
      expv[9] = 2'h3;
      expv[10] = 2'h3;
      expv[11] = 2'h3;
      expv[12] = 2'h3;
      expv[13] = 2'h3;
      expv[14] = 2'h3;
      expv[15] = 2'h3;
      expv[16] = 2'h3;
      expv[17] = 2'h3;
      expv[18] = 2'h3;
      expv[19] = 2'h3;
      expv[20] = 2'h3;
      expv[21] = 2'h3;
      expv[22] = 2'h3;
      expv[23] = 2'h3;
      expv[24] = 2'h3;
      expv[25] = 2'h3;
      expv[26] = 2'h3;
      expv[27] = 2'h3;
      expv[28] = 2'h3;
      expv[29] = 2'h3;
      expv[30] = 2'h3;
      expv[31] = 2'h3;
      expv[32] = 2'h3;
      expv[33] = 2'h3;
      expv[34] = 2'h3;
      expv[35] = 2'h3;
      expv[36] = 2'h3;
      expv[37] = 2'h3;
      expv[38] = 2'h3;
      expv[39] = 2'h3;
      expv[40] = 2'h3;
      expv[41] = 2'h3;
      expv[42] = 2'h3;
      expv[43] = 2'h3;
      expv[44] = 2'h3;
      expv[45] = 2'h3;
      expv[46] = 2'h3;
      expv[47] = 2'h3;
      expv[48] = 2'h3;
      expv[49] = 2'h3;
      expv[50] = 2'h3;
      expv[51] = 2'h3;
      expv[52] = 2'h3;
      expv[53] = 2'h3;
      expv[54] = 2'h3;
      expv[55] = 2'h3;
      expv[56] = 2'h3;
      expv[57] = 2'h3;
      expv[58] = 2'h3;
      expv[59] = 2'h3;
      expv[60] = 2'h3;
      expv[61] = 2'h3;
      expv[62] = 2'h3;
      expv[63] = 2'h3;
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
