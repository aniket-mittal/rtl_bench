// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .a(in_vec[2:0]),
    .q(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h4;
    stim[1] = 3'h3;
    stim[2] = 3'h5;
    stim[3] = 3'h1;
    stim[4] = 3'h2;
    stim[5] = 3'h5;
    stim[6] = 3'h0;
    stim[7] = 3'h5;
    stim[8] = 3'h0;
    stim[9] = 3'h7;
    stim[10] = 3'h0;
    stim[11] = 3'h7;
    stim[12] = 3'h2;
    stim[13] = 3'h7;
    stim[14] = 3'h5;
    stim[15] = 3'h5;
    stim[16] = 3'h0;
    stim[17] = 3'h1;
    stim[18] = 3'h5;
    stim[19] = 3'h2;
    stim[20] = 3'h0;
    stim[21] = 3'h3;
    stim[22] = 3'h3;
    stim[23] = 3'h4;
    stim[24] = 3'h2;
    stim[25] = 3'h3;
    stim[26] = 3'h0;
    stim[27] = 3'h6;
    stim[28] = 3'h5;
    stim[29] = 3'h0;
    stim[30] = 3'h5;
    stim[31] = 3'h7;
    stim[32] = 3'h6;
    stim[33] = 3'h4;
    stim[34] = 3'h3;
    stim[35] = 3'h7;
    stim[36] = 3'h5;
    stim[37] = 3'h5;
    stim[38] = 3'h7;
    stim[39] = 3'h1;
    stim[40] = 3'h1;
    stim[41] = 3'h6;
    stim[42] = 3'h4;
    stim[43] = 3'h5;
    stim[44] = 3'h6;
    stim[45] = 3'h6;
    stim[46] = 3'h0;
    stim[47] = 3'h7;
    stim[48] = 3'h3;
    stim[49] = 3'h0;
    stim[50] = 3'h1;
    stim[51] = 3'h6;
    stim[52] = 3'h4;
    stim[53] = 3'h2;
    stim[54] = 3'h2;
    stim[55] = 3'h6;
    stim[56] = 3'h1;
    stim[57] = 3'h1;
    stim[58] = 3'h7;
    stim[59] = 3'h5;
    stim[60] = 3'h6;
    stim[61] = 3'h5;
    stim[62] = 3'h7;
    stim[63] = 3'h5;
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
      expv[0] = 16'h2066;
      expv[1] = 16'h5a0e;
      expv[2] = 16'h64ce;
      expv[3] = 16'haee1;
      expv[4] = 16'h27d4;
      expv[5] = 16'h64ce;
      expv[6] = 16'h1232;
      expv[7] = 16'h64ce;
      expv[8] = 16'h1232;
      expv[9] = 16'h2f19;
      expv[10] = 16'h1232;
      expv[11] = 16'h2f19;
      expv[12] = 16'h27d4;
      expv[13] = 16'h2f19;
      expv[14] = 16'h64ce;
      expv[15] = 16'h64ce;
      expv[16] = 16'h1232;
      expv[17] = 16'haee1;
      expv[18] = 16'h64ce;
      expv[19] = 16'h27d4;
      expv[20] = 16'h1232;
      expv[21] = 16'h5a0e;
      expv[22] = 16'h5a0e;
      expv[23] = 16'h2066;
      expv[24] = 16'h27d4;
      expv[25] = 16'h5a0e;
      expv[26] = 16'h1232;
      expv[27] = 16'hc526;
      expv[28] = 16'h64ce;
      expv[29] = 16'h1232;
      expv[30] = 16'h64ce;
      expv[31] = 16'h2f19;
      expv[32] = 16'hc526;
      expv[33] = 16'h2066;
      expv[34] = 16'h5a0e;
      expv[35] = 16'h2f19;
      expv[36] = 16'h64ce;
      expv[37] = 16'h64ce;
      expv[38] = 16'h2f19;
      expv[39] = 16'haee1;
      expv[40] = 16'haee1;
      expv[41] = 16'hc526;
      expv[42] = 16'h2066;
      expv[43] = 16'h64ce;
      expv[44] = 16'hc526;
      expv[45] = 16'hc526;
      expv[46] = 16'h1232;
      expv[47] = 16'h2f19;
      expv[48] = 16'h5a0e;
      expv[49] = 16'h1232;
      expv[50] = 16'haee1;
      expv[51] = 16'hc526;
      expv[52] = 16'h2066;
      expv[53] = 16'h27d4;
      expv[54] = 16'h27d4;
      expv[55] = 16'hc526;
      expv[56] = 16'haee1;
      expv[57] = 16'haee1;
      expv[58] = 16'h2f19;
      expv[59] = 16'h64ce;
      expv[60] = 16'hc526;
      expv[61] = 16'h64ce;
      expv[62] = 16'h2f19;
      expv[63] = 16'h64ce;
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
