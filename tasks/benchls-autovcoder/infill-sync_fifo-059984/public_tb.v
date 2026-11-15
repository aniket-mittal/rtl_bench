// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_059984 dut (
    .clk(clk),
    .reset(in_vec[12:12]),
    .if_write_ce(in_vec[11:11]),
    .if_write(in_vec[10:10]),
    .if_din(in_vec[9:2]),
    .if_read_ce(in_vec[1:1]),
    .if_read(in_vec[0:0]),
    .if_full_n(out_vec[9:9]),
    .if_empty_n(out_vec[8:8]),
    .if_dout(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h1d55;
    stim[1] = 13'h1eea;
    stim[2] = 13'h07e6;
    stim[3] = 13'h0d5b;
    stim[4] = 13'h0d79;
    stim[5] = 13'h0bf9;
    stim[6] = 13'h06cc;
    stim[7] = 13'h041d;
    stim[8] = 13'h0fa8;
    stim[9] = 13'h0a7e;
    stim[10] = 13'h045a;
    stim[11] = 13'h0f1a;
    stim[12] = 13'h0c9f;
    stim[13] = 13'h004c;
    stim[14] = 13'h0ec0;
    stim[15] = 13'h03e0;
    stim[16] = 13'h1488;
    stim[17] = 13'h0b0e;
    stim[18] = 13'h090d;
    stim[19] = 13'h0828;
    stim[20] = 13'h096d;
    stim[21] = 13'h0f68;
    stim[22] = 13'h0673;
    stim[23] = 13'h0f0b;
    stim[24] = 13'h0b19;
    stim[25] = 13'h07d1;
    stim[26] = 13'h0674;
    stim[27] = 13'h08cd;
    stim[28] = 13'h0dda;
    stim[29] = 13'h076f;
    stim[30] = 13'h0aa8;
    stim[31] = 13'h04d0;
    stim[32] = 13'h0f86;
    stim[33] = 13'h034e;
    stim[34] = 13'h0bc6;
    stim[35] = 13'h0333;
    stim[36] = 13'h0eb3;
    stim[37] = 13'h07fd;
    stim[38] = 13'h09ed;
    stim[39] = 13'h0cfc;
    stim[40] = 13'h0c04;
    stim[41] = 13'h0327;
    stim[42] = 13'h0b0f;
    stim[43] = 13'h0f0b;
    stim[44] = 13'h0f3c;
    stim[45] = 13'h028c;
    stim[46] = 13'h052a;
    stim[47] = 13'h0922;
    stim[48] = 13'h06bd;
    stim[49] = 13'h00d2;
    stim[50] = 13'h06a5;
    stim[51] = 13'h046c;
    stim[52] = 13'h0bef;
    stim[53] = 13'h0e9b;
    stim[54] = 13'h0e7d;
    stim[55] = 13'h04f4;
    stim[56] = 13'h0ad2;
    stim[57] = 13'h0eb7;
    stim[58] = 13'h09a6;
    stim[59] = 13'h026f;
    stim[60] = 13'h0ce1;
    stim[61] = 13'h0fbf;
    stim[62] = 13'h0b43;
    stim[63] = 13'h0bc5;
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
      expv[0] = 10'h200;
      expv[1] = 10'h200;
      expv[2] = 10'h200;
      expv[3] = 10'h200;
      expv[4] = 10'h200;
      expv[5] = 10'h200;
      expv[6] = 10'h200;
      expv[7] = 10'h200;
      expv[8] = 10'h200;
      expv[9] = 10'h200;
      expv[10] = 10'h356;
      expv[11] = 10'h356;
      expv[12] = 10'h356;
      expv[13] = 10'h35e;
      expv[14] = 10'h35e;
      expv[15] = 10'h35e;
      expv[16] = 10'h35e;
      expv[17] = 10'h200;
      expv[18] = 10'h200;
      expv[19] = 10'h200;
      expv[20] = 10'h200;
      expv[21] = 10'h200;
      expv[22] = 10'h200;
      expv[23] = 10'h3da;
      expv[24] = 10'h2da;
      expv[25] = 10'h2da;
      expv[26] = 10'h2da;
      expv[27] = 10'h2da;
      expv[28] = 10'h2da;
      expv[29] = 10'h3c2;
      expv[30] = 10'h376;
      expv[31] = 10'h376;
      expv[32] = 10'h376;
      expv[33] = 10'h376;
      expv[34] = 10'h376;
      expv[35] = 10'h376;
      expv[36] = 10'h3e1;
      expv[37] = 10'h2e1;
      expv[38] = 10'h2e1;
      expv[39] = 10'h2e1;
      expv[40] = 10'h2e1;
      expv[41] = 10'h2e1;
      expv[42] = 10'h3ac;
      expv[43] = 10'h33f;
      expv[44] = 10'h301;
      expv[45] = 10'h301;
      expv[46] = 10'h301;
      expv[47] = 10'h301;
      expv[48] = 10'h301;
      expv[49] = 10'h301;
      expv[50] = 10'h301;
      expv[51] = 10'h301;
      expv[52] = 10'h301;
      expv[53] = 10'h3c2;
      expv[54] = 10'h3cf;
      expv[55] = 10'h3cf;
      expv[56] = 10'h3cf;
      expv[57] = 10'h3cf;
      expv[58] = 10'h3a6;
      expv[59] = 10'h3a6;
      expv[60] = 10'h39f;
      expv[61] = 10'h39f;
      expv[62] = 10'h3ad;
      expv[63] = 10'h338;
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
