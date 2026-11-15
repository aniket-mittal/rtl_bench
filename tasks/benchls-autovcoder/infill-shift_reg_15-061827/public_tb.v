// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_061827 dut (
    .clock(clk),
    .io_d(in_vec[14:0]),
    .io_q(out_vec[14:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h50e4;
    stim[1] = 15'h79d0;
    stim[2] = 15'h2e34;
    stim[3] = 15'h41b7;
    stim[4] = 15'h3f87;
    stim[5] = 15'h79fc;
    stim[6] = 15'h29e8;
    stim[7] = 15'h49e1;
    stim[8] = 15'h0881;
    stim[9] = 15'h1afe;
    stim[10] = 15'h0653;
    stim[11] = 15'h3de3;
    stim[12] = 15'h44b7;
    stim[13] = 15'h2f8b;
    stim[14] = 15'h565e;
    stim[15] = 15'h6657;
    stim[16] = 15'h07ad;
    stim[17] = 15'h23a3;
    stim[18] = 15'h1d27;
    stim[19] = 15'h45ec;
    stim[20] = 15'h48af;
    stim[21] = 15'h0c52;
    stim[22] = 15'h0bbe;
    stim[23] = 15'h7ddc;
    stim[24] = 15'h1845;
    stim[25] = 15'h3381;
    stim[26] = 15'h009f;
    stim[27] = 15'h77ce;
    stim[28] = 15'h03a9;
    stim[29] = 15'h5de7;
    stim[30] = 15'h54ee;
    stim[31] = 15'h521d;
    stim[32] = 15'h1a6c;
    stim[33] = 15'h14b3;
    stim[34] = 15'h128b;
    stim[35] = 15'h426d;
    stim[36] = 15'h4796;
    stim[37] = 15'h5732;
    stim[38] = 15'h5a91;
    stim[39] = 15'h7232;
    stim[40] = 15'h12ce;
    stim[41] = 15'h1a55;
    stim[42] = 15'h0566;
    stim[43] = 15'h4140;
    stim[44] = 15'h50da;
    stim[45] = 15'h0f68;
    stim[46] = 15'h37d8;
    stim[47] = 15'h671b;
    stim[48] = 15'h5431;
    stim[49] = 15'h7b5e;
    stim[50] = 15'h6328;
    stim[51] = 15'h607f;
    stim[52] = 15'h7c80;
    stim[53] = 15'h1309;
    stim[54] = 15'h6af7;
    stim[55] = 15'h359a;
    stim[56] = 15'h3972;
    stim[57] = 15'h263e;
    stim[58] = 15'h384b;
    stim[59] = 15'h2421;
    stim[60] = 15'h40f6;
    stim[61] = 15'h589b;
    stim[62] = 15'h6832;
    stim[63] = 15'h73e1;
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
      expv[0] = 15'hxxxx;
      expv[1] = 15'h50e4;
      expv[2] = 15'h79d0;
      expv[3] = 15'h2e34;
      expv[4] = 15'h41b7;
      expv[5] = 15'h3f87;
      expv[6] = 15'h79fc;
      expv[7] = 15'h29e8;
      expv[8] = 15'h49e1;
      expv[9] = 15'h0881;
      expv[10] = 15'h1afe;
      expv[11] = 15'h0653;
      expv[12] = 15'h3de3;
      expv[13] = 15'h44b7;
      expv[14] = 15'h2f8b;
      expv[15] = 15'h565e;
      expv[16] = 15'h6657;
      expv[17] = 15'h07ad;
      expv[18] = 15'h23a3;
      expv[19] = 15'h1d27;
      expv[20] = 15'h45ec;
      expv[21] = 15'h48af;
      expv[22] = 15'h0c52;
      expv[23] = 15'h0bbe;
      expv[24] = 15'h7ddc;
      expv[25] = 15'h1845;
      expv[26] = 15'h3381;
      expv[27] = 15'h009f;
      expv[28] = 15'h77ce;
      expv[29] = 15'h03a9;
      expv[30] = 15'h5de7;
      expv[31] = 15'h54ee;
      expv[32] = 15'h521d;
      expv[33] = 15'h1a6c;
      expv[34] = 15'h14b3;
      expv[35] = 15'h128b;
      expv[36] = 15'h426d;
      expv[37] = 15'h4796;
      expv[38] = 15'h5732;
      expv[39] = 15'h5a91;
      expv[40] = 15'h7232;
      expv[41] = 15'h12ce;
      expv[42] = 15'h1a55;
      expv[43] = 15'h0566;
      expv[44] = 15'h4140;
      expv[45] = 15'h50da;
      expv[46] = 15'h0f68;
      expv[47] = 15'h37d8;
      expv[48] = 15'h671b;
      expv[49] = 15'h5431;
      expv[50] = 15'h7b5e;
      expv[51] = 15'h6328;
      expv[52] = 15'h607f;
      expv[53] = 15'h7c80;
      expv[54] = 15'h1309;
      expv[55] = 15'h6af7;
      expv[56] = 15'h359a;
      expv[57] = 15'h3972;
      expv[58] = 15'h263e;
      expv[59] = 15'h384b;
      expv[60] = 15'h2421;
      expv[61] = 15'h40f6;
      expv[62] = 15'h589b;
      expv[63] = 15'h6832;
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
