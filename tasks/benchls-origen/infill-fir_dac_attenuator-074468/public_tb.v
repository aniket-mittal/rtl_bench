// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_074468 dut (
    .clk(clk),
    .DAC_in(in_vec[17:4]),
    .Sel_att(in_vec[3:0]),
    .DAC_out(out_vec[13:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h14d2a;
    stim[1] = 18'h3955e;
    stim[2] = 18'h0edb5;
    stim[3] = 18'h19978;
    stim[4] = 18'h34a77;
    stim[5] = 18'h331ec;
    stim[6] = 18'h270dc;
    stim[7] = 18'h2e47b;
    stim[8] = 18'h0e070;
    stim[9] = 18'h097b9;
    stim[10] = 18'h1e05a;
    stim[11] = 18'h21781;
    stim[12] = 18'h2cc18;
    stim[13] = 18'h0c696;
    stim[14] = 18'h15905;
    stim[15] = 18'h373b7;
    stim[16] = 18'h17264;
    stim[17] = 18'h27430;
    stim[18] = 18'h3059a;
    stim[19] = 18'h010a8;
    stim[20] = 18'h05193;
    stim[21] = 18'h12586;
    stim[22] = 18'h2d490;
    stim[23] = 18'h1fd35;
    stim[24] = 18'h07c53;
    stim[25] = 18'h3b369;
    stim[26] = 18'h3c5e8;
    stim[27] = 18'h3f59a;
    stim[28] = 18'h0b2c9;
    stim[29] = 18'h1e25c;
    stim[30] = 18'h0cd0e;
    stim[31] = 18'h03ee3;
    stim[32] = 18'h1a7ea;
    stim[33] = 18'h0aec6;
    stim[34] = 18'h214a7;
    stim[35] = 18'h19ae0;
    stim[36] = 18'h3971d;
    stim[37] = 18'h309fa;
    stim[38] = 18'h29056;
    stim[39] = 18'h38457;
    stim[40] = 18'h21601;
    stim[41] = 18'h2c943;
    stim[42] = 18'h279b2;
    stim[43] = 18'h35b95;
    stim[44] = 18'h2bff2;
    stim[45] = 18'h0898f;
    stim[46] = 18'h13d5a;
    stim[47] = 18'h16c93;
    stim[48] = 18'h133c2;
    stim[49] = 18'h08b4b;
    stim[50] = 18'h2f3d4;
    stim[51] = 18'h17561;
    stim[52] = 18'h20a2b;
    stim[53] = 18'h03996;
    stim[54] = 18'h0982c;
    stim[55] = 18'h0b202;
    stim[56] = 18'h0b690;
    stim[57] = 18'h37742;
    stim[58] = 18'h00565;
    stim[59] = 18'h32730;
    stim[60] = 18'h199db;
    stim[61] = 18'h0ffcf;
    stim[62] = 18'h2cf51;
    stim[63] = 18'h25e98;
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
      expv[0] = 14'hxxxx;
      expv[1] = 14'h14d2;
      expv[2] = 14'h3955;
      expv[3] = 14'h0edb;
      expv[4] = 14'h0199;
      expv[5] = 14'h04a7;
      expv[6] = 14'h331e;
      expv[7] = 14'h270d;
      expv[8] = 14'h2e47;
      expv[9] = 14'h0703;
      expv[10] = 14'h097b;
      expv[11] = 14'h1e05;
      expv[12] = 14'h2178;
      expv[13] = 14'h02cc;
      expv[14] = 14'h0c69;
      expv[15] = 14'h1590;
      expv[16] = 14'h073b;
      expv[17] = 14'h02e4;
      expv[18] = 14'h13a1;
      expv[19] = 14'h3059;
      expv[20] = 14'h0010;
      expv[21] = 14'h1bf3;
      expv[22] = 14'h1258;
      expv[23] = 14'h16a4;
      expv[24] = 14'h1fd3;
      expv[25] = 14'h1923;
      expv[26] = 14'h3b36;
      expv[27] = 14'h03c5;
      expv[28] = 14'h3f59;
      expv[29] = 14'h0b2c;
      expv[30] = 14'h1e25;
      expv[31] = 14'h0cd0;
      expv[32] = 14'h1d5e;
      expv[33] = 14'h1a7e;
      expv[34] = 14'h0aec;
      expv[35] = 14'h314a;
      expv[36] = 14'h0cd7;
      expv[37] = 14'h3971;
      expv[38] = 14'h309f;
      expv[39] = 14'h2905;
      expv[40] = 14'h0845;
      expv[41] = 14'h2160;
      expv[42] = 14'h2cd2;
      expv[43] = 14'h09e6;
      expv[44] = 14'h35b9;
      expv[45] = 14'h0aff;
      expv[46] = 14'h2ad2;
      expv[47] = 14'h13d5;
      expv[48] = 14'h1f89;
      expv[49] = 14'h04cf;
      expv[50] = 14'h08b4;
      expv[51] = 14'h05e7;
      expv[52] = 14'h1756;
      expv[53] = 14'h20a2;
      expv[54] = 14'h0399;
      expv[55] = 14'h0982;
      expv[56] = 14'h02c8;
      expv[57] = 14'h05b4;
      expv[58] = 14'h0ddd;
      expv[59] = 14'h0056;
      expv[60] = 14'h1939;
      expv[61] = 14'h199d;
      expv[62] = 14'h1d69;
      expv[63] = 14'h2cf5;
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
