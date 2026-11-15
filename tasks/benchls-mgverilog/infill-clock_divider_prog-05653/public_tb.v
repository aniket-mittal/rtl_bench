// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05653 dut (
    .clk(clk),
    .modulo(in_vec[9:0]),
    .count(out_vec[10:1]),
    .oClk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h0cb;
    stim[1] = 10'h1b6;
    stim[2] = 10'h109;
    stim[3] = 10'h266;
    stim[4] = 10'h142;
    stim[5] = 10'h004;
    stim[6] = 10'h3ab;
    stim[7] = 10'h3cc;
    stim[8] = 10'h2d9;
    stim[9] = 10'h32d;
    stim[10] = 10'h3a0;
    stim[11] = 10'h121;
    stim[12] = 10'h0f9;
    stim[13] = 10'h2ba;
    stim[14] = 10'h0c9;
    stim[15] = 10'h22c;
    stim[16] = 10'h3e7;
    stim[17] = 10'h248;
    stim[18] = 10'h2aa;
    stim[19] = 10'h3b0;
    stim[20] = 10'h38a;
    stim[21] = 10'h171;
    stim[22] = 10'h043;
    stim[23] = 10'h186;
    stim[24] = 10'h09c;
    stim[25] = 10'h308;
    stim[26] = 10'h25a;
    stim[27] = 10'h070;
    stim[28] = 10'h39b;
    stim[29] = 10'h156;
    stim[30] = 10'h326;
    stim[31] = 10'h38c;
    stim[32] = 10'h3ae;
    stim[33] = 10'h359;
    stim[34] = 10'h2ff;
    stim[35] = 10'h3f5;
    stim[36] = 10'h239;
    stim[37] = 10'h144;
    stim[38] = 10'h181;
    stim[39] = 10'h065;
    stim[40] = 10'h248;
    stim[41] = 10'h21c;
    stim[42] = 10'h05b;
    stim[43] = 10'h0cf;
    stim[44] = 10'h3f8;
    stim[45] = 10'h21d;
    stim[46] = 10'h334;
    stim[47] = 10'h0e6;
    stim[48] = 10'h365;
    stim[49] = 10'h190;
    stim[50] = 10'h145;
    stim[51] = 10'h39d;
    stim[52] = 10'h0dd;
    stim[53] = 10'h3aa;
    stim[54] = 10'h304;
    stim[55] = 10'h2f8;
    stim[56] = 10'h311;
    stim[57] = 10'h1f2;
    stim[58] = 10'h288;
    stim[59] = 10'h349;
    stim[60] = 10'h2ce;
    stim[61] = 10'h019;
    stim[62] = 10'h38e;
    stim[63] = 10'h01b;
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
      expv[0] = 11'h000;
      expv[1] = 11'h002;
      expv[2] = 11'h004;
      expv[3] = 11'h006;
      expv[4] = 11'h008;
      expv[5] = 11'h00b;
      expv[6] = 11'h000;
      expv[7] = 11'h002;
      expv[8] = 11'h004;
      expv[9] = 11'h006;
      expv[10] = 11'h008;
      expv[11] = 11'h00a;
      expv[12] = 11'h00c;
      expv[13] = 11'h00e;
      expv[14] = 11'h010;
      expv[15] = 11'h012;
      expv[16] = 11'h014;
      expv[17] = 11'h016;
      expv[18] = 11'h018;
      expv[19] = 11'h01a;
      expv[20] = 11'h01c;
      expv[21] = 11'h01e;
      expv[22] = 11'h020;
      expv[23] = 11'h022;
      expv[24] = 11'h024;
      expv[25] = 11'h026;
      expv[26] = 11'h028;
      expv[27] = 11'h02a;
      expv[28] = 11'h02c;
      expv[29] = 11'h02e;
      expv[30] = 11'h030;
      expv[31] = 11'h032;
      expv[32] = 11'h034;
      expv[33] = 11'h036;
      expv[34] = 11'h038;
      expv[35] = 11'h03a;
      expv[36] = 11'h03c;
      expv[37] = 11'h03e;
      expv[38] = 11'h040;
      expv[39] = 11'h042;
      expv[40] = 11'h044;
      expv[41] = 11'h046;
      expv[42] = 11'h048;
      expv[43] = 11'h04a;
      expv[44] = 11'h04c;
      expv[45] = 11'h04e;
      expv[46] = 11'h050;
      expv[47] = 11'h052;
      expv[48] = 11'h054;
      expv[49] = 11'h056;
      expv[50] = 11'h058;
      expv[51] = 11'h05a;
      expv[52] = 11'h05c;
      expv[53] = 11'h05e;
      expv[54] = 11'h060;
      expv[55] = 11'h062;
      expv[56] = 11'h064;
      expv[57] = 11'h066;
      expv[58] = 11'h068;
      expv[59] = 11'h06a;
      expv[60] = 11'h06c;
      expv[61] = 11'h06f;
      expv[62] = 11'h000;
      expv[63] = 11'h002;
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
