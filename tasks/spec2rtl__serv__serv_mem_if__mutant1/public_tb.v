// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .i_clk(clk),
    .i_bytecnt(in_vec[8:7]),
    .i_lsb(in_vec[6:5]),
    .i_signed(in_vec[4:4]),
    .i_word(in_vec[3:3]),
    .i_half(in_vec[2:2]),
    .i_mdu_op(in_vec[1:1]),
    .i_bufreg2_q(in_vec[0:0]),
    .o_misalign(out_vec[5:5]),
    .o_rd(out_vec[4:4]),
    .o_wb_sel(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h0ae;
    stim[1] = 9'h1f0;
    stim[2] = 9'h1b4;
    stim[3] = 9'h0d8;
    stim[4] = 9'h1f0;
    stim[5] = 9'h093;
    stim[6] = 9'h1bf;
    stim[7] = 9'h167;
    stim[8] = 9'h168;
    stim[9] = 9'h10b;
    stim[10] = 9'h0fb;
    stim[11] = 9'h16a;
    stim[12] = 9'h1de;
    stim[13] = 9'h038;
    stim[14] = 9'h0dc;
    stim[15] = 9'h1bc;
    stim[16] = 9'h0c0;
    stim[17] = 9'h1b2;
    stim[18] = 9'h0d1;
    stim[19] = 9'h1f3;
    stim[20] = 9'h1ee;
    stim[21] = 9'h0b4;
    stim[22] = 9'h153;
    stim[23] = 9'h1dc;
    stim[24] = 9'h08b;
    stim[25] = 9'h0c6;
    stim[26] = 9'h07d;
    stim[27] = 9'h186;
    stim[28] = 9'h1fb;
    stim[29] = 9'h0d4;
    stim[30] = 9'h086;
    stim[31] = 9'h147;
    stim[32] = 9'h1b6;
    stim[33] = 9'h0ff;
    stim[34] = 9'h075;
    stim[35] = 9'h0d0;
    stim[36] = 9'h086;
    stim[37] = 9'h1e2;
    stim[38] = 9'h024;
    stim[39] = 9'h12f;
    stim[40] = 9'h1d2;
    stim[41] = 9'h038;
    stim[42] = 9'h03e;
    stim[43] = 9'h127;
    stim[44] = 9'h14f;
    stim[45] = 9'h05e;
    stim[46] = 9'h1a0;
    stim[47] = 9'h071;
    stim[48] = 9'h0ba;
    stim[49] = 9'h1e6;
    stim[50] = 9'h036;
    stim[51] = 9'h069;
    stim[52] = 9'h08d;
    stim[53] = 9'h04b;
    stim[54] = 9'h1ed;
    stim[55] = 9'h02b;
    stim[56] = 9'h0d7;
    stim[57] = 9'h1ce;
    stim[58] = 9'h161;
    stim[59] = 9'h1e9;
    stim[60] = 9'h185;
    stim[61] = 9'h1d5;
    stim[62] = 9'h059;
    stim[63] = 9'h0d4;
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
      expv[0] = 6'h2e;
      expv[1] = 6'h08;
      expv[2] = 6'h22;
      expv[3] = 6'h2e;
      expv[4] = 6'h08;
      expv[5] = 6'h11;
      expv[6] = 6'h3e;
      expv[7] = 6'h28;
      expv[8] = 6'h2e;
      expv[9] = 6'h0f;
      expv[10] = 6'h3e;
      expv[11] = 6'h2e;
      expv[12] = 6'h3e;
      expv[13] = 6'h2e;
      expv[14] = 6'h2e;
      expv[15] = 6'h2e;
      expv[16] = 6'h04;
      expv[17] = 6'h02;
      expv[18] = 6'h04;
      expv[19] = 6'h08;
      expv[20] = 6'h2e;
      expv[21] = 6'h22;
      expv[22] = 6'h04;
      expv[23] = 6'h2e;
      expv[24] = 6'h1f;
      expv[25] = 6'h0c;
      expv[26] = 6'h3e;
      expv[27] = 6'h03;
      expv[28] = 6'h3e;
      expv[29] = 6'h0c;
      expv[30] = 6'h03;
      expv[31] = 6'h0c;
      expv[32] = 6'h22;
      expv[33] = 6'h3e;
      expv[34] = 6'h38;
      expv[35] = 6'h14;
      expv[36] = 6'h03;
      expv[37] = 6'h08;
      expv[38] = 6'h22;
      expv[39] = 6'h2e;
      expv[40] = 6'h04;
      expv[41] = 6'h2e;
      expv[42] = 6'h2e;
      expv[43] = 6'h22;
      expv[44] = 6'h2e;
      expv[45] = 6'h2e;
      expv[46] = 6'h02;
      expv[47] = 6'h18;
      expv[48] = 6'h2e;
      expv[49] = 6'h28;
      expv[50] = 6'h22;
      expv[51] = 6'h3e;
      expv[52] = 6'h1f;
      expv[53] = 6'h3e;
      expv[54] = 6'h2e;
      expv[55] = 6'h3e;
      expv[56] = 6'h1c;
      expv[57] = 6'h2e;
      expv[58] = 6'h08;
      expv[59] = 6'h2e;
      expv[60] = 6'h03;
      expv[61] = 6'h1c;
      expv[62] = 6'h3e;
      expv[63] = 6'h0c;
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
