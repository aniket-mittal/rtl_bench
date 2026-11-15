// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_120399 dut (
    .A(in_vec[8:5]),
    .B(in_vec[4:1]),
    .carryIn(in_vec[0:0]),
    .Sum(out_vec[6:3]),
    .carryOut(out_vec[2:2]),
    .PG(out_vec[1:1]),
    .GG(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h0a2;
    stim[1] = 9'h164;
    stim[2] = 9'h1c2;
    stim[3] = 9'h087;
    stim[4] = 9'h132;
    stim[5] = 9'h194;
    stim[6] = 9'h03d;
    stim[7] = 9'h089;
    stim[8] = 9'h058;
    stim[9] = 9'h109;
    stim[10] = 9'h0bb;
    stim[11] = 9'h12a;
    stim[12] = 9'h0cf;
    stim[13] = 9'h051;
    stim[14] = 9'h0c7;
    stim[15] = 9'h05e;
    stim[16] = 9'h105;
    stim[17] = 9'h014;
    stim[18] = 9'h0fa;
    stim[19] = 9'h140;
    stim[20] = 9'h0f9;
    stim[21] = 9'h124;
    stim[22] = 9'h05c;
    stim[23] = 9'h0d2;
    stim[24] = 9'h098;
    stim[25] = 9'h11f;
    stim[26] = 9'h006;
    stim[27] = 9'h082;
    stim[28] = 9'h14e;
    stim[29] = 9'h037;
    stim[30] = 9'h086;
    stim[31] = 9'h192;
    stim[32] = 9'h046;
    stim[33] = 9'h17c;
    stim[34] = 9'h11a;
    stim[35] = 9'h1cd;
    stim[36] = 9'h0f8;
    stim[37] = 9'h133;
    stim[38] = 9'h17d;
    stim[39] = 9'h02a;
    stim[40] = 9'h0f1;
    stim[41] = 9'h1a7;
    stim[42] = 9'h009;
    stim[43] = 9'h0df;
    stim[44] = 9'h0b6;
    stim[45] = 9'h19c;
    stim[46] = 9'h019;
    stim[47] = 9'h1db;
    stim[48] = 9'h1e7;
    stim[49] = 9'h187;
    stim[50] = 9'h01e;
    stim[51] = 9'h0ad;
    stim[52] = 9'h1b2;
    stim[53] = 9'h1e5;
    stim[54] = 9'h03e;
    stim[55] = 9'h067;
    stim[56] = 9'h0a2;
    stim[57] = 9'h018;
    stim[58] = 9'h010;
    stim[59] = 9'h080;
    stim[60] = 9'h115;
    stim[61] = 9'h19a;
    stim[62] = 9'h183;
    stim[63] = 9'h144;
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
      expv[0] = 7'h30;
      expv[1] = 7'h68;
      expv[2] = 7'h7a;
      expv[3] = 7'h40;
      expv[4] = 7'h15;
      expv[5] = 7'h35;
      expv[6] = 7'h06;
      expv[7] = 7'h48;
      expv[8] = 7'h70;
      expv[9] = 7'h68;
      expv[10] = 7'h1d;
      expv[11] = 7'h70;
      expv[12] = 7'h70;
      expv[13] = 7'h58;
      expv[14] = 7'h50;
      expv[15] = 7'h0d;
      expv[16] = 7'h58;
      expv[17] = 7'h50;
      expv[18] = 7'h25;
      expv[19] = 7'h50;
      expv[20] = 7'h25;
      expv[21] = 7'h58;
      expv[22] = 7'h05;
      expv[23] = 7'h7a;
      expv[24] = 7'h05;
      expv[25] = 7'h45;
      expv[26] = 7'h18;
      expv[27] = 7'h28;
      expv[28] = 7'h0d;
      expv[29] = 7'h68;
      expv[30] = 7'h38;
      expv[31] = 7'h2d;
      expv[32] = 7'h28;
      expv[33] = 7'h4d;
      expv[34] = 7'h2d;
      expv[35] = 7'h2d;
      expv[36] = 7'h1d;
      expv[37] = 7'h1d;
      expv[38] = 7'h55;
      expv[39] = 7'h30;
      expv[40] = 7'h06;
      expv[41] = 7'h0d;
      expv[42] = 7'h28;
      expv[43] = 7'h35;
      expv[44] = 7'h05;
      expv[45] = 7'h55;
      expv[46] = 7'h68;
      expv[47] = 7'h65;
      expv[48] = 7'h1d;
      expv[49] = 7'h06;
      expv[50] = 7'h7a;
      expv[51] = 7'h60;
      expv[52] = 7'h35;
      expv[53] = 7'h15;
      expv[54] = 7'h05;
      expv[55] = 7'h38;
      expv[56] = 7'h30;
      expv[57] = 7'h60;
      expv[58] = 7'h40;
      expv[59] = 7'h20;
      expv[60] = 7'h1d;
      expv[61] = 7'h4d;
      expv[62] = 7'h70;
      expv[63] = 7'h60;
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
