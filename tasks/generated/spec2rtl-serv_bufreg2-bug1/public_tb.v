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
    stim[0] = 46'h1e2b56441bed;
    stim[1] = 46'h199dbb33c0ca;
    stim[2] = 46'h0477a9b8d51a;
    stim[3] = 46'h0756f87de9b5;
    stim[4] = 46'h09e10132fedd;
    stim[5] = 46'h37c450592b25;
    stim[6] = 46'h27368436795c;
    stim[7] = 46'h15ef6ade1a8f;
    stim[8] = 46'h28d983b7ed4d;
    stim[9] = 46'h28c06a23315a;
    stim[10] = 46'h24fdc29a490d;
    stim[11] = 46'h1b903b213378;
    stim[12] = 46'h007a5bfcdeef;
    stim[13] = 46'h01ae94240cb1;
    stim[14] = 46'h279d98d2e8d7;
    stim[15] = 46'h197ef4c959ff;
    stim[16] = 46'h06cd3eef9355;
    stim[17] = 46'h016dd23666e7;
    stim[18] = 46'h168018e93046;
    stim[19] = 46'h0f2c7efe097a;
    stim[20] = 46'h31c33c0782ec;
    stim[21] = 46'h0430ecd9b5d0;
    stim[22] = 46'h32cff797c9b1;
    stim[23] = 46'h3f6247cf30e4;
    stim[24] = 46'h0dc1a5ca45ed;
    stim[25] = 46'h154ec922901b;
    stim[26] = 46'h06247e0b6059;
    stim[27] = 46'h3a84906bedcf;
    stim[28] = 46'h08059706f358;
    stim[29] = 46'h2983a1eba238;
    stim[30] = 46'h1af6bf6d8547;
    stim[31] = 46'h1bd1b5337d82;
    stim[32] = 46'h02ffd57d6cc5;
    stim[33] = 46'h01954eaa90de;
    stim[34] = 46'h0160d762d622;
    stim[35] = 46'h39405f2822f6;
    stim[36] = 46'h1ca0e134d39d;
    stim[37] = 46'h333933b88b85;
    stim[38] = 46'h09ddbc4405af;
    stim[39] = 46'h2843fdb7857f;
    stim[40] = 46'h13e610bb9122;
    stim[41] = 46'h22b1b67d1fac;
    stim[42] = 46'h022e3f990c01;
    stim[43] = 46'h3591a11e7548;
    stim[44] = 46'h00342615cf87;
    stim[45] = 46'h06cb1f464796;
    stim[46] = 46'h3a401e22ff93;
    stim[47] = 46'h008aa66b39f9;
    stim[48] = 46'h36ea060b4450;
    stim[49] = 46'h1b696eab1ba7;
    stim[50] = 46'h24b2c57cb429;
    stim[51] = 46'h047a2bcd87eb;
    stim[52] = 46'h242ee4db15e1;
    stim[53] = 46'h0b9e41c1d166;
    stim[54] = 46'h134ec10ef381;
    stim[55] = 46'h0246094823b3;
    stim[56] = 46'h28b9a252107c;
    stim[57] = 46'h190192797ad0;
    stim[58] = 46'h14ef681488e5;
    stim[59] = 46'h174040998de4;
    stim[60] = 46'h12bc4b59a390;
    stim[61] = 46'h3970575d93c0;
    stim[62] = 46'h3764ea80a116;
    stim[63] = 46'h2111313cfdd1;
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
      expv[1] = 35'h656441bed;
      expv[2] = 35'h2bb33c0ca;
      expv[3] = 35'h2a9b8d51a;
      expv[4] = 35'h1a9b8d51a;
      expv[5] = 35'h10132fedd;
      expv[6] = 35'h20132fedd;
      expv[7] = 35'h280997f6e;
      expv[8] = 35'h46ade1a8f;
      expv[9] = 35'h183b7ed4d;
      expv[10] = 35'h241dbf6a6;
      expv[11] = 35'h4c29a490d;
      expv[12] = 35'h1c29a490d;
      expv[13] = 35'h3419a490d;
      expv[14] = 35'h6c09a490d;
      expv[15] = 35'h298d2e8d7;
      expv[16] = 35'h098d2e8d7;
      expv[17] = 35'h53eef9355;
      expv[18] = 35'h4d23666e7;
      expv[19] = 35'h0d23666e7;
      expv[20] = 35'h7513666e7;
      expv[21] = 35'h03c0782ec;
      expv[22] = 35'h23c0782ec;
      expv[23] = 35'h7f797c9b1;
      expv[24] = 35'h5f797c9b1;
      expv[25] = 35'h2a5ca45ed;
      expv[26] = 35'h1a5ca45ed;
      expv[27] = 35'h1a5ca45ed;
      expv[28] = 35'h452e522f6;
      expv[29] = 35'h39706f358;
      expv[30] = 35'h2a1eba238;
      expv[31] = 35'h1a1eba238;
      expv[32] = 35'h7b5337d82;
      expv[33] = 35'h7d57d6cc5;
      expv[34] = 35'h44eaa90de;
      expv[35] = 35'h44eaa90de;
      expv[36] = 35'h44eaa90de;
      expv[37] = 35'h44eaa90de;
      expv[38] = 35'h733b88b85;
      expv[39] = 35'h3bc4405af;
      expv[40] = 35'h7fdb7857f;
      expv[41] = 35'h5fdb7857f;
      expv[42] = 35'h6b67d1fac;
      expv[43] = 35'h1b57d1fac;
      expv[44] = 35'h2a11e7548;
      expv[45] = 35'h7a11e7548;
      expv[46] = 35'h01f464796;
      expv[47] = 35'h30fa323cb;
      expv[48] = 35'h38ea323cb;
      expv[49] = 35'h18da323cb;
      expv[50] = 35'h56eab1ba7;
      expv[51] = 35'h537558dd3;
      expv[52] = 35'h736558dd3;
      expv[53] = 35'h7b5558dd3;
      expv[54] = 35'h3b4558dd3;
      expv[55] = 35'h3b4558dd3;
      expv[56] = 35'h5b4558dd3;
      expv[57] = 35'h0a252107c;
      expv[58] = 35'h292797ad0;
      expv[59] = 35'h4681488e5;
      expv[60] = 35'h6681488e5;
      expv[61] = 35'h4681488e5;
      expv[62] = 35'h4681488e5;
      expv[63] = 35'h4681488e5;
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
