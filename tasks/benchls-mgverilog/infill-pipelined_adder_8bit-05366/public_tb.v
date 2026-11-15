// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05366 dut (
    .clk(clk),
    .x(in_vec[16:9]),
    .y(in_vec[8:1]),
    .carry_in(in_vec[0:0]),
    .carry_output_bit(out_vec[8:8]),
    .sum(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1d03c;
    stim[1] = 17'h08125;
    stim[2] = 17'h056cb;
    stim[3] = 17'h1da7b;
    stim[4] = 17'h069a2;
    stim[5] = 17'h081ce;
    stim[6] = 17'h06c95;
    stim[7] = 17'h0ed5d;
    stim[8] = 17'h05d4d;
    stim[9] = 17'h1224f;
    stim[10] = 17'h1e793;
    stim[11] = 17'h1adb8;
    stim[12] = 17'h14cc2;
    stim[13] = 17'h1d6b1;
    stim[14] = 17'h07cd6;
    stim[15] = 17'h0b752;
    stim[16] = 17'h1e27d;
    stim[17] = 17'h0e449;
    stim[18] = 17'h14bc5;
    stim[19] = 17'h01486;
    stim[20] = 17'h0d109;
    stim[21] = 17'h04e2e;
    stim[22] = 17'h0ac95;
    stim[23] = 17'h12c1b;
    stim[24] = 17'h1d5ae;
    stim[25] = 17'h17a76;
    stim[26] = 17'h19cfc;
    stim[27] = 17'h1b3fa;
    stim[28] = 17'h0bbe2;
    stim[29] = 17'h0952e;
    stim[30] = 17'h0a53a;
    stim[31] = 17'h05b4f;
    stim[32] = 17'h15565;
    stim[33] = 17'h1695d;
    stim[34] = 17'h1dd1d;
    stim[35] = 17'h0ac9f;
    stim[36] = 17'h05e74;
    stim[37] = 17'h14ea3;
    stim[38] = 17'h18310;
    stim[39] = 17'h06651;
    stim[40] = 17'h0b053;
    stim[41] = 17'h02f79;
    stim[42] = 17'h0a54a;
    stim[43] = 17'h19182;
    stim[44] = 17'h0798e;
    stim[45] = 17'h02bd1;
    stim[46] = 17'h11c8d;
    stim[47] = 17'h13555;
    stim[48] = 17'h17eaf;
    stim[49] = 17'h03c48;
    stim[50] = 17'h0960d;
    stim[51] = 17'h1585a;
    stim[52] = 17'h08488;
    stim[53] = 17'h1d526;
    stim[54] = 17'h15478;
    stim[55] = 17'h1725e;
    stim[56] = 17'h1c6d7;
    stim[57] = 17'h0dcdd;
    stim[58] = 17'h170cd;
    stim[59] = 17'h05196;
    stim[60] = 17'h00005;
    stim[61] = 17'h1baf7;
    stim[62] = 17'h1541c;
    stim[63] = 17'h09f0e;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'hxxx;
      expv[2] = 9'h106;
      expv[3] = 9'h0d3;
      expv[4] = 9'h091;
      expv[5] = 9'h12b;
      expv[6] = 9'h105;
      expv[7] = 9'h127;
      expv[8] = 9'h081;
      expv[9] = 9'h125;
      expv[10] = 9'h0d5;
      expv[11] = 9'h0b9;
      expv[12] = 9'h1bd;
      expv[13] = 9'h1b2;
      expv[14] = 9'h107;
      expv[15] = 9'h144;
      expv[16] = 9'h0a9;
      expv[17] = 9'h104;
      expv[18] = 9'h130;
      expv[19] = 9'h097;
      expv[20] = 9'h188;
      expv[21] = 9'h04d;
      expv[22] = 9'h0ed;
      expv[23] = 9'h03e;
      expv[24] = 9'h0a1;
      expv[25] = 9'h0a4;
      expv[26] = 9'h1c1;
      expv[27] = 9'h0f8;
      expv[28] = 9'h14c;
      expv[29] = 9'h1d6;
      expv[30] = 9'h14e;
      expv[31] = 9'h0e1;
      expv[32] = 9'h0ef;
      expv[33] = 9'h0d5;
      expv[34] = 9'h15d;
      expv[35] = 9'h163;
      expv[36] = 9'h17d;
      expv[37] = 9'h0a6;
      expv[38] = 9'h069;
      expv[39] = 9'h0f9;
      expv[40] = 9'h149;
      expv[41] = 9'h05c;
      expv[42] = 9'h082;
      expv[43] = 9'h0d4;
      expv[44] = 9'h0f7;
      expv[45] = 9'h189;
      expv[46] = 9'h103;
      expv[47] = 9'h0fe;
      expv[48] = 9'h0d5;
      expv[49] = 9'h145;
      expv[50] = 9'h117;
      expv[51] = 9'h042;
      expv[52] = 9'h052;
      expv[53] = 9'h0d9;
      expv[54] = 9'h086;
      expv[55] = 9'h17d;
      expv[56] = 9'h0e6;
      expv[57] = 9'h0e8;
      expv[58] = 9'h14f;
      expv[59] = 9'h0dd;
      expv[60] = 9'h11f;
      expv[61] = 9'h0f3;
      expv[62] = 9'h003;
      expv[63] = 9'h159;
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
