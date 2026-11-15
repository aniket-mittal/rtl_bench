// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_115855 dut (
    .clk(clk),
    .sent(in_vec[8:8]),
    .data(in_vec[7:0]),
    .ready(out_vec[1:1]),
    .match(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h07a;
    stim[1] = 9'h062;
    stim[2] = 9'h0b9;
    stim[3] = 9'h1c3;
    stim[4] = 9'h159;
    stim[5] = 9'h1ca;
    stim[6] = 9'h0a9;
    stim[7] = 9'h1fe;
    stim[8] = 9'h11c;
    stim[9] = 9'h116;
    stim[10] = 9'h09c;
    stim[11] = 9'h092;
    stim[12] = 9'h0a9;
    stim[13] = 9'h075;
    stim[14] = 9'h1ca;
    stim[15] = 9'h0b9;
    stim[16] = 9'h137;
    stim[17] = 9'h10e;
    stim[18] = 9'h0fa;
    stim[19] = 9'h167;
    stim[20] = 9'h11b;
    stim[21] = 9'h1ca;
    stim[22] = 9'h013;
    stim[23] = 9'h157;
    stim[24] = 9'h112;
    stim[25] = 9'h15d;
    stim[26] = 9'h00d;
    stim[27] = 9'h04a;
    stim[28] = 9'h1ee;
    stim[29] = 9'h0e9;
    stim[30] = 9'h1f1;
    stim[31] = 9'h1cd;
    stim[32] = 9'h01b;
    stim[33] = 9'h1bc;
    stim[34] = 9'h1ac;
    stim[35] = 9'h142;
    stim[36] = 9'h07a;
    stim[37] = 9'h0ea;
    stim[38] = 9'h18e;
    stim[39] = 9'h086;
    stim[40] = 9'h0c1;
    stim[41] = 9'h01c;
    stim[42] = 9'h1d3;
    stim[43] = 9'h1be;
    stim[44] = 9'h1a0;
    stim[45] = 9'h154;
    stim[46] = 9'h0fa;
    stim[47] = 9'h072;
    stim[48] = 9'h0f0;
    stim[49] = 9'h1a2;
    stim[50] = 9'h061;
    stim[51] = 9'h172;
    stim[52] = 9'h079;
    stim[53] = 9'h092;
    stim[54] = 9'h0e3;
    stim[55] = 9'h16d;
    stim[56] = 9'h05b;
    stim[57] = 9'h10b;
    stim[58] = 9'h1d7;
    stim[59] = 9'h0f8;
    stim[60] = 9'h187;
    stim[61] = 9'h1df;
    stim[62] = 9'h04d;
    stim[63] = 9'h085;
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
      expv[0] = 2'h0;
      expv[1] = 2'h0;
      expv[2] = 2'h0;
      expv[3] = 2'h0;
      expv[4] = 2'h0;
      expv[5] = 2'h0;
      expv[6] = 2'h0;
      expv[7] = 2'h0;
      expv[8] = 2'h0;
      expv[9] = 2'h0;
      expv[10] = 2'h0;
      expv[11] = 2'h0;
      expv[12] = 2'h0;
      expv[13] = 2'h0;
      expv[14] = 2'h0;
      expv[15] = 2'h0;
      expv[16] = 2'h0;
      expv[17] = 2'h0;
      expv[18] = 2'h0;
      expv[19] = 2'h0;
      expv[20] = 2'h0;
      expv[21] = 2'h0;
      expv[22] = 2'h0;
      expv[23] = 2'h0;
      expv[24] = 2'h0;
      expv[25] = 2'h0;
      expv[26] = 2'h0;
      expv[27] = 2'h0;
      expv[28] = 2'h0;
      expv[29] = 2'h0;
      expv[30] = 2'h0;
      expv[31] = 2'h0;
      expv[32] = 2'h0;
      expv[33] = 2'h0;
      expv[34] = 2'h0;
      expv[35] = 2'h0;
      expv[36] = 2'h0;
      expv[37] = 2'h0;
      expv[38] = 2'h0;
      expv[39] = 2'h0;
      expv[40] = 2'h0;
      expv[41] = 2'h0;
      expv[42] = 2'h0;
      expv[43] = 2'h0;
      expv[44] = 2'h0;
      expv[45] = 2'h0;
      expv[46] = 2'h0;
      expv[47] = 2'h0;
      expv[48] = 2'h0;
      expv[49] = 2'h0;
      expv[50] = 2'h0;
      expv[51] = 2'h0;
      expv[52] = 2'h0;
      expv[53] = 2'h0;
      expv[54] = 2'h0;
      expv[55] = 2'h0;
      expv[56] = 2'h0;
      expv[57] = 2'h0;
      expv[58] = 2'h0;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h0;
      expv[63] = 2'h0;
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
