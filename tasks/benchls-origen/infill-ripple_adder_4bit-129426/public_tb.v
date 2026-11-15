// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_129426 dut (
    .A(in_vec[8:5]),
    .B(in_vec[4:1]),
    .cin(in_vec[0:0]),
    .sum(out_vec[4:1]),
    .cout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h087;
    stim[1] = 9'h16a;
    stim[2] = 9'h103;
    stim[3] = 9'h1ed;
    stim[4] = 9'h0d8;
    stim[5] = 9'h1b3;
    stim[6] = 9'h0dd;
    stim[7] = 9'h043;
    stim[8] = 9'h1b6;
    stim[9] = 9'h10d;
    stim[10] = 9'h048;
    stim[11] = 9'h014;
    stim[12] = 9'h02c;
    stim[13] = 9'h03a;
    stim[14] = 9'h1cd;
    stim[15] = 9'h16e;
    stim[16] = 9'h111;
    stim[17] = 9'h149;
    stim[18] = 9'h099;
    stim[19] = 9'h176;
    stim[20] = 9'h016;
    stim[21] = 9'h1e4;
    stim[22] = 9'h17e;
    stim[23] = 9'h17c;
    stim[24] = 9'h149;
    stim[25] = 9'h1d5;
    stim[26] = 9'h145;
    stim[27] = 9'h1f7;
    stim[28] = 9'h047;
    stim[29] = 9'h127;
    stim[30] = 9'h031;
    stim[31] = 9'h09c;
    stim[32] = 9'h072;
    stim[33] = 9'h1e8;
    stim[34] = 9'h1a7;
    stim[35] = 9'h03b;
    stim[36] = 9'h13f;
    stim[37] = 9'h1fc;
    stim[38] = 9'h112;
    stim[39] = 9'h124;
    stim[40] = 9'h177;
    stim[41] = 9'h0c2;
    stim[42] = 9'h14b;
    stim[43] = 9'h1eb;
    stim[44] = 9'h08f;
    stim[45] = 9'h07b;
    stim[46] = 9'h075;
    stim[47] = 9'h110;
    stim[48] = 9'h0ec;
    stim[49] = 9'h1ee;
    stim[50] = 9'h077;
    stim[51] = 9'h07f;
    stim[52] = 9'h07a;
    stim[53] = 9'h0ca;
    stim[54] = 9'h157;
    stim[55] = 9'h1bc;
    stim[56] = 9'h1c9;
    stim[57] = 9'h1fc;
    stim[58] = 9'h055;
    stim[59] = 9'h1d0;
    stim[60] = 9'h1c6;
    stim[61] = 9'h0da;
    stim[62] = 9'h1ac;
    stim[63] = 9'h19d;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 5'h10;
      expv[1] = 5'h01;
      expv[2] = 5'h14;
      expv[3] = 5'h0d;
      expv[4] = 5'h05;
      expv[5] = 5'h0f;
      expv[6] = 5'h0b;
      expv[7] = 5'h08;
      expv[8] = 5'h11;
      expv[9] = 5'h1e;
      expv[10] = 5'h0c;
      expv[11] = 5'h14;
      expv[12] = 5'h0e;
      expv[13] = 5'h1c;
      expv[14] = 5'h0b;
      expv[15] = 5'h05;
      expv[16] = 5'h03;
      expv[17] = 5'h1e;
      expv[18] = 5'h03;
      expv[19] = 5'h0d;
      expv[20] = 5'h16;
      expv[21] = 5'h03;
      expv[22] = 5'h15;
      expv[23] = 5'h13;
      expv[24] = 5'h1e;
      expv[25] = 5'h13;
      expv[26] = 5'h1a;
      expv[27] = 5'h17;
      expv[28] = 5'h0c;
      expv[29] = 5'h1a;
      expv[30] = 5'h14;
      expv[31] = 5'h05;
      expv[32] = 5'h18;
      expv[33] = 5'h07;
      expv[34] = 5'h03;
      expv[35] = 5'h1e;
      expv[36] = 5'h13;
      expv[37] = 5'h1b;
      expv[38] = 5'h03;
      expv[39] = 5'h16;
      expv[40] = 5'h0f;
      expv[41] = 5'h0e;
      expv[42] = 5'h01;
      expv[43] = 5'h0b;
      expv[44] = 5'h18;
      expv[45] = 5'h03;
      expv[46] = 5'h1c;
      expv[47] = 5'h01;
      expv[48] = 5'h1a;
      expv[49] = 5'h0d;
      expv[50] = 5'h1e;
      expv[51] = 5'h07;
      expv[52] = 5'h01;
      expv[53] = 5'h16;
      expv[54] = 5'h0d;
      expv[55] = 5'h17;
      expv[56] = 5'h07;
      expv[57] = 5'h1b;
      expv[58] = 5'h1a;
      expv[59] = 5'h0d;
      expv[60] = 5'h03;
      expv[61] = 5'h07;
      expv[62] = 5'h07;
      expv[63] = 5'h17;
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
