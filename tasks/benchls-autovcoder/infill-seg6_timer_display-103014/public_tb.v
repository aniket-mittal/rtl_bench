// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 43;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_103014 dut (
    .CLK_50MHz(clk),
    .Res(in_vec[0:0]),
    .SEG1(out_vec[42:36]),
    .SEG2(out_vec[35:29]),
    .SEG3(out_vec[28:22]),
    .SEG4(out_vec[21:15]),
    .SEG5(out_vec[14:8]),
    .SEG6(out_vec[7:1]),
    .CLK_1Hz(out_vec[0:0])
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
    stim[12] = 1'h1;
    stim[13] = 1'h1;
    stim[14] = 1'h1;
    stim[15] = 1'h1;
    stim[16] = 1'h1;
    stim[17] = 1'h1;
    stim[18] = 1'h1;
    stim[19] = 1'h0;
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
    stim[35] = 1'h0;
    stim[36] = 1'h1;
    stim[37] = 1'h1;
    stim[38] = 1'h1;
    stim[39] = 1'h1;
    stim[40] = 1'h1;
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
      expv[0] = 43'h46ffffffffx;
      expv[1] = 43'h46ffffffffx;
      expv[2] = 43'h46ffffffffx;
      expv[3] = 43'h46ffffffffx;
      expv[4] = 43'h46ffffffffx;
      expv[5] = 43'h46ffffffffx;
      expv[6] = 43'h46ffffffffx;
      expv[7] = 43'h46ffffffffx;
      expv[8] = 43'h46ffffffffx;
      expv[9] = 43'h46ffffffffx;
      expv[10] = 43'h46ffffffffx;
      expv[11] = 43'h46ffffffffx;
      expv[12] = 43'h46ffffffffx;
      expv[13] = 43'h46ffffffffx;
      expv[14] = 43'h46ffffffffx;
      expv[15] = 43'h46ffffffffx;
      expv[16] = 43'h46ffffffffx;
      expv[17] = 43'h46ffffffffx;
      expv[18] = 43'h46ffffffffx;
      expv[19] = 43'h46ffffffffx;
      expv[20] = 43'h46ffffffffx;
      expv[21] = 43'h46ffffffffx;
      expv[22] = 43'h46ffffffffx;
      expv[23] = 43'h46ffffffffx;
      expv[24] = 43'h46ffffffffx;
      expv[25] = 43'h46ffffffffx;
      expv[26] = 43'h46ffffffffx;
      expv[27] = 43'h46ffffffffx;
      expv[28] = 43'h46ffffffffx;
      expv[29] = 43'h46ffffffffx;
      expv[30] = 43'h46ffffffffx;
      expv[31] = 43'h46ffffffffx;
      expv[32] = 43'h46ffffffffx;
      expv[33] = 43'h46ffffffffx;
      expv[34] = 43'h46ffffffffx;
      expv[35] = 43'h46ffffffffx;
      expv[36] = 43'h46ffffffffx;
      expv[37] = 43'h46ffffffffx;
      expv[38] = 43'h46ffffffffx;
      expv[39] = 43'h46ffffffffx;
      expv[40] = 43'h46ffffffffx;
      expv[41] = 43'h46ffffffffx;
      expv[42] = 43'h46ffffffffx;
      expv[43] = 43'h46ffffffffx;
      expv[44] = 43'h46ffffffffx;
      expv[45] = 43'h46ffffffffx;
      expv[46] = 43'h46ffffffffx;
      expv[47] = 43'h46ffffffffx;
      expv[48] = 43'h46ffffffffx;
      expv[49] = 43'h46ffffffffx;
      expv[50] = 43'h46ffffffffx;
      expv[51] = 43'h46ffffffffx;
      expv[52] = 43'h46ffffffffx;
      expv[53] = 43'h46ffffffffx;
      expv[54] = 43'h46ffffffffx;
      expv[55] = 43'h46ffffffffx;
      expv[56] = 43'h46ffffffffx;
      expv[57] = 43'h46ffffffffx;
      expv[58] = 43'h46ffffffffx;
      expv[59] = 43'h46ffffffffx;
      expv[60] = 43'h46ffffffffx;
      expv[61] = 43'h46ffffffffx;
      expv[62] = 43'h46ffffffffx;
      expv[63] = 43'h46ffffffffx;
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
