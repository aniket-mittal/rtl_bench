// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_138752 dut (
    .clk(clk),
    .reset(in_vec[8:8]),
    .module1_out(in_vec[7:4]),
    .module2_out(in_vec[3:0]),
    .final_output(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h1dc;
    stim[1] = 9'h177;
    stim[2] = 9'h0a3;
    stim[3] = 9'h061;
    stim[4] = 9'h0f5;
    stim[5] = 9'h08a;
    stim[6] = 9'h074;
    stim[7] = 9'h009;
    stim[8] = 9'h0e8;
    stim[9] = 9'h012;
    stim[10] = 9'h00a;
    stim[11] = 9'h0a6;
    stim[12] = 9'h070;
    stim[13] = 9'h0c4;
    stim[14] = 9'h059;
    stim[15] = 9'h056;
    stim[16] = 9'h0fe;
    stim[17] = 9'h07a;
    stim[18] = 9'h066;
    stim[19] = 9'h09a;
    stim[20] = 9'h0b1;
    stim[21] = 9'h03b;
    stim[22] = 9'h0c4;
    stim[23] = 9'h0ce;
    stim[24] = 9'h043;
    stim[25] = 9'h0ec;
    stim[26] = 9'h016;
    stim[27] = 9'h0b8;
    stim[28] = 9'h025;
    stim[29] = 9'h09b;
    stim[30] = 9'h0ed;
    stim[31] = 9'h07b;
    stim[32] = 9'h0ad;
    stim[33] = 9'h0cf;
    stim[34] = 9'h0dd;
    stim[35] = 9'h08c;
    stim[36] = 9'h0fd;
    stim[37] = 9'h042;
    stim[38] = 9'h0a7;
    stim[39] = 9'h092;
    stim[40] = 9'h0a4;
    stim[41] = 9'h0a2;
    stim[42] = 9'h010;
    stim[43] = 9'h0f9;
    stim[44] = 9'h04c;
    stim[45] = 9'h025;
    stim[46] = 9'h02b;
    stim[47] = 9'h0f0;
    stim[48] = 9'h052;
    stim[49] = 9'h007;
    stim[50] = 9'h01a;
    stim[51] = 9'h0c4;
    stim[52] = 9'h092;
    stim[53] = 9'h01c;
    stim[54] = 9'h03c;
    stim[55] = 9'h034;
    stim[56] = 9'h0e5;
    stim[57] = 9'h009;
    stim[58] = 9'h0d9;
    stim[59] = 9'h000;
    stim[60] = 9'h08c;
    stim[61] = 9'h0f9;
    stim[62] = 9'h049;
    stim[63] = 9'h0cb;
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
      expv[0] = 16'h0001;
      expv[1] = 16'h0000;
      expv[2] = 16'h0007;
      expv[3] = 16'h0005;
      expv[4] = 16'h0000;
      expv[5] = 16'h0004;
      expv[6] = 16'h0003;
      expv[7] = 16'h0007;
      expv[8] = 16'h0006;
      expv[9] = 16'h0005;
      expv[10] = 16'h0006;
      expv[11] = 16'h0004;
      expv[12] = 16'h0007;
      expv[13] = 16'h0008;
      expv[14] = 16'h0002;
      expv[15] = 16'h0005;
      expv[16] = 16'h0001;
      expv[17] = 16'h0003;
      expv[18] = 16'h0000;
      expv[19] = 16'h0005;
      expv[20] = 16'h0000;
      expv[21] = 16'h0008;
      expv[22] = 16'h0008;
      expv[23] = 16'h0004;
      expv[24] = 16'h0001;
      expv[25] = 16'h0002;
      expv[26] = 16'h0001;
      expv[27] = 16'h0003;
      expv[28] = 16'h0003;
      expv[29] = 16'h0004;
      expv[30] = 16'h0001;
      expv[31] = 16'h0002;
      expv[32] = 16'h0003;
      expv[33] = 16'h0003;
      expv[34] = 16'h0000;
      expv[35] = 16'h0002;
      expv[36] = 16'h0002;
      expv[37] = 16'h0002;
      expv[38] = 16'h0003;
      expv[39] = 16'h0007;
      expv[40] = 16'h0006;
      expv[41] = 16'h0008;
      expv[42] = 16'h0001;
      expv[43] = 16'h0006;
      expv[44] = 16'h0008;
      expv[45] = 16'h0003;
      expv[46] = 16'h0007;
      expv[47] = 16'h0005;
      expv[48] = 16'h0003;
      expv[49] = 16'h0009;
      expv[50] = 16'h0007;
      expv[51] = 16'h0008;
      expv[52] = 16'h0007;
      expv[53] = 16'h0005;
      expv[54] = 16'h0007;
      expv[55] = 16'h0005;
      expv[56] = 16'h0009;
      expv[57] = 16'h0007;
      expv[58] = 16'h0004;
      expv[59] = 16'h0000;
      expv[60] = 16'h0002;
      expv[61] = 16'h0006;
      expv[62] = 16'h0001;
      expv[63] = 16'h0001;
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
