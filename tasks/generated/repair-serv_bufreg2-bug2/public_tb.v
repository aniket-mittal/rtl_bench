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
    stim[0] = 46'h016554b7457a;
    stim[1] = 46'h16a5fe82d329;
    stim[2] = 46'h12e54e5dac90;
    stim[3] = 46'h2328e79b0644;
    stim[4] = 46'h1cc0e37256ce;
    stim[5] = 46'h19165c2406a7;
    stim[6] = 46'h2ad416e8eafa;
    stim[7] = 46'h365936129220;
    stim[8] = 46'h07e56e71b116;
    stim[9] = 46'h3a46a14b27af;
    stim[10] = 46'h0ac0c54a2df5;
    stim[11] = 46'h2310338bc454;
    stim[12] = 46'h2dc45abd2018;
    stim[13] = 46'h1c8d0fd885f0;
    stim[14] = 46'h322395dd9c76;
    stim[15] = 46'h33259df2a092;
    stim[16] = 46'h198e0c0aab8e;
    stim[17] = 46'h3e51ce363223;
    stim[18] = 46'h334d1749de71;
    stim[19] = 46'h36ea34539114;
    stim[20] = 46'h0c0d899fae08;
    stim[21] = 46'h223c5f91ade2;
    stim[22] = 46'h1d1e3570738e;
    stim[23] = 46'h11feaa6924e4;
    stim[24] = 46'h2896b287d4a9;
    stim[25] = 46'h1a392834b552;
    stim[26] = 46'h2213f1fa9486;
    stim[27] = 46'h0b2ee0f2c397;
    stim[28] = 46'h1a8a8077a3e0;
    stim[29] = 46'h1bb54734ae75;
    stim[30] = 46'h19e0ecc03750;
    stim[31] = 46'h152ac23297d8;
    stim[32] = 46'h3829def132a9;
    stim[33] = 46'h0a46d8b40012;
    stim[34] = 46'h2d1c72fa80a2;
    stim[35] = 46'h3dbaccad6026;
    stim[36] = 46'h2a00d22e71ee;
    stim[37] = 46'h3ab7d75203fb;
    stim[38] = 46'h31ebaf04eda1;
    stim[39] = 46'h0f0d58a59e70;
    stim[40] = 46'h2d043d667d74;
    stim[41] = 46'h330724d83b2e;
    stim[42] = 46'h20e9ea7e50db;
    stim[43] = 46'h1c4794d613f1;
    stim[44] = 46'h31551207211e;
    stim[45] = 46'h24f18112773b;
    stim[46] = 46'h3c13642701f7;
    stim[47] = 46'h0da4290610f2;
    stim[48] = 46'h079ecbcbf7a6;
    stim[49] = 46'h28b2033ab810;
    stim[50] = 46'h215033ce34ca;
    stim[51] = 46'h14a41fba03af;
    stim[52] = 46'h1c245eb73b93;
    stim[53] = 46'h01742fc535d8;
    stim[54] = 46'h1c563cc6eaf4;
    stim[55] = 46'h2f410d57932a;
    stim[56] = 46'h0e6f08de0ab4;
    stim[57] = 46'h08f8825ec9fc;
    stim[58] = 46'h35627edf106b;
    stim[59] = 46'h1f294e6d0dfe;
    stim[60] = 46'h2a17d08cdd73;
    stim[61] = 46'h29973ecbb732;
    stim[62] = 46'h39e731e48d6d;
    stim[63] = 46'h19b5a4498ebd;
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
      expv[1] = 35'h154b7457a;
      expv[2] = 35'h5fe82d329;
      expv[3] = 35'h14e5dac90;
      expv[4] = 35'h00d5dac90;
      expv[5] = 35'h30d5dac90;
      expv[6] = 35'h20d5dac90;
      expv[7] = 35'h08caed648;
      expv[8] = 35'h436129220;
      expv[9] = 35'h66e71b116;
      expv[10] = 35'h4ad38d88b;
      expv[11] = 35'h46c38d88b;
      expv[12] = 35'h12b1c6c45;
      expv[13] = 35'h42b1c6c45;
      expv[14] = 35'h20fd885f0;
      expv[15] = 35'h195dd9c76;
      expv[16] = 35'h39df2a092;
      expv[17] = 35'h09df2a092;
      expv[18] = 35'h0ce363223;
      expv[19] = 35'h21749de71;
      expv[20] = 35'h19649de71;
      expv[21] = 35'h2899fae08;
      expv[22] = 35'h3c89fae08;
      expv[23] = 35'h7c79fae08;
      expv[24] = 35'h6c79fae08;
      expv[25] = 35'h4e3cfd704;
      expv[26] = 35'h42834b552;
      expv[27] = 35'h6f1fa9486;
      expv[28] = 35'h6f0fa9486;
      expv[29] = 35'h7effa9486;
      expv[30] = 35'h54734ae75;
      expv[31] = 35'h24734ae75;
      expv[32] = 35'h18634ae75;
      expv[33] = 35'h3def132a9;
      expv[34] = 35'h3ddf132a9;
      expv[35] = 35'h0dcf132a9;
      expv[36] = 35'h15bf132a9;
      expv[37] = 35'h31af89954;
      expv[38] = 35'h7d75203fb;
      expv[39] = 35'h4af04eda1;
      expv[40] = 35'h558a59e70;
      expv[41] = 35'h62c52cf38;
      expv[42] = 35'h524d83b2e;
      expv[43] = 35'h7ea7e50db;
      expv[44] = 35'h294d613f1;
      expv[45] = 35'h11207211e;
      expv[46] = 35'h18112773b;
      expv[47] = 35'h4642701f7;
      expv[48] = 35'h6642701f7;
      expv[49] = 35'h1a32701f7;
      expv[50] = 35'h5519380fb;
      expv[51] = 35'h4519380fb;
      expv[52] = 35'h5519380fb;
      expv[53] = 35'h7519380fb;
      expv[54] = 35'h7519380fb;
      expv[55] = 35'h1519380fb;
      expv[56] = 35'h20d57932a;
      expv[57] = 35'h008de0ab4;
      expv[58] = 35'h207de0ab4;
      expv[59] = 35'h007de0ab4;
      expv[60] = 35'h24e6d0dfe;
      expv[61] = 35'h6d08cdd73;
      expv[62] = 35'h23ecbb732;
      expv[63] = 35'h331e48d6d;
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
