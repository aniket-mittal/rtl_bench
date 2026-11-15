// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_000129 dut (
    .clock(clk),
    .k_tr(in_vec[0:0]),
    .key_code(out_vec[7:0])
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
    stim[1] = 1'h0;
    stim[2] = 1'h0;
    stim[3] = 1'h0;
    stim[4] = 1'h1;
    stim[5] = 1'h1;
    stim[6] = 1'h1;
    stim[7] = 1'h0;
    stim[8] = 1'h1;
    stim[9] = 1'h0;
    stim[10] = 1'h1;
    stim[11] = 1'h1;
    stim[12] = 1'h0;
    stim[13] = 1'h1;
    stim[14] = 1'h1;
    stim[15] = 1'h0;
    stim[16] = 1'h0;
    stim[17] = 1'h1;
    stim[18] = 1'h1;
    stim[19] = 1'h1;
    stim[20] = 1'h0;
    stim[21] = 1'h0;
    stim[22] = 1'h1;
    stim[23] = 1'h0;
    stim[24] = 1'h1;
    stim[25] = 1'h0;
    stim[26] = 1'h1;
    stim[27] = 1'h1;
    stim[28] = 1'h0;
    stim[29] = 1'h1;
    stim[30] = 1'h0;
    stim[31] = 1'h0;
    stim[32] = 1'h0;
    stim[33] = 1'h0;
    stim[34] = 1'h0;
    stim[35] = 1'h1;
    stim[36] = 1'h0;
    stim[37] = 1'h1;
    stim[38] = 1'h1;
    stim[39] = 1'h0;
    stim[40] = 1'h1;
    stim[41] = 1'h1;
    stim[42] = 1'h0;
    stim[43] = 1'h1;
    stim[44] = 1'h1;
    stim[45] = 1'h1;
    stim[46] = 1'h1;
    stim[47] = 1'h0;
    stim[48] = 1'h0;
    stim[49] = 1'h0;
    stim[50] = 1'h0;
    stim[51] = 1'h1;
    stim[52] = 1'h0;
    stim[53] = 1'h1;
    stim[54] = 1'h1;
    stim[55] = 1'h1;
    stim[56] = 1'h0;
    stim[57] = 1'h0;
    stim[58] = 1'h1;
    stim[59] = 1'h0;
    stim[60] = 1'h1;
    stim[61] = 1'h1;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hf0;
      expv[2] = 8'hf0;
      expv[3] = 8'hxx;
      expv[4] = 8'hxx;
      expv[5] = 8'hxx;
      expv[6] = 8'hxx;
      expv[7] = 8'hxx;
      expv[8] = 8'hxx;
      expv[9] = 8'hxx;
      expv[10] = 8'hxx;
      expv[11] = 8'hxx;
      expv[12] = 8'hxx;
      expv[13] = 8'hxx;
      expv[14] = 8'hxx;
      expv[15] = 8'hxx;
      expv[16] = 8'hxx;
      expv[17] = 8'h2b;
      expv[18] = 8'h2b;
      expv[19] = 8'h2b;
      expv[20] = 8'h2b;
      expv[21] = 8'h2b;
      expv[22] = 8'h2b;
      expv[23] = 8'h2b;
      expv[24] = 8'h2b;
      expv[25] = 8'h2b;
      expv[26] = 8'h2b;
      expv[27] = 8'h2b;
      expv[28] = 8'h2b;
      expv[29] = 8'h2b;
      expv[30] = 8'h2b;
      expv[31] = 8'h2b;
      expv[32] = 8'h2b;
      expv[33] = 8'h2b;
      expv[34] = 8'h2b;
      expv[35] = 8'h2b;
      expv[36] = 8'h2b;
      expv[37] = 8'h2b;
      expv[38] = 8'h2b;
      expv[39] = 8'h2b;
      expv[40] = 8'h2b;
      expv[41] = 8'h2b;
      expv[42] = 8'h2b;
      expv[43] = 8'h2b;
      expv[44] = 8'h2b;
      expv[45] = 8'h2b;
      expv[46] = 8'h2b;
      expv[47] = 8'h2b;
      expv[48] = 8'h2b;
      expv[49] = 8'h2b;
      expv[50] = 8'h2b;
      expv[51] = 8'h2b;
      expv[52] = 8'h2b;
      expv[53] = 8'h2b;
      expv[54] = 8'h2b;
      expv[55] = 8'h2b;
      expv[56] = 8'h2b;
      expv[57] = 8'h2b;
      expv[58] = 8'h2b;
      expv[59] = 8'h2b;
      expv[60] = 8'h2b;
      expv[61] = 8'h2b;
      expv[62] = 8'h2b;
      expv[63] = 8'h2b;
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
