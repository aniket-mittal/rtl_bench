// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_143306 dut (
    .clk(clk),
    .address(in_vec[12:9]),
    .data_in(in_vec[8:1]),
    .rw(in_vec[0:0]),
    .data_out(out_vec[9:2]),
    .hit(out_vec[1:1]),
    .miss(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h19b2;
    stim[1] = 13'h1570;
    stim[2] = 13'h120a;
    stim[3] = 13'h12f8;
    stim[4] = 13'h1496;
    stim[5] = 13'h02cb;
    stim[6] = 13'h07ba;
    stim[7] = 13'h1a0d;
    stim[8] = 13'h11a5;
    stim[9] = 13'h16a1;
    stim[10] = 13'h0a7b;
    stim[11] = 13'h1c40;
    stim[12] = 13'h1dce;
    stim[13] = 13'h12bd;
    stim[14] = 13'h035d;
    stim[15] = 13'h1383;
    stim[16] = 13'h1e2e;
    stim[17] = 13'h1262;
    stim[18] = 13'h01d7;
    stim[19] = 13'h06a1;
    stim[20] = 13'h02b9;
    stim[21] = 13'h1008;
    stim[22] = 13'h157e;
    stim[23] = 13'h1db8;
    stim[24] = 13'h0e42;
    stim[25] = 13'h1b1b;
    stim[26] = 13'h0d15;
    stim[27] = 13'h14a8;
    stim[28] = 13'h133e;
    stim[29] = 13'h0e34;
    stim[30] = 13'h0a38;
    stim[31] = 13'h049c;
    stim[32] = 13'h1bbc;
    stim[33] = 13'h0cce;
    stim[34] = 13'h0774;
    stim[35] = 13'h1f0d;
    stim[36] = 13'h16b2;
    stim[37] = 13'h0310;
    stim[38] = 13'h10f7;
    stim[39] = 13'h07c3;
    stim[40] = 13'h0284;
    stim[41] = 13'h10b8;
    stim[42] = 13'h03be;
    stim[43] = 13'h1f97;
    stim[44] = 13'h04d1;
    stim[45] = 13'h1315;
    stim[46] = 13'h18f1;
    stim[47] = 13'h1657;
    stim[48] = 13'h0785;
    stim[49] = 13'h0b64;
    stim[50] = 13'h17ea;
    stim[51] = 13'h1537;
    stim[52] = 13'h1306;
    stim[53] = 13'h0681;
    stim[54] = 13'h1fc6;
    stim[55] = 13'h13a1;
    stim[56] = 13'h0344;
    stim[57] = 13'h1a67;
    stim[58] = 13'h152c;
    stim[59] = 13'h0330;
    stim[60] = 13'h0311;
    stim[61] = 13'h1342;
    stim[62] = 13'h1e5c;
    stim[63] = 13'h0009;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h001;
      expv[2] = 10'h001;
      expv[3] = 10'h001;
      expv[4] = 10'h001;
      expv[5] = 10'h001;
      expv[6] = 10'h001;
      expv[7] = 10'h1f2;
      expv[8] = 10'h1f2;
      expv[9] = 10'h1f2;
      expv[10] = 10'h1f2;
      expv[11] = 10'h1f2;
      expv[12] = 10'h001;
      expv[13] = 10'h001;
      expv[14] = 10'h001;
      expv[15] = 10'h001;
      expv[16] = 10'h001;
      expv[17] = 10'h001;
      expv[18] = 10'h001;
      expv[19] = 10'h001;
      expv[20] = 10'h001;
      expv[21] = 10'h001;
      expv[22] = 10'h001;
      expv[23] = 10'h001;
      expv[24] = 10'h001;
      expv[25] = 10'h001;
      expv[26] = 10'h001;
      expv[27] = 10'h001;
      expv[28] = 10'h001;
      expv[29] = 10'h001;
      expv[30] = 10'h001;
      expv[31] = 10'h001;
      expv[32] = 10'h27e;
      expv[33] = 10'h001;
      expv[34] = 10'h001;
      expv[35] = 10'h06a;
      expv[36] = 10'h06a;
      expv[37] = 10'h001;
      expv[38] = 10'h37a;
      expv[39] = 10'h37a;
      expv[40] = 10'h37a;
      expv[41] = 10'h37a;
      expv[42] = 10'h001;
      expv[43] = 10'h37a;
      expv[44] = 10'h37a;
      expv[45] = 10'h37a;
      expv[46] = 10'h37a;
      expv[47] = 10'h37a;
      expv[48] = 10'h37a;
      expv[49] = 10'h37a;
      expv[50] = 10'h001;
      expv[51] = 10'h001;
      expv[52] = 10'h001;
      expv[53] = 10'h001;
      expv[54] = 10'h001;
      expv[55] = 10'h001;
      expv[56] = 10'h001;
      expv[57] = 10'h2ca;
      expv[58] = 10'h2ca;
      expv[59] = 10'h001;
      expv[60] = 10'h25a;
      expv[61] = 10'h25a;
      expv[62] = 10'h001;
      expv[63] = 10'h001;
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
