// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_147476 dut (
    .clk(clk),
    .d_in(in_vec[32:32]),
    .byte_in(in_vec[31:0]),
    .led_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1b899e5ec;
    stim[1] = 33'h0fbf53209;
    stim[2] = 33'h16a6ebaa0;
    stim[3] = 33'h1b8163118;
    stim[4] = 33'h1c99f99af;
    stim[5] = 33'h1799f8c63;
    stim[6] = 33'h1ca9bc36a;
    stim[7] = 33'h077c5dae9;
    stim[8] = 33'h0a3ab51f0;
    stim[9] = 33'h1855bc8ae;
    stim[10] = 33'h09c887c21;
    stim[11] = 33'h027d63796;
    stim[12] = 33'h0e9e5d4f5;
    stim[13] = 33'h1b8221d5d;
    stim[14] = 33'h1ab647b1d;
    stim[15] = 33'h1707ee9f7;
    stim[16] = 33'h052f49d14;
    stim[17] = 33'h1395ab5cb;
    stim[18] = 33'h04331ab1b;
    stim[19] = 33'h10fb85e5a;
    stim[20] = 33'h1f6e2eeb2;
    stim[21] = 33'h03062be9e;
    stim[22] = 33'h1309d39a8;
    stim[23] = 33'h028eb8d5d;
    stim[24] = 33'h18f821c2e;
    stim[25] = 33'h0e39c837f;
    stim[26] = 33'h0125ccde3;
    stim[27] = 33'h0f540258e;
    stim[28] = 33'h10769f405;
    stim[29] = 33'h07a3e7c5c;
    stim[30] = 33'h08201c913;
    stim[31] = 33'h0886dd722;
    stim[32] = 33'h035230632;
    stim[33] = 33'h153d2527a;
    stim[34] = 33'h07ea61c74;
    stim[35] = 33'h1a4b0a7b4;
    stim[36] = 33'h17a7143d5;
    stim[37] = 33'h192846f2b;
    stim[38] = 33'h122230ee0;
    stim[39] = 33'h07b9a796b;
    stim[40] = 33'h1d631fb69;
    stim[41] = 33'h05d1a32f1;
    stim[42] = 33'h0828c8582;
    stim[43] = 33'h0864d9cb8;
    stim[44] = 33'h04a9d1320;
    stim[45] = 33'h029aa9a9a;
    stim[46] = 33'h131e59222;
    stim[47] = 33'h03fd1bf1d;
    stim[48] = 33'h16852f547;
    stim[49] = 33'h0f39a2e9b;
    stim[50] = 33'h1ab6d1571;
    stim[51] = 33'h06c78c06a;
    stim[52] = 33'h0b13af16b;
    stim[53] = 33'h1c69de1b0;
    stim[54] = 33'h080893f15;
    stim[55] = 33'h0770ad0de;
    stim[56] = 33'h06ed0a694;
    stim[57] = 33'h09d59011f;
    stim[58] = 33'h16d0bcfd3;
    stim[59] = 33'h0a06d63e7;
    stim[60] = 33'h11b84b2e4;
    stim[61] = 33'h15ab545d4;
    stim[62] = 33'h0148f42f7;
    stim[63] = 33'h1b3fc4bb5;
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
      expv[0] = 1'hx;
      expv[1] = 1'hx;
      expv[2] = 1'h0;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h0;
      expv[7] = 1'h1;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h1;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h1;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h0;
      expv[43] = 1'h1;
      expv[44] = 1'h0;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h0;
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
