// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08158 dut (
    .clk(clk),
    .rst(in_vec[9:9]),
    .intv(in_vec[8:1]),
    .inta(in_vec[0:0]),
    .intr(out_vec[3:3]),
    .iid(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h355;
    stim[1] = 10'h3fd;
    stim[2] = 10'h1c7;
    stim[3] = 10'h08d;
    stim[4] = 10'h068;
    stim[5] = 10'h1b6;
    stim[6] = 10'h1a9;
    stim[7] = 10'h198;
    stim[8] = 10'h1df;
    stim[9] = 10'h0cd;
    stim[10] = 10'h044;
    stim[11] = 10'h0cb;
    stim[12] = 10'h066;
    stim[13] = 10'h191;
    stim[14] = 10'h01f;
    stim[15] = 10'h0f8;
    stim[16] = 10'h088;
    stim[17] = 10'h16d;
    stim[18] = 10'h101;
    stim[19] = 10'h15c;
    stim[20] = 10'h102;
    stim[21] = 10'h07b;
    stim[22] = 10'h158;
    stim[23] = 10'h1d7;
    stim[24] = 10'h128;
    stim[25] = 10'h113;
    stim[26] = 10'h16c;
    stim[27] = 10'h1a4;
    stim[28] = 10'h0e7;
    stim[29] = 10'h135;
    stim[30] = 10'h13e;
    stim[31] = 10'h183;
    stim[32] = 10'h10c;
    stim[33] = 10'h0dc;
    stim[34] = 10'h119;
    stim[35] = 10'h0b9;
    stim[36] = 10'h11a;
    stim[37] = 10'h1bd;
    stim[38] = 10'h1e1;
    stim[39] = 10'h03f;
    stim[40] = 10'h1bd;
    stim[41] = 10'h0e0;
    stim[42] = 10'h03e;
    stim[43] = 10'h0e0;
    stim[44] = 10'h0b3;
    stim[45] = 10'h08c;
    stim[46] = 10'h191;
    stim[47] = 10'h1e5;
    stim[48] = 10'h1ae;
    stim[49] = 10'h1a8;
    stim[50] = 10'h094;
    stim[51] = 10'h10d;
    stim[52] = 10'h03f;
    stim[53] = 10'h077;
    stim[54] = 10'h1d0;
    stim[55] = 10'h132;
    stim[56] = 10'h122;
    stim[57] = 10'h194;
    stim[58] = 10'h054;
    stim[59] = 10'h128;
    stim[60] = 10'h071;
    stim[61] = 10'h05f;
    stim[62] = 10'h120;
    stim[63] = 10'h077;
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
      expv[0] = 4'hx;
      expv[1] = 4'h0;
      expv[2] = 4'h0;
      expv[3] = 4'h8;
      expv[4] = 4'h8;
      expv[5] = 4'h8;
      expv[6] = 4'h9;
      expv[7] = 4'h9;
      expv[8] = 4'h8;
      expv[9] = 4'h8;
      expv[10] = 4'h8;
      expv[11] = 4'h8;
      expv[12] = 4'h8;
      expv[13] = 4'h8;
      expv[14] = 4'h8;
      expv[15] = 4'h8;
      expv[16] = 4'h8;
      expv[17] = 4'h9;
      expv[18] = 4'h9;
      expv[19] = 4'h9;
      expv[20] = 4'h9;
      expv[21] = 4'h9;
      expv[22] = 4'h9;
      expv[23] = 4'h8;
      expv[24] = 4'h8;
      expv[25] = 4'h8;
      expv[26] = 4'h8;
      expv[27] = 4'h8;
      expv[28] = 4'h9;
      expv[29] = 4'h9;
      expv[30] = 4'h9;
      expv[31] = 4'h8;
      expv[32] = 4'h8;
      expv[33] = 4'h8;
      expv[34] = 4'h9;
      expv[35] = 4'h9;
      expv[36] = 4'h9;
      expv[37] = 4'h9;
      expv[38] = 4'h9;
      expv[39] = 4'h9;
      expv[40] = 4'h9;
      expv[41] = 4'h9;
      expv[42] = 4'h8;
      expv[43] = 4'h8;
      expv[44] = 4'h8;
      expv[45] = 4'h8;
      expv[46] = 4'h8;
      expv[47] = 4'h8;
      expv[48] = 4'h8;
      expv[49] = 4'h9;
      expv[50] = 4'h8;
      expv[51] = 4'h8;
      expv[52] = 4'h8;
      expv[53] = 4'h8;
      expv[54] = 4'h8;
      expv[55] = 4'h8;
      expv[56] = 4'h9;
      expv[57] = 4'h8;
      expv[58] = 4'h8;
      expv[59] = 4'h8;
      expv[60] = 4'h8;
      expv[61] = 4'h8;
      expv[62] = 4'h8;
      expv[63] = 4'h8;
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
