// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_107197 dut (
    .i_clk(clk),
    .i_rst(in_vec[65:65]),
    .i_start(in_vec[64:64]),
    .i_rs1(in_vec[63:32]),
    .i_rs2(in_vec[31:0]),
    .o_res(out_vec[64:33]),
    .o_rem(out_vec[32:1]),
    .ok(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h2e0c1096edfe2d9d8;
    stim[1] = 66'h3d05a4ae437151fb7;
    stim[2] = 66'h1f1483d5e15b0ef28;
    stim[3] = 66'h0895486ad28dc6e0d;
    stim[4] = 66'h020af999d18b696f4;
    stim[5] = 66'h11316079b15d2a693;
    stim[6] = 66'h138ee6e18b1cf643e;
    stim[7] = 66'h07900cc6fa70e0253;
    stim[8] = 66'h1c5c0058cf00a3949;
    stim[9] = 66'h18d865aa4fc8e3076;
    stim[10] = 66'h10baea637070064eb;
    stim[11] = 66'h1e4be7de01d5c28fb;
    stim[12] = 66'h091522c0131d77f0b;
    stim[13] = 66'h0e344f08cf0ba5c99;
    stim[14] = 66'h012a3144c9f3e805d;
    stim[15] = 66'h0419947ae746cd1ed;
    stim[16] = 66'h1b8e1ffe018e9f793;
    stim[17] = 66'h0892872f95ba5ffdb;
    stim[18] = 66'h03eac234c5aa9a312;
    stim[19] = 66'h009d17528b5f96c96;
    stim[20] = 66'h1776d8b1455e05565;
    stim[21] = 66'h1b849842e190c4d81;
    stim[22] = 66'h13f5b59fa0f91db4b;
    stim[23] = 66'h0de738c68342aebb3;
    stim[24] = 66'h3a186a63c54c569ca;
    stim[25] = 66'h041475bfa57c2ea15;
    stim[26] = 66'h0b646e44753715fac;
    stim[27] = 66'h129874b7b7d19c7b5;
    stim[28] = 66'h05c669f5cff4ec5be;
    stim[29] = 66'h16f2a00c5daac9679;
    stim[30] = 66'h1d226d3a1dc1a2c23;
    stim[31] = 66'h0578f104ccf36a288;
    stim[32] = 66'h1cd3a96cfbcb55998;
    stim[33] = 66'h1d93aaebb6af8c3f1;
    stim[34] = 66'h0ea08e8f6d3cf84ad;
    stim[35] = 66'h0ff0198cc81f0f5b5;
    stim[36] = 66'h1143a1324d368b444;
    stim[37] = 66'h027187c68c27679a0;
    stim[38] = 66'h0161439635b46c04b;
    stim[39] = 66'h0648e915f723c7984;
    stim[40] = 66'h081a0cf8c7092aac7;
    stim[41] = 66'h0c8bdc32f557adf65;
    stim[42] = 66'h15155075c98b7549d;
    stim[43] = 66'h10cb1e6209c50eb30;
    stim[44] = 66'h12586bec63cbef012;
    stim[45] = 66'h01e4d27e1f72eb0a5;
    stim[46] = 66'h1d02e2c3e760839cc;
    stim[47] = 66'h0abad24e1400bda55;
    stim[48] = 66'h0a66208edabefa518;
    stim[49] = 66'h0ff0a946b2c3d2102;
    stim[50] = 66'h084620176cc53f3be;
    stim[51] = 66'h1182b464eda61013b;
    stim[52] = 66'h1346d8c4150c5658b;
    stim[53] = 66'h021f52f7d34792427;
    stim[54] = 66'h051e28a681134e76c;
    stim[55] = 66'h09da0967afe39fea0;
    stim[56] = 66'h089ea8ee63b877e1f;
    stim[57] = 66'h01c73fceb325fad99;
    stim[58] = 66'h03274d25ff179d4bb;
    stim[59] = 66'h0e39cf7d52ae120b4;
    stim[60] = 66'h154af1d468886812e;
    stim[61] = 66'h18e633c680a5abc6c;
    stim[62] = 66'h11212f04d98c43751;
    stim[63] = 66'h0fc78a2be63c2b7f9;
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
      expv[0] = 65'h00000000000000001;
      expv[1] = 65'h00000000000000001;
      expv[2] = 65'h00000000000000001;
      expv[3] = 65'h00000000000000001;
      expv[4] = 65'h00000000000000001;
      expv[5] = 65'h00000000000000001;
      expv[6] = 65'h00000000000000001;
      expv[7] = 65'h00000000000000001;
      expv[8] = 65'h00000000000000001;
      expv[9] = 65'h00000000000000001;
      expv[10] = 65'h00000000000000001;
      expv[11] = 65'h00000000000000001;
      expv[12] = 65'h00000000000000001;
      expv[13] = 65'h00000000000000001;
      expv[14] = 65'h00000000000000001;
      expv[15] = 65'h00000000000000001;
      expv[16] = 65'h00000000000000001;
      expv[17] = 65'h00000000000000001;
      expv[18] = 65'h00000000000000001;
      expv[19] = 65'h00000000000000001;
      expv[20] = 65'h00000000000000001;
      expv[21] = 65'h00000000000000001;
      expv[22] = 65'h00000000000000001;
      expv[23] = 65'h00000000000000001;
      expv[24] = 65'h00000000000000001;
      expv[25] = 65'h00000000000000001;
      expv[26] = 65'h00000000000000001;
      expv[27] = 65'h00000000000000001;
      expv[28] = 65'h00000000000000001;
      expv[29] = 65'h00000000000000001;
      expv[30] = 65'h00000000000000001;
      expv[31] = 65'h00000000000000001;
      expv[32] = 65'h00000000000000001;
      expv[33] = 65'h00000000000000001;
      expv[34] = 65'h00000000000000001;
      expv[35] = 65'h00000000000000001;
      expv[36] = 65'h00000000000000001;
      expv[37] = 65'h00000000000000001;
      expv[38] = 65'h00000000000000001;
      expv[39] = 65'h00000000000000001;
      expv[40] = 65'h00000000000000001;
      expv[41] = 65'h00000000000000001;
      expv[42] = 65'h00000000000000001;
      expv[43] = 65'h00000000000000001;
      expv[44] = 65'h00000000000000001;
      expv[45] = 65'h00000000000000001;
      expv[46] = 65'h00000000000000001;
      expv[47] = 65'h00000000000000001;
      expv[48] = 65'h00000000000000001;
      expv[49] = 65'h00000000000000001;
      expv[50] = 65'h00000000000000001;
      expv[51] = 65'h00000000000000001;
      expv[52] = 65'h00000000000000001;
      expv[53] = 65'h00000000000000001;
      expv[54] = 65'h00000000000000001;
      expv[55] = 65'h00000000000000001;
      expv[56] = 65'h00000000000000001;
      expv[57] = 65'h00000000000000001;
      expv[58] = 65'h00000000000000001;
      expv[59] = 65'h00000000000000001;
      expv[60] = 65'h00000000000000001;
      expv[61] = 65'h00000000000000001;
      expv[62] = 65'h00000000000000001;
      expv[63] = 65'h00000000000000001;
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
