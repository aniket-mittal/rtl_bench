// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_035131 dut (
    .clk(clk),
    .rst_n(in_vec[39:39]),
    .s1_flg_384(in_vec[38:38]),
    .wr_size(in_vec[37:22]),
    .cmd_extend(in_vec[21:6]),
    .size0_clr(in_vec[5:5]),
    .size0_add(in_vec[4:4]),
    .size1_clr(in_vec[3:3]),
    .size1_en(in_vec[2:2]),
    .size1_op(in_vec[1:0]),
    .size0(out_vec[63:32]),
    .size1(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'h41d92ab20a;
    stim[1] = 40'h78e52ab38d;
    stim[2] = 40'heeae4769c3;
    stim[3] = 40'h825ce9a697;
    stim[4] = 40'h8694b12602;
    stim[5] = 40'hc2e85c732d;
    stim[6] = 40'hcd48ff2689;
    stim[7] = 40'h8b0e1bce53;
    stim[8] = 40'hf3db459626;
    stim[9] = 40'ha8d015dafc;
    stim[10] = 40'hf32337d974;
    stim[11] = 40'hb828965f1e;
    stim[12] = 40'hf968ebb5a7;
    stim[13] = 40'h69b9be8bcc;
    stim[14] = 40'h9c5e7337ee;
    stim[15] = 40'hc6b267c505;
    stim[16] = 40'hfcf1a8e2dc;
    stim[17] = 40'hc4d85fe603;
    stim[18] = 40'h8bbc7615a5;
    stim[19] = 40'ha072b1b877;
    stim[20] = 40'hd8b324e8c3;
    stim[21] = 40'hd60a3acab4;
    stim[22] = 40'he8fcce93a3;
    stim[23] = 40'h8bec7c718e;
    stim[24] = 40'h9c8b2f926c;
    stim[25] = 40'hd7cdd3355c;
    stim[26] = 40'h905a97141b;
    stim[27] = 40'hbac7dd161b;
    stim[28] = 40'hbb5ba65c70;
    stim[29] = 40'h8724af0de3;
    stim[30] = 40'hc9a2f15d12;
    stim[31] = 40'ha9d0311478;
    stim[32] = 40'h9bef9ca1d2;
    stim[33] = 40'hd7589f100d;
    stim[34] = 40'h845c8c4ad8;
    stim[35] = 40'hca1b376d07;
    stim[36] = 40'hd6a6294337;
    stim[37] = 40'hd9712eb5a6;
    stim[38] = 40'hbe118c414e;
    stim[39] = 40'hbe2cf9c4a0;
    stim[40] = 40'hf765e54d28;
    stim[41] = 40'hc56e482016;
    stim[42] = 40'ha342e90b9a;
    stim[43] = 40'hcc495eab33;
    stim[44] = 40'ha866bbcd31;
    stim[45] = 40'ha7cde0ad6f;
    stim[46] = 40'h952acd71a7;
    stim[47] = 40'he72a4584da;
    stim[48] = 40'hf6ae47c46e;
    stim[49] = 40'hee0f168fcc;
    stim[50] = 40'he24f370c1d;
    stim[51] = 40'hbd7514821d;
    stim[52] = 40'hf90c7435eb;
    stim[53] = 40'ha211fc2c0b;
    stim[54] = 40'h9d9fdfcc48;
    stim[55] = 40'h85303b5008;
    stim[56] = 40'heb2728fe62;
    stim[57] = 40'heaa7b4cc1a;
    stim[58] = 40'he82aa79e7d;
    stim[59] = 40'hf9db922173;
    stim[60] = 40'h8a39c99a8b;
    stim[61] = 40'h812f3cdc16;
    stim[62] = 40'hcd1cba96a7;
    stim[63] = 40'hd1c6fc1683;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'h0000097300000020;
      expv[5] = 64'h0000097300000020;
      expv[6] = 64'h0000000000000000;
      expv[7] = 64'h0000000000000000;
      expv[8] = 64'h00002c3800000000;
      expv[9] = 64'h0000000000001658;
      expv[10] = 64'h0000000000000000;
      expv[11] = 64'h000000000000cc8c;
      expv[12] = 64'h0000e0a200000000;
      expv[13] = 64'h0000000000000000;
      expv[14] = 64'h0000000000000000;
      expv[15] = 64'h0000000000000000;
      expv[16] = 64'h0000000000001ac9;
      expv[17] = 64'h0000f3c600000000;
      expv[18] = 64'h0000f3c600000000;
      expv[19] = 64'h0000000000002ef1;
      expv[20] = 64'h0000000000002f11;
      expv[21] = 64'h0000000000002f11;
      expv[22] = 64'h0000000000005828;
      expv[23] = 64'h0000000000005828;
      expv[24] = 64'h0000000000000000;
      expv[25] = 64'h0000000000000000;
      expv[26] = 64'h00005f3700000000;
      expv[27] = 64'h0000a0a100000000;
      expv[28] = 64'h00018bc000000000;
      expv[29] = 64'h0000000000000000;
      expv[30] = 64'h0000000000000000;
      expv[31] = 64'h0000268b00000000;
      expv[32] = 64'h0000000000000000;
      expv[33] = 64'h00006fbe00000000;
      expv[34] = 64'h00006fbe00000000;
      expv[35] = 64'h0000813000000000;
      expv[36] = 64'h0000813000000030;
      expv[37] = 64'h0000000000000060;
      expv[38] = 64'h000000000000bb36;
      expv[39] = 64'h0000000000000000;
      expv[40] = 64'h0000000000000000;
      expv[41] = 64'h0000000000000000;
      expv[42] = 64'h000015b900002080;
      expv[43] = 64'h0000a2c400000000;
      expv[44] = 64'h0000000000000000;
      expv[45] = 64'h0000000000000000;
      expv[46] = 64'h0000000000000000;
      expv[47] = 64'h0000000000000020;
      expv[48] = 64'h00009ca900000000;
      expv[49] = 64'h0000000000000000;
      expv[50] = 64'h0000000000000000;
      expv[51] = 64'h0000893c00000000;
      expv[52] = 64'h00017f1000000000;
      expv[53] = 64'h0000000000000000;
      expv[54] = 64'h0000000000000000;
      expv[55] = 64'h0000000000000000;
      expv[56] = 64'h0000000000000000;
      expv[57] = 64'h0000000000000000;
      expv[58] = 64'h0000aa9e00000000;
      expv[59] = 64'h0000000000000000;
      expv[60] = 64'h0000000000000000;
      expv[61] = 64'h0000000000000000;
      expv[62] = 64'h000004bc0000f370;
      expv[63] = 64'h000000000000f3a0;
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
