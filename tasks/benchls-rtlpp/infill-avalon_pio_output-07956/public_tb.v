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

  rtlpp_07956 dut (
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
    stim[0] = 37'h115c932661;
    stim[1] = 37'h099fab8f2e;
    stim[2] = 37'h0fae80c2ab;
    stim[3] = 37'h0a9ab9f1dc;
    stim[4] = 37'h0a9032fc79;
    stim[5] = 37'h1fa7f546d3;
    stim[6] = 37'h07cb8207af;
    stim[7] = 37'h1bf0dfa7c1;
    stim[8] = 37'h1e5c1bd7d6;
    stim[9] = 37'h125b17fd61;
    stim[10] = 37'h0326c38559;
    stim[11] = 37'h0f40726370;
    stim[12] = 37'h1ff3f4d23b;
    stim[13] = 37'h0b7f5a7823;
    stim[14] = 37'h171b095484;
    stim[15] = 37'h02298cfbf9;
    stim[16] = 37'h055207aaa4;
    stim[17] = 37'h0b2c2d28ac;
    stim[18] = 37'h076f01e438;
    stim[19] = 37'h13f3d6047c;
    stim[20] = 37'h0ff003e5b0;
    stim[21] = 37'h0324813e45;
    stim[22] = 37'h12f7d47a73;
    stim[23] = 37'h1b60667f7a;
    stim[24] = 37'h0a6af5aeb7;
    stim[25] = 37'h127f3a4df1;
    stim[26] = 37'h1f7fdfa017;
    stim[27] = 37'h0e23649e95;
    stim[28] = 37'h13bfad48b9;
    stim[29] = 37'h0edee0a164;
    stim[30] = 37'h07ef17ea48;
    stim[31] = 37'h1fbbaf4e55;
    stim[32] = 37'h1705ec842c;
    stim[33] = 37'h17efcec264;
    stim[34] = 37'h16f0b06cff;
    stim[35] = 37'h133cc82562;
    stim[36] = 37'h1a40911a05;
    stim[37] = 37'h0340deb615;
    stim[38] = 37'h15190a6cbe;
    stim[39] = 37'h0b7555e0cf;
    stim[40] = 37'h0a169ff022;
    stim[41] = 37'h13f0b12e3a;
    stim[42] = 37'h1efceb7295;
    stim[43] = 37'h1a3e5627f7;
    stim[44] = 37'h174ba370c6;
    stim[45] = 37'h0eba949a62;
    stim[46] = 37'h1ec152b2e1;
    stim[47] = 37'h1fa56851fb;
    stim[48] = 37'h063e083f51;
    stim[49] = 37'h12c635f319;
    stim[50] = 37'h0ebf128862;
    stim[51] = 37'h03adf7d5dc;
    stim[52] = 37'h169118a3cb;
    stim[53] = 37'h0a96a8f598;
    stim[54] = 37'h163025e41d;
    stim[55] = 37'h0e4320dac4;
    stim[56] = 37'h1e43082345;
    stim[57] = 37'h1278f49b86;
    stim[58] = 37'h1b774819e2;
    stim[59] = 37'h0e025d43d0;
    stim[60] = 37'h1f7be52574;
    stim[61] = 37'h07f6e01147;
    stim[62] = 37'h1beaf52c22;
    stim[63] = 37'h17b401d9ca;
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
      expv[11] = 40'h0000000000;
      expv[12] = 40'h0000000000;
      expv[13] = 40'h0000000000;
      expv[14] = 40'h0000000000;
      expv[15] = 40'h0000000000;
      expv[16] = 40'h0000000000;
      expv[17] = 40'h0000000000;
      expv[18] = 40'h0000000000;
      expv[19] = 40'h0000000000;
      expv[20] = 40'h0000000000;
      expv[21] = 40'h0000000000;
      expv[22] = 40'h0000000000;
      expv[23] = 40'h0000000000;
      expv[24] = 40'h0000000000;
      expv[25] = 40'h0000000000;
      expv[26] = 40'h0000000000;
      expv[27] = 40'h0000000000;
      expv[28] = 40'h0000000000;
      expv[29] = 40'h0000000000;
      expv[30] = 40'h0000000000;
      expv[31] = 40'h0000000000;
      expv[32] = 40'h0000000000;
      expv[33] = 40'h0000000000;
      expv[34] = 40'h0000000000;
      expv[35] = 40'h0000000000;
      expv[36] = 40'h0000000000;
      expv[37] = 40'h0000000000;
      expv[38] = 40'h0000000000;
      expv[39] = 40'h0000000000;
      expv[40] = 40'h0000000000;
      expv[41] = 40'h0000000000;
      expv[42] = 40'h0000000000;
      expv[43] = 40'h0000000000;
      expv[44] = 40'h0000000000;
      expv[45] = 40'h0000000000;
      expv[46] = 40'h0000000000;
      expv[47] = 40'h0000000000;
      expv[48] = 40'h0000000000;
      expv[49] = 40'h5100000000;
      expv[50] = 40'h5100000000;
      expv[51] = 40'h5100000051;
      expv[52] = 40'h5100000000;
      expv[53] = 40'h5100000000;
      expv[54] = 40'h5100000000;
      expv[55] = 40'h5100000000;
      expv[56] = 40'h5100000000;
      expv[57] = 40'h5100000000;
      expv[58] = 40'h5100000000;
      expv[59] = 40'h5100000000;
      expv[60] = 40'h5100000000;
      expv[61] = 40'h5100000051;
      expv[62] = 40'h5100000000;
      expv[63] = 40'h5100000000;
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
