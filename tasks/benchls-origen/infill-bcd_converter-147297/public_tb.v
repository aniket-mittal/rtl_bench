// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_147297 dut (
    .clk(clk),
    .count(in_vec[8:1]),
    .calculate(in_vec[0:0]),
    .centenas(out_vec[14:11]),
    .decenas(out_vec[10:7]),
    .unidades(out_vec[6:3]),
    .C(out_vec[2:2]),
    .De(out_vec[1:1]),
    .U(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h139;
    stim[1] = 9'h1d8;
    stim[2] = 9'h1d0;
    stim[3] = 9'h166;
    stim[4] = 9'h0ca;
    stim[5] = 9'h1d0;
    stim[6] = 9'h196;
    stim[7] = 9'h108;
    stim[8] = 9'h10c;
    stim[9] = 9'h092;
    stim[10] = 9'h1bc;
    stim[11] = 9'h189;
    stim[12] = 9'h046;
    stim[13] = 9'h13e;
    stim[14] = 9'h0ff;
    stim[15] = 9'h021;
    stim[16] = 9'h134;
    stim[17] = 9'h1c7;
    stim[18] = 9'h162;
    stim[19] = 9'h04c;
    stim[20] = 9'h129;
    stim[21] = 9'h1de;
    stim[22] = 9'h166;
    stim[23] = 9'h1d6;
    stim[24] = 9'h01c;
    stim[25] = 9'h057;
    stim[26] = 9'h037;
    stim[27] = 9'h1e4;
    stim[28] = 9'h0a6;
    stim[29] = 9'h074;
    stim[30] = 9'h124;
    stim[31] = 9'h196;
    stim[32] = 9'h03d;
    stim[33] = 9'h1d3;
    stim[34] = 9'h191;
    stim[35] = 9'h01a;
    stim[36] = 9'h00e;
    stim[37] = 9'h1a6;
    stim[38] = 9'h174;
    stim[39] = 9'h103;
    stim[40] = 9'h118;
    stim[41] = 9'h000;
    stim[42] = 9'h04a;
    stim[43] = 9'h053;
    stim[44] = 9'h1f5;
    stim[45] = 9'h0c6;
    stim[46] = 9'h0fa;
    stim[47] = 9'h047;
    stim[48] = 9'h0b4;
    stim[49] = 9'h140;
    stim[50] = 9'h179;
    stim[51] = 9'h195;
    stim[52] = 9'h043;
    stim[53] = 9'h1f4;
    stim[54] = 9'h081;
    stim[55] = 9'h14a;
    stim[56] = 9'h15d;
    stim[57] = 9'h0ab;
    stim[58] = 9'h184;
    stim[59] = 9'h1a4;
    stim[60] = 9'h152;
    stim[61] = 9'h13e;
    stim[62] = 9'h1cf;
    stim[63] = 9'h0c3;
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
      expv[0] = 15'hxxxx;
      expv[1] = 15'hxxxx;
      expv[2] = 15'h0000;
      expv[3] = 15'h0000;
      expv[4] = 15'h0000;
      expv[5] = 15'h0000;
      expv[6] = 15'h0000;
      expv[7] = 15'h0000;
      expv[8] = 15'h0000;
      expv[9] = 15'h0000;
      expv[10] = 15'h0000;
      expv[11] = 15'h0000;
      expv[12] = 15'h0000;
      expv[13] = 15'h0000;
      expv[14] = 15'h0000;
      expv[15] = 15'h0000;
      expv[16] = 15'h0804;
      expv[17] = 15'h0000;
      expv[18] = 15'h0000;
      expv[19] = 15'h0000;
      expv[20] = 15'h0000;
      expv[21] = 15'h0000;
      expv[22] = 15'h0000;
      expv[23] = 15'h0000;
      expv[24] = 15'h0000;
      expv[25] = 15'h0000;
      expv[26] = 15'h0000;
      expv[27] = 15'h0000;
      expv[28] = 15'h0000;
      expv[29] = 15'h0000;
      expv[30] = 15'h0000;
      expv[31] = 15'h0000;
      expv[32] = 15'h0000;
      expv[33] = 15'h0000;
      expv[34] = 15'h0000;
      expv[35] = 15'h0182;
      expv[36] = 15'h0000;
      expv[37] = 15'h0000;
      expv[38] = 15'h0000;
      expv[39] = 15'h0000;
      expv[40] = 15'h0000;
      expv[41] = 15'h0000;
      expv[42] = 15'h0000;
      expv[43] = 15'h0000;
      expv[44] = 15'h0000;
      expv[45] = 15'h0000;
      expv[46] = 15'h0000;
      expv[47] = 15'h0000;
      expv[48] = 15'h0000;
      expv[49] = 15'h0000;
      expv[50] = 15'h0000;
      expv[51] = 15'h0000;
      expv[52] = 15'h0804;
      expv[53] = 15'h0c06;
      expv[54] = 15'h0000;
      expv[55] = 15'h0000;
      expv[56] = 15'h0000;
      expv[57] = 15'h0000;
      expv[58] = 15'h0804;
      expv[59] = 15'h0000;
      expv[60] = 15'h0000;
      expv[61] = 15'h0000;
      expv[62] = 15'h0000;
      expv[63] = 15'h0000;
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
