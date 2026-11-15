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

  four_adder dut (
    .A(in_vec[8:5]),
    .B(in_vec[4:1]),
    .c_in(in_vec[0:0]),
    .c_out(out_vec[4:4]),
    .sum(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h163;
    stim[1] = 9'h024;
    stim[2] = 9'h082;
    stim[3] = 9'h01b;
    stim[4] = 9'h199;
    stim[5] = 9'h104;
    stim[6] = 9'h01b;
    stim[7] = 9'h0fa;
    stim[8] = 9'h171;
    stim[9] = 9'h147;
    stim[10] = 9'h180;
    stim[11] = 9'h1ac;
    stim[12] = 9'h19a;
    stim[13] = 9'h173;
    stim[14] = 9'h10b;
    stim[15] = 9'h0cf;
    stim[16] = 9'h1a6;
    stim[17] = 9'h105;
    stim[18] = 9'h046;
    stim[19] = 9'h04b;
    stim[20] = 9'h0c5;
    stim[21] = 9'h07f;
    stim[22] = 9'h155;
    stim[23] = 9'h07f;
    stim[24] = 9'h189;
    stim[25] = 9'h01f;
    stim[26] = 9'h1ce;
    stim[27] = 9'h0d2;
    stim[28] = 9'h02b;
    stim[29] = 9'h1d3;
    stim[30] = 9'h081;
    stim[31] = 9'h1a1;
    stim[32] = 9'h1b2;
    stim[33] = 9'h04b;
    stim[34] = 9'h013;
    stim[35] = 9'h146;
    stim[36] = 9'h099;
    stim[37] = 9'h17e;
    stim[38] = 9'h153;
    stim[39] = 9'h086;
    stim[40] = 9'h0aa;
    stim[41] = 9'h179;
    stim[42] = 9'h10c;
    stim[43] = 9'h0e4;
    stim[44] = 9'h0b4;
    stim[45] = 9'h05f;
    stim[46] = 9'h1c4;
    stim[47] = 9'h185;
    stim[48] = 9'h0f2;
    stim[49] = 9'h0d2;
    stim[50] = 9'h0db;
    stim[51] = 9'h171;
    stim[52] = 9'h1e4;
    stim[53] = 9'h014;
    stim[54] = 9'h0ac;
    stim[55] = 9'h138;
    stim[56] = 9'h00c;
    stim[57] = 9'h0db;
    stim[58] = 9'h15e;
    stim[59] = 9'h0d1;
    stim[60] = 9'h1d9;
    stim[61] = 9'h121;
    stim[62] = 9'h156;
    stim[63] = 9'h1ef;
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
      expv[0] = 5'h0d;
      expv[1] = 5'h03;
      expv[2] = 5'h05;
      expv[3] = 5'h0e;
      expv[4] = 5'h19;
      expv[5] = 5'h0a;
      expv[6] = 5'h0e;
      expv[7] = 5'h14;
      expv[8] = 5'h14;
      expv[9] = 5'h0e;
      expv[10] = 5'h0c;
      expv[11] = 5'h13;
      expv[12] = 5'h19;
      expv[13] = 5'h15;
      expv[14] = 5'h0e;
      expv[15] = 5'h0e;
      expv[16] = 5'h10;
      expv[17] = 5'h0b;
      expv[18] = 5'h05;
      expv[19] = 5'h08;
      expv[20] = 5'h09;
      expv[21] = 5'h13;
      expv[22] = 5'h15;
      expv[23] = 5'h13;
      expv[24] = 5'h11;
      expv[25] = 5'h10;
      expv[26] = 5'h15;
      expv[27] = 5'h0f;
      expv[28] = 5'h07;
      expv[29] = 5'h18;
      expv[30] = 5'h05;
      expv[31] = 5'h0e;
      expv[32] = 5'h16;
      expv[33] = 5'h08;
      expv[34] = 5'h0a;
      expv[35] = 5'h0d;
      expv[36] = 5'h11;
      expv[37] = 5'h1a;
      expv[38] = 5'h14;
      expv[39] = 5'h07;
      expv[40] = 5'h0a;
      expv[41] = 5'h18;
      expv[42] = 5'h0e;
      expv[43] = 5'h09;
      expv[44] = 5'h0f;
      expv[45] = 5'h12;
      expv[46] = 5'h10;
      expv[47] = 5'h0f;
      expv[48] = 5'h10;
      expv[49] = 5'h0f;
      expv[50] = 5'h14;
      expv[51] = 5'h14;
      expv[52] = 5'h11;
      expv[53] = 5'h0a;
      expv[54] = 5'h0b;
      expv[55] = 5'h15;
      expv[56] = 5'h06;
      expv[57] = 5'h14;
      expv[58] = 5'h19;
      expv[59] = 5'h0f;
      expv[60] = 5'h1b;
      expv[61] = 5'h0a;
      expv[62] = 5'h15;
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
