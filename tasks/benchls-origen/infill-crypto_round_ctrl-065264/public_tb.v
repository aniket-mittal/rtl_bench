// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_065264 dut (
    .ck(clk),
    .start(in_vec[0:0]),
    .round0(out_vec[16:16]),
    .round1(out_vec[15:15]),
    .round(out_vec[14:10]),
    .ready(out_vec[9:9]),
    .sels(out_vec[8:5]),
    .selk(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 1'h1;
    stim[1] = 1'h1;
    stim[2] = 1'h0;
    stim[3] = 1'h1;
    stim[4] = 1'h1;
    stim[5] = 1'h1;
    stim[6] = 1'h0;
    stim[7] = 1'h0;
    stim[8] = 1'h1;
    stim[9] = 1'h0;
    stim[10] = 1'h1;
    stim[11] = 1'h0;
    stim[12] = 1'h1;
    stim[13] = 1'h1;
    stim[14] = 1'h0;
    stim[15] = 1'h0;
    stim[16] = 1'h1;
    stim[17] = 1'h0;
    stim[18] = 1'h0;
    stim[19] = 1'h1;
    stim[20] = 1'h1;
    stim[21] = 1'h0;
    stim[22] = 1'h1;
    stim[23] = 1'h1;
    stim[24] = 1'h0;
    stim[25] = 1'h0;
    stim[26] = 1'h0;
    stim[27] = 1'h0;
    stim[28] = 1'h0;
    stim[29] = 1'h1;
    stim[30] = 1'h0;
    stim[31] = 1'h1;
    stim[32] = 1'h0;
    stim[33] = 1'h0;
    stim[34] = 1'h1;
    stim[35] = 1'h0;
    stim[36] = 1'h0;
    stim[37] = 1'h0;
    stim[38] = 1'h1;
    stim[39] = 1'h0;
    stim[40] = 1'h0;
    stim[41] = 1'h0;
    stim[42] = 1'h1;
    stim[43] = 1'h1;
    stim[44] = 1'h1;
    stim[45] = 1'h0;
    stim[46] = 1'h1;
    stim[47] = 1'h1;
    stim[48] = 1'h0;
    stim[49] = 1'h0;
    stim[50] = 1'h0;
    stim[51] = 1'h0;
    stim[52] = 1'h0;
    stim[53] = 1'h1;
    stim[54] = 1'h0;
    stim[55] = 1'h1;
    stim[56] = 1'h1;
    stim[57] = 1'h1;
    stim[58] = 1'h1;
    stim[59] = 1'h0;
    stim[60] = 1'h1;
    stim[61] = 1'h0;
    stim[62] = 1'h1;
    stim[63] = 1'h0;
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
      expv[0] = 17'hxxxxx;
      expv[1] = 17'h10020;
      expv[2] = 17'h10020;
      expv[3] = 17'h10040;
      expv[4] = 17'h10020;
      expv[5] = 17'h10020;
      expv[6] = 17'h10020;
      expv[7] = 17'h10040;
      expv[8] = 17'h10080;
      expv[9] = 17'h10020;
      expv[10] = 17'h10040;
      expv[11] = 17'h10020;
      expv[12] = 17'h10040;
      expv[13] = 17'h10020;
      expv[14] = 17'h10020;
      expv[15] = 17'h10040;
      expv[16] = 17'h10080;
      expv[17] = 17'h10020;
      expv[18] = 17'h10040;
      expv[19] = 17'h10080;
      expv[20] = 17'h10020;
      expv[21] = 17'h10020;
      expv[22] = 17'h10040;
      expv[23] = 17'h10020;
      expv[24] = 17'h10020;
      expv[25] = 17'h10040;
      expv[26] = 17'h10080;
      expv[27] = 17'h10100;
      expv[28] = 17'h10001;
      expv[29] = 17'h10002;
      expv[30] = 17'h10020;
      expv[31] = 17'h10040;
      expv[32] = 17'h10020;
      expv[33] = 17'h10040;
      expv[34] = 17'h10080;
      expv[35] = 17'h10020;
      expv[36] = 17'h10040;
      expv[37] = 17'h10080;
      expv[38] = 17'h10100;
      expv[39] = 17'h10020;
      expv[40] = 17'h10040;
      expv[41] = 17'h10080;
      expv[42] = 17'h10100;
      expv[43] = 17'h10020;
      expv[44] = 17'h10020;
      expv[45] = 17'h10020;
      expv[46] = 17'h10040;
      expv[47] = 17'h10020;
      expv[48] = 17'h10020;
      expv[49] = 17'h10040;
      expv[50] = 17'h10080;
      expv[51] = 17'h10100;
      expv[52] = 17'h10001;
      expv[53] = 17'h10002;
      expv[54] = 17'h10020;
      expv[55] = 17'h10040;
      expv[56] = 17'h10020;
      expv[57] = 17'h10020;
      expv[58] = 17'h10020;
      expv[59] = 17'h10020;
      expv[60] = 17'h10040;
      expv[61] = 17'h10020;
      expv[62] = 17'h10040;
      expv[63] = 17'h10020;
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
