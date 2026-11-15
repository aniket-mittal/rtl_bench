// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_072012 dut (
    .a(in_vec[1:1]),
    .b(in_vec[0:0]),
    .out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 2'h2;
    stim[1] = 2'h3;
    stim[2] = 2'h3;
    stim[3] = 2'h3;
    stim[4] = 2'h2;
    stim[5] = 2'h0;
    stim[6] = 2'h0;
    stim[7] = 2'h0;
    stim[8] = 2'h1;
    stim[9] = 2'h3;
    stim[10] = 2'h2;
    stim[11] = 2'h3;
    stim[12] = 2'h2;
    stim[13] = 2'h0;
    stim[14] = 2'h0;
    stim[15] = 2'h3;
    stim[16] = 2'h3;
    stim[17] = 2'h2;
    stim[18] = 2'h3;
    stim[19] = 2'h3;
    stim[20] = 2'h2;
    stim[21] = 2'h2;
    stim[22] = 2'h1;
    stim[23] = 2'h1;
    stim[24] = 2'h2;
    stim[25] = 2'h0;
    stim[26] = 2'h0;
    stim[27] = 2'h2;
    stim[28] = 2'h3;
    stim[29] = 2'h2;
    stim[30] = 2'h0;
    stim[31] = 2'h0;
    stim[32] = 2'h2;
    stim[33] = 2'h3;
    stim[34] = 2'h1;
    stim[35] = 2'h1;
    stim[36] = 2'h3;
    stim[37] = 2'h0;
    stim[38] = 2'h1;
    stim[39] = 2'h3;
    stim[40] = 2'h3;
    stim[41] = 2'h0;
    stim[42] = 2'h0;
    stim[43] = 2'h2;
    stim[44] = 2'h1;
    stim[45] = 2'h0;
    stim[46] = 2'h1;
    stim[47] = 2'h1;
    stim[48] = 2'h3;
    stim[49] = 2'h1;
    stim[50] = 2'h0;
    stim[51] = 2'h0;
    stim[52] = 2'h2;
    stim[53] = 2'h0;
    stim[54] = 2'h2;
    stim[55] = 2'h3;
    stim[56] = 2'h2;
    stim[57] = 2'h2;
    stim[58] = 2'h3;
    stim[59] = 2'h0;
    stim[60] = 2'h1;
    stim[61] = 2'h2;
    stim[62] = 2'h2;
    stim[63] = 2'h3;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 1'hx;
      expv[1] = 1'hx;
      expv[2] = 1'hx;
      expv[3] = 1'hx;
      expv[4] = 1'hx;
      expv[5] = 1'hx;
      expv[6] = 1'hx;
      expv[7] = 1'hx;
      expv[8] = 1'hx;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
