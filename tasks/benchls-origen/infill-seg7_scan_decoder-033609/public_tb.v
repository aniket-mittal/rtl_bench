// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_033609 dut (
    .clk(clk),
    .rst(in_vec[0:0]),
    .dataout(out_vec[12:5]),
    .U3_138_A(out_vec[4:2]),
    .U2_138_select(out_vec[1:1]),
    .U3_138_select(out_vec[0:0])
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
    stim[3] = 1'h0;
    stim[4] = 1'h0;
    stim[5] = 1'h0;
    stim[6] = 1'h0;
    stim[7] = 1'h0;
    stim[8] = 1'h0;
    stim[9] = 1'h0;
    stim[10] = 1'h0;
    stim[11] = 1'h0;
    stim[12] = 1'h0;
    stim[13] = 1'h0;
    stim[14] = 1'h0;
    stim[15] = 1'h0;
    stim[16] = 1'h0;
    stim[17] = 1'h0;
    stim[18] = 1'h0;
    stim[19] = 1'h1;
    stim[20] = 1'h0;
    stim[21] = 1'h0;
    stim[22] = 1'h0;
    stim[23] = 1'h0;
    stim[24] = 1'h0;
    stim[25] = 1'h0;
    stim[26] = 1'h0;
    stim[27] = 1'h0;
    stim[28] = 1'h0;
    stim[29] = 1'h0;
    stim[30] = 1'h0;
    stim[31] = 1'h0;
    stim[32] = 1'h0;
    stim[33] = 1'h0;
    stim[34] = 1'h0;
    stim[35] = 1'h0;
    stim[36] = 1'h0;
    stim[37] = 1'h0;
    stim[38] = 1'h0;
    stim[39] = 1'h0;
    stim[40] = 1'h0;
    stim[41] = 1'h0;
    stim[42] = 1'h0;
    stim[43] = 1'h0;
    stim[44] = 1'h0;
    stim[45] = 1'h0;
    stim[46] = 1'h0;
    stim[47] = 1'h0;
    stim[48] = 1'h0;
    stim[49] = 1'h0;
    stim[50] = 1'h0;
    stim[51] = 1'h0;
    stim[52] = 1'h0;
    stim[53] = 1'h0;
    stim[54] = 1'h0;
    stim[55] = 1'h0;
    stim[56] = 1'h0;
    stim[57] = 1'h0;
    stim[58] = 1'h0;
    stim[59] = 1'h0;
    stim[60] = 1'h0;
    stim[61] = 1'h0;
    stim[62] = 1'h0;
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
      expv[0] = 13'h1f81;
      expv[1] = 13'h1f81;
      expv[2] = 13'h1f81;
      expv[3] = 13'h1f81;
      expv[4] = 13'h1f81;
      expv[5] = 13'h1f81;
      expv[6] = 13'h1f81;
      expv[7] = 13'h1f81;
      expv[8] = 13'h1f81;
      expv[9] = 13'h1f81;
      expv[10] = 13'h1f81;
      expv[11] = 13'h1f81;
      expv[12] = 13'h1f81;
      expv[13] = 13'h1f81;
      expv[14] = 13'h1f81;
      expv[15] = 13'h1f81;
      expv[16] = 13'h1f81;
      expv[17] = 13'h1f81;
      expv[18] = 13'h1f81;
      expv[19] = 13'h1f81;
      expv[20] = 13'h1f81;
      expv[21] = 13'h1f81;
      expv[22] = 13'h1f81;
      expv[23] = 13'h1f81;
      expv[24] = 13'h1f81;
      expv[25] = 13'h1f81;
      expv[26] = 13'h1f81;
      expv[27] = 13'h1f81;
      expv[28] = 13'h1f81;
      expv[29] = 13'h1f81;
      expv[30] = 13'h1f81;
      expv[31] = 13'h1f81;
      expv[32] = 13'h1f81;
      expv[33] = 13'h1f81;
      expv[34] = 13'h1f81;
      expv[35] = 13'h1f81;
      expv[36] = 13'h1f81;
      expv[37] = 13'h1f81;
      expv[38] = 13'h1f81;
      expv[39] = 13'h1f81;
      expv[40] = 13'h1f81;
      expv[41] = 13'h1f81;
      expv[42] = 13'h1f81;
      expv[43] = 13'h1f81;
      expv[44] = 13'h1f81;
      expv[45] = 13'h1f81;
      expv[46] = 13'h1f81;
      expv[47] = 13'h1f81;
      expv[48] = 13'h1f81;
      expv[49] = 13'h1f81;
      expv[50] = 13'h1f81;
      expv[51] = 13'h1f81;
      expv[52] = 13'h1f81;
      expv[53] = 13'h1f81;
      expv[54] = 13'h1f81;
      expv[55] = 13'h1f81;
      expv[56] = 13'h1f81;
      expv[57] = 13'h1f81;
      expv[58] = 13'h1f81;
      expv[59] = 13'h1f81;
      expv[60] = 13'h1f81;
      expv[61] = 13'h1f81;
      expv[62] = 13'h1f81;
      expv[63] = 13'h1f81;
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
