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

  rtlpp_00909 dut (
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
    stim[0] = 9'h15c;
    stim[1] = 9'h140;
    stim[2] = 9'h0a0;
    stim[3] = 9'h0d7;
    stim[4] = 9'h000;
    stim[5] = 9'h0e7;
    stim[6] = 9'h091;
    stim[7] = 9'h03c;
    stim[8] = 9'h099;
    stim[9] = 9'h0a1;
    stim[10] = 9'h03f;
    stim[11] = 9'h03b;
    stim[12] = 9'h0b7;
    stim[13] = 9'h033;
    stim[14] = 9'h082;
    stim[15] = 9'h00c;
    stim[16] = 9'h073;
    stim[17] = 9'h089;
    stim[18] = 9'h013;
    stim[19] = 9'h02c;
    stim[20] = 9'h076;
    stim[21] = 9'h062;
    stim[22] = 9'h048;
    stim[23] = 9'h095;
    stim[24] = 9'h03a;
    stim[25] = 9'h068;
    stim[26] = 9'h076;
    stim[27] = 9'h072;
    stim[28] = 9'h021;
    stim[29] = 9'h0c7;
    stim[30] = 9'h028;
    stim[31] = 9'h024;
    stim[32] = 9'h0c2;
    stim[33] = 9'h059;
    stim[34] = 9'h1e6;
    stim[35] = 9'h01d;
    stim[36] = 9'h043;
    stim[37] = 9'h074;
    stim[38] = 9'h0c1;
    stim[39] = 9'h0ea;
    stim[40] = 9'h081;
    stim[41] = 9'h09a;
    stim[42] = 9'h0b5;
    stim[43] = 9'h001;
    stim[44] = 9'h062;
    stim[45] = 9'h038;
    stim[46] = 9'h096;
    stim[47] = 9'h0ac;
    stim[48] = 9'h0ae;
    stim[49] = 9'h063;
    stim[50] = 9'h0c0;
    stim[51] = 9'h0a7;
    stim[52] = 9'h099;
    stim[53] = 9'h098;
    stim[54] = 9'h0da;
    stim[55] = 9'h02b;
    stim[56] = 9'h0bf;
    stim[57] = 9'h099;
    stim[58] = 9'h003;
    stim[59] = 9'h0e8;
    stim[60] = 9'h046;
    stim[61] = 9'h041;
    stim[62] = 9'h0f9;
    stim[63] = 9'h089;
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
