// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .a(in_vec[1:1]),
    .b(in_vec[0:0]),
    .out_and(out_vec[6:6]),
    .out_or(out_vec[5:5]),
    .out_xor(out_vec[4:4]),
    .out_nand(out_vec[3:3]),
    .out_nor(out_vec[2:2]),
    .out_xnor(out_vec[1:1]),
    .out_anotb(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 2'h0;
    stim[1] = 2'h1;
    stim[2] = 2'h2;
    stim[3] = 2'h0;
    stim[4] = 2'h2;
    stim[5] = 2'h0;
    stim[6] = 2'h2;
    stim[7] = 2'h2;
    stim[8] = 2'h1;
    stim[9] = 2'h3;
    stim[10] = 2'h3;
    stim[11] = 2'h2;
    stim[12] = 2'h2;
    stim[13] = 2'h3;
    stim[14] = 2'h0;
    stim[15] = 2'h0;
    stim[16] = 2'h1;
    stim[17] = 2'h1;
    stim[18] = 2'h0;
    stim[19] = 2'h2;
    stim[20] = 2'h1;
    stim[21] = 2'h2;
    stim[22] = 2'h2;
    stim[23] = 2'h1;
    stim[24] = 2'h3;
    stim[25] = 2'h2;
    stim[26] = 2'h3;
    stim[27] = 2'h3;
    stim[28] = 2'h1;
    stim[29] = 2'h1;
    stim[30] = 2'h0;
    stim[31] = 2'h0;
    stim[32] = 2'h0;
    stim[33] = 2'h1;
    stim[34] = 2'h1;
    stim[35] = 2'h1;
    stim[36] = 2'h1;
    stim[37] = 2'h2;
    stim[38] = 2'h3;
    stim[39] = 2'h3;
    stim[40] = 2'h3;
    stim[41] = 2'h1;
    stim[42] = 2'h1;
    stim[43] = 2'h2;
    stim[44] = 2'h1;
    stim[45] = 2'h3;
    stim[46] = 2'h2;
    stim[47] = 2'h0;
    stim[48] = 2'h2;
    stim[49] = 2'h1;
    stim[50] = 2'h3;
    stim[51] = 2'h2;
    stim[52] = 2'h0;
    stim[53] = 2'h1;
    stim[54] = 2'h0;
    stim[55] = 2'h3;
    stim[56] = 2'h1;
    stim[57] = 2'h0;
    stim[58] = 2'h3;
    stim[59] = 2'h1;
    stim[60] = 2'h3;
    stim[61] = 2'h1;
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
      expv[0] = 7'h0e;
      expv[1] = 7'h38;
      expv[2] = 7'h39;
      expv[3] = 7'h0e;
      expv[4] = 7'h39;
      expv[5] = 7'h0e;
      expv[6] = 7'h39;
      expv[7] = 7'h39;
      expv[8] = 7'h38;
      expv[9] = 7'h62;
      expv[10] = 7'h62;
      expv[11] = 7'h39;
      expv[12] = 7'h39;
      expv[13] = 7'h62;
      expv[14] = 7'h0e;
      expv[15] = 7'h0e;
      expv[16] = 7'h38;
      expv[17] = 7'h38;
      expv[18] = 7'h0e;
      expv[19] = 7'h39;
      expv[20] = 7'h38;
      expv[21] = 7'h39;
      expv[22] = 7'h39;
      expv[23] = 7'h38;
      expv[24] = 7'h62;
      expv[25] = 7'h39;
      expv[26] = 7'h62;
      expv[27] = 7'h62;
      expv[28] = 7'h38;
      expv[29] = 7'h38;
      expv[30] = 7'h0e;
      expv[31] = 7'h0e;
      expv[32] = 7'h0e;
      expv[33] = 7'h38;
      expv[34] = 7'h38;
      expv[35] = 7'h38;
      expv[36] = 7'h38;
      expv[37] = 7'h39;
      expv[38] = 7'h62;
      expv[39] = 7'h62;
      expv[40] = 7'h62;
      expv[41] = 7'h38;
      expv[42] = 7'h38;
      expv[43] = 7'h39;
      expv[44] = 7'h38;
      expv[45] = 7'h62;
      expv[46] = 7'h39;
      expv[47] = 7'h0e;
      expv[48] = 7'h39;
      expv[49] = 7'h38;
      expv[50] = 7'h62;
      expv[51] = 7'h39;
      expv[52] = 7'h0e;
      expv[53] = 7'h38;
      expv[54] = 7'h0e;
      expv[55] = 7'h62;
      expv[56] = 7'h38;
      expv[57] = 7'h0e;
      expv[58] = 7'h62;
      expv[59] = 7'h38;
      expv[60] = 7'h62;
      expv[61] = 7'h38;
      expv[62] = 7'h39;
      expv[63] = 7'h62;
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
