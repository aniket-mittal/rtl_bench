// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04287 dut (
    .CLK(clk),
    .RST(in_vec[9:9]),
    .SPI_EN(in_vec[8:8]),
    .SPI_DATA(in_vec[7:0]),
    .CS(out_vec[3:3]),
    .SDO(out_vec[2:2]),
    .SCLK(out_vec[1:1]),
    .SPI_FIN(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h275;
    stim[1] = 10'h219;
    stim[2] = 10'h147;
    stim[3] = 10'h131;
    stim[4] = 10'h066;
    stim[5] = 10'h018;
    stim[6] = 10'h075;
    stim[7] = 10'h0e6;
    stim[8] = 10'h319;
    stim[9] = 10'h0ab;
    stim[10] = 10'h08b;
    stim[11] = 10'h14e;
    stim[12] = 10'h134;
    stim[13] = 10'h045;
    stim[14] = 10'h175;
    stim[15] = 10'h017;
    stim[16] = 10'h09a;
    stim[17] = 10'h092;
    stim[18] = 10'h1ff;
    stim[19] = 10'h171;
    stim[20] = 10'h1f7;
    stim[21] = 10'h1ea;
    stim[22] = 10'h1db;
    stim[23] = 10'h0be;
    stim[24] = 10'h14a;
    stim[25] = 10'h008;
    stim[26] = 10'h189;
    stim[27] = 10'h0d1;
    stim[28] = 10'h004;
    stim[29] = 10'h1dd;
    stim[30] = 10'h155;
    stim[31] = 10'h02b;
    stim[32] = 10'h117;
    stim[33] = 10'h078;
    stim[34] = 10'h154;
    stim[35] = 10'h1e2;
    stim[36] = 10'h042;
    stim[37] = 10'h3fa;
    stim[38] = 10'h0de;
    stim[39] = 10'h1ea;
    stim[40] = 10'h17c;
    stim[41] = 10'h13e;
    stim[42] = 10'h01d;
    stim[43] = 10'h042;
    stim[44] = 10'h1fa;
    stim[45] = 10'h160;
    stim[46] = 10'h09f;
    stim[47] = 10'h108;
    stim[48] = 10'h048;
    stim[49] = 10'h0e5;
    stim[50] = 10'h0c6;
    stim[51] = 10'h119;
    stim[52] = 10'h012;
    stim[53] = 10'h121;
    stim[54] = 10'h0e1;
    stim[55] = 10'h1b0;
    stim[56] = 10'h0f4;
    stim[57] = 10'h0e2;
    stim[58] = 10'h0bc;
    stim[59] = 10'h05f;
    stim[60] = 10'h101;
    stim[61] = 10'h0cd;
    stim[62] = 10'h03a;
    stim[63] = 10'h125;
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
      expv[0] = 4'he;
      expv[1] = 4'he;
      expv[2] = 4'h6;
      expv[3] = 4'h6;
      expv[4] = 4'h6;
      expv[5] = 4'h4;
      expv[6] = 4'h0;
      expv[7] = 4'h2;
      expv[8] = 4'h2;
      expv[9] = 4'h8;
      expv[10] = 4'he;
      expv[11] = 4'h6;
      expv[12] = 4'h6;
      expv[13] = 4'h6;
      expv[14] = 4'h4;
      expv[15] = 4'h0;
      expv[16] = 4'h2;
      expv[17] = 4'h2;
      expv[18] = 4'h0;
      expv[19] = 4'h4;
      expv[20] = 4'h6;
      expv[21] = 4'h6;
      expv[22] = 4'h4;
      expv[23] = 4'h0;
      expv[24] = 4'h2;
      expv[25] = 4'h2;
      expv[26] = 4'h0;
      expv[27] = 4'h0;
      expv[28] = 4'h2;
      expv[29] = 4'h2;
      expv[30] = 4'h0;
      expv[31] = 4'h4;
      expv[32] = 4'h6;
      expv[33] = 4'h6;
      expv[34] = 4'h4;
      expv[35] = 4'h4;
      expv[36] = 4'h6;
      expv[37] = 4'h6;
      expv[38] = 4'hc;
      expv[39] = 4'h6;
      expv[40] = 4'h6;
      expv[41] = 4'h6;
      expv[42] = 4'h4;
      expv[43] = 4'h4;
      expv[44] = 4'h6;
      expv[45] = 4'h6;
      expv[46] = 4'h4;
      expv[47] = 4'h4;
      expv[48] = 4'h6;
      expv[49] = 4'h6;
      expv[50] = 4'h4;
      expv[51] = 4'h4;
      expv[52] = 4'h6;
      expv[53] = 4'h6;
      expv[54] = 4'h4;
      expv[55] = 4'h0;
      expv[56] = 4'h2;
      expv[57] = 4'h2;
      expv[58] = 4'h0;
      expv[59] = 4'h4;
      expv[60] = 4'h6;
      expv[61] = 4'h6;
      expv[62] = 4'h4;
      expv[63] = 4'h0;
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
