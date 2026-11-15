// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10675 dut (
    .clock(clk),
    .reset_l(in_vec[2:2]),
    .A(in_vec[1:1]),
    .B(in_vec[0:0]),
    .CurrentCount(out_vec[32:1]),
    .Direction(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h5;
    stim[1] = 3'h7;
    stim[2] = 3'h0;
    stim[3] = 3'h1;
    stim[4] = 3'h0;
    stim[5] = 3'h1;
    stim[6] = 3'h2;
    stim[7] = 3'h3;
    stim[8] = 3'h1;
    stim[9] = 3'h0;
    stim[10] = 3'h1;
    stim[11] = 3'h0;
    stim[12] = 3'h7;
    stim[13] = 3'h1;
    stim[14] = 3'h2;
    stim[15] = 3'h0;
    stim[16] = 3'h1;
    stim[17] = 3'h3;
    stim[18] = 3'h1;
    stim[19] = 3'h3;
    stim[20] = 3'h1;
    stim[21] = 3'h2;
    stim[22] = 3'h3;
    stim[23] = 3'h1;
    stim[24] = 3'h2;
    stim[25] = 3'h3;
    stim[26] = 3'h2;
    stim[27] = 3'h3;
    stim[28] = 3'h2;
    stim[29] = 3'h1;
    stim[30] = 3'h1;
    stim[31] = 3'h3;
    stim[32] = 3'h3;
    stim[33] = 3'h3;
    stim[34] = 3'h2;
    stim[35] = 3'h3;
    stim[36] = 3'h1;
    stim[37] = 3'h2;
    stim[38] = 3'h3;
    stim[39] = 3'h1;
    stim[40] = 3'h1;
    stim[41] = 3'h0;
    stim[42] = 3'h0;
    stim[43] = 3'h3;
    stim[44] = 3'h2;
    stim[45] = 3'h3;
    stim[46] = 3'h3;
    stim[47] = 3'h0;
    stim[48] = 3'h2;
    stim[49] = 3'h1;
    stim[50] = 3'h1;
    stim[51] = 3'h0;
    stim[52] = 3'h0;
    stim[53] = 3'h3;
    stim[54] = 3'h1;
    stim[55] = 3'h0;
    stim[56] = 3'h1;
    stim[57] = 3'h0;
    stim[58] = 3'h2;
    stim[59] = 3'h3;
    stim[60] = 3'h0;
    stim[61] = 3'h2;
    stim[62] = 3'h0;
    stim[63] = 3'h3;
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
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'hxxxxxxxxx;
      expv[2] = 33'hxxxxxxxxx;
      expv[3] = 33'h100000000;
      expv[4] = 33'h100000000;
      expv[5] = 33'h100000000;
      expv[6] = 33'h100000000;
      expv[7] = 33'h100000000;
      expv[8] = 33'h100000000;
      expv[9] = 33'h100000000;
      expv[10] = 33'h100000000;
      expv[11] = 33'h100000000;
      expv[12] = 33'h100000000;
      expv[13] = 33'h100000003;
      expv[14] = 33'h100000001;
      expv[15] = 33'h100000001;
      expv[16] = 33'h100000001;
      expv[17] = 33'h100000001;
      expv[18] = 33'h100000001;
      expv[19] = 33'h100000001;
      expv[20] = 33'h100000001;
      expv[21] = 33'h100000001;
      expv[22] = 33'h100000001;
      expv[23] = 33'h100000001;
      expv[24] = 33'h100000001;
      expv[25] = 33'h100000001;
      expv[26] = 33'h100000001;
      expv[27] = 33'h100000001;
      expv[28] = 33'h100000001;
      expv[29] = 33'h100000001;
      expv[30] = 33'h100000001;
      expv[31] = 33'h100000001;
      expv[32] = 33'h100000001;
      expv[33] = 33'h100000001;
      expv[34] = 33'h100000001;
      expv[35] = 33'h100000001;
      expv[36] = 33'h100000001;
      expv[37] = 33'h100000001;
      expv[38] = 33'h100000001;
      expv[39] = 33'h100000001;
      expv[40] = 33'h100000001;
      expv[41] = 33'h100000001;
      expv[42] = 33'h100000001;
      expv[43] = 33'h100000001;
      expv[44] = 33'h100000001;
      expv[45] = 33'h100000001;
      expv[46] = 33'h100000001;
      expv[47] = 33'h100000001;
      expv[48] = 33'h100000001;
      expv[49] = 33'h100000001;
      expv[50] = 33'h100000001;
      expv[51] = 33'h100000001;
      expv[52] = 33'h100000001;
      expv[53] = 33'h100000001;
      expv[54] = 33'h100000001;
      expv[55] = 33'h100000001;
      expv[56] = 33'h100000001;
      expv[57] = 33'h100000001;
      expv[58] = 33'h100000001;
      expv[59] = 33'h100000001;
      expv[60] = 33'h100000001;
      expv[61] = 33'h100000001;
      expv[62] = 33'h100000001;
      expv[63] = 33'h100000001;
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
