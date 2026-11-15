// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10012 dut (
    .clk(clk),
    .a(in_vec[21:12]),
    .b(in_vec[11:2]),
    .ce(in_vec[1:1]),
    .clr(in_vec[0:0]),
    .op(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h071764;
    stim[1] = 22'h3cb6e8;
    stim[2] = 22'h00f127;
    stim[3] = 22'h28d8e8;
    stim[4] = 22'h138592;
    stim[5] = 22'h3da1eb;
    stim[6] = 22'h3b65c4;
    stim[7] = 22'h0e966a;
    stim[8] = 22'h15a047;
    stim[9] = 22'h2a03ca;
    stim[10] = 22'h31c9f9;
    stim[11] = 22'h2ea723;
    stim[12] = 22'h2a0df4;
    stim[13] = 22'h2f0bdc;
    stim[14] = 22'h03af69;
    stim[15] = 22'h099255;
    stim[16] = 22'h04c805;
    stim[17] = 22'h10298e;
    stim[18] = 22'h1f2b70;
    stim[19] = 22'h0d7755;
    stim[20] = 22'h1462ca;
    stim[21] = 22'h04eb25;
    stim[22] = 22'h1fa9fe;
    stim[23] = 22'h2130eb;
    stim[24] = 22'h399e97;
    stim[25] = 22'h29550a;
    stim[26] = 22'h237e02;
    stim[27] = 22'h2d89ca;
    stim[28] = 22'h2a7d1a;
    stim[29] = 22'h3dd02b;
    stim[30] = 22'h344131;
    stim[31] = 22'h22fecb;
    stim[32] = 22'h11cd85;
    stim[33] = 22'h2baab6;
    stim[34] = 22'h238efb;
    stim[35] = 22'h02ca04;
    stim[36] = 22'h14ce8f;
    stim[37] = 22'h172292;
    stim[38] = 22'h24a5f3;
    stim[39] = 22'h32d9ce;
    stim[40] = 22'h1cf256;
    stim[41] = 22'h03d03f;
    stim[42] = 22'h2eefc3;
    stim[43] = 22'h063712;
    stim[44] = 22'h0348a8;
    stim[45] = 22'h331af7;
    stim[46] = 22'h0b6a4f;
    stim[47] = 22'h2de19a;
    stim[48] = 22'h30f596;
    stim[49] = 22'h38a368;
    stim[50] = 22'h06dd53;
    stim[51] = 22'h124205;
    stim[52] = 22'h337e8b;
    stim[53] = 22'h178b61;
    stim[54] = 22'h035a62;
    stim[55] = 22'h1e3da6;
    stim[56] = 22'h17ff23;
    stim[57] = 22'h1f11ec;
    stim[58] = 22'h0f6ec5;
    stim[59] = 22'h3e3f1a;
    stim[60] = 22'h323b01;
    stim[61] = 22'h257318;
    stim[62] = 22'h0ed119;
    stim[63] = 22'h1feb8f;
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
