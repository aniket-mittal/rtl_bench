// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_104426 dut (
    .clock(clk),
    .io_d(in_vec[11:0]),
    .io_q(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h66d;
    stim[1] = 12'h523;
    stim[2] = 12'hb1c;
    stim[3] = 12'h1c2;
    stim[4] = 12'h6b0;
    stim[5] = 12'h39e;
    stim[6] = 12'ha64;
    stim[7] = 12'hf31;
    stim[8] = 12'h053;
    stim[9] = 12'h04b;
    stim[10] = 12'h1ce;
    stim[11] = 12'hf95;
    stim[12] = 12'hb2b;
    stim[13] = 12'hb6e;
    stim[14] = 12'h13d;
    stim[15] = 12'h66a;
    stim[16] = 12'hbe4;
    stim[17] = 12'h076;
    stim[18] = 12'h1ed;
    stim[19] = 12'h885;
    stim[20] = 12'h0ea;
    stim[21] = 12'h7ba;
    stim[22] = 12'h83d;
    stim[23] = 12'h8f1;
    stim[24] = 12'h7aa;
    stim[25] = 12'he2b;
    stim[26] = 12'h0cd;
    stim[27] = 12'hffa;
    stim[28] = 12'h08b;
    stim[29] = 12'ha41;
    stim[30] = 12'h5cb;
    stim[31] = 12'hea1;
    stim[32] = 12'h6d3;
    stim[33] = 12'h797;
    stim[34] = 12'h349;
    stim[35] = 12'h593;
    stim[36] = 12'h2c3;
    stim[37] = 12'hbfd;
    stim[38] = 12'h497;
    stim[39] = 12'hcfb;
    stim[40] = 12'h6c8;
    stim[41] = 12'h3e3;
    stim[42] = 12'h18c;
    stim[43] = 12'hb55;
    stim[44] = 12'h6a6;
    stim[45] = 12'hc32;
    stim[46] = 12'heee;
    stim[47] = 12'h015;
    stim[48] = 12'habd;
    stim[49] = 12'h737;
    stim[50] = 12'h8b9;
    stim[51] = 12'hdf1;
    stim[52] = 12'h532;
    stim[53] = 12'h96b;
    stim[54] = 12'h678;
    stim[55] = 12'h7af;
    stim[56] = 12'haff;
    stim[57] = 12'h59b;
    stim[58] = 12'h394;
    stim[59] = 12'h3a6;
    stim[60] = 12'h587;
    stim[61] = 12'h409;
    stim[62] = 12'h375;
    stim[63] = 12'hec0;
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
      expv[0] = 12'hxxx;
      expv[1] = 12'h66d;
      expv[2] = 12'h523;
      expv[3] = 12'hb1c;
      expv[4] = 12'h1c2;
      expv[5] = 12'h6b0;
      expv[6] = 12'h39e;
      expv[7] = 12'ha64;
      expv[8] = 12'hf31;
      expv[9] = 12'h053;
      expv[10] = 12'h04b;
      expv[11] = 12'h1ce;
      expv[12] = 12'hf95;
      expv[13] = 12'hb2b;
      expv[14] = 12'hb6e;
      expv[15] = 12'h13d;
      expv[16] = 12'h66a;
      expv[17] = 12'hbe4;
      expv[18] = 12'h076;
      expv[19] = 12'h1ed;
      expv[20] = 12'h885;
      expv[21] = 12'h0ea;
      expv[22] = 12'h7ba;
      expv[23] = 12'h83d;
      expv[24] = 12'h8f1;
      expv[25] = 12'h7aa;
      expv[26] = 12'he2b;
      expv[27] = 12'h0cd;
      expv[28] = 12'hffa;
      expv[29] = 12'h08b;
      expv[30] = 12'ha41;
      expv[31] = 12'h5cb;
      expv[32] = 12'hea1;
      expv[33] = 12'h6d3;
      expv[34] = 12'h797;
      expv[35] = 12'h349;
      expv[36] = 12'h593;
      expv[37] = 12'h2c3;
      expv[38] = 12'hbfd;
      expv[39] = 12'h497;
      expv[40] = 12'hcfb;
      expv[41] = 12'h6c8;
      expv[42] = 12'h3e3;
      expv[43] = 12'h18c;
      expv[44] = 12'hb55;
      expv[45] = 12'h6a6;
      expv[46] = 12'hc32;
      expv[47] = 12'heee;
      expv[48] = 12'h015;
      expv[49] = 12'habd;
      expv[50] = 12'h737;
      expv[51] = 12'h8b9;
      expv[52] = 12'hdf1;
      expv[53] = 12'h532;
      expv[54] = 12'h96b;
      expv[55] = 12'h678;
      expv[56] = 12'h7af;
      expv[57] = 12'haff;
      expv[58] = 12'h59b;
      expv[59] = 12'h394;
      expv[60] = 12'h3a6;
      expv[61] = 12'h587;
      expv[62] = 12'h409;
      expv[63] = 12'h375;
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
