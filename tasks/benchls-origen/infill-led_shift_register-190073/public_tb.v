// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_190073 dut (
    .clk(clk),
    .rst(in_vec[8:8]),
    .led(in_vec[7:0]),
    .sreg_d(out_vec[2:2]),
    .sreg_ld(out_vec[1:1]),
    .sreg_clk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h164;
    stim[1] = 9'h14c;
    stim[2] = 9'h066;
    stim[3] = 9'h01f;
    stim[4] = 9'h055;
    stim[5] = 9'h02d;
    stim[6] = 9'h049;
    stim[7] = 9'h027;
    stim[8] = 9'h030;
    stim[9] = 9'h03a;
    stim[10] = 9'h028;
    stim[11] = 9'h07a;
    stim[12] = 9'h0d9;
    stim[13] = 9'h08d;
    stim[14] = 9'h0b5;
    stim[15] = 9'h074;
    stim[16] = 9'h0e3;
    stim[17] = 9'h03b;
    stim[18] = 9'h07e;
    stim[19] = 9'h0cd;
    stim[20] = 9'h074;
    stim[21] = 9'h0da;
    stim[22] = 9'h04d;
    stim[23] = 9'h02f;
    stim[24] = 9'h02c;
    stim[25] = 9'h08b;
    stim[26] = 9'h07e;
    stim[27] = 9'h003;
    stim[28] = 9'h0ce;
    stim[29] = 9'h0b1;
    stim[30] = 9'h023;
    stim[31] = 9'h047;
    stim[32] = 9'h0ae;
    stim[33] = 9'h0ee;
    stim[34] = 9'h1d0;
    stim[35] = 9'h05b;
    stim[36] = 9'h0c2;
    stim[37] = 9'h0db;
    stim[38] = 9'h01e;
    stim[39] = 9'h034;
    stim[40] = 9'h0fa;
    stim[41] = 9'h073;
    stim[42] = 9'h033;
    stim[43] = 9'h0d5;
    stim[44] = 9'h076;
    stim[45] = 9'h053;
    stim[46] = 9'h053;
    stim[47] = 9'h00f;
    stim[48] = 9'h050;
    stim[49] = 9'h032;
    stim[50] = 9'h047;
    stim[51] = 9'h058;
    stim[52] = 9'h0b6;
    stim[53] = 9'h01d;
    stim[54] = 9'h07c;
    stim[55] = 9'h065;
    stim[56] = 9'h09e;
    stim[57] = 9'h008;
    stim[58] = 9'h01e;
    stim[59] = 9'h089;
    stim[60] = 9'h0a4;
    stim[61] = 9'h07a;
    stim[62] = 9'h0d6;
    stim[63] = 9'h0e9;
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
      expv[0] = 3'h0;
      expv[1] = 3'h0;
      expv[2] = 3'h0;
      expv[3] = 3'h0;
      expv[4] = 3'h0;
      expv[5] = 3'h0;
      expv[6] = 3'h0;
      expv[7] = 3'h0;
      expv[8] = 3'h0;
      expv[9] = 3'h0;
      expv[10] = 3'h0;
      expv[11] = 3'h0;
      expv[12] = 3'h3;
      expv[13] = 3'h1;
      expv[14] = 3'h1;
      expv[15] = 3'h1;
      expv[16] = 3'h1;
      expv[17] = 3'h1;
      expv[18] = 3'h1;
      expv[19] = 3'h1;
      expv[20] = 3'h1;
      expv[21] = 3'h1;
      expv[22] = 3'h6;
      expv[23] = 3'h4;
      expv[24] = 3'h4;
      expv[25] = 3'h4;
      expv[26] = 3'h4;
      expv[27] = 3'h4;
      expv[28] = 3'h4;
      expv[29] = 3'h4;
      expv[30] = 3'h4;
      expv[31] = 3'h4;
      expv[32] = 3'h7;
      expv[33] = 3'h5;
      expv[34] = 3'h0;
      expv[35] = 3'h0;
      expv[36] = 3'h0;
      expv[37] = 3'h0;
      expv[38] = 3'h0;
      expv[39] = 3'h0;
      expv[40] = 3'h0;
      expv[41] = 3'h0;
      expv[42] = 3'h0;
      expv[43] = 3'h0;
      expv[44] = 3'h0;
      expv[45] = 3'h3;
      expv[46] = 3'h1;
      expv[47] = 3'h1;
      expv[48] = 3'h1;
      expv[49] = 3'h1;
      expv[50] = 3'h1;
      expv[51] = 3'h1;
      expv[52] = 3'h1;
      expv[53] = 3'h1;
      expv[54] = 3'h1;
      expv[55] = 3'h6;
      expv[56] = 3'h4;
      expv[57] = 3'h4;
      expv[58] = 3'h4;
      expv[59] = 3'h4;
      expv[60] = 3'h4;
      expv[61] = 3'h4;
      expv[62] = 3'h4;
      expv[63] = 3'h4;
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
