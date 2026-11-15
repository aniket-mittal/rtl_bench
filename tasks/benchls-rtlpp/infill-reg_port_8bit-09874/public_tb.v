// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09874 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[39:32]),
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
    stim[0] = 37'h14a99cd0c5;
    stim[1] = 37'h0408ad8b2e;
    stim[2] = 37'h0b3c6ce20c;
    stim[3] = 37'h12099d0826;
    stim[4] = 37'h1bbb17df8b;
    stim[5] = 37'h0f4c653f3b;
    stim[6] = 37'h13d19c5e21;
    stim[7] = 37'h0b5dfde32d;
    stim[8] = 37'h1b9571c066;
    stim[9] = 37'h0367f8a649;
    stim[10] = 37'h06e11dc2f3;
    stim[11] = 37'h1fb780697c;
    stim[12] = 37'h1e0a58bd12;
    stim[13] = 37'h03ab6527c6;
    stim[14] = 37'h1e95bb9db0;
    stim[15] = 37'h1f1f255281;
    stim[16] = 37'h0ee7d99ba7;
    stim[17] = 37'h16e1b5462f;
    stim[18] = 37'h1b87bda1df;
    stim[19] = 37'h1688c092a8;
    stim[20] = 37'h1ed1eed6f7;
    stim[21] = 37'h1f189c2a8e;
    stim[22] = 37'h1bc16d4b47;
    stim[23] = 37'h1b7595e3f6;
    stim[24] = 37'h07237a7c13;
    stim[25] = 37'h0ac7084ccd;
    stim[26] = 37'h1f0d264c13;
    stim[27] = 37'h135c46110c;
    stim[28] = 37'h037a330832;
    stim[29] = 37'h07bb1d6032;
    stim[30] = 37'h178e256d10;
    stim[31] = 37'h0b4cd3127a;
    stim[32] = 37'h03546eee0d;
    stim[33] = 37'h1ab7eaed76;
    stim[34] = 37'h0ed99260a8;
    stim[35] = 37'h1afa1424b9;
    stim[36] = 37'h1fc97b26ec;
    stim[37] = 37'h1ea78f9f4a;
    stim[38] = 37'h1f18244369;
    stim[39] = 37'h0ed4ec7cfb;
    stim[40] = 37'h0219770df9;
    stim[41] = 37'h1ff586f87c;
    stim[42] = 37'h1f55799be4;
    stim[43] = 37'h020acd2cd4;
    stim[44] = 37'h0f5b7e23ac;
    stim[45] = 37'h131d93cbfc;
    stim[46] = 37'h0e31719720;
    stim[47] = 37'h0f77d1ac8f;
    stim[48] = 37'h1f2893ac2c;
    stim[49] = 37'h1ecbd3b52c;
    stim[50] = 37'h16d1a42d4d;
    stim[51] = 37'h033db5731f;
    stim[52] = 37'h13bed1f92e;
    stim[53] = 37'h1b148faba9;
    stim[54] = 37'h1bdcb100f1;
    stim[55] = 37'h0e2763ec33;
    stim[56] = 37'h0b5a1e15f3;
    stim[57] = 37'h122bca2505;
    stim[58] = 37'h02e1539864;
    stim[59] = 37'h0b3bc75297;
    stim[60] = 37'h1a8a4560e0;
    stim[61] = 37'h17e1bc4d6f;
    stim[62] = 37'h0b2670ee4d;
    stim[63] = 37'h1e268fc095;
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
      expv[0] = 40'h0000000000;
      expv[1] = 40'h0000000000;
      expv[2] = 40'h0000000000;
      expv[3] = 40'h0000000000;
      expv[4] = 40'h0000000000;
      expv[5] = 40'h0000000000;
      expv[6] = 40'h0000000000;
      expv[7] = 40'h0000000000;
      expv[8] = 40'h0000000000;
      expv[9] = 40'h0000000000;
      expv[10] = 40'h0000000000;
      expv[11] = 40'hf300000000;
      expv[12] = 40'hf300000000;
      expv[13] = 40'hf3000000f3;
      expv[14] = 40'hf300000000;
      expv[15] = 40'hf300000000;
      expv[16] = 40'hf300000000;
      expv[17] = 40'hf300000000;
      expv[18] = 40'hf300000000;
      expv[19] = 40'hf300000000;
      expv[20] = 40'hf300000000;
      expv[21] = 40'hf300000000;
      expv[22] = 40'hf300000000;
      expv[23] = 40'hf300000000;
      expv[24] = 40'hf3000000f3;
      expv[25] = 40'hf300000000;
      expv[26] = 40'hf300000000;
      expv[27] = 40'hf300000000;
      expv[28] = 40'hf3000000f3;
      expv[29] = 40'hf3000000f3;
      expv[30] = 40'hf300000000;
      expv[31] = 40'hf300000000;
      expv[32] = 40'hf3000000f3;
      expv[33] = 40'hf300000000;
      expv[34] = 40'hf300000000;
      expv[35] = 40'hf300000000;
      expv[36] = 40'hf300000000;
      expv[37] = 40'hf300000000;
      expv[38] = 40'hf300000000;
      expv[39] = 40'hf300000000;
      expv[40] = 40'hf3000000f3;
      expv[41] = 40'hf300000000;
      expv[42] = 40'hf300000000;
      expv[43] = 40'hf3000000f3;
      expv[44] = 40'hf300000000;
      expv[45] = 40'hf300000000;
      expv[46] = 40'hf300000000;
      expv[47] = 40'hf300000000;
      expv[48] = 40'hf300000000;
      expv[49] = 40'hf300000000;
      expv[50] = 40'hf300000000;
      expv[51] = 40'hf3000000f3;
      expv[52] = 40'hf300000000;
      expv[53] = 40'hf300000000;
      expv[54] = 40'hf300000000;
      expv[55] = 40'hf300000000;
      expv[56] = 40'hf300000000;
      expv[57] = 40'hf300000000;
      expv[58] = 40'hf3000000f3;
      expv[59] = 40'hf300000000;
      expv[60] = 40'hf300000000;
      expv[61] = 40'hf300000000;
      expv[62] = 40'hf300000000;
      expv[63] = 40'hf300000000;
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
