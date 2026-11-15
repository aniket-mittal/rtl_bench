// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03718 dut (
    .clock(clk),
    .reset(in_vec[10:10]),
    .i_d(in_vec[9:3]),
    .state(in_vec[2:1]),
    .fire(in_vec[0:0]),
    .o_d(out_vec[10:3]),
    .f_start_i_eq_0(out_vec[2:2]),
    .f_zeros_i_eq_0(out_vec[1:1]),
    .f_zeros_cnt_eq_127(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h637;
    stim[1] = 11'h632;
    stim[2] = 11'h145;
    stim[3] = 11'h0e6;
    stim[4] = 11'h078;
    stim[5] = 11'h172;
    stim[6] = 11'h2c6;
    stim[7] = 11'h06d;
    stim[8] = 11'h1d4;
    stim[9] = 11'h211;
    stim[10] = 11'h232;
    stim[11] = 11'h154;
    stim[12] = 11'h607;
    stim[13] = 11'h17b;
    stim[14] = 11'h32e;
    stim[15] = 11'h379;
    stim[16] = 11'h31c;
    stim[17] = 11'h005;
    stim[18] = 11'h2eb;
    stim[19] = 11'h67a;
    stim[20] = 11'h276;
    stim[21] = 11'h0d1;
    stim[22] = 11'h3ca;
    stim[23] = 11'h329;
    stim[24] = 11'h194;
    stim[25] = 11'h384;
    stim[26] = 11'h0b5;
    stim[27] = 11'h16b;
    stim[28] = 11'h01f;
    stim[29] = 11'h0db;
    stim[30] = 11'h0f4;
    stim[31] = 11'h372;
    stim[32] = 11'h163;
    stim[33] = 11'h191;
    stim[34] = 11'h04e;
    stim[35] = 11'h140;
    stim[36] = 11'h3d2;
    stim[37] = 11'h141;
    stim[38] = 11'h1ed;
    stim[39] = 11'h39c;
    stim[40] = 11'h14d;
    stim[41] = 11'h23b;
    stim[42] = 11'h292;
    stim[43] = 11'h103;
    stim[44] = 11'h159;
    stim[45] = 11'h31d;
    stim[46] = 11'h0b4;
    stim[47] = 11'h0dc;
    stim[48] = 11'h14a;
    stim[49] = 11'h21c;
    stim[50] = 11'h1b3;
    stim[51] = 11'h12f;
    stim[52] = 11'h3fb;
    stim[53] = 11'h1b1;
    stim[54] = 11'h03c;
    stim[55] = 11'h3bc;
    stim[56] = 11'h205;
    stim[57] = 11'h172;
    stim[58] = 11'h27c;
    stim[59] = 11'h209;
    stim[60] = 11'h02d;
    stim[61] = 11'h2fa;
    stim[62] = 11'h2f7;
    stim[63] = 11'h092;
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
      expv[0] = 11'h000;
      expv[1] = 11'h000;
      expv[2] = 11'h000;
      expv[3] = 11'h000;
      expv[4] = 11'h000;
      expv[5] = 11'h000;
      expv[6] = 11'h000;
      expv[7] = 11'h000;
      expv[8] = 11'h000;
      expv[9] = 11'h210;
      expv[10] = 11'h000;
      expv[11] = 11'h000;
      expv[12] = 11'h000;
      expv[13] = 11'h000;
      expv[14] = 11'h000;
      expv[15] = 11'h378;
      expv[16] = 11'h000;
      expv[17] = 11'h006;
      expv[18] = 11'h000;
      expv[19] = 11'h000;
      expv[20] = 11'h000;
      expv[21] = 11'h0d0;
      expv[22] = 11'h000;
      expv[23] = 11'h328;
      expv[24] = 11'h000;
      expv[25] = 11'h000;
      expv[26] = 11'h000;
      expv[27] = 11'h000;
      expv[28] = 11'h000;
      expv[29] = 11'h000;
      expv[30] = 11'h000;
      expv[31] = 11'h000;
      expv[32] = 11'h000;
      expv[33] = 11'h190;
      expv[34] = 11'h000;
      expv[35] = 11'h000;
      expv[36] = 11'h000;
      expv[37] = 11'h140;
      expv[38] = 11'h000;
      expv[39] = 11'h000;
      expv[40] = 11'h000;
      expv[41] = 11'h000;
      expv[42] = 11'h000;
      expv[43] = 11'h000;
      expv[44] = 11'h158;
      expv[45] = 11'h000;
      expv[46] = 11'h000;
      expv[47] = 11'h000;
      expv[48] = 11'h000;
      expv[49] = 11'h000;
      expv[50] = 11'h000;
      expv[51] = 11'h000;
      expv[52] = 11'h000;
      expv[53] = 11'h1b0;
      expv[54] = 11'h000;
      expv[55] = 11'h000;
      expv[56] = 11'h000;
      expv[57] = 11'h000;
      expv[58] = 11'h000;
      expv[59] = 11'h208;
      expv[60] = 11'h000;
      expv[61] = 11'h000;
      expv[62] = 11'h000;
      expv[63] = 11'h000;
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
