// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 46;
  localparam OW = 27;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_199459 dut (
    .clock(clk),
    .start(in_vec[45:45]),
    .lowerXBound(in_vec[44:34]),
    .upperXBound(in_vec[33:23]),
    .lowerYBound(in_vec[22:12]),
    .upperYBound(in_vec[11:1]),
    .reset_n(in_vec[0:0]),
    .x(out_vec[26:16]),
    .y(out_vec[15:5]),
    .colour(out_vec[4:2]),
    .writeEn(out_vec[1:1]),
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
    stim[0] = 46'h010141760554;
    stim[1] = 46'h241cd393c226;
    stim[2] = 46'h1ac6bc73d93b;
    stim[3] = 46'h2ef4909c273f;
    stim[4] = 46'h0ab909cba315;
    stim[5] = 46'h1b1f2c766f71;
    stim[6] = 46'h065de9fe0d2f;
    stim[7] = 46'h3f2efdb6df79;
    stim[8] = 46'h2add159b6721;
    stim[9] = 46'h11668fa0fda9;
    stim[10] = 46'h355b54f2b0db;
    stim[11] = 46'h14871e53e387;
    stim[12] = 46'h2389782715c9;
    stim[13] = 46'h2b2d9d93e033;
    stim[14] = 46'h3686b1b83447;
    stim[15] = 46'h37de1f50310d;
    stim[16] = 46'h028628a6abc9;
    stim[17] = 46'h303abb2a3c55;
    stim[18] = 46'h29bbb9e0407f;
    stim[19] = 46'h0f2e4e0caa69;
    stim[20] = 46'h15b59fd36c9b;
    stim[21] = 46'h2d31bce91d07;
    stim[22] = 46'h36fafa5fc513;
    stim[23] = 46'h063fbe045095;
    stim[24] = 46'h1a5d110dfd2b;
    stim[25] = 46'h1eeb442faf59;
    stim[26] = 46'h35770ef93495;
    stim[27] = 46'h00fd3eb7e469;
    stim[28] = 46'h2edfdff74645;
    stim[29] = 46'h1f3af3592a21;
    stim[30] = 46'h0f15f28236a7;
    stim[31] = 46'h02e6c35fa80f;
    stim[32] = 46'h1c0936e252bb;
    stim[33] = 46'h1d5abc0d8fe1;
    stim[34] = 46'h0ff27bec2969;
    stim[35] = 46'h27bd3a68285d;
    stim[36] = 46'h36eee153535b;
    stim[37] = 46'h2148ed41b9cd;
    stim[38] = 46'h210ea63f4423;
    stim[39] = 46'h1589bf1b1a7d;
    stim[40] = 46'h28c304f1173f;
    stim[41] = 46'h01e9f2295f47;
    stim[42] = 46'h37a498b7d88f;
    stim[43] = 46'h052818d33d77;
    stim[44] = 46'h11c4f923eeef;
    stim[45] = 46'h32408e6287df;
    stim[46] = 46'h037e4d56f3d5;
    stim[47] = 46'h28745675ebc3;
    stim[48] = 46'h2a77c2de107d;
    stim[49] = 46'h2fbe0ef388d1;
    stim[50] = 46'h2ed1e4afc7d5;
    stim[51] = 46'h04095ea8a2c5;
    stim[52] = 46'h3be9a9241025;
    stim[53] = 46'h214962690e19;
    stim[54] = 46'h3149be301811;
    stim[55] = 46'h09cdebabe7d7;
    stim[56] = 46'h3d207c43114b;
    stim[57] = 46'h250ffe7aa7f9;
    stim[58] = 46'h24c04e75b25d;
    stim[59] = 46'h22526cda2b03;
    stim[60] = 46'h3ca46bfd44bf;
    stim[61] = 46'h2b0dc4c9fa61;
    stim[62] = 46'h1935a0128d03;
    stim[63] = 46'h393c0cced2f1;
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
      expv[0] = 27'h0000001;
      expv[1] = 27'h0000001;
      expv[2] = 27'h0000001;
      expv[3] = 27'h1a72263;
      expv[4] = 27'h0000000;
      expv[5] = 27'h0000001;
      expv[6] = 27'h3bd3843;
      expv[7] = 27'h3be3843;
      expv[8] = 27'h0000000;
      expv[9] = 27'h0000000;
      expv[10] = 27'h2b736c2;
      expv[11] = 27'h0000000;
      expv[12] = 27'h0000001;
      expv[13] = 27'h0000000;
      expv[14] = 27'h0000000;
      expv[15] = 27'h0000000;
      expv[16] = 27'h0000000;
      expv[17] = 27'h0000001;
      expv[18] = 27'h0000000;
      expv[19] = 27'h0000000;
      expv[20] = 27'h0000001;
      expv[21] = 27'h26ec083;
      expv[22] = 27'h0000000;
      expv[23] = 27'h0000000;
      expv[24] = 27'h0000001;
      expv[25] = 27'h0000001;
      expv[26] = 27'h5bebf83;
      expv[27] = 27'h0000000;
      expv[28] = 27'h0000001;
      expv[29] = 27'h0000000;
      expv[30] = 27'h0000001;
      expv[31] = 27'h0000001;
      expv[32] = 27'h0000001;
      expv[33] = 27'h0000001;
      expv[34] = 27'h3b7ee83;
      expv[35] = 27'h0000001;
      expv[36] = 27'h0000000;
      expv[37] = 27'h0000000;
      expv[38] = 27'h0000000;
      expv[39] = 27'h0000000;
      expv[40] = 27'h0437e82;
      expv[41] = 27'h0000000;
      expv[42] = 27'h230e222;
      expv[43] = 27'h0000000;
      expv[44] = 27'h0000001;
      expv[45] = 27'h0000001;
      expv[46] = 27'h0000000;
      expv[47] = 27'h0000001;
      expv[48] = 27'h0000000;
      expv[49] = 27'h0000000;
      expv[50] = 27'h0000000;
      expv[51] = 27'h0000000;
      expv[52] = 27'h0000001;
      expv[53] = 27'h0000000;
      expv[54] = 27'h0000000;
      expv[55] = 27'h0000000;
      expv[56] = 27'h0000001;
      expv[57] = 27'h0000000;
      expv[58] = 27'h0000000;
      expv[59] = 27'h0000000;
      expv[60] = 27'h0000000;
      expv[61] = 27'h0000000;
      expv[62] = 27'h0000000;
      expv[63] = 27'h2c393e2;
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
