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

  rtlpp_10889 dut (
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
    stim[0] = 22'h25ad15;
    stim[1] = 22'h298e28;
    stim[2] = 22'h3e6721;
    stim[3] = 22'h070108;
    stim[4] = 22'h0b52a2;
    stim[5] = 22'h1b204f;
    stim[6] = 22'h328fa5;
    stim[7] = 22'h1e67b6;
    stim[8] = 22'h3a6c07;
    stim[9] = 22'h0f8acb;
    stim[10] = 22'h1b94b1;
    stim[11] = 22'h2b7651;
    stim[12] = 22'h0a4d13;
    stim[13] = 22'h0af8c7;
    stim[14] = 22'h0f3373;
    stim[15] = 22'h0bdeca;
    stim[16] = 22'h3b5991;
    stim[17] = 22'h07307c;
    stim[18] = 22'h26c110;
    stim[19] = 22'h2e1474;
    stim[20] = 22'h33a331;
    stim[21] = 22'h061bfe;
    stim[22] = 22'h065fa3;
    stim[23] = 22'h372cd1;
    stim[24] = 22'h3f8305;
    stim[25] = 22'h066ea0;
    stim[26] = 22'h1b16d5;
    stim[27] = 22'h12849a;
    stim[28] = 22'h2a2975;
    stim[29] = 22'h1b5d2f;
    stim[30] = 22'h3e2595;
    stim[31] = 22'h0ac369;
    stim[32] = 22'h1f7fb2;
    stim[33] = 22'h175158;
    stim[34] = 22'h327e4b;
    stim[35] = 22'h0e7298;
    stim[36] = 22'h0e0634;
    stim[37] = 22'h0f9c8d;
    stim[38] = 22'h3af0a4;
    stim[39] = 22'h0bc762;
    stim[40] = 22'h320d93;
    stim[41] = 22'h0fbb16;
    stim[42] = 22'h26a0b0;
    stim[43] = 22'h36cd79;
    stim[44] = 22'h069068;
    stim[45] = 22'h3fc4ad;
    stim[46] = 22'h2baa13;
    stim[47] = 22'h2e79fe;
    stim[48] = 22'h0fbbf9;
    stim[49] = 22'h235802;
    stim[50] = 22'h3610d6;
    stim[51] = 22'h066ce4;
    stim[52] = 22'h0f2db6;
    stim[53] = 22'h3f6d46;
    stim[54] = 22'h0a3e53;
    stim[55] = 22'h0f3f47;
    stim[56] = 22'h121a16;
    stim[57] = 22'h235f9b;
    stim[58] = 22'h0282b1;
    stim[59] = 22'h23572f;
    stim[60] = 22'h0ec4f5;
    stim[61] = 22'h122bdb;
    stim[62] = 22'h1383a7;
    stim[63] = 22'h33baf1;
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
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h067b6;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h067b6;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h067b6;
      expv[28] = 17'h0c34f;
      expv[29] = 17'h067b6;
      expv[30] = 17'h067b6;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h067b6;
      expv[34] = 17'h0c34f;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00008;
      expv[38] = 17'h00004;
      expv[39] = 17'h00000;
      expv[40] = 17'h00004;
      expv[41] = 17'h00000;
      expv[42] = 17'h00004;
      expv[43] = 17'h0c34f;
      expv[44] = 17'h00000;
      expv[45] = 17'h00002;
      expv[46] = 17'h00000;
      expv[47] = 17'h067b6;
      expv[48] = 17'h067b6;
      expv[49] = 17'h00004;
      expv[50] = 17'h0c345;
      expv[51] = 17'h00000;
      expv[52] = 17'h00002;
      expv[53] = 17'h00004;
      expv[54] = 17'h00000;
      expv[55] = 17'h00004;
      expv[56] = 17'h00004;
      expv[57] = 17'h0c34f;
      expv[58] = 17'h0c345;
      expv[59] = 17'h00002;
      expv[60] = 17'h0c345;
      expv[61] = 17'h00004;
      expv[62] = 17'h0c34f;
      expv[63] = 17'h0c34f;
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
