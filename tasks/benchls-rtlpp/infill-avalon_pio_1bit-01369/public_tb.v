// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01369 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[32:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h153b906bb7;
    stim[1] = 37'h006fcafa92;
    stim[2] = 37'h17cb1d6b7c;
    stim[3] = 37'h0fb5475712;
    stim[4] = 37'h0738e711f9;
    stim[5] = 37'h135073f2ed;
    stim[6] = 37'h1b88435741;
    stim[7] = 37'h0a07c9baa4;
    stim[8] = 37'h1a42823bbd;
    stim[9] = 37'h1b48995758;
    stim[10] = 37'h133556f9b0;
    stim[11] = 37'h1b513690e7;
    stim[12] = 37'h07275c7e7d;
    stim[13] = 37'h1679c273ab;
    stim[14] = 37'h1f0b09522e;
    stim[15] = 37'h1f504d67e9;
    stim[16] = 37'h0f4dc57a0c;
    stim[17] = 37'h0f1c199071;
    stim[18] = 37'h0e2a6daddb;
    stim[19] = 37'h1a53dd9657;
    stim[20] = 37'h1b1a0e8e46;
    stim[21] = 37'h02a3f115bb;
    stim[22] = 37'h1a80ec4bc6;
    stim[23] = 37'h1ef93b45a7;
    stim[24] = 37'h1ebc05574c;
    stim[25] = 37'h0779493cbd;
    stim[26] = 37'h1686b1920a;
    stim[27] = 37'h07bd49652f;
    stim[28] = 37'h1af92078fd;
    stim[29] = 37'h1eec38026c;
    stim[30] = 37'h1e69ec815b;
    stim[31] = 37'h063a566bfc;
    stim[32] = 37'h16ed5fcb6c;
    stim[33] = 37'h1af7f8e3d4;
    stim[34] = 37'h0cb4de4aae;
    stim[35] = 37'h0e7c37e3ce;
    stim[36] = 37'h0a6ac9b906;
    stim[37] = 37'h1697cf8e3f;
    stim[38] = 37'h03153c6b1c;
    stim[39] = 37'h1f80184ce0;
    stim[40] = 37'h0a998f7ba7;
    stim[41] = 37'h0b247ecded;
    stim[42] = 37'h1eebc457c8;
    stim[43] = 37'h1e42522810;
    stim[44] = 37'h17c75edc7f;
    stim[45] = 37'h1e4a7e9e7f;
    stim[46] = 37'h1e71a4c5ff;
    stim[47] = 37'h06c62f9604;
    stim[48] = 37'h0e480f83b0;
    stim[49] = 37'h027e8c0954;
    stim[50] = 37'h0f20aac6e2;
    stim[51] = 37'h034329b03d;
    stim[52] = 37'h06431e026a;
    stim[53] = 37'h029548a976;
    stim[54] = 37'h02b8a13dda;
    stim[55] = 37'h0a9e5f27a0;
    stim[56] = 37'h1eb2d452b4;
    stim[57] = 37'h1bae601f28;
    stim[58] = 37'h03616ee1ac;
    stim[59] = 37'h0e1aa8dad2;
    stim[60] = 37'h0fe22e6033;
    stim[61] = 37'h12545f0695;
    stim[62] = 37'h1b6d95b75a;
    stim[63] = 37'h06fb82c081;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000000;
      expv[63] = 33'h000000000;
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
