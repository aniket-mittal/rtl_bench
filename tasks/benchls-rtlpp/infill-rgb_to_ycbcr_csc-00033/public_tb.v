// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00033 dut (
    .clk(clk),
    .rst(in_vec[25:25]),
    .enable(in_vec[24:24]),
    .data_in(in_vec[23:0]),
    .data_out(out_vec[24:1]),
    .enable_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h38e1be4;
    stim[1] = 26'h3acf8f2;
    stim[2] = 26'h127d3e2;
    stim[3] = 26'h00bb649;
    stim[4] = 26'h06825f0;
    stim[5] = 26'h1e15a29;
    stim[6] = 26'h1a19692;
    stim[7] = 26'h152320e;
    stim[8] = 26'h09089dc;
    stim[9] = 26'h0a04e86;
    stim[10] = 26'h0da4d9b;
    stim[11] = 26'h1b21db9;
    stim[12] = 26'h1520001;
    stim[13] = 26'h0521a86;
    stim[14] = 26'h0c92fae;
    stim[15] = 26'h0e990f3;
    stim[16] = 26'h1c842f3;
    stim[17] = 26'h09370c8;
    stim[18] = 26'h12394d1;
    stim[19] = 26'h0a2a893;
    stim[20] = 26'h1584638;
    stim[21] = 26'h0748240;
    stim[22] = 26'h1bc26e2;
    stim[23] = 26'h2813b48;
    stim[24] = 26'h14a81f2;
    stim[25] = 26'h029eb65;
    stim[26] = 26'h0031841;
    stim[27] = 26'h04e9549;
    stim[28] = 26'h0b28a3b;
    stim[29] = 26'h1ee8746;
    stim[30] = 26'h1470aa9;
    stim[31] = 26'h1c6ec6c;
    stim[32] = 26'h1965c86;
    stim[33] = 26'h0694fe6;
    stim[34] = 26'h150dc68;
    stim[35] = 26'h147607b;
    stim[36] = 26'h0804230;
    stim[37] = 26'h021bfd6;
    stim[38] = 26'h168846f;
    stim[39] = 26'h15e6b27;
    stim[40] = 26'h117c461;
    stim[41] = 26'h18f0fae;
    stim[42] = 26'h1f10dc1;
    stim[43] = 26'h0133a0d;
    stim[44] = 26'h053e052;
    stim[45] = 26'h0a925c0;
    stim[46] = 26'h01607a2;
    stim[47] = 26'h0cc44b4;
    stim[48] = 26'h2fbdb2b;
    stim[49] = 26'h1509ab4;
    stim[50] = 26'h0a4ccd2;
    stim[51] = 26'h1d740fe;
    stim[52] = 26'h10f99d3;
    stim[53] = 26'h11899a5;
    stim[54] = 26'h0c9d245;
    stim[55] = 26'h1e39247;
    stim[56] = 26'h1ee7150;
    stim[57] = 26'h09964b9;
    stim[58] = 26'h1692841;
    stim[59] = 26'h044497b;
    stim[60] = 26'h18706ef;
    stim[61] = 26'h17db59c;
    stim[62] = 26'h03fe484;
    stim[63] = 26'h1fa2b48;
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
      expv[0] = 25'hxxxxxxx;
      expv[1] = 25'hxxxxxxx;
      expv[2] = 25'h0000000;
      expv[3] = 25'h0000000;
      expv[4] = 25'h0000000;
      expv[5] = 25'h0000001;
      expv[6] = 25'h0000000;
      expv[7] = 25'h1010000;
      expv[8] = 25'h12a4f89;
      expv[9] = 25'h0bb98b7;
      expv[10] = 25'h0bb98b7;
      expv[11] = 25'h0bb98b6;
      expv[12] = 25'h0bb98b6;
      expv[13] = 25'h0fb0d2c;
      expv[14] = 25'h0d72c57;
      expv[15] = 25'h0d72c57;
      expv[16] = 25'h0d72c56;
      expv[17] = 25'h0d72c56;
      expv[18] = 25'h18560ba;
      expv[19] = 25'h18560bb;
      expv[20] = 25'h0f55214;
      expv[21] = 25'h0f55215;
      expv[22] = 25'h19d4b0c;
      expv[23] = 25'h19d4b0d;
      expv[24] = 25'h1507b32;
      expv[25] = 25'h0000000;
      expv[26] = 25'h0000000;
      expv[27] = 25'h0000001;
      expv[28] = 25'h0000000;
      expv[29] = 25'h0000000;
      expv[30] = 25'h0000000;
      expv[31] = 25'h1010000;
      expv[32] = 25'h17aa33b;
      expv[33] = 25'h0af7cff;
      expv[34] = 25'h1970881;
      expv[35] = 25'h1970881;
      expv[36] = 25'h0870782;
      expv[37] = 25'h1212cdf;
      expv[38] = 25'h1212cdf;
      expv[39] = 25'h1212cde;
      expv[40] = 25'h0a29d52;
      expv[41] = 25'h120decb;
      expv[42] = 25'h0f0ecf7;
      expv[43] = 25'h0bf0aab;
      expv[44] = 25'h0ba7527;
      expv[45] = 25'h0ba7527;
      expv[46] = 25'h0ba7526;
      expv[47] = 25'h0ba7526;
      expv[48] = 25'h0ba7526;
      expv[49] = 25'h0ba7526;
      expv[50] = 25'h0000000;
      expv[51] = 25'h0000000;
      expv[52] = 25'h0000001;
      expv[53] = 25'h1010000;
      expv[54] = 25'h126af33;
      expv[55] = 25'h1a75715;
      expv[56] = 25'h1a75715;
      expv[57] = 25'h1506336;
      expv[58] = 25'h1207b1d;
      expv[59] = 25'h1207b1d;
      expv[60] = 25'h0a96b0a;
      expv[61] = 25'h0a96b0b;
      expv[62] = 25'h0cb88ea;
      expv[63] = 25'h10f386f;
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
