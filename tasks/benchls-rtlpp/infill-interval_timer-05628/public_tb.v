// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05628 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h3197d3;
    stim[1] = 22'h29f53b;
    stim[2] = 22'h3e20c3;
    stim[3] = 22'h3296b2;
    stim[4] = 22'h0ac94d;
    stim[5] = 22'h0b5282;
    stim[6] = 22'h0f3781;
    stim[7] = 22'h3a6d14;
    stim[8] = 22'h3e6762;
    stim[9] = 22'h3753b5;
    stim[10] = 22'h17512d;
    stim[11] = 22'h2a336b;
    stim[12] = 22'h0a75a4;
    stim[13] = 22'h2a26dd;
    stim[14] = 22'h0fb739;
    stim[15] = 22'h12fa87;
    stim[16] = 22'h0729ba;
    stim[17] = 22'h3e53c4;
    stim[18] = 22'h0a02c9;
    stim[19] = 22'h121c2a;
    stim[20] = 22'h360be5;
    stim[21] = 22'h2fcc6e;
    stim[22] = 22'h0e5559;
    stim[23] = 22'h337c9e;
    stim[24] = 22'h1bd8fd;
    stim[25] = 22'h1e27cd;
    stim[26] = 22'h35087c;
    stim[27] = 22'h176e54;
    stim[28] = 22'h37ea9d;
    stim[29] = 22'h07a981;
    stim[30] = 22'h26c793;
    stim[31] = 22'h0e4d19;
    stim[32] = 22'h2636ec;
    stim[33] = 22'h03bd0e;
    stim[34] = 22'h2f898a;
    stim[35] = 22'h2ae508;
    stim[36] = 22'h262336;
    stim[37] = 22'h16e801;
    stim[38] = 22'h1ecbb6;
    stim[39] = 22'h2f1fd3;
    stim[40] = 22'h2f9b0a;
    stim[41] = 22'h3ad80f;
    stim[42] = 22'h335f64;
    stim[43] = 22'h271fc4;
    stim[44] = 22'h2f25f5;
    stim[45] = 22'h131c2d;
    stim[46] = 22'h0e3432;
    stim[47] = 22'h1bad62;
    stim[48] = 22'h1673f5;
    stim[49] = 22'h1fd0fd;
    stim[50] = 22'h2ec01b;
    stim[51] = 22'h0fb041;
    stim[52] = 22'h27673c;
    stim[53] = 22'h0acd3b;
    stim[54] = 22'h23df63;
    stim[55] = 22'h3ff6e0;
    stim[56] = 22'h1e2d08;
    stim[57] = 22'h1629b8;
    stim[58] = 22'h0fb146;
    stim[59] = 22'h3f6fc6;
    stim[60] = 22'h160ff4;
    stim[61] = 22'h068d3e;
    stim[62] = 22'h1bca3a;
    stim[63] = 22'h022467;
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
      expv[11] = 17'h001f3;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h001f3;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h001f3;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h001f3;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h001f3;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h001f3;
      expv[38] = 17'h001f3;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h001f3;
      expv[45] = 17'h00000;
      expv[46] = 17'h0e801;
      expv[47] = 17'h00009;
      expv[48] = 17'h0cbb6;
      expv[49] = 17'h0e801;
      expv[50] = 17'h0cbb6;
      expv[51] = 17'h00000;
      expv[52] = 17'h00002;
      expv[53] = 17'h073f5;
      expv[54] = 17'h00002;
      expv[55] = 17'h073f5;
      expv[56] = 17'h00000;
      expv[57] = 17'h0cbb6;
      expv[58] = 17'h073f5;
      expv[59] = 17'h00002;
      expv[60] = 17'h00000;
      expv[61] = 17'h029b8;
      expv[62] = 17'h00000;
      expv[63] = 17'h02d08;
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
