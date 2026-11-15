// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_099683 dut (
    .sclk(clk),
    .mosi(in_vec[10:10]),
    .negss(in_vec[9:9]),
    .dIn(in_vec[8:1]),
    .write_en(in_vec[0:0]),
    .miso(out_vec[8:8]),
    .dOut(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h28c;
    stim[1] = 11'h44c;
    stim[2] = 11'h3aa;
    stim[3] = 11'h36c;
    stim[4] = 11'h545;
    stim[5] = 11'h284;
    stim[6] = 11'h23b;
    stim[7] = 11'h46d;
    stim[8] = 11'h474;
    stim[9] = 11'h7f4;
    stim[10] = 11'h54e;
    stim[11] = 11'h524;
    stim[12] = 11'h7a9;
    stim[13] = 11'h077;
    stim[14] = 11'h39d;
    stim[15] = 11'h4b5;
    stim[16] = 11'h1ab;
    stim[17] = 11'h50b;
    stim[18] = 11'h25e;
    stim[19] = 11'h61c;
    stim[20] = 11'h6ee;
    stim[21] = 11'h1ab;
    stim[22] = 11'h5dc;
    stim[23] = 11'h462;
    stim[24] = 11'h037;
    stim[25] = 11'h679;
    stim[26] = 11'h2cf;
    stim[27] = 11'h491;
    stim[28] = 11'h128;
    stim[29] = 11'h0e9;
    stim[30] = 11'h58e;
    stim[31] = 11'h134;
    stim[32] = 11'h5bf;
    stim[33] = 11'h00b;
    stim[34] = 11'h585;
    stim[35] = 11'h150;
    stim[36] = 11'h23d;
    stim[37] = 11'h238;
    stim[38] = 11'h2f5;
    stim[39] = 11'h434;
    stim[40] = 11'h16e;
    stim[41] = 11'h44d;
    stim[42] = 11'h7c4;
    stim[43] = 11'h010;
    stim[44] = 11'h5a2;
    stim[45] = 11'h2df;
    stim[46] = 11'h3a5;
    stim[47] = 11'h154;
    stim[48] = 11'h7bc;
    stim[49] = 11'h769;
    stim[50] = 11'h638;
    stim[51] = 11'h779;
    stim[52] = 11'h1c5;
    stim[53] = 11'h7aa;
    stim[54] = 11'h674;
    stim[55] = 11'h4e3;
    stim[56] = 11'h431;
    stim[57] = 11'h6eb;
    stim[58] = 11'h42d;
    stim[59] = 11'h01e;
    stim[60] = 11'h391;
    stim[61] = 11'h624;
    stim[62] = 11'h6c8;
    stim[63] = 11'h413;
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
      expv[2] = 9'hxxx;
      expv[3] = 9'hxxx;
      expv[4] = 9'hxxx;
      expv[5] = 9'h1a2;
      expv[6] = 9'h1a2;
      expv[7] = 9'h1a2;
      expv[8] = 9'h136;
      expv[9] = 9'h06d;
      expv[10] = 9'h06d;
      expv[11] = 9'h0db;
      expv[12] = 9'h1b7;
      expv[13] = 9'h1b7;
      expv[14] = 9'h03b;
      expv[15] = 9'h03b;
      expv[16] = 9'h05a;
      expv[17] = 9'h0d5;
      expv[18] = 9'h185;
      expv[19] = 9'h185;
      expv[20] = 9'h185;
      expv[21] = 9'h185;
      expv[22] = 9'h1d5;
      expv[23] = 9'h1ab;
      expv[24] = 9'h157;
      expv[25] = 9'h01b;
      expv[26] = 9'h01b;
      expv[27] = 9'h01b;
      expv[28] = 9'h048;
      expv[29] = 9'h090;
      expv[30] = 9'h174;
      expv[31] = 9'h0e9;
      expv[32] = 9'h1d2;
      expv[33] = 9'h1df;
      expv[34] = 9'h105;
      expv[35] = 9'h0c2;
      expv[36] = 9'h184;
      expv[37] = 9'h184;
      expv[38] = 9'h184;
      expv[39] = 9'h184;
      expv[40] = 9'h109;
      expv[41] = 9'h012;
      expv[42] = 9'h026;
      expv[43] = 9'h026;
      expv[44] = 9'h04c;
      expv[45] = 9'h199;
      expv[46] = 9'h199;
      expv[47] = 9'h199;
      expv[48] = 9'h032;
      expv[49] = 9'h032;
      expv[50] = 9'h032;
      expv[51] = 9'h032;
      expv[52] = 9'h032;
      expv[53] = 9'h1e2;
      expv[54] = 9'h1e2;
      expv[55] = 9'h1e2;
      expv[56] = 9'h171;
      expv[57] = 9'h018;
      expv[58] = 9'h018;
      expv[59] = 9'h016;
      expv[60] = 9'h02c;
      expv[61] = 9'h02c;
      expv[62] = 9'h02c;
      expv[63] = 9'h02c;
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
