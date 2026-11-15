// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_034088 dut (
    .clk(clk),
    .nCR(in_vec[12:12]),
    .code(in_vec[11:0]),
    .ctrl_clk(out_vec[10:10]),
    .BCD1(out_vec[9:7]),
    .BCD2(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h0c66;
    stim[1] = 13'h01ed;
    stim[2] = 13'h1e1b;
    stim[3] = 13'h1032;
    stim[4] = 13'h1e0f;
    stim[5] = 13'h14cb;
    stim[6] = 13'h1792;
    stim[7] = 13'h1567;
    stim[8] = 13'h1cd3;
    stim[9] = 13'h1dc0;
    stim[10] = 13'h1fe3;
    stim[11] = 13'h1211;
    stim[12] = 13'h1354;
    stim[13] = 13'h1c9a;
    stim[14] = 13'h1bfc;
    stim[15] = 13'h1282;
    stim[16] = 13'h153d;
    stim[17] = 13'h1b19;
    stim[18] = 13'h1231;
    stim[19] = 13'h147a;
    stim[20] = 13'h1e96;
    stim[21] = 13'h1916;
    stim[22] = 13'h1023;
    stim[23] = 13'h1d91;
    stim[24] = 13'h15bd;
    stim[25] = 13'h1a33;
    stim[26] = 13'h178b;
    stim[27] = 13'h1a26;
    stim[28] = 13'h173e;
    stim[29] = 13'h1be3;
    stim[30] = 13'h198a;
    stim[31] = 13'h1781;
    stim[32] = 13'h14c5;
    stim[33] = 13'h16f5;
    stim[34] = 13'h1690;
    stim[35] = 13'h1fce;
    stim[36] = 13'h1602;
    stim[37] = 13'h1b21;
    stim[38] = 13'h1ad2;
    stim[39] = 13'h197b;
    stim[40] = 13'h0d5d;
    stim[41] = 13'h169a;
    stim[42] = 13'h1863;
    stim[43] = 13'h1693;
    stim[44] = 13'h1178;
    stim[45] = 13'h1ebd;
    stim[46] = 13'h1bd9;
    stim[47] = 13'h1bea;
    stim[48] = 13'h1763;
    stim[49] = 13'h1d4d;
    stim[50] = 13'h1f76;
    stim[51] = 13'h1589;
    stim[52] = 13'h1fd3;
    stim[53] = 13'h1e99;
    stim[54] = 13'h17c4;
    stim[55] = 13'h1b45;
    stim[56] = 13'h12ac;
    stim[57] = 13'h15ff;
    stim[58] = 13'h1591;
    stim[59] = 13'h1eef;
    stim[60] = 13'h138b;
    stim[61] = 13'h1813;
    stim[62] = 13'h11a6;
    stim[63] = 13'h1fe8;
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
      expv[0] = 11'h07e;
      expv[1] = 11'h07e;
      expv[2] = 11'h07e;
      expv[3] = 11'h07e;
      expv[4] = 11'h47e;
      expv[5] = 11'h47e;
      expv[6] = 11'h07e;
      expv[7] = 11'h07e;
      expv[8] = 11'h47e;
      expv[9] = 11'h47e;
      expv[10] = 11'h07e;
      expv[11] = 11'h07e;
      expv[12] = 11'h47e;
      expv[13] = 11'h47e;
      expv[14] = 11'h07e;
      expv[15] = 11'h07e;
      expv[16] = 11'h47e;
      expv[17] = 11'h47e;
      expv[18] = 11'h07e;
      expv[19] = 11'h07e;
      expv[20] = 11'h47e;
      expv[21] = 11'h47e;
      expv[22] = 11'h07e;
      expv[23] = 11'h07e;
      expv[24] = 11'h47e;
      expv[25] = 11'h47e;
      expv[26] = 11'h07e;
      expv[27] = 11'h07e;
      expv[28] = 11'h47e;
      expv[29] = 11'h47e;
      expv[30] = 11'h07e;
      expv[31] = 11'h07e;
      expv[32] = 11'h47e;
      expv[33] = 11'h47e;
      expv[34] = 11'h07e;
      expv[35] = 11'h07e;
      expv[36] = 11'h47e;
      expv[37] = 11'h47e;
      expv[38] = 11'h07e;
      expv[39] = 11'h07e;
      expv[40] = 11'h07e;
      expv[41] = 11'h07e;
      expv[42] = 11'h07e;
      expv[43] = 11'h47e;
      expv[44] = 11'h47e;
      expv[45] = 11'h07e;
      expv[46] = 11'h07e;
      expv[47] = 11'h47e;
      expv[48] = 11'h47e;
      expv[49] = 11'h07e;
      expv[50] = 11'h07e;
      expv[51] = 11'h47e;
      expv[52] = 11'h47e;
      expv[53] = 11'h07e;
      expv[54] = 11'h07e;
      expv[55] = 11'h47e;
      expv[56] = 11'h47e;
      expv[57] = 11'h07e;
      expv[58] = 11'h07e;
      expv[59] = 11'h47e;
      expv[60] = 11'h47e;
      expv[61] = 11'h07e;
      expv[62] = 11'h07e;
      expv[63] = 11'h47e;
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
