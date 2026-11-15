// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_159171 dut (
    .clk(clk),
    .reset(in_vec[8:8]),
    .X(in_vec[7:0]),
    .Y(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h101;
    stim[1] = 9'h14d;
    stim[2] = 9'h0d1;
    stim[3] = 9'h0e7;
    stim[4] = 9'h024;
    stim[5] = 9'h0b4;
    stim[6] = 9'h087;
    stim[7] = 9'h018;
    stim[8] = 9'h073;
    stim[9] = 9'h16b;
    stim[10] = 9'h094;
    stim[11] = 9'h0e3;
    stim[12] = 9'h023;
    stim[13] = 9'h05e;
    stim[14] = 9'h04a;
    stim[15] = 9'h0c5;
    stim[16] = 9'h099;
    stim[17] = 9'h0e1;
    stim[18] = 9'h00e;
    stim[19] = 9'h0bc;
    stim[20] = 9'h08a;
    stim[21] = 9'h071;
    stim[22] = 9'h076;
    stim[23] = 9'h031;
    stim[24] = 9'h0f2;
    stim[25] = 9'h048;
    stim[26] = 9'h1e4;
    stim[27] = 9'h084;
    stim[28] = 9'h0a3;
    stim[29] = 9'h033;
    stim[30] = 9'h035;
    stim[31] = 9'h0c6;
    stim[32] = 9'h030;
    stim[33] = 9'h098;
    stim[34] = 9'h0a9;
    stim[35] = 9'h06d;
    stim[36] = 9'h0b8;
    stim[37] = 9'h0ee;
    stim[38] = 9'h08e;
    stim[39] = 9'h05d;
    stim[40] = 9'h0f0;
    stim[41] = 9'h095;
    stim[42] = 9'h078;
    stim[43] = 9'h0ea;
    stim[44] = 9'h0c1;
    stim[45] = 9'h07f;
    stim[46] = 9'h0ea;
    stim[47] = 9'h00e;
    stim[48] = 9'h0df;
    stim[49] = 9'h0a1;
    stim[50] = 9'h013;
    stim[51] = 9'h0fe;
    stim[52] = 9'h034;
    stim[53] = 9'h059;
    stim[54] = 9'h046;
    stim[55] = 9'h0c0;
    stim[56] = 9'h0bb;
    stim[57] = 9'h1d7;
    stim[58] = 9'h0f6;
    stim[59] = 9'h075;
    stim[60] = 9'h068;
    stim[61] = 9'h0aa;
    stim[62] = 9'h098;
    stim[63] = 9'h0a1;
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
      expv[0] = 10'h000;
      expv[1] = 10'h000;
      expv[2] = 10'h000;
      expv[3] = 10'h000;
      expv[4] = 10'h01a;
      expv[5] = 10'h037;
      expv[6] = 10'h03b;
      expv[7] = 10'h076;
      expv[8] = 10'h062;
      expv[9] = 10'h000;
      expv[10] = 10'h000;
      expv[11] = 10'h000;
      expv[12] = 10'h012;
      expv[13] = 10'h02e;
      expv[14] = 10'h033;
      expv[15] = 10'h062;
      expv[16] = 10'h048;
      expv[17] = 10'h083;
      expv[18] = 10'h074;
      expv[19] = 10'h0da;
      expv[20] = 10'h125;
      expv[21] = 10'h0a4;
      expv[22] = 10'h0d5;
      expv[23] = 10'h0f3;
      expv[24] = 10'h0e2;
      expv[25] = 10'h15a;
      expv[26] = 10'h000;
      expv[27] = 10'h000;
      expv[28] = 10'h000;
      expv[29] = 10'h010;
      expv[30] = 10'h024;
      expv[31] = 10'h02b;
      expv[32] = 10'h031;
      expv[33] = 10'h04a;
      expv[34] = 10'h080;
      expv[35] = 10'h063;
      expv[36] = 10'h0a8;
      expv[37] = 10'h0b9;
      expv[38] = 10'h0c1;
      expv[39] = 10'h0c9;
      expv[40] = 10'h0d6;
      expv[41] = 10'h103;
      expv[42] = 10'h0db;
      expv[43] = 10'h115;
      expv[44] = 10'h15d;
      expv[45] = 10'h134;
      expv[46] = 10'h124;
      expv[47] = 10'h1ae;
      expv[48] = 10'h13e;
      expv[49] = 10'h127;
      expv[50] = 10'h1af;
      expv[51] = 10'h156;
      expv[52] = 10'h124;
      expv[53] = 10'h1a0;
      expv[54] = 10'h0d3;
      expv[55] = 10'h0eb;
      expv[56] = 10'h175;
      expv[57] = 10'h000;
      expv[58] = 10'h000;
      expv[59] = 10'h000;
      expv[60] = 10'h01e;
      expv[61] = 10'h02d;
      expv[62] = 10'h03a;
      expv[63] = 10'h04f;
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
