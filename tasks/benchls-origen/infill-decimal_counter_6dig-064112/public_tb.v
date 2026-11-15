// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_064112 dut (
    .Clk(clk),
    .Enable(in_vec[1:1]),
    .Clr(in_vec[0:0]),
    .Q(out_vec[47:40]),
    .Q1(out_vec[39:32]),
    .Q2(out_vec[31:24]),
    .Q3(out_vec[23:16]),
    .Q4(out_vec[15:8]),
    .Q5(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 2'h0;
    stim[1] = 2'h2;
    stim[2] = 2'h1;
    stim[3] = 2'h1;
    stim[4] = 2'h1;
    stim[5] = 2'h1;
    stim[6] = 2'h3;
    stim[7] = 2'h3;
    stim[8] = 2'h1;
    stim[9] = 2'h1;
    stim[10] = 2'h1;
    stim[11] = 2'h3;
    stim[12] = 2'h1;
    stim[13] = 2'h1;
    stim[14] = 2'h3;
    stim[15] = 2'h3;
    stim[16] = 2'h3;
    stim[17] = 2'h1;
    stim[18] = 2'h3;
    stim[19] = 2'h3;
    stim[20] = 2'h1;
    stim[21] = 2'h3;
    stim[22] = 2'h1;
    stim[23] = 2'h1;
    stim[24] = 2'h3;
    stim[25] = 2'h3;
    stim[26] = 2'h1;
    stim[27] = 2'h1;
    stim[28] = 2'h1;
    stim[29] = 2'h1;
    stim[30] = 2'h3;
    stim[31] = 2'h3;
    stim[32] = 2'h1;
    stim[33] = 2'h3;
    stim[34] = 2'h3;
    stim[35] = 2'h1;
    stim[36] = 2'h1;
    stim[37] = 2'h3;
    stim[38] = 2'h1;
    stim[39] = 2'h1;
    stim[40] = 2'h3;
    stim[41] = 2'h1;
    stim[42] = 2'h1;
    stim[43] = 2'h1;
    stim[44] = 2'h1;
    stim[45] = 2'h1;
    stim[46] = 2'h1;
    stim[47] = 2'h1;
    stim[48] = 2'h1;
    stim[49] = 2'h1;
    stim[50] = 2'h1;
    stim[51] = 2'h1;
    stim[52] = 2'h3;
    stim[53] = 2'h1;
    stim[54] = 2'h3;
    stim[55] = 2'h3;
    stim[56] = 2'h1;
    stim[57] = 2'h1;
    stim[58] = 2'h1;
    stim[59] = 2'h1;
    stim[60] = 2'h3;
    stim[61] = 2'h1;
    stim[62] = 2'h3;
    stim[63] = 2'h3;
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
      expv[0] = 48'h000000000000;
      expv[1] = 48'h000000000000;
      expv[2] = 48'h000000000000;
      expv[3] = 48'h000000000000;
      expv[4] = 48'h000000000000;
      expv[5] = 48'h000000000000;
      expv[6] = 48'h000000000000;
      expv[7] = 48'h010000000000;
      expv[8] = 48'h020000000000;
      expv[9] = 48'h020000000000;
      expv[10] = 48'h020000000000;
      expv[11] = 48'h020000000000;
      expv[12] = 48'h030000000000;
      expv[13] = 48'h030000000000;
      expv[14] = 48'h030000000000;
      expv[15] = 48'h040000000000;
      expv[16] = 48'h050000000000;
      expv[17] = 48'h060000000000;
      expv[18] = 48'h060000000000;
      expv[19] = 48'h070000000000;
      expv[20] = 48'h080000000000;
      expv[21] = 48'h080000000000;
      expv[22] = 48'h090000000000;
      expv[23] = 48'h090000000000;
      expv[24] = 48'h090000000000;
      expv[25] = 48'h000100000000;
      expv[26] = 48'h010100000000;
      expv[27] = 48'h010100000000;
      expv[28] = 48'h010100000000;
      expv[29] = 48'h010100000000;
      expv[30] = 48'h010100000000;
      expv[31] = 48'h020100000000;
      expv[32] = 48'h030100000000;
      expv[33] = 48'h030100000000;
      expv[34] = 48'h040100000000;
      expv[35] = 48'h050100000000;
      expv[36] = 48'h050100000000;
      expv[37] = 48'h050100000000;
      expv[38] = 48'h060100000000;
      expv[39] = 48'h060100000000;
      expv[40] = 48'h060100000000;
      expv[41] = 48'h070100000000;
      expv[42] = 48'h070100000000;
      expv[43] = 48'h070100000000;
      expv[44] = 48'h070100000000;
      expv[45] = 48'h070100000000;
      expv[46] = 48'h070100000000;
      expv[47] = 48'h070100000000;
      expv[48] = 48'h070100000000;
      expv[49] = 48'h070100000000;
      expv[50] = 48'h070100000000;
      expv[51] = 48'h070100000000;
      expv[52] = 48'h070100000000;
      expv[53] = 48'h080100000000;
      expv[54] = 48'h080100000000;
      expv[55] = 48'h090100000000;
      expv[56] = 48'h000200000000;
      expv[57] = 48'h000200000000;
      expv[58] = 48'h000200000000;
      expv[59] = 48'h000200000000;
      expv[60] = 48'h000200000000;
      expv[61] = 48'h010200000000;
      expv[62] = 48'h010200000000;
      expv[63] = 48'h020200000000;
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
