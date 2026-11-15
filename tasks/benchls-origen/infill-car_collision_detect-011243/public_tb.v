// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_011243 dut (
    .clk(clk),
    .carX(in_vec[25:16]),
    .carY(in_vec[15:6]),
    .carOrient(in_vec[5:4]),
    .carIndex(in_vec[3:0]),
    .collision(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h099aee1;
    stim[1] = 26'h0af16fc;
    stim[2] = 26'h1d49f0d;
    stim[3] = 26'h24df322;
    stim[4] = 26'h27afcff;
    stim[5] = 26'h279895c;
    stim[6] = 26'h16cd232;
    stim[7] = 26'h22ec32e;
    stim[8] = 26'h0674323;
    stim[9] = 26'h3638a33;
    stim[10] = 26'h1b03be9;
    stim[11] = 26'h2d20633;
    stim[12] = 26'h17acd2a;
    stim[13] = 26'h195280f;
    stim[14] = 26'h3467048;
    stim[15] = 26'h151ee50;
    stim[16] = 26'h1f6bc1d;
    stim[17] = 26'h233b06e;
    stim[18] = 26'h2d51367;
    stim[19] = 26'h1c7c9d7;
    stim[20] = 26'h27984bc;
    stim[21] = 26'h09d05a3;
    stim[22] = 26'h2183132;
    stim[23] = 26'h3e32557;
    stim[24] = 26'h3f991ea;
    stim[25] = 26'h2699519;
    stim[26] = 26'h35804b0;
    stim[27] = 26'h2f8e978;
    stim[28] = 26'h0cb38c1;
    stim[29] = 26'h2ad2999;
    stim[30] = 26'h012cc53;
    stim[31] = 26'h0b3135c;
    stim[32] = 26'h0f453d5;
    stim[33] = 26'h22f75fe;
    stim[34] = 26'h3296337;
    stim[35] = 26'h3f6c88e;
    stim[36] = 26'h3af987b;
    stim[37] = 26'h0190e3d;
    stim[38] = 26'h10bf097;
    stim[39] = 26'h23aaa5d;
    stim[40] = 26'h030d3f7;
    stim[41] = 26'h36d9375;
    stim[42] = 26'h177a312;
    stim[43] = 26'h3fc0dbb;
    stim[44] = 26'h1847956;
    stim[45] = 26'h373c861;
    stim[46] = 26'h2b8f31a;
    stim[47] = 26'h0727336;
    stim[48] = 26'h0cb2d2a;
    stim[49] = 26'h02917c5;
    stim[50] = 26'h24ee5bb;
    stim[51] = 26'h247f49a;
    stim[52] = 26'h198116b;
    stim[53] = 26'h3c6341b;
    stim[54] = 26'h0a56ab2;
    stim[55] = 26'h3c8c4f1;
    stim[56] = 26'h0ca8211;
    stim[57] = 26'h30ec34e;
    stim[58] = 26'h03408fb;
    stim[59] = 26'h2e6fe85;
    stim[60] = 26'h2b51fef;
    stim[61] = 26'h200017e;
    stim[62] = 26'h33b8130;
    stim[63] = 26'h1bd0433;
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
      expv[0] = 1'h0;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
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
