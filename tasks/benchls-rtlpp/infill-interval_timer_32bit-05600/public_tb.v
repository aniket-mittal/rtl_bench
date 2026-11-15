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

  rtlpp_05600 dut (
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
    stim[0] = 22'h05b8bf;
    stim[1] = 22'h10df6b;
    stim[2] = 22'h1febea;
    stim[3] = 22'h32dea8;
    stim[4] = 22'h374e27;
    stim[5] = 22'h226a17;
    stim[6] = 22'h2f3b84;
    stim[7] = 22'h3ab08f;
    stim[8] = 22'h33a6bf;
    stim[9] = 22'h2b97c2;
    stim[10] = 22'h13a6b3;
    stim[11] = 22'h36ef4e;
    stim[12] = 22'h0aa6ae;
    stim[13] = 22'h236e02;
    stim[14] = 22'h2fb0ab;
    stim[15] = 22'h0b6f4f;
    stim[16] = 22'h0b8387;
    stim[17] = 22'h1b58af;
    stim[18] = 22'h27ca3d;
    stim[19] = 22'h16a7bd;
    stim[20] = 22'h13b9e0;
    stim[21] = 22'h161e66;
    stim[22] = 22'h2f32b3;
    stim[23] = 22'h13eea1;
    stim[24] = 22'h2a6f37;
    stim[25] = 22'h2b96fc;
    stim[26] = 22'h2e121c;
    stim[27] = 22'h1667f4;
    stim[28] = 22'h329a36;
    stim[29] = 22'h27691f;
    stim[30] = 22'h2b5166;
    stim[31] = 22'h2fe795;
    stim[32] = 22'h2f7798;
    stim[33] = 22'h2fed31;
    stim[34] = 22'h2e4ad1;
    stim[35] = 22'h03666b;
    stim[36] = 22'h17e006;
    stim[37] = 22'h070c1e;
    stim[38] = 22'h3fe6dc;
    stim[39] = 22'h03784b;
    stim[40] = 22'h3ba20d;
    stim[41] = 22'h0a6c15;
    stim[42] = 22'h0796e9;
    stim[43] = 22'h3b0135;
    stim[44] = 22'h0f50d4;
    stim[45] = 22'h02393c;
    stim[46] = 22'h37f514;
    stim[47] = 22'h12dba5;
    stim[48] = 22'h0ff392;
    stim[49] = 22'h0e284f;
    stim[50] = 22'h3792f3;
    stim[51] = 22'h138956;
    stim[52] = 22'h334af1;
    stim[53] = 22'h03f7b0;
    stim[54] = 22'h1ac701;
    stim[55] = 22'h3728bd;
    stim[56] = 22'h22d2bb;
    stim[57] = 22'h37d9fb;
    stim[58] = 22'h36b472;
    stim[59] = 22'h1b8111;
    stim[60] = 22'h16301b;
    stim[61] = 22'h33e024;
    stim[62] = 22'h332be4;
    stim[63] = 22'h3b95dd;
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
      expv[3] = 17'h00007;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00a1f;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00007;
      expv[19] = 17'h00000;
      expv[20] = 17'h00a1f;
      expv[21] = 17'h0a7bd;
      expv[22] = 17'h0a7bd;
      expv[23] = 17'h00000;
      expv[24] = 17'h01e66;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h01e66;
      expv[29] = 17'h00000;
      expv[30] = 17'h01e66;
      expv[31] = 17'h00007;
      expv[32] = 17'h00007;
      expv[33] = 17'h00007;
      expv[34] = 17'h00007;
      expv[35] = 17'h00007;
      expv[36] = 17'h00000;
      expv[37] = 17'h067f4;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h067f4;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h067f4;
      expv[53] = 17'h00000;
      expv[54] = 17'h00002;
      expv[55] = 17'h00007;
      expv[56] = 17'h00000;
      expv[57] = 17'h067f4;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00007;
      expv[61] = 17'h067f4;
      expv[62] = 17'h00000;
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
