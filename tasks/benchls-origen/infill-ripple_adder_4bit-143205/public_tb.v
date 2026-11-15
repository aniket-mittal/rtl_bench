// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_143205 dut (
    .A(in_vec[9:6]),
    .B(in_vec[5:2]),
    .Cin(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .Sum(out_vec[4:1]),
    .Cout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h0a9;
    stim[1] = 10'h001;
    stim[2] = 10'h346;
    stim[3] = 10'h1ea;
    stim[4] = 10'h0b2;
    stim[5] = 10'h140;
    stim[6] = 10'h33a;
    stim[7] = 10'h32e;
    stim[8] = 10'h008;
    stim[9] = 10'h18a;
    stim[10] = 10'h018;
    stim[11] = 10'h3da;
    stim[12] = 10'h07c;
    stim[13] = 10'h1ba;
    stim[14] = 10'h34e;
    stim[15] = 10'h068;
    stim[16] = 10'h1c4;
    stim[17] = 10'h1dc;
    stim[18] = 10'h2d2;
    stim[19] = 10'h3f8;
    stim[20] = 10'h392;
    stim[21] = 10'h1ac;
    stim[22] = 10'h224;
    stim[23] = 10'h010;
    stim[24] = 10'h1aa;
    stim[25] = 10'h2d2;
    stim[26] = 10'h34e;
    stim[27] = 10'h09c;
    stim[28] = 10'h2ac;
    stim[29] = 10'h1e8;
    stim[30] = 10'h154;
    stim[31] = 10'h39a;
    stim[32] = 10'h3ce;
    stim[33] = 10'h266;
    stim[34] = 10'h086;
    stim[35] = 10'h3e0;
    stim[36] = 10'h0f6;
    stim[37] = 10'h3d2;
    stim[38] = 10'h340;
    stim[39] = 10'h17c;
    stim[40] = 10'h028;
    stim[41] = 10'h0d6;
    stim[42] = 10'h340;
    stim[43] = 10'h184;
    stim[44] = 10'h07a;
    stim[45] = 10'h232;
    stim[46] = 10'h35a;
    stim[47] = 10'h0f6;
    stim[48] = 10'h160;
    stim[49] = 10'h01c;
    stim[50] = 10'h1c0;
    stim[51] = 10'h08e;
    stim[52] = 10'h222;
    stim[53] = 10'h096;
    stim[54] = 10'h0b2;
    stim[55] = 10'h29e;
    stim[56] = 10'h376;
    stim[57] = 10'h1e2;
    stim[58] = 10'h0de;
    stim[59] = 10'h1b6;
    stim[60] = 10'h38c;
    stim[61] = 10'h3a4;
    stim[62] = 10'h0d0;
    stim[63] = 10'h074;
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
      expv[0] = 5'h00;
      expv[1] = 5'h00;
      expv[2] = 5'h1e;
      expv[3] = 5'h05;
      expv[4] = 5'h1e;
      expv[5] = 5'h0a;
      expv[6] = 5'h17;
      expv[7] = 5'h11;
      expv[8] = 5'h04;
      expv[9] = 5'h12;
      expv[10] = 5'h0c;
      expv[11] = 5'h0d;
      expv[12] = 5'h01;
      expv[13] = 5'h0b;
      expv[14] = 5'h03;
      expv[15] = 5'h16;
      expv[16] = 5'h10;
      expv[17] = 5'h1c;
      expv[18] = 5'h01;
      expv[19] = 5'h1b;
      expv[20] = 5'h07;
      expv[21] = 5'h03;
      expv[22] = 5'h03;
      expv[23] = 5'h08;
      expv[24] = 5'h03;
      expv[25] = 5'h01;
      expv[26] = 5'h03;
      expv[27] = 5'h12;
      expv[28] = 5'h0b;
      expv[29] = 5'h03;
      expv[30] = 5'h14;
      expv[31] = 5'h0b;
      expv[32] = 5'h07;
      expv[33] = 5'h07;
      expv[34] = 5'h08;
      expv[35] = 5'h0f;
      expv[36] = 5'h03;
      expv[37] = 5'h09;
      expv[38] = 5'h1a;
      expv[39] = 5'h09;
      expv[40] = 5'h14;
      expv[41] = 5'h12;
      expv[42] = 5'h1a;
      expv[43] = 5'h0e;
      expv[44] = 5'h01;
      expv[45] = 5'h0b;
      expv[46] = 5'h09;
      expv[47] = 5'h03;
      expv[48] = 5'h1a;
      expv[49] = 5'h0e;
      expv[50] = 5'h0e;
      expv[51] = 5'h0c;
      expv[52] = 5'h03;
      expv[53] = 5'h10;
      expv[54] = 5'h1e;
      expv[55] = 5'h05;
      expv[56] = 5'h17;
      expv[57] = 5'h01;
      expv[58] = 5'h16;
      expv[59] = 5'h09;
      expv[60] = 5'h03;
      expv[61] = 5'h0f;
      expv[62] = 5'h0e;
      expv[63] = 5'h1c;
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
