// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_113087 dut (
    .clk(clk),
    .reset(in_vec[33:33]),
    .start(in_vec[32:32]),
    .num(in_vec[31:16]),
    .den(in_vec[15:0]),
    .result(out_vec[16:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h3192571f4;
    stim[1] = 34'h220eafbab;
    stim[2] = 34'h0c0516538;
    stim[3] = 34'h0fd8ed8c7;
    stim[4] = 34'h0415789ae;
    stim[5] = 34'h02fe168bf;
    stim[6] = 34'h0d8b6dbbd;
    stim[7] = 34'h0170e6560;
    stim[8] = 34'h15a1e39e4;
    stim[9] = 34'h0afefe036;
    stim[10] = 34'h00265df36;
    stim[11] = 34'h10aebe1cc;
    stim[12] = 34'h029ee8cd8;
    stim[13] = 34'h02bf20d22;
    stim[14] = 34'h1101cdf81;
    stim[15] = 34'h0d5d58c9b;
    stim[16] = 34'h0357fff3d;
    stim[17] = 34'h00f04d3ba;
    stim[18] = 34'h02f34ac94;
    stim[19] = 34'h0064b4346;
    stim[20] = 34'h06707d658;
    stim[21] = 34'h0ef7e450c;
    stim[22] = 34'h19aedb688;
    stim[23] = 34'h06dcb060b;
    stim[24] = 34'h08f1c3be1;
    stim[25] = 34'h1aeb035f2;
    stim[26] = 34'h017b43886;
    stim[27] = 34'h1906fdc9b;
    stim[28] = 34'h0a045fb15;
    stim[29] = 34'h0730a243d;
    stim[30] = 34'h183d79cfb;
    stim[31] = 34'h1b48913d2;
    stim[32] = 34'h1ee9fe783;
    stim[33] = 34'h049ddc0a6;
    stim[34] = 34'h1817a03a3;
    stim[35] = 34'h144741e70;
    stim[36] = 34'h0e34e5bd3;
    stim[37] = 34'h02bc2c5b7;
    stim[38] = 34'h0a51e55f0;
    stim[39] = 34'h0dedbcaf5;
    stim[40] = 34'h0fbe1ed04;
    stim[41] = 34'h1601033c9;
    stim[42] = 34'h0f9a7d4e6;
    stim[43] = 34'h07b5bfeb2;
    stim[44] = 34'h05ae750fa;
    stim[45] = 34'h173a85b53;
    stim[46] = 34'h13fd6fff4;
    stim[47] = 34'h0de85d586;
    stim[48] = 34'h0e4ea60a2;
    stim[49] = 34'h1ba6ff772;
    stim[50] = 34'h176a75751;
    stim[51] = 34'h09cce192b;
    stim[52] = 34'h01afb511d;
    stim[53] = 34'h02ab9432f;
    stim[54] = 34'h080bc4d2c;
    stim[55] = 34'h16729dd3f;
    stim[56] = 34'h1fa8d74e1;
    stim[57] = 34'h0d287ac52;
    stim[58] = 34'h2c293f440;
    stim[59] = 34'h19d7dd72a;
    stim[60] = 34'h0cdbcfaa5;
    stim[61] = 34'h1f84371ab;
    stim[62] = 34'h125643c7d;
    stim[63] = 34'h13883d778;
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
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00001;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00001;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00001;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00003;
      expv[28] = 17'h00002;
      expv[29] = 17'h1ffb7;
      expv[30] = 17'h1ffb6;
      expv[31] = 17'h1ffb6;
      expv[32] = 17'h00003;
      expv[33] = 17'h00003;
      expv[34] = 17'h00003;
      expv[35] = 17'h00002;
      expv[36] = 17'h00001;
      expv[37] = 17'h00001;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h1fec5;
      expv[44] = 17'h1fec4;
      expv[45] = 17'h1fec4;
      expv[46] = 17'h1fec4;
      expv[47] = 17'h00001;
      expv[48] = 17'h00001;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00001;
      expv[52] = 17'h00001;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00003;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00001;
      expv[62] = 17'h00000;
      expv[63] = 17'h00003;
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
