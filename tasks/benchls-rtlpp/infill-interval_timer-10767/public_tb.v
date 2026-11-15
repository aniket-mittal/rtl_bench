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

  rtlpp_10767 dut (
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
    stim[0] = 22'h31aebc;
    stim[1] = 22'h18195e;
    stim[2] = 22'h366267;
    stim[3] = 22'h069c76;
    stim[4] = 22'h3e0fe8;
    stim[5] = 22'h2e3818;
    stim[6] = 22'h1776d4;
    stim[7] = 22'h2b9df3;
    stim[8] = 22'h1745d1;
    stim[9] = 22'h3e7731;
    stim[10] = 22'h06f46e;
    stim[11] = 22'h070aa1;
    stim[12] = 22'h0eeb86;
    stim[13] = 22'h1e27d1;
    stim[14] = 22'h2686da;
    stim[15] = 22'h1f4aa8;
    stim[16] = 22'h1201fb;
    stim[17] = 22'h0696d0;
    stim[18] = 22'h2e5e18;
    stim[19] = 22'h324874;
    stim[20] = 22'h3a872c;
    stim[21] = 22'h3769ba;
    stim[22] = 22'h2e9148;
    stim[23] = 22'h3f0b8a;
    stim[24] = 22'h1ad7e4;
    stim[25] = 22'h3e2042;
    stim[26] = 22'h3fcb49;
    stim[27] = 22'h265700;
    stim[28] = 22'h2f0aaf;
    stim[29] = 22'h13f4cb;
    stim[30] = 22'h27c5fa;
    stim[31] = 22'h1fcd74;
    stim[32] = 22'h120f7e;
    stim[33] = 22'h3eaf4f;
    stim[34] = 22'h3be5fd;
    stim[35] = 22'h331f2b;
    stim[36] = 22'h1a9e4d;
    stim[37] = 22'h364f8e;
    stim[38] = 22'h3e624c;
    stim[39] = 22'h1b1c73;
    stim[40] = 22'h2b7850;
    stim[41] = 22'h236660;
    stim[42] = 22'h1298d7;
    stim[43] = 22'h0fd7b1;
    stim[44] = 22'h1a886d;
    stim[45] = 22'h13000a;
    stim[46] = 22'h122085;
    stim[47] = 22'h1b3413;
    stim[48] = 22'h27449b;
    stim[49] = 22'h3a0b5c;
    stim[50] = 22'h177e4c;
    stim[51] = 22'h26662f;
    stim[52] = 22'h3a9903;
    stim[53] = 22'h1bdefb;
    stim[54] = 22'h225288;
    stim[55] = 22'h0fa7a1;
    stim[56] = 22'h16ca5f;
    stim[57] = 22'h3f44be;
    stim[58] = 22'h03b53d;
    stim[59] = 22'h3f1590;
    stim[60] = 22'h236e72;
    stim[61] = 22'h227084;
    stim[62] = 22'h2fa0bf;
    stim[63] = 22'h07a106;
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
      expv[7] = 17'h0c34f;
      expv[8] = 17'h00000;
      expv[9] = 17'h0c34f;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h0c34f;
      expv[16] = 17'h027d1;
      expv[17] = 17'h0c34f;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h027d1;
      expv[24] = 17'h00000;
      expv[25] = 17'h027d1;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h0c34f;
      expv[29] = 17'h027d1;
      expv[30] = 17'h0c34f;
      expv[31] = 17'h0c34f;
      expv[32] = 17'h027d1;
      expv[33] = 17'h0c34f;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h027d1;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h027d1;
      expv[41] = 17'h027d1;
      expv[42] = 17'h0c34f;
      expv[43] = 17'h0c34f;
      expv[44] = 17'h00006;
      expv[45] = 17'h027d1;
      expv[46] = 17'h0c34f;
      expv[47] = 17'h0c34f;
      expv[48] = 17'h027d1;
      expv[49] = 17'h0c34f;
      expv[50] = 17'h00000;
      expv[51] = 17'h0c34f;
      expv[52] = 17'h0c34f;
      expv[53] = 17'h00000;
      expv[54] = 17'h027d1;
      expv[55] = 17'h0c34f;
      expv[56] = 17'h00006;
      expv[57] = 17'h0c34f;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h0c34f;
      expv[62] = 17'h0c34f;
      expv[63] = 17'h027d1;
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
