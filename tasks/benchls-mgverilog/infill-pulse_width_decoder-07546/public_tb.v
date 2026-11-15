// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07546 dut (
    .refclk_i(clk),
    .fsclk_i(in_vec[1:1]),
    .rst_i(in_vec[0:0]),
    .result_o(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 2'h3;
    stim[1] = 2'h3;
    stim[2] = 2'h0;
    stim[3] = 2'h0;
    stim[4] = 2'h2;
    stim[5] = 2'h0;
    stim[6] = 2'h0;
    stim[7] = 2'h2;
    stim[8] = 2'h0;
    stim[9] = 2'h0;
    stim[10] = 2'h0;
    stim[11] = 2'h0;
    stim[12] = 2'h0;
    stim[13] = 2'h2;
    stim[14] = 2'h0;
    stim[15] = 2'h2;
    stim[16] = 2'h0;
    stim[17] = 2'h2;
    stim[18] = 2'h0;
    stim[19] = 2'h0;
    stim[20] = 2'h0;
    stim[21] = 2'h0;
    stim[22] = 2'h0;
    stim[23] = 2'h2;
    stim[24] = 2'h2;
    stim[25] = 2'h0;
    stim[26] = 2'h2;
    stim[27] = 2'h2;
    stim[28] = 2'h2;
    stim[29] = 2'h0;
    stim[30] = 2'h2;
    stim[31] = 2'h2;
    stim[32] = 2'h0;
    stim[33] = 2'h2;
    stim[34] = 2'h0;
    stim[35] = 2'h2;
    stim[36] = 2'h0;
    stim[37] = 2'h2;
    stim[38] = 2'h2;
    stim[39] = 2'h0;
    stim[40] = 2'h2;
    stim[41] = 2'h2;
    stim[42] = 2'h0;
    stim[43] = 2'h2;
    stim[44] = 2'h2;
    stim[45] = 2'h0;
    stim[46] = 2'h2;
    stim[47] = 2'h2;
    stim[48] = 2'h0;
    stim[49] = 2'h2;
    stim[50] = 2'h0;
    stim[51] = 2'h2;
    stim[52] = 2'h2;
    stim[53] = 2'h2;
    stim[54] = 2'h0;
    stim[55] = 2'h0;
    stim[56] = 2'h2;
    stim[57] = 2'h2;
    stim[58] = 2'h0;
    stim[59] = 2'h0;
    stim[60] = 2'h2;
    stim[61] = 2'h2;
    stim[62] = 2'h2;
    stim[63] = 2'h0;
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
      expv[0] = 4'hf;
      expv[1] = 4'hf;
      expv[2] = 4'hf;
      expv[3] = 4'hf;
      expv[4] = 4'hf;
      expv[5] = 4'hf;
      expv[6] = 4'hf;
      expv[7] = 4'hf;
      expv[8] = 4'he;
      expv[9] = 4'he;
      expv[10] = 4'he;
      expv[11] = 4'he;
      expv[12] = 4'he;
      expv[13] = 4'he;
      expv[14] = 4'he;
      expv[15] = 4'he;
      expv[16] = 4'he;
      expv[17] = 4'he;
      expv[18] = 4'he;
      expv[19] = 4'he;
      expv[20] = 4'he;
      expv[21] = 4'he;
      expv[22] = 4'he;
      expv[23] = 4'he;
      expv[24] = 4'he;
      expv[25] = 4'he;
      expv[26] = 4'he;
      expv[27] = 4'he;
      expv[28] = 4'he;
      expv[29] = 4'he;
      expv[30] = 4'he;
      expv[31] = 4'he;
      expv[32] = 4'he;
      expv[33] = 4'he;
      expv[34] = 4'he;
      expv[35] = 4'he;
      expv[36] = 4'he;
      expv[37] = 4'he;
      expv[38] = 4'he;
      expv[39] = 4'he;
      expv[40] = 4'he;
      expv[41] = 4'he;
      expv[42] = 4'he;
      expv[43] = 4'he;
      expv[44] = 4'he;
      expv[45] = 4'he;
      expv[46] = 4'he;
      expv[47] = 4'he;
      expv[48] = 4'he;
      expv[49] = 4'he;
      expv[50] = 4'he;
      expv[51] = 4'he;
      expv[52] = 4'he;
      expv[53] = 4'he;
      expv[54] = 4'he;
      expv[55] = 4'he;
      expv[56] = 4'he;
      expv[57] = 4'he;
      expv[58] = 4'he;
      expv[59] = 4'he;
      expv[60] = 4'he;
      expv[61] = 4'he;
      expv[62] = 4'he;
      expv[63] = 4'he;
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
