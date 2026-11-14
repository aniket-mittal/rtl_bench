// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 46;
  localparam OW = 35;
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
    .i_en(in_vec[45:45]),
    .i_init(in_vec[44:44]),
    .i_cnt7(in_vec[43:43]),
    .i_cnt_done(in_vec[42:42]),
    .i_sh_right(in_vec[41:41]),
    .i_lsb(in_vec[40:39]),
    .i_bytecnt(in_vec[38:37]),
    .i_op_b_sel(in_vec[36:36]),
    .i_shift_op(in_vec[35:35]),
    .i_rs2(in_vec[34:34]),
    .i_imm(in_vec[33:33]),
    .i_load(in_vec[32:32]),
    .i_dat(in_vec[31:0]),
    .o_sh_done(out_vec[34:34]),
    .o_op_b(out_vec[33:33]),
    .o_q(out_vec[32:32]),
    .o_dat(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 46'h2959b8340e84;
    stim[1] = 46'h003aa69c65f0;
    stim[2] = 46'h1bb1aff602c7;
    stim[3] = 46'h1b5135a7a88b;
    stim[4] = 46'h320faa6c124f;
    stim[5] = 46'h067d796ceb75;
    stim[6] = 46'h074378a14954;
    stim[7] = 46'h391443ee042d;
    stim[8] = 46'h1973a3cd2dae;
    stim[9] = 46'h3435727a60b0;
    stim[10] = 46'h161e95decf94;
    stim[11] = 46'h0f7ee2be96e1;
    stim[12] = 46'h38560865bd1a;
    stim[13] = 46'h3dccfe03e44b;
    stim[14] = 46'h00704a11a68c;
    stim[15] = 46'h3a7b13e72d17;
    stim[16] = 46'h019847843e8a;
    stim[17] = 46'h04626b1f597a;
    stim[18] = 46'h0ad1f043362d;
    stim[19] = 46'h384ef38e4cdc;
    stim[20] = 46'h136aae19b86c;
    stim[21] = 46'h34e3bae252a9;
    stim[22] = 46'h2db2ecec48fb;
    stim[23] = 46'h14a0ea9e46af;
    stim[24] = 46'h207f86fed4c9;
    stim[25] = 46'h2d6de7828cc5;
    stim[26] = 46'h0646d99a76aa;
    stim[27] = 46'h184d2d98fdbc;
    stim[28] = 46'h2aa2e6b6952a;
    stim[29] = 46'h3b9baa40a107;
    stim[30] = 46'h3e898d7bd258;
    stim[31] = 46'h0ed83e705559;
    stim[32] = 46'h08eb52455e13;
    stim[33] = 46'h3a85536ce4dd;
    stim[34] = 46'h1fbba01196e7;
    stim[35] = 46'h3da44a8794d1;
    stim[36] = 46'h0a4324ec915e;
    stim[37] = 46'h2dccc3342f5d;
    stim[38] = 46'h1be1b79115c9;
    stim[39] = 46'h023ba2c46126;
    stim[40] = 46'h0551d56e6a8c;
    stim[41] = 46'h0e97c9af5a22;
    stim[42] = 46'h34ae3e6524ba;
    stim[43] = 46'h1fbf18ef25e4;
    stim[44] = 46'h3aceee3a9b6b;
    stim[45] = 46'h0a1727152a8e;
    stim[46] = 46'h296c93e7d38c;
    stim[47] = 46'h2c02279fe1c1;
    stim[48] = 46'h07a4b699e4c8;
    stim[49] = 46'h1e4b3d60347d;
    stim[50] = 46'h3d5a96e39c18;
    stim[51] = 46'h3f6c3eb80fc5;
    stim[52] = 46'h29ae742da652;
    stim[53] = 46'h24ebb981ca5a;
    stim[54] = 46'h043308a71ce9;
    stim[55] = 46'h07df457b5cb5;
    stim[56] = 46'h31c1cc6f5fb1;
    stim[57] = 46'h178d72216ccc;
    stim[58] = 46'h0a79c9615174;
    stim[59] = 46'h3607ce280624;
    stim[60] = 46'h2af30dd02e20;
    stim[61] = 46'h3809ce72ee40;
    stim[62] = 46'h22d65b275030;
    stim[63] = 46'h0b4952641684;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'h4b8340e84;
      expv[2] = 35'h137340e84;
      expv[3] = 35'h0aff602c7;
      expv[4] = 35'h335a7a88b;
      expv[5] = 35'h7aa6c124f;
      expv[6] = 35'h6796ceb75;
      expv[7] = 35'h778a14954;
      expv[8] = 35'h0bc50a4aa;
      expv[9] = 35'h2a3cd2dae;
      expv[10] = 35'h6727a60b0;
      expv[11] = 35'h6f17a60b0;
      expv[12] = 35'h6f07a60b0;
      expv[13] = 35'h4f83d3058;
      expv[14] = 35'h4f83d3058;
      expv[15] = 35'h4f83d3058;
      expv[16] = 35'h113e72d17;
      expv[17] = 35'h312e72d17;
      expv[18] = 35'h112e72d17;
      expv[19] = 35'h7f043362d;
      expv[20] = 35'h7f043362d;
      expv[21] = 35'h6f043362d;
      expv[22] = 35'h0bae252a9;
      expv[23] = 35'h0bae252a9;
      expv[24] = 35'h7bae252a9;
      expv[25] = 35'h086fed4c9;
      expv[26] = 35'h7e7828cc5;
      expv[27] = 35'h5e7828cc5;
      expv[28] = 35'h32d98fdbc;
      expv[29] = 35'h096cc7ede;
      expv[30] = 35'h5aa40a107;
      expv[31] = 35'h08d7bd258;
      expv[32] = 35'h20c7bd258;
      expv[33] = 35'h452455e13;
      expv[34] = 35'h1536ce4dd;
      expv[35] = 35'h0a01196e7;
      expv[36] = 35'h3a01196e7;
      expv[37] = 35'h424ec915e;
      expv[38] = 35'h123ec915e;
      expv[39] = 35'h5b79115c9;
      expv[40] = 35'h0a2c46126;
      expv[41] = 35'h6d56e6a8c;
      expv[42] = 35'h6c9af5a22;
      expv[43] = 35'h3c9af5a22;
      expv[44] = 35'h318ef25e4;
      expv[45] = 35'h218ef25e4;
      expv[46] = 35'h527152a8e;
      expv[47] = 35'h226152a8e;
      expv[48] = 35'h1930a9547;
      expv[49] = 35'h3930a9547;
      expv[50] = 35'h03d60347d;
      expv[51] = 35'h43d60347d;
      expv[52] = 35'h63c60347d;
      expv[53] = 35'h6bb60347d;
      expv[54] = 35'h0b981ca5a;
      expv[55] = 35'h208a71ce9;
      expv[56] = 35'h5457b5cb5;
      expv[57] = 35'h0cc6f5fb1;
      expv[58] = 35'h472216ccc;
      expv[59] = 35'h6c9615174;
      expv[60] = 35'h4ce280624;
      expv[61] = 35'h00dd02e20;
      expv[62] = 35'h6ce72ee40;
      expv[63] = 35'h5e7397720;
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
