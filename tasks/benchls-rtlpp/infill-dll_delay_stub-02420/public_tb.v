// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02420 dut (
    .dll_clk(clk),
    .dll_delayctrlout(out_vec[5:0])
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
    stim[19] = 1'h0;
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
      expv[0] = 6'h2a;
      expv[1] = 6'h2a;
      expv[2] = 6'h2a;
      expv[3] = 6'h2a;
      expv[4] = 6'h2a;
      expv[5] = 6'h2a;
      expv[6] = 6'h2a;
      expv[7] = 6'h2a;
      expv[8] = 6'h2a;
      expv[9] = 6'h2a;
      expv[10] = 6'h2a;
      expv[11] = 6'h2a;
      expv[12] = 6'h2a;
      expv[13] = 6'h2a;
      expv[14] = 6'h2a;
      expv[15] = 6'h2a;
      expv[16] = 6'h2a;
      expv[17] = 6'h2a;
      expv[18] = 6'h2a;
      expv[19] = 6'h2a;
      expv[20] = 6'h2a;
      expv[21] = 6'h2a;
      expv[22] = 6'h2a;
      expv[23] = 6'h2a;
      expv[24] = 6'h2a;
      expv[25] = 6'h2a;
      expv[26] = 6'h2a;
      expv[27] = 6'h2a;
      expv[28] = 6'h2a;
      expv[29] = 6'h2a;
      expv[30] = 6'h2a;
      expv[31] = 6'h2a;
      expv[32] = 6'h2a;
      expv[33] = 6'h2a;
      expv[34] = 6'h2a;
      expv[35] = 6'h2a;
      expv[36] = 6'h2a;
      expv[37] = 6'h2a;
      expv[38] = 6'h2a;
      expv[39] = 6'h2a;
      expv[40] = 6'h2a;
      expv[41] = 6'h2a;
      expv[42] = 6'h2a;
      expv[43] = 6'h2a;
      expv[44] = 6'h2a;
      expv[45] = 6'h2a;
      expv[46] = 6'h2a;
      expv[47] = 6'h2a;
      expv[48] = 6'h2a;
      expv[49] = 6'h2a;
      expv[50] = 6'h2a;
      expv[51] = 6'h2a;
      expv[52] = 6'h2a;
      expv[53] = 6'h2a;
      expv[54] = 6'h2a;
      expv[55] = 6'h2a;
      expv[56] = 6'h2a;
      expv[57] = 6'h2a;
      expv[58] = 6'h2a;
      expv[59] = 6'h2a;
      expv[60] = 6'h2a;
      expv[61] = 6'h2a;
      expv[62] = 6'h2a;
      expv[63] = 6'h2a;
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
