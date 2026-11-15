// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 122;
  localparam OW = 53;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05352 dut (
    .clk(clk),
    .MonDReg(in_vec[121:90]),
    .break_readreg(in_vec[89:58]),
    .dbrk_hit0_latch(in_vec[57:57]),
    .dbrk_hit1_latch(in_vec[56:56]),
    .dbrk_hit2_latch(in_vec[55:55]),
    .dbrk_hit3_latch(in_vec[54:54]),
    .debugack(in_vec[53:53]),
    .monitor_error(in_vec[52:52]),
    .monitor_ready(in_vec[51:51]),
    .reset_n(in_vec[50:50]),
    .resetlatch(in_vec[49:49]),
    .tracemem_on(in_vec[48:48]),
    .tracemem_trcdata(in_vec[47:12]),
    .tracemem_tw(in_vec[11:11]),
    .trc_im_addr(in_vec[10:4]),
    .trc_on(in_vec[3:3]),
    .trc_wrap(in_vec[2:2]),
    .trigbrktype(in_vec[1:1]),
    .trigger_state_1(in_vec[0:0]),
    .jdo(out_vec[52:15]),
    .jrst_n(out_vec[14:14]),
    .st_ready_test_idle(out_vec[13:13]),
    .take_action_break_a(out_vec[12:12]),
    .take_action_break_b(out_vec[11:11]),
    .take_action_break_c(out_vec[10:10]),
    .take_action_ocimem_a(out_vec[9:9]),
    .take_action_ocimem_b(out_vec[8:8]),
    .take_action_tracectrl(out_vec[7:7]),
    .take_action_tracemem_a(out_vec[6:6]),
    .take_action_tracemem_b(out_vec[5:5]),
    .take_no_action_break_a(out_vec[4:4]),
    .take_no_action_break_b(out_vec[3:3]),
    .take_no_action_break_c(out_vec[2:2]),
    .take_no_action_ocimem_a(out_vec[1:1]),
    .take_no_action_tracemem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 122'h1f0a00b869e4cf1f439583ebd210e43;
    stim[1] = 122'h390a561fd78bbe58ca96fca7af8be7e;
    stim[2] = 122'h1add41a040d3d9106ee6ed0dc9125a4;
    stim[3] = 122'h13b5e1ef471dea0710424ea4997dd3d;
    stim[4] = 122'h1859b98fabeab10353cea1e499bc3d1;
    stim[5] = 122'h020fbe3ff0a341e054ff8952b8010a1;
    stim[6] = 122'h1f749814bee8e25cc552d633e8ed466;
    stim[7] = 122'h3cb2889ad0bce098e8683e92883ccd5;
    stim[8] = 122'h3c9a0180a02f9cad40f7c8efc0210da;
    stim[9] = 122'h3b8d327464a5b409c3c25a573c0418d;
    stim[10] = 122'h1922ecad8e7158309c49fb2d945944c;
    stim[11] = 122'h3628e207779547d2ebd5f91f3662db3;
    stim[12] = 122'h17fd6f2f8863ddfac65fef18cba7109;
    stim[13] = 122'h0ca2a945b0080ebaebfb952eeb6bfe3;
    stim[14] = 122'h12ef920bd632af5201e822d992aee34;
    stim[15] = 122'h1e89b94a36f5fb48754fc57385ba3fd;
    stim[16] = 122'h14447637a13ec5e73968259da075fbe;
    stim[17] = 122'h1957e1e8697e12c129737a5fbe327eb;
    stim[18] = 122'h2d18e1e8690f128949eb695a8fa8b4e;
    stim[19] = 122'h268c53d88602e995b4d3bcb930d13f6;
    stim[20] = 122'h2617a6e6ec07318223e61c2ceeca259;
    stim[21] = 122'h3c9216d7c2fbae58dac2cfce95120e8;
    stim[22] = 122'h1f06961bd47a9d9927565d9f30af677;
    stim[23] = 122'h3f3cd372e200fa4e1bfaf16cf0cf868;
    stim[24] = 122'h1b1cf8143431097dbe59003d03180b4;
    stim[25] = 122'h30f3c028c6d353f7ae771fdcbcabf3b;
    stim[26] = 122'h3a27052e055e7b02f555a28c28c9c55;
    stim[27] = 122'h0c85a934a6c24a0e5d48eb5035d7b63;
    stim[28] = 122'h3a5c8639e78276b915ffed38d3bc057;
    stim[29] = 122'h2037da61f1857032b8f36bdaacbe4f8;
    stim[30] = 122'h3570e97eb77387f01e6eed426fbc3ce;
    stim[31] = 122'h10c7aa1c14b313b4df5901d85a0b80b;
    stim[32] = 122'h24a297724b2021a654f43f68d8bca46;
    stim[33] = 122'h26d1993bfa9a3af505657c4ac7f4d2f;
    stim[34] = 122'h240623a51c898f207bf63f74d038ebd;
    stim[35] = 122'h09b8cbf478a157846d7959a64017d8b;
    stim[36] = 122'h2e62dd79f82c7bf33de1c839ba8500f;
    stim[37] = 122'h1d0fa7ac92d9e16e6764198fe168493;
    stim[38] = 122'h3849f4ddaba2d7f7e348299d7f68c4e;
    stim[39] = 122'h0e06adf18c9d11eabad99a65cf66c85;
    stim[40] = 122'h052aff12a047ce6643fab461a34d6d3;
    stim[41] = 122'h3124480da4612d6982dfc1385a0b946;
    stim[42] = 122'h3637db05fe707c907542c2a34c44bfa;
    stim[43] = 122'h344f11697975b8dc77554ad7da2c23b;
    stim[44] = 122'h321fd2db3343583f7fdceaae23f3b09;
    stim[45] = 122'h3bf91edcc838ae27e75820e92bd0839;
    stim[46] = 122'h3924804f642795cccb4d712cbd2c6f2;
    stim[47] = 122'h130a0ba208723c5dec15e89536f68bf;
    stim[48] = 122'h11d17a91b4678f29da4cd0eab8af5e8;
    stim[49] = 122'h171df04ecfdac37629d640945843b1a;
    stim[50] = 122'h18e8450cc63bdb9d545f88d63c3fe53;
    stim[51] = 122'h224df8f9bc5e0a15e9f50abd732188f;
    stim[52] = 122'h2b9b676987f6f449e471a12ee0d4e9f;
    stim[53] = 122'h27a7dea9d9ed9d6b2c79e6111a413da;
    stim[54] = 122'h1df210c94a48a68ff7e6206217ed9c9;
    stim[55] = 122'h3b2b690cde996b9edd4de0ab0fea925;
    stim[56] = 122'h3dd682f9e68f9e35be5bf450ac8c096;
    stim[57] = 122'h344144de5b8bc65b0ef364aa91d1b75;
    stim[58] = 122'h0ec26238ba00492291570995216a609;
    stim[59] = 122'h10cad84f632c34caa350e15ea4dedb7;
    stim[60] = 122'h2054e24e204fd7ccc0f3ba378f0cb74;
    stim[61] = 122'h115a957a43319d7210690ab85ec7659;
    stim[62] = 122'h018b7d2c2eecd92518f7372b6574443;
    stim[63] = 122'h3fdab4ddae833ddbcc68bec8aced660;
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
      expv[0] = 53'h0f85005c211609;
      expv[1] = 53'h1c852b0fe5b3ec;
      expv[2] = 53'h0d6ea0d037a05e;
      expv[3] = 53'h09daf0f7a843fc;
      expv[4] = 53'h0c2cdcc7c9403f;
      expv[5] = 53'h0107df1fea2d13;
      expv[6] = 53'h0fba4c0a42514e;
      expv[7] = 53'h1e59444d74027c;
      expv[8] = 53'h1e4d00c04031af;
      expv[9] = 53'h1dc6993a2140de;
      expv[10] = 53'h0c917656ce41de;
      expv[11] = 53'h1b147103b5d629;
      expv[12] = 53'h0bfeb797c3cd93;
      expv[13] = 53'h065154a2d59709;
      expv[14] = 53'h0977c905e0827c;
      expv[15] = 53'h0f44dca51ac0fe;
      expv[16] = 53'h0a223b1bdc03fc;
      expv[17] = 53'h0cabf0f434948b;
      expv[18] = 53'h168c70f42402dc;
      expv[19] = 53'h134629ec5a716e;
      expv[20] = 53'h130bd3737180bf;
      expv[21] = 53'h1e490b6bede09f;
      expv[22] = 53'h0f834b0df3d56a;
      expv[23] = 53'h1f9e69b96d8b95;
      expv[24] = 53'h0d8e7c0a1f4876;
      expv[25] = 53'h1879e0147797a9;
      expv[26] = 53'h1d1382971a4f70;
      expv[27] = 53'h0642d49a4ec31d;
      expv[28] = 53'h1d2e431cea146a;
      expv[29] = 53'h101bed30fca8b7;
      expv[30] = 53'h1ab874bf4f00de;
      expv[31] = 53'h0863d50e0fd789;
      expv[32] = 53'h12514bb92a324c;
      expv[33] = 53'h1368cc9de202dc;
      expv[34] = 53'h120311d29d0ef0;
      expv[35] = 53'h04dc65fa369789;
      expv[36] = 53'h17316ebcfe01de;
      expv[37] = 53'h0e87d3d653003f;
      expv[38] = 53'h1c24fa6ed142dc;
      expv[39] = 53'h070356f8ddee50;
      expv[40] = 53'h02957f8941152b;
      expv[41] = 53'h18922406c1f34c;
      expv[42] = 53'h1b1bed82fa42bd;
      expv[43] = 53'h1a2788b4bb54ab;
      expv[44] = 53'h190fe96d9fcf91;
      expv[45] = 53'h1dfc8f6e734eb1;
      expv[46] = 53'h1c924027a5403f;
      expv[47] = 53'h098505d11696e8;
      expv[48] = 53'h08e8bd48cdc19f;
      expv[49] = 53'h0b8ef82774d3ad;
      expv[50] = 53'h0c7422866ad729;
      expv[51] = 53'h1126fc7cd417c8;
      expv[52] = 53'h15cdb3b4d216e8;
      expv[53] = 53'h13d3ef54f611af;
      expv[54] = 53'h0ef90864bb039d;
      expv[55] = 53'h1d95b4866ec25c;
      expv[56] = 53'h1eeb417cff506e;
      expv[57] = 53'h1a20a26f272f70;
      expv[58] = 53'h0761311c48cc93;
      expv[59] = 53'h08656c27b1d668;
      expv[60] = 53'h102a7127002a74;
      expv[61] = 53'h08ad4abd2881bf;
      expv[62] = 53'h00c5be960c340b;
      expv[63] = 53'h1fed5a6ec6011f;
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
