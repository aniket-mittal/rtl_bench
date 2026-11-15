// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  test_pattern dut (
    .clk(clk),
    .aclr(in_vec[1:1]),
    .ena(in_vec[0:0]),
    .val(out_vec[15:0])
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
    stim[4] = 2'h1;
    stim[5] = 2'h0;
    stim[6] = 2'h0;
    stim[7] = 2'h0;
    stim[8] = 2'h0;
    stim[9] = 2'h0;
    stim[10] = 2'h1;
    stim[11] = 2'h1;
    stim[12] = 2'h1;
    stim[13] = 2'h0;
    stim[14] = 2'h0;
    stim[15] = 2'h1;
    stim[16] = 2'h0;
    stim[17] = 2'h1;
    stim[18] = 2'h0;
    stim[19] = 2'h1;
    stim[20] = 2'h0;
    stim[21] = 2'h1;
    stim[22] = 2'h1;
    stim[23] = 2'h0;
    stim[24] = 2'h1;
    stim[25] = 2'h0;
    stim[26] = 2'h0;
    stim[27] = 2'h0;
    stim[28] = 2'h1;
    stim[29] = 2'h1;
    stim[30] = 2'h0;
    stim[31] = 2'h0;
    stim[32] = 2'h1;
    stim[33] = 2'h1;
    stim[34] = 2'h0;
    stim[35] = 2'h1;
    stim[36] = 2'h1;
    stim[37] = 2'h0;
    stim[38] = 2'h0;
    stim[39] = 2'h1;
    stim[40] = 2'h1;
    stim[41] = 2'h1;
    stim[42] = 2'h1;
    stim[43] = 2'h0;
    stim[44] = 2'h0;
    stim[45] = 2'h0;
    stim[46] = 2'h0;
    stim[47] = 2'h1;
    stim[48] = 2'h0;
    stim[49] = 2'h1;
    stim[50] = 2'h0;
    stim[51] = 2'h0;
    stim[52] = 2'h1;
    stim[53] = 2'h1;
    stim[54] = 2'h1;
    stim[55] = 2'h1;
    stim[56] = 2'h1;
    stim[57] = 2'h0;
    stim[58] = 2'h0;
    stim[59] = 2'h0;
    stim[60] = 2'h1;
    stim[61] = 2'h1;
    stim[62] = 2'h0;
    stim[63] = 2'h1;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h0000;
      expv[5] = 16'h002b;
      expv[6] = 16'h002b;
      expv[7] = 16'h002b;
      expv[8] = 16'h002b;
      expv[9] = 16'h002b;
      expv[10] = 16'h002b;
      expv[11] = 16'h0056;
      expv[12] = 16'h0081;
      expv[13] = 16'h00ac;
      expv[14] = 16'h00ac;
      expv[15] = 16'h00ac;
      expv[16] = 16'h00d7;
      expv[17] = 16'h00d7;
      expv[18] = 16'h0102;
      expv[19] = 16'h0102;
      expv[20] = 16'h012d;
      expv[21] = 16'h012d;
      expv[22] = 16'h0158;
      expv[23] = 16'h0183;
      expv[24] = 16'h0183;
      expv[25] = 16'h01ae;
      expv[26] = 16'h01ae;
      expv[27] = 16'h01ae;
      expv[28] = 16'h01ae;
      expv[29] = 16'h01d9;
      expv[30] = 16'h0204;
      expv[31] = 16'h0204;
      expv[32] = 16'h0204;
      expv[33] = 16'h022f;
      expv[34] = 16'h025a;
      expv[35] = 16'h025a;
      expv[36] = 16'h0285;
      expv[37] = 16'h02b0;
      expv[38] = 16'h02b0;
      expv[39] = 16'h02b0;
      expv[40] = 16'h02db;
      expv[41] = 16'h0306;
      expv[42] = 16'h0331;
      expv[43] = 16'h035c;
      expv[44] = 16'h035c;
      expv[45] = 16'h035c;
      expv[46] = 16'h035c;
      expv[47] = 16'h035c;
      expv[48] = 16'h0387;
      expv[49] = 16'h0387;
      expv[50] = 16'h03b2;
      expv[51] = 16'h03b2;
      expv[52] = 16'h03b2;
      expv[53] = 16'h03dd;
      expv[54] = 16'h0408;
      expv[55] = 16'h0433;
      expv[56] = 16'h045e;
      expv[57] = 16'h0489;
      expv[58] = 16'h0489;
      expv[59] = 16'h0489;
      expv[60] = 16'h0489;
      expv[61] = 16'h04b4;
      expv[62] = 16'h04df;
      expv[63] = 16'h04df;
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
