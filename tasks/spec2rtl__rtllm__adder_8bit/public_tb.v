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

  adder_8bit dut (
    .a(in_vec[16:9]),
    .b(in_vec[8:1]),
    .cin(in_vec[0:0]),
    .sum(out_vec[8:1]),
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
    stim[0] = 17'h08872;
    stim[1] = 17'h0482a;
    stim[2] = 17'h108eb;
    stim[3] = 17'h106d3;
    stim[4] = 17'h0c45f;
    stim[5] = 17'h00e07;
    stim[6] = 17'h180dd;
    stim[7] = 17'h141ac;
    stim[8] = 17'h0e9aa;
    stim[9] = 17'h0669c;
    stim[10] = 17'h1dd4d;
    stim[11] = 17'h013a5;
    stim[12] = 17'h1326e;
    stim[13] = 17'h163ea;
    stim[14] = 17'h185c4;
    stim[15] = 17'h1ec03;
    stim[16] = 17'h0d4c0;
    stim[17] = 17'h15887;
    stim[18] = 17'h03225;
    stim[19] = 17'h056b8;
    stim[20] = 17'h1066e;
    stim[21] = 17'h0cad7;
    stim[22] = 17'h176a5;
    stim[23] = 17'h19e06;
    stim[24] = 17'h05603;
    stim[25] = 17'h1cccd;
    stim[26] = 17'h15623;
    stim[27] = 17'h0ddd0;
    stim[28] = 17'h108c4;
    stim[29] = 17'h0b56c;
    stim[30] = 17'h1e9c4;
    stim[31] = 17'h08126;
    stim[32] = 17'h0af17;
    stim[33] = 17'h099cc;
    stim[34] = 17'h00a49;
    stim[35] = 17'h1338a;
    stim[36] = 17'h08335;
    stim[37] = 17'h0189d;
    stim[38] = 17'h1b2a2;
    stim[39] = 17'h05f93;
    stim[40] = 17'h0a47e;
    stim[41] = 17'h0249c;
    stim[42] = 17'h0f238;
    stim[43] = 17'h156a8;
    stim[44] = 17'h16d15;
    stim[45] = 17'h0a237;
    stim[46] = 17'h18c42;
    stim[47] = 17'h1e36b;
    stim[48] = 17'h0942e;
    stim[49] = 17'h199e7;
    stim[50] = 17'h0321b;
    stim[51] = 17'h09fec;
    stim[52] = 17'h12162;
    stim[53] = 17'h1b79d;
    stim[54] = 17'h09386;
    stim[55] = 17'h0a6e2;
    stim[56] = 17'h15f44;
    stim[57] = 17'h14886;
    stim[58] = 17'h004a4;
    stim[59] = 17'h14583;
    stim[60] = 17'h11cf1;
    stim[61] = 17'h09f1a;
    stim[62] = 17'h14be5;
    stim[63] = 17'h11236;
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
      expv[0] = 9'h0fa;
      expv[1] = 9'h072;
      expv[2] = 9'h1f4;
      expv[3] = 9'h1da;
      expv[4] = 9'h124;
      expv[5] = 9'h016;
      expv[6] = 9'h05f;
      expv[7] = 9'h0ed;
      expv[8] = 9'h093;
      expv[9] = 9'h102;
      expv[10] = 9'h12b;
      expv[11] = 9'h1b8;
      expv[12] = 9'h1a0;
      expv[13] = 9'h14d;
      expv[14] = 9'h149;
      expv[15] = 9'h1f0;
      expv[16] = 9'h194;
      expv[17] = 9'h1e0;
      expv[18] = 9'h058;
      expv[19] = 9'h10e;
      expv[20] = 9'h174;
      expv[21] = 9'h1a2;
      expv[22] = 9'h01d;
      expv[23] = 9'h1a4;
      expv[24] = 9'h05a;
      expv[25] = 9'h09b;
      expv[26] = 9'h17a;
      expv[27] = 9'h0ad;
      expv[28] = 9'h1cc;
      expv[29] = 9'h021;
      expv[30] = 9'h1ad;
      expv[31] = 9'h1a6;
      expv[32] = 9'h1c6;
      expv[33] = 9'h065;
      expv[34] = 9'h054;
      expv[35] = 9'h0bd;
      expv[36] = 9'h1b8;
      expv[37] = 9'h0b6;
      expv[38] = 9'h055;
      expv[39] = 9'h1f2;
      expv[40] = 9'h122;
      expv[41] = 9'h0c0;
      expv[42] = 9'h12a;
      expv[43] = 9'h1fe;
      expv[44] = 9'h083;
      expv[45] = 9'h0da;
      expv[46] = 9'h1ce;
      expv[47] = 9'h14f;
      expv[48] = 9'h0c2;
      expv[49] = 9'h181;
      expv[50] = 9'h04e;
      expv[51] = 9'h08b;
      expv[52] = 9'h083;
      expv[53] = 9'h155;
      expv[54] = 9'h019;
      expv[55] = 9'h188;
      expv[56] = 9'h0a3;
      expv[57] = 9'h1ce;
      expv[58] = 9'h0a8;
      expv[59] = 9'h0c9;
      expv[60] = 9'h00f;
      expv[61] = 9'h1b8;
      expv[62] = 9'h131;
      expv[63] = 9'h148;
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
