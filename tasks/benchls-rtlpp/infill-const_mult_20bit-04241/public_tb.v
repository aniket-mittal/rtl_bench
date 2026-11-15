// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04241 dut (
    .clk(clk),
    .reset(in_vec[8:8]),
    .X(in_vec[7:0]),
    .Y(out_vec[19:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h144;
    stim[1] = 9'h174;
    stim[2] = 9'h0fe;
    stim[3] = 9'h0ac;
    stim[4] = 9'h077;
    stim[5] = 9'h0aa;
    stim[6] = 9'h0f2;
    stim[7] = 9'h017;
    stim[8] = 9'h08a;
    stim[9] = 9'h018;
    stim[10] = 9'h081;
    stim[11] = 9'h0d6;
    stim[12] = 9'h0c9;
    stim[13] = 9'h007;
    stim[14] = 9'h094;
    stim[15] = 9'h005;
    stim[16] = 9'h096;
    stim[17] = 9'h099;
    stim[18] = 9'h0a3;
    stim[19] = 9'h041;
    stim[20] = 9'h06c;
    stim[21] = 9'h0d9;
    stim[22] = 9'h01c;
    stim[23] = 9'h0f8;
    stim[24] = 9'h0da;
    stim[25] = 9'h093;
    stim[26] = 9'h021;
    stim[27] = 9'h009;
    stim[28] = 9'h008;
    stim[29] = 9'h099;
    stim[30] = 9'h004;
    stim[31] = 9'h0e0;
    stim[32] = 9'h028;
    stim[33] = 9'h085;
    stim[34] = 9'h027;
    stim[35] = 9'h05c;
    stim[36] = 9'h14f;
    stim[37] = 9'h06a;
    stim[38] = 9'h048;
    stim[39] = 9'h0a5;
    stim[40] = 9'h0d4;
    stim[41] = 9'h02e;
    stim[42] = 9'h08f;
    stim[43] = 9'h0a3;
    stim[44] = 9'h0d4;
    stim[45] = 9'h0c2;
    stim[46] = 9'h0c7;
    stim[47] = 9'h09a;
    stim[48] = 9'h0e5;
    stim[49] = 9'h02b;
    stim[50] = 9'h013;
    stim[51] = 9'h0e1;
    stim[52] = 9'h0d0;
    stim[53] = 9'h003;
    stim[54] = 9'h0ef;
    stim[55] = 9'h02f;
    stim[56] = 9'h0fb;
    stim[57] = 9'h0e8;
    stim[58] = 9'h0cf;
    stim[59] = 9'h05c;
    stim[60] = 9'h06a;
    stim[61] = 9'h0ad;
    stim[62] = 9'h0af;
    stim[63] = 9'h0ab;
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
      expv[0] = 20'h00000;
      expv[1] = 20'h00000;
      expv[2] = 20'h00000;
      expv[3] = 20'h00000;
      expv[4] = 20'h00000;
      expv[5] = 20'h00000;
      expv[6] = 20'h00000;
      expv[7] = 20'h00000;
      expv[8] = 20'h00000;
      expv[9] = 20'h00000;
      expv[10] = 20'h00000;
      expv[11] = 20'h00000;
      expv[12] = 20'h00000;
      expv[13] = 20'h00000;
      expv[14] = 20'h00000;
      expv[15] = 20'h00000;
      expv[16] = 20'h00000;
      expv[17] = 20'h00000;
      expv[18] = 20'h00000;
      expv[19] = 20'h00000;
      expv[20] = 20'h00000;
      expv[21] = 20'h00000;
      expv[22] = 20'h00000;
      expv[23] = 20'h00000;
      expv[24] = 20'h00000;
      expv[25] = 20'h00000;
      expv[26] = 20'h00000;
      expv[27] = 20'h00000;
      expv[28] = 20'h00000;
      expv[29] = 20'h00000;
      expv[30] = 20'h00000;
      expv[31] = 20'h00000;
      expv[32] = 20'h00000;
      expv[33] = 20'h00000;
      expv[34] = 20'h00000;
      expv[35] = 20'h00000;
      expv[36] = 20'h00000;
      expv[37] = 20'h00000;
      expv[38] = 20'h00000;
      expv[39] = 20'h00000;
      expv[40] = 20'h00000;
      expv[41] = 20'h00000;
      expv[42] = 20'h00000;
      expv[43] = 20'h00000;
      expv[44] = 20'h00000;
      expv[45] = 20'h00000;
      expv[46] = 20'h00000;
      expv[47] = 20'h00000;
      expv[48] = 20'h00000;
      expv[49] = 20'h00000;
      expv[50] = 20'h00000;
      expv[51] = 20'h00000;
      expv[52] = 20'h00000;
      expv[53] = 20'h00000;
      expv[54] = 20'h00000;
      expv[55] = 20'h00000;
      expv[56] = 20'h00000;
      expv[57] = 20'h00000;
      expv[58] = 20'h00000;
      expv[59] = 20'h00000;
      expv[60] = 20'h00000;
      expv[61] = 20'h00000;
      expv[62] = 20'h00000;
      expv[63] = 20'h00000;
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
