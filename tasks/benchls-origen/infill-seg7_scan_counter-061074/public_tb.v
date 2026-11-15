// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_061074 dut (
    .CLK_50M(clk),
    .RST_N(in_vec[0:0]),
    .SEG_DATA(out_vec[13:6]),
    .SEG_EN(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 1'h0;
    stim[1] = 1'h0;
    stim[2] = 1'h1;
    stim[3] = 1'h1;
    stim[4] = 1'h1;
    stim[5] = 1'h1;
    stim[6] = 1'h1;
    stim[7] = 1'h1;
    stim[8] = 1'h1;
    stim[9] = 1'h1;
    stim[10] = 1'h1;
    stim[11] = 1'h1;
    stim[12] = 1'h0;
    stim[13] = 1'h1;
    stim[14] = 1'h1;
    stim[15] = 1'h1;
    stim[16] = 1'h1;
    stim[17] = 1'h1;
    stim[18] = 1'h1;
    stim[19] = 1'h1;
    stim[20] = 1'h1;
    stim[21] = 1'h1;
    stim[22] = 1'h1;
    stim[23] = 1'h1;
    stim[24] = 1'h1;
    stim[25] = 1'h1;
    stim[26] = 1'h1;
    stim[27] = 1'h1;
    stim[28] = 1'h1;
    stim[29] = 1'h1;
    stim[30] = 1'h1;
    stim[31] = 1'h1;
    stim[32] = 1'h1;
    stim[33] = 1'h1;
    stim[34] = 1'h1;
    stim[35] = 1'h1;
    stim[36] = 1'h1;
    stim[37] = 1'h1;
    stim[38] = 1'h1;
    stim[39] = 1'h1;
    stim[40] = 1'h0;
    stim[41] = 1'h1;
    stim[42] = 1'h1;
    stim[43] = 1'h1;
    stim[44] = 1'h1;
    stim[45] = 1'h1;
    stim[46] = 1'h1;
    stim[47] = 1'h1;
    stim[48] = 1'h1;
    stim[49] = 1'h1;
    stim[50] = 1'h1;
    stim[51] = 1'h1;
    stim[52] = 1'h1;
    stim[53] = 1'h1;
    stim[54] = 1'h1;
    stim[55] = 1'h1;
    stim[56] = 1'h1;
    stim[57] = 1'h1;
    stim[58] = 1'h1;
    stim[59] = 1'h1;
    stim[60] = 1'h1;
    stim[61] = 1'h1;
    stim[62] = 1'h1;
    stim[63] = 1'h1;
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
      expv[0] = 14'h0ffe;
      expv[1] = 14'h0ffe;
      expv[2] = 14'h0ffe;
      expv[3] = 14'h0ffe;
      expv[4] = 14'h0ffe;
      expv[5] = 14'h0ffe;
      expv[6] = 14'h0ffe;
      expv[7] = 14'h0ffe;
      expv[8] = 14'h0ffe;
      expv[9] = 14'h0ffe;
      expv[10] = 14'h0ffe;
      expv[11] = 14'h0ffe;
      expv[12] = 14'h0ffe;
      expv[13] = 14'h0ffe;
      expv[14] = 14'h0ffe;
      expv[15] = 14'h0ffe;
      expv[16] = 14'h0ffe;
      expv[17] = 14'h0ffe;
      expv[18] = 14'h0ffe;
      expv[19] = 14'h0ffe;
      expv[20] = 14'h0ffe;
      expv[21] = 14'h0ffe;
      expv[22] = 14'h0ffe;
      expv[23] = 14'h0ffe;
      expv[24] = 14'h0ffe;
      expv[25] = 14'h0ffe;
      expv[26] = 14'h0ffe;
      expv[27] = 14'h0ffe;
      expv[28] = 14'h0ffe;
      expv[29] = 14'h0ffe;
      expv[30] = 14'h0ffe;
      expv[31] = 14'h0ffe;
      expv[32] = 14'h0ffe;
      expv[33] = 14'h0ffe;
      expv[34] = 14'h0ffe;
      expv[35] = 14'h0ffe;
      expv[36] = 14'h0ffe;
      expv[37] = 14'h0ffe;
      expv[38] = 14'h0ffe;
      expv[39] = 14'h0ffe;
      expv[40] = 14'h0ffe;
      expv[41] = 14'h0ffe;
      expv[42] = 14'h0ffe;
      expv[43] = 14'h0ffe;
      expv[44] = 14'h0ffe;
      expv[45] = 14'h0ffe;
      expv[46] = 14'h0ffe;
      expv[47] = 14'h0ffe;
      expv[48] = 14'h0ffe;
      expv[49] = 14'h0ffe;
      expv[50] = 14'h0ffe;
      expv[51] = 14'h0ffe;
      expv[52] = 14'h0ffe;
      expv[53] = 14'h0ffe;
      expv[54] = 14'h0ffe;
      expv[55] = 14'h0ffe;
      expv[56] = 14'h0ffe;
      expv[57] = 14'h0ffe;
      expv[58] = 14'h0ffe;
      expv[59] = 14'h0ffe;
      expv[60] = 14'h0ffe;
      expv[61] = 14'h0ffe;
      expv[62] = 14'h0ffe;
      expv[63] = 14'h0ffe;
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
