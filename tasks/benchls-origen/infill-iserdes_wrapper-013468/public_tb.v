// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_013468 dut (
    .CLK(clk),
    .CLK_B(in_vec[5:5]),
    .CLKDIV(in_vec[4:4]),
    .D(in_vec[3:3]),
    .FIFO_RD_CLK(in_vec[2:2]),
    .FIFO_RD_EN(in_vec[1:1]),
    .RST(in_vec[0:0]),
    .Q(out_vec[9:2]),
    .FIFO_EMPTY(out_vec[1:1]),
    .INTERNAL_DIVCLK(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h11;
    stim[1] = 6'h0b;
    stim[2] = 6'h2c;
    stim[3] = 6'h36;
    stim[4] = 6'h00;
    stim[5] = 6'h06;
    stim[6] = 6'h18;
    stim[7] = 6'h26;
    stim[8] = 6'h26;
    stim[9] = 6'h2a;
    stim[10] = 6'h2c;
    stim[11] = 6'h18;
    stim[12] = 6'h32;
    stim[13] = 6'h06;
    stim[14] = 6'h3e;
    stim[15] = 6'h3a;
    stim[16] = 6'h2a;
    stim[17] = 6'h2a;
    stim[18] = 6'h06;
    stim[19] = 6'h0e;
    stim[20] = 6'h1a;
    stim[21] = 6'h0c;
    stim[22] = 6'h30;
    stim[23] = 6'h30;
    stim[24] = 6'h12;
    stim[25] = 6'h0a;
    stim[26] = 6'h16;
    stim[27] = 6'h12;
    stim[28] = 6'h18;
    stim[29] = 6'h3a;
    stim[30] = 6'h0c;
    stim[31] = 6'h18;
    stim[32] = 6'h2e;
    stim[33] = 6'h20;
    stim[34] = 6'h10;
    stim[35] = 6'h30;
    stim[36] = 6'h3a;
    stim[37] = 6'h1c;
    stim[38] = 6'h00;
    stim[39] = 6'h04;
    stim[40] = 6'h05;
    stim[41] = 6'h3e;
    stim[42] = 6'h3a;
    stim[43] = 6'h16;
    stim[44] = 6'h16;
    stim[45] = 6'h14;
    stim[46] = 6'h2a;
    stim[47] = 6'h24;
    stim[48] = 6'h0c;
    stim[49] = 6'h1c;
    stim[50] = 6'h0a;
    stim[51] = 6'h3a;
    stim[52] = 6'h2e;
    stim[53] = 6'h14;
    stim[54] = 6'h0a;
    stim[55] = 6'h2a;
    stim[56] = 6'h26;
    stim[57] = 6'h1e;
    stim[58] = 6'h16;
    stim[59] = 6'h02;
    stim[60] = 6'h32;
    stim[61] = 6'h04;
    stim[62] = 6'h10;
    stim[63] = 6'h2e;
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
      expv[0] = 10'h002;
      expv[1] = 10'h002;
      expv[2] = 10'h002;
      expv[3] = 10'h005;
      expv[4] = 10'h008;
      expv[5] = 10'h011;
      expv[6] = 10'h020;
      expv[7] = 10'h045;
      expv[8] = 10'h088;
      expv[9] = 10'h111;
      expv[10] = 10'h224;
      expv[11] = 10'h04d;
      expv[12] = 10'h09c;
      expv[13] = 10'h139;
      expv[14] = 10'h270;
      expv[15] = 10'h0e5;
      expv[16] = 10'h1cc;
      expv[17] = 10'h39d;
      expv[18] = 10'h33c;
      expv[19] = 10'h279;
      expv[20] = 10'h0f4;
      expv[21] = 10'h1ed;
      expv[22] = 10'h3dc;
      expv[23] = 10'h3b9;
      expv[24] = 10'h370;
      expv[25] = 10'h2e1;
      expv[26] = 10'h1c4;
      expv[27] = 10'h389;
      expv[28] = 10'h310;
      expv[29] = 10'h225;
      expv[30] = 10'h04c;
      expv[31] = 10'h09d;
      expv[32] = 10'h13c;
      expv[33] = 10'h27d;
      expv[34] = 10'h0f8;
      expv[35] = 10'h1f1;
      expv[36] = 10'h3e0;
      expv[37] = 10'h3c5;
      expv[38] = 10'h38c;
      expv[39] = 10'h319;
      expv[40] = 10'h002;
      expv[41] = 10'h002;
      expv[42] = 10'h005;
      expv[43] = 10'h00c;
      expv[44] = 10'h019;
      expv[45] = 10'h030;
      expv[46] = 10'h061;
      expv[47] = 10'h0c4;
      expv[48] = 10'h189;
      expv[49] = 10'h314;
      expv[50] = 10'h22d;
      expv[51] = 10'h05c;
      expv[52] = 10'h0bd;
      expv[53] = 10'h17c;
      expv[54] = 10'h2f9;
      expv[55] = 10'h1f4;
      expv[56] = 10'h3ed;
      expv[57] = 10'h3d8;
      expv[58] = 10'h3b5;
      expv[59] = 10'h368;
      expv[60] = 10'h2d1;
      expv[61] = 10'h1a0;
      expv[62] = 10'h341;
      expv[63] = 10'h280;
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
