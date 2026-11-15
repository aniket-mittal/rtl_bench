// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_028103 dut (
    .clk(clk),
    .rst_n(in_vec[64:64]),
    .d2_input(in_vec[63:0]),
    .d2_output(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h09a83e3dbe7b8a38d;
    stim[1] = 65'h067da67bd72660428;
    stim[2] = 65'h16087ad119e20c86f;
    stim[3] = 65'h175fa2c511b2457a7;
    stim[4] = 65'h18d1ddf66d3874425;
    stim[5] = 65'h191efe0ab7708af6e;
    stim[6] = 65'h1bf034ca539381711;
    stim[7] = 65'h1c43aa4c333790b8f;
    stim[8] = 65'h10704a4a12a5f5593;
    stim[9] = 65'h134f195d41d886c6f;
    stim[10] = 65'h1b97d59454a367efe;
    stim[11] = 65'h0235a5927bc916ccb;
    stim[12] = 65'h1fbb80f8b8b9175ec;
    stim[13] = 65'h1410670ba2cc439ed;
    stim[14] = 65'h1e7301d7a0e36ce3d;
    stim[15] = 65'h1b374932c1fef46d9;
    stim[16] = 65'h18bda7bdf8e31c81f;
    stim[17] = 65'h19ff84147e7f6ad92;
    stim[18] = 65'h1153160cc3894a0c7;
    stim[19] = 65'h1a40762971fce7f3f;
    stim[20] = 65'h132f59db8169e3935;
    stim[21] = 65'h1bf4f2519472a83c1;
    stim[22] = 65'h1e4a7a6c34a39f038;
    stim[23] = 65'h1c0d1ed5854f45944;
    stim[24] = 65'h13b7112b7344dbe9d;
    stim[25] = 65'h17cf124b8b68945c3;
    stim[26] = 65'h119f625bc1d4c0527;
    stim[27] = 65'h1bdfa395a3e059e49;
    stim[28] = 65'h1d06cfce4c2a0082a;
    stim[29] = 65'h1ecb532f637dedbc5;
    stim[30] = 65'h1ef2ff2195fb1dcb8;
    stim[31] = 65'h11a09bba30e3ae603;
    stim[32] = 65'h1153794efe9ef197e;
    stim[33] = 65'h10e72ec9a9560be60;
    stim[34] = 65'h183c1b163e070b09e;
    stim[35] = 65'h18d8310c02ae8f324;
    stim[36] = 65'h153e228052082936e;
    stim[37] = 65'h1d4cf9555b7146890;
    stim[38] = 65'h0e4e408dfb6a2fee9;
    stim[39] = 65'h1388e9776ea40916e;
    stim[40] = 65'h1f86fb854052059c2;
    stim[41] = 65'h17e8188ed8e8d0b18;
    stim[42] = 65'h154526a688d9e9cbf;
    stim[43] = 65'h1a4f71ea9b4a21ac6;
    stim[44] = 65'h1cd707d38a30b1287;
    stim[45] = 65'h17ecf0095a4803718;
    stim[46] = 65'h10789239123afa9ac;
    stim[47] = 65'h13931aad84c936435;
    stim[48] = 65'h1b8c3791c72fa9e01;
    stim[49] = 65'h188ce9d582ace3206;
    stim[50] = 65'h18fe63aeae2b6395f;
    stim[51] = 65'h197cd18c21175a5b6;
    stim[52] = 65'h13ad131afc1ad1a24;
    stim[53] = 65'h1002ad357db7e093b;
    stim[54] = 65'h11c802efae30022c7;
    stim[55] = 65'h1f03da85d164c9dc1;
    stim[56] = 65'h1dc73db67c8f370af;
    stim[57] = 65'h1a44c6abc8900cced;
    stim[58] = 65'h1ba8583ad29c7bb24;
    stim[59] = 65'h1227dceb322475612;
    stim[60] = 65'h1d8277540d52019bb;
    stim[61] = 65'h111fbfaa3f2e10931;
    stim[62] = 65'h1773cdda01c210766;
    stim[63] = 65'h1f364a9fc58d65e24;
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
      expv[3] = 32'hff800080;
      expv[4] = 32'hff820084;
      expv[5] = 32'hff840082;
      expv[6] = 32'hff850084;
      expv[7] = 32'hff820087;
      expv[8] = 32'hff850083;
      expv[9] = 32'hff840085;
      expv[10] = 32'hff820083;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'hff800080;
      expv[14] = 32'hff870082;
      expv[15] = 32'hff840082;
      expv[16] = 32'hff830085;
      expv[17] = 32'hff830085;
      expv[18] = 32'hff850084;
      expv[19] = 32'hff850083;
      expv[20] = 32'hff820083;
      expv[21] = 32'hff850084;
      expv[22] = 32'hff820083;
      expv[23] = 32'hff840085;
      expv[24] = 32'hff820087;
      expv[25] = 32'hff830085;
      expv[26] = 32'hff820083;
      expv[27] = 32'hff860080;
      expv[28] = 32'hff840082;
      expv[29] = 32'hff830085;
      expv[30] = 32'hff850084;
      expv[31] = 32'hff830085;
      expv[32] = 32'hff820087;
      expv[33] = 32'hff800085;
      expv[34] = 32'hff840081;
      expv[35] = 32'hff810084;
      expv[36] = 32'hff830085;
      expv[37] = 32'hff830085;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'hff800080;
      expv[41] = 32'hff820083;
      expv[42] = 32'hff840086;
      expv[43] = 32'hff840082;
      expv[44] = 32'hff830082;
      expv[45] = 32'hff870082;
      expv[46] = 32'hff870082;
      expv[47] = 32'hff860080;
      expv[48] = 32'hff820083;
      expv[49] = 32'hff820083;
      expv[50] = 32'hff830085;
      expv[51] = 32'hff830085;
      expv[52] = 32'hff870082;
      expv[53] = 32'hff830085;
      expv[54] = 32'hff850080;
      expv[55] = 32'hff840082;
      expv[56] = 32'hff850080;
      expv[57] = 32'hff820087;
      expv[58] = 32'hff850084;
      expv[59] = 32'hff850084;
      expv[60] = 32'hff820087;
      expv[61] = 32'hff820084;
      expv[62] = 32'hff870082;
      expv[63] = 32'hff840082;
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
