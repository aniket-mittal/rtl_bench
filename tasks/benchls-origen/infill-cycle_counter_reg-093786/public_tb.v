// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_093786 dut (
    .clk(clk),
    .reset(in_vec[40:40]),
    .cs(in_vec[39:39]),
    .read(in_vec[38:38]),
    .write(in_vec[37:37]),
    .addr(in_vec[36:32]),
    .wr_data(in_vec[31:0]),
    .rd_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h131eec9cc67;
    stim[1] = 41'h153c48e9ad7;
    stim[2] = 41'h1e6a0041c97;
    stim[3] = 41'h0689f2107e3;
    stim[4] = 41'h0065371e46d;
    stim[5] = 41'h0f2a17e0817;
    stim[6] = 41'h055a5109eec;
    stim[7] = 41'h064f4d8588a;
    stim[8] = 41'h0b062d4f6ed;
    stim[9] = 41'h04dda54d4b0;
    stim[10] = 41'h0f2a291d54b;
    stim[11] = 41'h0e1227b42a9;
    stim[12] = 41'h0bda38ae917;
    stim[13] = 41'h0ac668e90b4;
    stim[14] = 41'h0adb3f40a01;
    stim[15] = 41'h0d6bc3e3467;
    stim[16] = 41'h01c92e8c78b;
    stim[17] = 41'h00417ac7b44;
    stim[18] = 41'h025fb0c24d2;
    stim[19] = 41'h0a1ded5d90b;
    stim[20] = 41'h0c0e00fa979;
    stim[21] = 41'h039c0d2ad47;
    stim[22] = 41'h03f680b5410;
    stim[23] = 41'h0920bc31f56;
    stim[24] = 41'h0de74ecb51b;
    stim[25] = 41'h0cfc167f3cf;
    stim[26] = 41'h040c8cdce98;
    stim[27] = 41'h0d8e8e6c8ba;
    stim[28] = 41'h0a68ff40db1;
    stim[29] = 41'h04cbe118d28;
    stim[30] = 41'h0a485341f0f;
    stim[31] = 41'h0bda2f3fc54;
    stim[32] = 41'h0e5cf911e2e;
    stim[33] = 41'h02f75d03394;
    stim[34] = 41'h06f8229ccaf;
    stim[35] = 41'h09a9c6b0099;
    stim[36] = 41'h0a575a1dc46;
    stim[37] = 41'h0eae1a43974;
    stim[38] = 41'h0e4c1ccfdb9;
    stim[39] = 41'h05cbf95d4b3;
    stim[40] = 41'h0f9a6f1a45e;
    stim[41] = 41'h0705efb8f99;
    stim[42] = 41'h022804c37e3;
    stim[43] = 41'h04067cd8fae;
    stim[44] = 41'h08314db1ec7;
    stim[45] = 41'h0760ae583f2;
    stim[46] = 41'h09b7d612f26;
    stim[47] = 41'h037516724db;
    stim[48] = 41'h031bacd3337;
    stim[49] = 41'h0a8d229de8b;
    stim[50] = 41'h011922abcde;
    stim[51] = 41'h0be2590d49b;
    stim[52] = 41'h0a34205c9b8;
    stim[53] = 41'h0df4058e79d;
    stim[54] = 41'h0b854697e10;
    stim[55] = 41'h0b9df2e5d78;
    stim[56] = 41'h019a1768afd;
    stim[57] = 41'h17af7a00a86;
    stim[58] = 41'h0a5dcc075a5;
    stim[59] = 41'h0d1f06cc13b;
    stim[60] = 41'h07144c3b0a2;
    stim[61] = 41'h0c5d7cb94f4;
    stim[62] = 41'h00cbfe28efe;
    stim[63] = 41'h078c9610f24;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000004;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000004;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000009;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h0000000d;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000010;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h0000001a;
      expv[38] = 32'h0000001b;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000000;
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
