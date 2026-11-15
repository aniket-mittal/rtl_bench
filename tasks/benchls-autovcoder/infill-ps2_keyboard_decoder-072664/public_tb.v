// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072664 dut (
    .clk(clk),
    .reset_n(in_vec[9:9]),
    .ps2_key_en(in_vec[8:8]),
    .ps2_key_data(in_vec[7:0]),
    .keycode(out_vec[10:3]),
    .ext(out_vec[2:2]),
    .make(out_vec[1:1]),
    .keycode_ready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h1ed;
    stim[1] = 10'h192;
    stim[2] = 10'h394;
    stim[3] = 10'h31a;
    stim[4] = 10'h390;
    stim[5] = 10'h2e2;
    stim[6] = 10'h29e;
    stim[7] = 10'h3d3;
    stim[8] = 10'h330;
    stim[9] = 10'h2a4;
    stim[10] = 10'h3a8;
    stim[11] = 10'h2f9;
    stim[12] = 10'h373;
    stim[13] = 10'h348;
    stim[14] = 10'h25c;
    stim[15] = 10'h2d9;
    stim[16] = 10'h319;
    stim[17] = 10'h2ef;
    stim[18] = 10'h15f;
    stim[19] = 10'h224;
    stim[20] = 10'h396;
    stim[21] = 10'h21d;
    stim[22] = 10'h35d;
    stim[23] = 10'h2cd;
    stim[24] = 10'h260;
    stim[25] = 10'h3c0;
    stim[26] = 10'h065;
    stim[27] = 10'h354;
    stim[28] = 10'h3fb;
    stim[29] = 10'h383;
    stim[30] = 10'h324;
    stim[31] = 10'h214;
    stim[32] = 10'h2c4;
    stim[33] = 10'h20c;
    stim[34] = 10'h347;
    stim[35] = 10'h266;
    stim[36] = 10'h3ac;
    stim[37] = 10'h32d;
    stim[38] = 10'h2d6;
    stim[39] = 10'h348;
    stim[40] = 10'h2c2;
    stim[41] = 10'h305;
    stim[42] = 10'h33a;
    stim[43] = 10'h203;
    stim[44] = 10'h3d5;
    stim[45] = 10'h347;
    stim[46] = 10'h338;
    stim[47] = 10'h357;
    stim[48] = 10'h21d;
    stim[49] = 10'h36a;
    stim[50] = 10'h2d5;
    stim[51] = 10'h379;
    stim[52] = 10'h2b3;
    stim[53] = 10'h223;
    stim[54] = 10'h258;
    stim[55] = 10'h2f9;
    stim[56] = 10'h286;
    stim[57] = 10'h2a6;
    stim[58] = 10'h238;
    stim[59] = 10'h356;
    stim[60] = 10'h2be;
    stim[61] = 10'h28b;
    stim[62] = 10'h353;
    stim[63] = 10'h22b;
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
      expv[0] = 11'hxxx;
      expv[1] = 11'hxxx;
      expv[2] = 11'hxxx;
      expv[3] = 11'hxxx;
      expv[4] = 11'h0d3;
      expv[5] = 11'h0d2;
      expv[6] = 11'h713;
      expv[7] = 11'h712;
      expv[8] = 11'h712;
      expv[9] = 11'h183;
      expv[10] = 11'h182;
      expv[11] = 11'h182;
      expv[12] = 11'h7cb;
      expv[13] = 11'h7ca;
      expv[14] = 11'h243;
      expv[15] = 11'h242;
      expv[16] = 11'h242;
      expv[17] = 11'h242;
      expv[18] = 11'h77b;
      expv[19] = 11'h77a;
      expv[20] = 11'h77a;
      expv[21] = 11'h77a;
      expv[22] = 11'h0eb;
      expv[23] = 11'h0ea;
      expv[24] = 11'h66b;
      expv[25] = 11'h66a;
      expv[26] = 11'h66a;
      expv[27] = 11'h32b;
      expv[28] = 11'h32a;
      expv[29] = 11'h7db;
      expv[30] = 11'h7da;
      expv[31] = 11'h123;
      expv[32] = 11'h122;
      expv[33] = 11'h122;
      expv[34] = 11'h122;
      expv[35] = 11'h122;
      expv[36] = 11'h333;
      expv[37] = 11'h332;
      expv[38] = 11'h16b;
      expv[39] = 11'h16a;
      expv[40] = 11'h16a;
      expv[41] = 11'h613;
      expv[42] = 11'h612;
      expv[43] = 11'h1d3;
      expv[44] = 11'h1d2;
      expv[45] = 11'h1d2;
      expv[46] = 11'h23b;
      expv[47] = 11'h23a;
      expv[48] = 11'h2bb;
      expv[49] = 11'h2ba;
      expv[50] = 11'h2ba;
      expv[51] = 11'h6ab;
      expv[52] = 11'h6aa;
      expv[53] = 11'h59b;
      expv[54] = 11'h59a;
      expv[55] = 11'h59a;
      expv[56] = 11'h59a;
      expv[57] = 11'h59a;
      expv[58] = 11'h59a;
      expv[59] = 11'h59a;
      expv[60] = 11'h59a;
      expv[61] = 11'h5f3;
      expv[62] = 11'h5f2;
      expv[63] = 11'h5f2;
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
