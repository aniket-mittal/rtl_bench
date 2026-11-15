// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05605 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h0c3e87;
    stim[1] = 22'h19f536;
    stim[2] = 22'h07a253;
    stim[3] = 22'h2611d4;
    stim[4] = 22'h0e2795;
    stim[5] = 22'h173259;
    stim[6] = 22'h07060a;
    stim[7] = 22'h02495d;
    stim[8] = 22'h330e7f;
    stim[9] = 22'h32ec22;
    stim[10] = 22'h06098a;
    stim[11] = 22'h32ce5b;
    stim[12] = 22'h036c07;
    stim[13] = 22'h17457f;
    stim[14] = 22'h0fd924;
    stim[15] = 22'h0236a7;
    stim[16] = 22'h3fc826;
    stim[17] = 22'h127e21;
    stim[18] = 22'h06626d;
    stim[19] = 22'h13c146;
    stim[20] = 22'h3bee96;
    stim[21] = 22'h1bc074;
    stim[22] = 22'h138b0f;
    stim[23] = 22'h3f8187;
    stim[24] = 22'h2e6bbd;
    stim[25] = 22'h23aa72;
    stim[26] = 22'h0ff44a;
    stim[27] = 22'h0e0b08;
    stim[28] = 22'h175deb;
    stim[29] = 22'h13e9b9;
    stim[30] = 22'h2b6c68;
    stim[31] = 22'h0b5c7e;
    stim[32] = 22'h2f499d;
    stim[33] = 22'h1227cb;
    stim[34] = 22'h332ba9;
    stim[35] = 22'h3a2b06;
    stim[36] = 22'h0a0906;
    stim[37] = 22'h2b4345;
    stim[38] = 22'h0e7b56;
    stim[39] = 22'h1ff46e;
    stim[40] = 22'h3e671b;
    stim[41] = 22'h1624a0;
    stim[42] = 22'h0e2dc7;
    stim[43] = 22'h2a4fec;
    stim[44] = 22'h2b481c;
    stim[45] = 22'h272822;
    stim[46] = 22'h1aeb91;
    stim[47] = 22'h17199c;
    stim[48] = 22'h1e1691;
    stim[49] = 22'h046f9f;
    stim[50] = 22'h2e4b54;
    stim[51] = 22'h1373d6;
    stim[52] = 22'h32f694;
    stim[53] = 22'h165c09;
    stim[54] = 22'h1fc0de;
    stim[55] = 22'h321529;
    stim[56] = 22'h224a7a;
    stim[57] = 22'h1bed4e;
    stim[58] = 22'h29f0f5;
    stim[59] = 22'h06a9aa;
    stim[60] = 22'h3e25af;
    stim[61] = 22'h17d4be;
    stim[62] = 22'h27976a;
    stim[63] = 22'h36bdd5;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h0c34f;
      expv[7] = 17'h00002;
      expv[8] = 17'h00002;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00002;
      expv[12] = 17'h00000;
      expv[13] = 17'h00002;
      expv[14] = 17'h0c34f;
      expv[15] = 17'h00005;
      expv[16] = 17'h00002;
      expv[17] = 17'h00000;
      expv[18] = 17'h0c34f;
      expv[19] = 17'h00002;
      expv[20] = 17'h0c34f;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h0c34f;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h0c33c;
      expv[27] = 17'h00005;
      expv[28] = 17'h00005;
      expv[29] = 17'h0c34f;
      expv[30] = 17'h0c34f;
      expv[31] = 17'h00000;
      expv[32] = 17'h00008;
      expv[33] = 17'h00000;
      expv[34] = 17'h0c34f;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00008;
      expv[38] = 17'h00000;
      expv[39] = 17'h00008;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h0c34f;
      expv[43] = 17'h00006;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h0c33c;
      expv[47] = 17'h00000;
      expv[48] = 17'h024a0;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h0c34f;
      expv[53] = 17'h00000;
      expv[54] = 17'h0c34f;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h0c34f;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h0c34f;
      expv[63] = 17'h00000;
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
