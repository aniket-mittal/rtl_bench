// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 29;
  localparam OW = 42;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_046838 dut (
    .CLK(clk),
    .reset(in_vec[28:28]),
    .operand(in_vec[27:16]),
    .number(in_vec[15:0]),
    .wren(out_vec[41:41]),
    .ready(out_vec[40:40]),
    .address(out_vec[39:28]),
    .result(out_vec[27:12]),
    .bsf(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 29'h140d73c8;
    stim[1] = 29'h104ea7de;
    stim[2] = 29'h0cbf827d;
    stim[3] = 29'h06b31691;
    stim[4] = 29'h07c75f50;
    stim[5] = 29'h06cd12b2;
    stim[6] = 29'h05d25689;
    stim[7] = 29'h0f901f1f;
    stim[8] = 29'h0ead1223;
    stim[9] = 29'h0e6f29c4;
    stim[10] = 29'h06b2f348;
    stim[11] = 29'h05f67c9b;
    stim[12] = 29'h0cd98ba9;
    stim[13] = 29'h0de4db25;
    stim[14] = 29'h07dfcb8e;
    stim[15] = 29'h03f3bdc9;
    stim[16] = 29'h057ba400;
    stim[17] = 29'h07e1007a;
    stim[18] = 29'h1a40df9d;
    stim[19] = 29'h08ccdc10;
    stim[20] = 29'h0b06be26;
    stim[21] = 29'h01cd5069;
    stim[22] = 29'h0c76e936;
    stim[23] = 29'h10df8dfc;
    stim[24] = 29'h0db07413;
    stim[25] = 29'h092ec409;
    stim[26] = 29'h06993e88;
    stim[27] = 29'h0fc8e4c9;
    stim[28] = 29'h0b6f2833;
    stim[29] = 29'h0c72df78;
    stim[30] = 29'h09e392d8;
    stim[31] = 29'h0966c4e9;
    stim[32] = 29'h06ebc994;
    stim[33] = 29'h04b3cdf3;
    stim[34] = 29'h105c08b6;
    stim[35] = 29'h093ec82f;
    stim[36] = 29'h05cb8716;
    stim[37] = 29'h06576aae;
    stim[38] = 29'h0f89899c;
    stim[39] = 29'h0cbf8c31;
    stim[40] = 29'h071542ee;
    stim[41] = 29'h0073fe31;
    stim[42] = 29'h0f5fc2c5;
    stim[43] = 29'h0f1b395c;
    stim[44] = 29'h0472905b;
    stim[45] = 29'h0655552f;
    stim[46] = 29'h0bace668;
    stim[47] = 29'h00edb6cb;
    stim[48] = 29'h00b87cfb;
    stim[49] = 29'h0a5f4d04;
    stim[50] = 29'h06b9989f;
    stim[51] = 29'h0194501e;
    stim[52] = 29'h0bbbb58e;
    stim[53] = 29'h077363e3;
    stim[54] = 29'h0385a9b5;
    stim[55] = 29'h0142a1d3;
    stim[56] = 29'h075c50b2;
    stim[57] = 29'h05af5059;
    stim[58] = 29'h0d579a88;
    stim[59] = 29'h06d4bc99;
    stim[60] = 29'h04cccc74;
    stim[61] = 29'h054b9b25;
    stim[62] = 29'h0473e547;
    stim[63] = 29'h0fd8ec74;
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
      expv[0] = 42'h00000000000;
      expv[1] = 42'h00000000000;
      expv[2] = 42'h00000000000;
      expv[3] = 42'h20000000000;
      expv[4] = 42'h20010001000;
      expv[5] = 42'h20020001000;
      expv[6] = 42'h20030002000;
      expv[7] = 42'h20040003000;
      expv[8] = 42'h20050005000;
      expv[9] = 42'h20060008000;
      expv[10] = 42'h2007000d000;
      expv[11] = 42'h20080015000;
      expv[12] = 42'h20090022000;
      expv[13] = 42'h200a0037000;
      expv[14] = 42'h200b0059000;
      expv[15] = 42'h200c0090000;
      expv[16] = 42'h200d00e9000;
      expv[17] = 42'h200e0179000;
      expv[18] = 42'h00000000000;
      expv[19] = 42'h00000000000;
      expv[20] = 42'h20000000000;
      expv[21] = 42'h20010001000;
      expv[22] = 42'h20020001000;
      expv[23] = 42'h00000000000;
      expv[24] = 42'h00000000000;
      expv[25] = 42'h20000000000;
      expv[26] = 42'h20010001000;
      expv[27] = 42'h20020001000;
      expv[28] = 42'h20030002000;
      expv[29] = 42'h20040003000;
      expv[30] = 42'h20050005000;
      expv[31] = 42'h20060008000;
      expv[32] = 42'h2007000d000;
      expv[33] = 42'h20080015000;
      expv[34] = 42'h00000000000;
      expv[35] = 42'h00000000000;
      expv[36] = 42'h20000000000;
      expv[37] = 42'h20010001000;
      expv[38] = 42'h20020001000;
      expv[39] = 42'h20030002000;
      expv[40] = 42'h20040003000;
      expv[41] = 42'h20050005000;
      expv[42] = 42'h20060008000;
      expv[43] = 42'h2007000d000;
      expv[44] = 42'h20080015000;
      expv[45] = 42'h20090022000;
      expv[46] = 42'h200a0037000;
      expv[47] = 42'h200b0059000;
      expv[48] = 42'h200c0090000;
      expv[49] = 42'h200d00e9000;
      expv[50] = 42'h200e0179000;
      expv[51] = 42'h200f0262000;
      expv[52] = 42'h201003db000;
      expv[53] = 42'h2011063d000;
      expv[54] = 42'h20120a18000;
      expv[55] = 42'h20131055000;
      expv[56] = 42'h20141a6d000;
      expv[57] = 42'h20152ac2000;
      expv[58] = 42'h2016452f000;
      expv[59] = 42'h20176ff1000;
      expv[60] = 42'h2018b520000;
      expv[61] = 42'h20192511000;
      expv[62] = 42'h201ada31000;
      expv[63] = 42'h201bff42000;
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
