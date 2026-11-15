// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_017660 dut (
    .i_clk(clk),
    .i_rst(in_vec[33:33]),
    .i_count(in_vec[32:1]),
    .i_en(in_vec[0:0]),
    .o_done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h3725759fe;
    stim[1] = 34'h3695e587c;
    stim[2] = 34'h05ef0940a;
    stim[3] = 34'h0a49c7d3c;
    stim[4] = 34'h098ce4d3e;
    stim[5] = 34'h06e88c6e6;
    stim[6] = 34'h0c2eec718;
    stim[7] = 34'h11fb0721f;
    stim[8] = 34'h1ed1e337c;
    stim[9] = 34'h1c26445a5;
    stim[10] = 34'h124333227;
    stim[11] = 34'h17f7fb711;
    stim[12] = 34'h17738d0e7;
    stim[13] = 34'h1a520532d;
    stim[14] = 34'h01c805041;
    stim[15] = 34'h0a0aad749;
    stim[16] = 34'h1840a821a;
    stim[17] = 34'h043cda20f;
    stim[18] = 34'h11e1e71f6;
    stim[19] = 34'h0d1b8b06f;
    stim[20] = 34'h0fe05d4bf;
    stim[21] = 34'h128973124;
    stim[22] = 34'h0ff3e43d0;
    stim[23] = 34'h0e11604cf;
    stim[24] = 34'h1d77a1fe0;
    stim[25] = 34'h0652d8947;
    stim[26] = 34'h12ca3a46b;
    stim[27] = 34'h15b574b5e;
    stim[28] = 34'h142bd979c;
    stim[29] = 34'h1a3802391;
    stim[30] = 34'h1e7098f1b;
    stim[31] = 34'h0e7042320;
    stim[32] = 34'h3f17e4eee;
    stim[33] = 34'h003679b97;
    stim[34] = 34'h0c66ea89e;
    stim[35] = 34'h1b5ef3327;
    stim[36] = 34'h132db294a;
    stim[37] = 34'h0b4fd2b04;
    stim[38] = 34'h194be16b1;
    stim[39] = 34'h025312463;
    stim[40] = 34'h1ec979b37;
    stim[41] = 34'h1c11767c6;
    stim[42] = 34'h1792ad21d;
    stim[43] = 34'h187f1fceb;
    stim[44] = 34'h01a12abfa;
    stim[45] = 34'h1636f717f;
    stim[46] = 34'h04949961a;
    stim[47] = 34'h160578868;
    stim[48] = 34'h02b63433a;
    stim[49] = 34'h033528a54;
    stim[50] = 34'h10c42e60b;
    stim[51] = 34'h090b16dd3;
    stim[52] = 34'h17c0da9df;
    stim[53] = 34'h16573fef9;
    stim[54] = 34'h1c13981b3;
    stim[55] = 34'h009b3b490;
    stim[56] = 34'h160624359;
    stim[57] = 34'h054578d22;
    stim[58] = 34'h10d4816bd;
    stim[59] = 34'h0bcf45a54;
    stim[60] = 34'h062c86e31;
    stim[61] = 34'h0ed3c8e37;
    stim[62] = 34'h1f13583d3;
    stim[63] = 34'h15ef90f3f;
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
      expv[0] = 1'h1;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
