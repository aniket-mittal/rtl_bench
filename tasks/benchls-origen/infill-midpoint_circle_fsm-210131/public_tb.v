// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_210131 dut (
    .clk(clk),
    .rst(in_vec[13:13]),
    .en(in_vec[12:12]),
    .central(in_vec[11:4]),
    .radius(in_vec[3:0]),
    .busy(out_vec[9:9]),
    .valid(out_vec[8:8]),
    .candidate(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h3995;
    stim[1] = 14'h2de1;
    stim[2] = 14'h1224;
    stim[3] = 14'h0c40;
    stim[4] = 14'h0dd2;
    stim[5] = 14'h086b;
    stim[6] = 14'h1495;
    stim[7] = 14'h1728;
    stim[8] = 14'h06b1;
    stim[9] = 14'h0360;
    stim[10] = 14'h0f21;
    stim[11] = 14'h0d64;
    stim[12] = 14'h1b30;
    stim[13] = 14'h1a58;
    stim[14] = 14'h1bcf;
    stim[15] = 14'h18c5;
    stim[16] = 14'h0efc;
    stim[17] = 14'h1eb9;
    stim[18] = 14'h0bea;
    stim[19] = 14'h12a2;
    stim[20] = 14'h1835;
    stim[21] = 14'h0206;
    stim[22] = 14'h12b2;
    stim[23] = 14'h1b12;
    stim[24] = 14'h141a;
    stim[25] = 14'h39e8;
    stim[26] = 14'h1fc6;
    stim[27] = 14'h15ed;
    stim[28] = 14'h0bd8;
    stim[29] = 14'h2dac;
    stim[30] = 14'h04c1;
    stim[31] = 14'h1d4e;
    stim[32] = 14'h1893;
    stim[33] = 14'h133f;
    stim[34] = 14'h109a;
    stim[35] = 14'h0a0c;
    stim[36] = 14'h04b9;
    stim[37] = 14'h140d;
    stim[38] = 14'h2892;
    stim[39] = 14'h0697;
    stim[40] = 14'h1166;
    stim[41] = 14'h1fd6;
    stim[42] = 14'h04f7;
    stim[43] = 14'h177b;
    stim[44] = 14'h1875;
    stim[45] = 14'h0b6b;
    stim[46] = 14'h0aeb;
    stim[47] = 14'h1863;
    stim[48] = 14'h123d;
    stim[49] = 14'h0724;
    stim[50] = 14'h05fa;
    stim[51] = 14'h141a;
    stim[52] = 14'h021d;
    stim[53] = 14'h11e6;
    stim[54] = 14'h1c8b;
    stim[55] = 14'h187b;
    stim[56] = 14'h1016;
    stim[57] = 14'h2e63;
    stim[58] = 14'h10e7;
    stim[59] = 14'h17f7;
    stim[60] = 14'h085c;
    stim[61] = 14'h0104;
    stim[62] = 14'h079d;
    stim[63] = 14'h16e4;
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
      expv[0] = 10'h000;
      expv[1] = 10'h000;
      expv[2] = 10'h000;
      expv[3] = 10'h000;
      expv[4] = 10'hx00;
      expv[5] = 10'h000;
      expv[6] = 10'h000;
      expv[7] = 10'h000;
      expv[8] = 10'h200;
      expv[9] = 10'h200;
      expv[10] = 10'h000;
      expv[11] = 10'h000;
      expv[12] = 10'h000;
      expv[13] = 10'h000;
      expv[14] = 10'h200;
      expv[15] = 10'h200;
      expv[16] = 10'h200;
      expv[17] = 10'h200;
      expv[18] = 10'h000;
      expv[19] = 10'h200;
      expv[20] = 10'h000;
      expv[21] = 10'h200;
      expv[22] = 10'h200;
      expv[23] = 10'h000;
      expv[24] = 10'h200;
      expv[25] = 10'h000;
      expv[26] = 10'h000;
      expv[27] = 10'h000;
      expv[28] = 10'h200;
      expv[29] = 10'h000;
      expv[30] = 10'h000;
      expv[31] = 10'h000;
      expv[32] = 10'h000;
      expv[33] = 10'h200;
      expv[34] = 10'h200;
      expv[35] = 10'h200;
      expv[36] = 10'h200;
      expv[37] = 10'h000;
      expv[38] = 10'h000;
      expv[39] = 10'h000;
      expv[40] = 10'h000;
      expv[41] = 10'h000;
      expv[42] = 10'h200;
      expv[43] = 10'h200;
      expv[44] = 10'h000;
      expv[45] = 10'h200;
      expv[46] = 10'h200;
      expv[47] = 10'h000;
      expv[48] = 10'h000;
      expv[49] = 10'h200;
      expv[50] = 10'h200;
      expv[51] = 10'h000;
      expv[52] = 10'h000;
      expv[53] = 10'h200;
      expv[54] = 10'h000;
      expv[55] = 10'h200;
      expv[56] = 10'h200;
      expv[57] = 10'h000;
      expv[58] = 10'h000;
      expv[59] = 10'h000;
      expv[60] = 10'h200;
      expv[61] = 10'h200;
      expv[62] = 10'h000;
      expv[63] = 10'h000;
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
