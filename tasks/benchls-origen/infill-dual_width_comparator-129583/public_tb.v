// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_129583 dut (
    .a16(in_vec[48:33]),
    .b16(in_vec[32:17]),
    .a8(in_vec[16:9]),
    .b8(in_vec[8:1]),
    .size_select(in_vec[0:0]),
    .final_result(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h031bf791aa97a;
    stim[1] = 49'h1e6e0217e3e0e;
    stim[2] = 49'h0174664c3cdd0;
    stim[3] = 49'h170c66a12fef1;
    stim[4] = 49'h0e7e0f5235ed9;
    stim[5] = 49'h0f7aecf408336;
    stim[6] = 49'h0162650a01aa7;
    stim[7] = 49'h18f3a304339d7;
    stim[8] = 49'h00ed01bde3485;
    stim[9] = 49'h0786116435f7c;
    stim[10] = 49'h12498a550659e;
    stim[11] = 49'h000858518a2f5;
    stim[12] = 49'h0fd483a262448;
    stim[13] = 49'h1bf511659fc2b;
    stim[14] = 49'h1b98cd55ea489;
    stim[15] = 49'h0456f6917288b;
    stim[16] = 49'h005f77f042555;
    stim[17] = 49'h143850e3d50e0;
    stim[18] = 49'h0496a29737949;
    stim[19] = 49'h0a45d0c96379c;
    stim[20] = 49'h135b1f4192faa;
    stim[21] = 49'h1895ba99f4efb;
    stim[22] = 49'h07ad7740dc7db;
    stim[23] = 49'h1fba92ac1cd86;
    stim[24] = 49'h0b41924b13114;
    stim[25] = 49'h10e1b3d09745e;
    stim[26] = 49'h0c35375b1c350;
    stim[27] = 49'h14b9fba4e5878;
    stim[28] = 49'h030de1ce8227e;
    stim[29] = 49'h0da60b763047c;
    stim[30] = 49'h016d14203abf0;
    stim[31] = 49'h0c1444ee85dcd;
    stim[32] = 49'h0dea817f97c8a;
    stim[33] = 49'h00925b1397ac0;
    stim[34] = 49'h0546375cfb1b0;
    stim[35] = 49'h14e3bb3b01093;
    stim[36] = 49'h045be8f82b361;
    stim[37] = 49'h1f40ec432bb20;
    stim[38] = 49'h1cb4408d91d14;
    stim[39] = 49'h065de067afc6d;
    stim[40] = 49'h0ff2718dcf53f;
    stim[41] = 49'h002e06d12020a;
    stim[42] = 49'h1ac333c14a6d2;
    stim[43] = 49'h02c2f0f88aa45;
    stim[44] = 49'h165a5b1997738;
    stim[45] = 49'h105ec0737d572;
    stim[46] = 49'h1f47437c88d13;
    stim[47] = 49'h06ef3d1f3bb77;
    stim[48] = 49'h0c47ee2f612ed;
    stim[49] = 49'h1380843e52fc1;
    stim[50] = 49'h1002a23af24b9;
    stim[51] = 49'h012523d7d7b2c;
    stim[52] = 49'h0c987b4bf57a0;
    stim[53] = 49'h072ebe6115a7d;
    stim[54] = 49'h0f7b6c4b3b37a;
    stim[55] = 49'h12658c97d77cc;
    stim[56] = 49'h089390864e20d;
    stim[57] = 49'h1b7756b82f169;
    stim[58] = 49'h18bf6620bfdb6;
    stim[59] = 49'h1b3de20e17ab6;
    stim[60] = 49'h12ee5e5516e74;
    stim[61] = 49'h196e578c260e1;
    stim[62] = 49'h0e9c8aca79007;
    stim[63] = 49'h07d29c899ec4e;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h1;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
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
