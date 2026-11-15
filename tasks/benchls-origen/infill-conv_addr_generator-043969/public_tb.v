// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_043969 dut (
    .clk(clk),
    .st(in_vec[8:5]),
    .in_cell_row(in_vec[4:0]),
    .in_addr(out_vec[12:8]),
    .w_addr(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h136;
    stim[1] = 9'h132;
    stim[2] = 9'h0d3;
    stim[3] = 9'h1c6;
    stim[4] = 9'h15a;
    stim[5] = 9'h1b5;
    stim[6] = 9'h006;
    stim[7] = 9'h0cb;
    stim[8] = 9'h113;
    stim[9] = 9'h014;
    stim[10] = 9'h1f0;
    stim[11] = 9'h07f;
    stim[12] = 9'h037;
    stim[13] = 9'h1a2;
    stim[14] = 9'h070;
    stim[15] = 9'h164;
    stim[16] = 9'h143;
    stim[17] = 9'h045;
    stim[18] = 9'h101;
    stim[19] = 9'h1ff;
    stim[20] = 9'h174;
    stim[21] = 9'h1ed;
    stim[22] = 9'h0d6;
    stim[23] = 9'h104;
    stim[24] = 9'h0fe;
    stim[25] = 9'h1f9;
    stim[26] = 9'h1ca;
    stim[27] = 9'h0be;
    stim[28] = 9'h140;
    stim[29] = 9'h1df;
    stim[30] = 9'h00d;
    stim[31] = 9'h0a1;
    stim[32] = 9'h0d8;
    stim[33] = 9'h012;
    stim[34] = 9'h003;
    stim[35] = 9'h1e4;
    stim[36] = 9'h000;
    stim[37] = 9'h107;
    stim[38] = 9'h0e1;
    stim[39] = 9'h0b1;
    stim[40] = 9'h189;
    stim[41] = 9'h18c;
    stim[42] = 9'h038;
    stim[43] = 9'h1f2;
    stim[44] = 9'h072;
    stim[45] = 9'h1c0;
    stim[46] = 9'h15b;
    stim[47] = 9'h0d5;
    stim[48] = 9'h0bf;
    stim[49] = 9'h1df;
    stim[50] = 9'h089;
    stim[51] = 9'h07e;
    stim[52] = 9'h0de;
    stim[53] = 9'h19a;
    stim[54] = 9'h099;
    stim[55] = 9'h06d;
    stim[56] = 9'h0f1;
    stim[57] = 9'h17e;
    stim[58] = 9'h1f2;
    stim[59] = 9'h0c7;
    stim[60] = 9'h1e5;
    stim[61] = 9'h045;
    stim[62] = 9'h0de;
    stim[63] = 9'h08d;
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
      expv[0] = 13'hxxxx;
      expv[1] = 13'h0000;
      expv[2] = 13'h0000;
      expv[3] = 13'h0000;
      expv[4] = 13'h0000;
      expv[5] = 13'h0000;
      expv[6] = 13'h0000;
      expv[7] = 13'h0000;
      expv[8] = 13'h0000;
      expv[9] = 13'h0000;
      expv[10] = 13'h0000;
      expv[11] = 13'h0000;
      expv[12] = 13'h0000;
      expv[13] = 13'h0000;
      expv[14] = 13'h0000;
      expv[15] = 13'h0000;
      expv[16] = 13'h0000;
      expv[17] = 13'h0000;
      expv[18] = 13'h0101;
      expv[19] = 13'h0000;
      expv[20] = 13'h0000;
      expv[21] = 13'h0000;
      expv[22] = 13'h0000;
      expv[23] = 13'h0000;
      expv[24] = 13'h0000;
      expv[25] = 13'h0000;
      expv[26] = 13'h0000;
      expv[27] = 13'h0000;
      expv[28] = 13'h0000;
      expv[29] = 13'h0000;
      expv[30] = 13'h0000;
      expv[31] = 13'h0000;
      expv[32] = 13'h0000;
      expv[33] = 13'h0000;
      expv[34] = 13'h0000;
      expv[35] = 13'h0000;
      expv[36] = 13'h0000;
      expv[37] = 13'h0000;
      expv[38] = 13'h0000;
      expv[39] = 13'h0000;
      expv[40] = 13'h0000;
      expv[41] = 13'h0000;
      expv[42] = 13'h0000;
      expv[43] = 13'h0000;
      expv[44] = 13'h0000;
      expv[45] = 13'h0000;
      expv[46] = 13'h0000;
      expv[47] = 13'h0000;
      expv[48] = 13'h0000;
      expv[49] = 13'h0000;
      expv[50] = 13'h0000;
      expv[51] = 13'h0000;
      expv[52] = 13'h0000;
      expv[53] = 13'h0000;
      expv[54] = 13'h0000;
      expv[55] = 13'h0000;
      expv[56] = 13'h0000;
      expv[57] = 13'h0000;
      expv[58] = 13'h0000;
      expv[59] = 13'h0000;
      expv[60] = 13'h0000;
      expv[61] = 13'h0000;
      expv[62] = 13'h0101;
      expv[63] = 13'h0000;
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
