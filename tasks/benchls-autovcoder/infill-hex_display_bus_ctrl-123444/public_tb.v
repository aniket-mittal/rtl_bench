// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 69;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_123444 dut (
    .SysClk(clk),
    .Reset(in_vec[8:8]),
    .DataIn(in_vec[7:0]),
    .HEX7(out_vec[68:62]),
    .HEX6(out_vec[61:55]),
    .HEX5(out_vec[54:48]),
    .HEX4(out_vec[47:41]),
    .HEX3(out_vec[40:34]),
    .HEX2(out_vec[33:27]),
    .HEX1(out_vec[26:20]),
    .HEX0(out_vec[19:13]),
    .Addr(out_vec[12:11]),
    .DataOut(out_vec[10:3]),
    .CS_N(out_vec[2:2]),
    .RD_N(out_vec[1:1]),
    .WR_N(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h117;
    stim[1] = 9'h145;
    stim[2] = 9'h041;
    stim[3] = 9'h0a7;
    stim[4] = 9'h014;
    stim[5] = 9'h0e7;
    stim[6] = 9'h00b;
    stim[7] = 9'h0f2;
    stim[8] = 9'h016;
    stim[9] = 9'h0fc;
    stim[10] = 9'h0cd;
    stim[11] = 9'h099;
    stim[12] = 9'h1c6;
    stim[13] = 9'h059;
    stim[14] = 9'h09b;
    stim[15] = 9'h01e;
    stim[16] = 9'h0b8;
    stim[17] = 9'h096;
    stim[18] = 9'h0a9;
    stim[19] = 9'h0a5;
    stim[20] = 9'h078;
    stim[21] = 9'h03e;
    stim[22] = 9'h0d7;
    stim[23] = 9'h051;
    stim[24] = 9'h0c7;
    stim[25] = 9'h0e6;
    stim[26] = 9'h078;
    stim[27] = 9'h095;
    stim[28] = 9'h047;
    stim[29] = 9'h09d;
    stim[30] = 9'h0d6;
    stim[31] = 9'h018;
    stim[32] = 9'h0f2;
    stim[33] = 9'h08c;
    stim[34] = 9'h012;
    stim[35] = 9'h03c;
    stim[36] = 9'h0b3;
    stim[37] = 9'h049;
    stim[38] = 9'h061;
    stim[39] = 9'h0e0;
    stim[40] = 9'h082;
    stim[41] = 9'h1d8;
    stim[42] = 9'h0b4;
    stim[43] = 9'h05e;
    stim[44] = 9'h08c;
    stim[45] = 9'h0ec;
    stim[46] = 9'h0db;
    stim[47] = 9'h0b1;
    stim[48] = 9'h0d8;
    stim[49] = 9'h0a9;
    stim[50] = 9'h0be;
    stim[51] = 9'h0bc;
    stim[52] = 9'h076;
    stim[53] = 9'h0f9;
    stim[54] = 9'h0e1;
    stim[55] = 9'h043;
    stim[56] = 9'h0d5;
    stim[57] = 9'h033;
    stim[58] = 9'h1f4;
    stim[59] = 9'h01b;
    stim[60] = 9'h069;
    stim[61] = 9'h052;
    stim[62] = 9'h085;
    stim[63] = 9'h04e;
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
      expv[0] = 69'hxxxxxxxxxxxxxxxxxx;
      expv[1] = 69'hxxxxxxxxxxxxxxxxxx;
      expv[2] = 69'hxxxxxxxxxxxxxxxxxx;
      expv[3] = 69'h0fdfbf7efdfbf7xx0f;
      expv[4] = 69'h0fdfbf7efdfbf7xx0f;
      expv[5] = 69'h0fdfbf7efdfbf7xx0f;
      expv[6] = 69'h0fdfbf7efdfbf7xx0f;
      expv[7] = 69'h0fdfbf7efdfbf7xx0f;
      expv[8] = 69'h0fdfbf7efdfbf7xx0f;
      expv[9] = 69'h0fdfbf7efdfbf7xx0f;
      expv[10] = 69'h0fdfbf7efdfbf7xx0f;
      expv[11] = 69'h0fdfbf7efdfbf7xx0f;
      expv[12] = 69'h0fdfbf7efdfbf7xx0f;
      expv[13] = 69'h0fdfbf7efdfbf7xx0f;
      expv[14] = 69'h0fdfbf7efdfbf7xx0f;
      expv[15] = 69'h0fdfbf7efdfbf7xx0f;
      expv[16] = 69'h0fdfbf7efdfbf7xx0f;
      expv[17] = 69'h0fdfbf7efdfbf7xx0f;
      expv[18] = 69'h0fdfbf7efdfbf7xx0f;
      expv[19] = 69'h0fdfbf7efdfbf7xx0f;
      expv[20] = 69'h0fdfbf7efdfbf7xx0f;
      expv[21] = 69'h0fdfbf7efdfbf7xx0f;
      expv[22] = 69'h0fdfbf7efdfbf7xx0f;
      expv[23] = 69'h0fdfbf7efdfbf7xx0f;
      expv[24] = 69'h0fdfbf7efdfbf7xx0f;
      expv[25] = 69'h0fdfbf7efdfbf7xx0f;
      expv[26] = 69'h0fdfbf7efdfbf7xx0f;
      expv[27] = 69'h0fdfbf7efdfbf7xx0f;
      expv[28] = 69'h0fdfbf7efdfbf7xx0f;
      expv[29] = 69'h0fdfbf7efdfbf7xx0f;
      expv[30] = 69'h0fdfbf7efdfbf7xx0f;
      expv[31] = 69'h0fdfbf7efdfbf7xx0f;
      expv[32] = 69'h0fdfbf7efdfbf7xx0f;
      expv[33] = 69'h0fdfbf7efdfbf7xx0f;
      expv[34] = 69'h0fdfbf7efdfbf7xx0f;
      expv[35] = 69'h0fdfbf7efdfbf7xx0f;
      expv[36] = 69'h0fdfbf7efdfbf7xx0f;
      expv[37] = 69'h0fdfbf7efdfbf7xx0f;
      expv[38] = 69'h0fdfbf7efdfbf7xx0f;
      expv[39] = 69'h0fdfbf7efdfbf7xx0f;
      expv[40] = 69'h0fdfbf7efdfbf7xx0f;
      expv[41] = 69'h0fdfbf7efdfbf7xx0f;
      expv[42] = 69'h0fdfbf7efdfbf7xx0f;
      expv[43] = 69'h0fdfbf7efdfbf7xx0f;
      expv[44] = 69'h0fdfbf7efdfbf7xx0f;
      expv[45] = 69'h0fdfbf7efdfbf7xx0f;
      expv[46] = 69'h0fdfbf7efdfbf7xx0f;
      expv[47] = 69'h0fdfbf7efdfbf7xx0f;
      expv[48] = 69'h0fdfbf7efdfbf7xx0f;
      expv[49] = 69'h0fdfbf7efdfbf7xx0f;
      expv[50] = 69'h0fdfbf7efdfbf7xx0f;
      expv[51] = 69'h0fdfbf7efdfbf7xx0f;
      expv[52] = 69'h0fdfbf7efdfbf7xx0f;
      expv[53] = 69'h0fdfbf7efdfbf7xx0f;
      expv[54] = 69'h0fdfbf7efdfbf7xx0f;
      expv[55] = 69'h0fdfbf7efdfbf7xx0f;
      expv[56] = 69'h0fdfbf7efdfbf7xx0f;
      expv[57] = 69'h0fdfbf7efdfbf7xx0f;
      expv[58] = 69'h0fdfbf7efdfbf7xx0f;
      expv[59] = 69'h0fdfbf7efdfbf7xx0f;
      expv[60] = 69'h0fdfbf7efdfbf7xx0f;
      expv[61] = 69'h0fdfbf7efdfbf7xx0f;
      expv[62] = 69'h0fdfbf7efdfbf7xx0f;
      expv[63] = 69'h0fdfbf7efdfbf7xx0f;
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
