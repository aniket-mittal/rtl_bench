// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02856 dut (
    .clk(clk),
    .hc(in_vec[21:11]),
    .vc(in_vec[10:0]),
    .matrix_x(out_vec[5:3]),
    .matrix_y(out_vec[2:1]),
    .lines(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h29b2b6;
    stim[1] = 22'h3c84c5;
    stim[2] = 22'h3083bc;
    stim[3] = 22'h2243ed;
    stim[4] = 22'h397b53;
    stim[5] = 22'h28d355;
    stim[6] = 22'h071f9a;
    stim[7] = 22'h365ed2;
    stim[8] = 22'h0adb66;
    stim[9] = 22'h2c9fef;
    stim[10] = 22'h207972;
    stim[11] = 22'h25ac4b;
    stim[12] = 22'h291dc9;
    stim[13] = 22'h28df62;
    stim[14] = 22'h16f309;
    stim[15] = 22'h397607;
    stim[16] = 22'h27b5c2;
    stim[17] = 22'h0ee231;
    stim[18] = 22'h0dc927;
    stim[19] = 22'h1d9902;
    stim[20] = 22'h0dafaa;
    stim[21] = 22'h0351c5;
    stim[22] = 22'h048f7d;
    stim[23] = 22'h0d0734;
    stim[24] = 22'h07ae56;
    stim[25] = 22'h01d9ed;
    stim[26] = 22'h1a48ba;
    stim[27] = 22'h14dd2e;
    stim[28] = 22'h2d5d0c;
    stim[29] = 22'h34b212;
    stim[30] = 22'h1aab5f;
    stim[31] = 22'h0b4779;
    stim[32] = 22'h3a3bc6;
    stim[33] = 22'h26097e;
    stim[34] = 22'h183e4f;
    stim[35] = 22'h153ce8;
    stim[36] = 22'h010f82;
    stim[37] = 22'h331ea3;
    stim[38] = 22'h13a33e;
    stim[39] = 22'h2e9c2e;
    stim[40] = 22'h3208cc;
    stim[41] = 22'h2f3744;
    stim[42] = 22'h2938f6;
    stim[43] = 22'h0a3b76;
    stim[44] = 22'h059459;
    stim[45] = 22'h226962;
    stim[46] = 22'h3cda44;
    stim[47] = 22'h0cea7f;
    stim[48] = 22'h3bf8fd;
    stim[49] = 22'h11ac91;
    stim[50] = 22'h2c330e;
    stim[51] = 22'h0268ed;
    stim[52] = 22'h1cc967;
    stim[53] = 22'h09a0aa;
    stim[54] = 22'h3c59fd;
    stim[55] = 22'h244012;
    stim[56] = 22'h2b683b;
    stim[57] = 22'h075ffd;
    stim[58] = 22'h2042c4;
    stim[59] = 22'h07ffb2;
    stim[60] = 22'h3c5adf;
    stim[61] = 22'h13d407;
    stim[62] = 22'h3327dc;
    stim[63] = 22'h1eabbb;
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
      expv[0] = 6'h00;
      expv[1] = 6'h00;
      expv[2] = 6'h00;
      expv[3] = 6'h00;
      expv[4] = 6'h00;
      expv[5] = 6'h00;
      expv[6] = 6'h00;
      expv[7] = 6'h00;
      expv[8] = 6'h00;
      expv[9] = 6'h09;
      expv[10] = 6'h00;
      expv[11] = 6'h03;
      expv[12] = 6'h01;
      expv[13] = 6'h01;
      expv[14] = 6'h01;
      expv[15] = 6'h09;
      expv[16] = 6'h01;
      expv[17] = 6'h01;
      expv[18] = 6'h0b;
      expv[19] = 6'h13;
      expv[20] = 6'h03;
      expv[21] = 6'h09;
      expv[22] = 6'h03;
      expv[23] = 6'h01;
      expv[24] = 6'h09;
      expv[25] = 6'h09;
      expv[26] = 6'h03;
      expv[27] = 6'h03;
      expv[28] = 6'h09;
      expv[29] = 6'h01;
      expv[30] = 6'h03;
      expv[31] = 6'h01;
      expv[32] = 6'h09;
      expv[33] = 6'h01;
      expv[34] = 6'h03;
      expv[35] = 6'h09;
      expv[36] = 6'h11;
      expv[37] = 6'h01;
      expv[38] = 6'h01;
      expv[39] = 6'h09;
      expv[40] = 6'h01;
      expv[41] = 6'h01;
      expv[42] = 6'h01;
      expv[43] = 6'h01;
      expv[44] = 6'h09;
      expv[45] = 6'h01;
      expv[46] = 6'h03;
      expv[47] = 6'h05;
      expv[48] = 6'h09;
      expv[49] = 6'h01;
      expv[50] = 6'h09;
      expv[51] = 6'h01;
      expv[52] = 6'h01;
      expv[53] = 6'h03;
      expv[54] = 6'h01;
      expv[55] = 6'h03;
      expv[56] = 6'h01;
      expv[57] = 6'h01;
      expv[58] = 6'h01;
      expv[59] = 6'h01;
      expv[60] = 6'h01;
      expv[61] = 6'h01;
      expv[62] = 6'h09;
      expv[63] = 6'h01;
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
