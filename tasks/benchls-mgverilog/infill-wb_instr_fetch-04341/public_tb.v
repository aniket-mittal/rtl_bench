// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 71;
  localparam OW = 133;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04341 dut (
    .i_clk(clk),
    .i_rst(in_vec[70:70]),
    .i_new_pc(in_vec[69:69]),
    .i_clear_cache(in_vec[68:68]),
    .i_stalled_n(in_vec[67:67]),
    .i_pc(in_vec[66:35]),
    .i_wb_ack(in_vec[34:34]),
    .i_wb_stall(in_vec[33:33]),
    .i_wb_err(in_vec[32:32]),
    .i_wb_data(in_vec[31:0]),
    .o_i(out_vec[132:101]),
    .o_pc(out_vec[100:69]),
    .o_valid(out_vec[68:68]),
    .o_illegal(out_vec[67:67]),
    .o_wb_cyc(out_vec[66:66]),
    .o_wb_stb(out_vec[65:65]),
    .o_wb_we(out_vec[64:64]),
    .o_wb_addr(out_vec[63:32]),
    .o_wb_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 71'h571baa5e94bd6a1008;
    stim[1] = 71'h7540d6bdf7b2e83557;
    stim[2] = 71'h31dbcbb8af0946cd0d;
    stim[3] = 71'h390e85c5a3498098b2;
    stim[4] = 71'h2045c6072d506be054;
    stim[5] = 71'h37344156d11b4a29a9;
    stim[6] = 71'h0add7819bf35ca6cd5;
    stim[7] = 71'h377d0f0162d5a5959b;
    stim[8] = 71'h0d62b46fd0d945b61c;
    stim[9] = 71'h3ef1d485754d66706c;
    stim[10] = 71'h35ee6b639b54193864;
    stim[11] = 71'h25bcafae05e0154bd3;
    stim[12] = 71'h1684350e7bfe0d7c1f;
    stim[13] = 71'h1f4aba2897edd84675;
    stim[14] = 71'h3d7cba8e25e431890f;
    stim[15] = 71'h322c40ed9831defe2f;
    stim[16] = 71'h1d4f1a15d9181247cd;
    stim[17] = 71'h33fda97e7da8322d0e;
    stim[18] = 71'h0ff9fed5a93555166a;
    stim[19] = 71'h1966a68fa9a09777fd;
    stim[20] = 71'h170010cd6cddc15a97;
    stim[21] = 71'h30ba51d2c9fc52a4fa;
    stim[22] = 71'h091908da8e44eb234b;
    stim[23] = 71'h3347f98b99dcd01df6;
    stim[24] = 71'h2ac8d4cae3a5de7880;
    stim[25] = 71'h02d6eecd40ec07dd0b;
    stim[26] = 71'h2a402bd8c3897271a0;
    stim[27] = 71'h2bab0345eabe25ff39;
    stim[28] = 71'h26442371f23be21ba3;
    stim[29] = 71'h180a4ccc11adf21d8c;
    stim[30] = 71'h3a74f487d19a5defd8;
    stim[31] = 71'h16cbd048cd411985cb;
    stim[32] = 71'h7da25cdf32c9d6e770;
    stim[33] = 71'h1d6c35b43d5f60d5e9;
    stim[34] = 71'h16a23b6b1c62a67df9;
    stim[35] = 71'h0e2471dd40a2092608;
    stim[36] = 71'h159ad56c8ee4755151;
    stim[37] = 71'h16eca55f3cbab548af;
    stim[38] = 71'h3228ec31f04f9cc5e2;
    stim[39] = 71'h3a12cdb6b9d79947bf;
    stim[40] = 71'h33a1ef0fcda2176cc5;
    stim[41] = 71'h1a4bcdc668fb9ed019;
    stim[42] = 71'h27a40a09e5bde06457;
    stim[43] = 71'h21edac170384acfe79;
    stim[44] = 71'h771a727796ff35a46b;
    stim[45] = 71'h2eab2f66a1c273a837;
    stim[46] = 71'h3dd714d5c4d2219a28;
    stim[47] = 71'h09608f13f4f6edfb7c;
    stim[48] = 71'h24896fdf610d83f2eb;
    stim[49] = 71'h1544d3a4fe86fac23e;
    stim[50] = 71'h29f7b60f401b9a47ab;
    stim[51] = 71'h0a78b2e67138b42048;
    stim[52] = 71'h366d01963ac8555eb8;
    stim[53] = 71'h1e74257319f412af0a;
    stim[54] = 71'h2ff26fa797328324a8;
    stim[55] = 71'h07d39d098453b53e6c;
    stim[56] = 71'h364822f76688647a42;
    stim[57] = 71'h10207beec6648a87b7;
    stim[58] = 71'h05b541cc40397d956a;
    stim[59] = 71'h326d667ae433be3b58;
    stim[60] = 71'h13d422b9f46f3287f2;
    stim[61] = 71'h03fa2597831a9ebcef;
    stim[62] = 71'h095be33a73e746661f;
    stim[63] = 71'h07ef27e3f8d033920d;
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
      expv[0] = 133'hxxxxxxxxx0000000000000000000000000;
      expv[1] = 133'hxxxxxxxxx0000000000000000000000000;
      expv[2] = 133'hxxxxxxxxx5035af7c0a81ad7be00000000;
      expv[3] = 133'hxxxxxxxxx76f2ee2a03b79771500000000;
      expv[4] = 133'hxxxxxxxxx43a17168021d0b8b400000000;
      expv[5] = 133'hxxxxxxxxx117181ca008b8c0e500000000;
      expv[6] = 133'hxxxxxxxxxcd1055b40e6882ada00000000;
      expv[7] = 133'hxxxxxxxxxcd1055b60e6882adb00000000;
      expv[8] = 133'hxxxxxxxxxdf43c0586efa1e02c00000000;
      expv[9] = 133'hxxxxxxxxxdf43c0584efa1e02c00000000;
      expv[10] = 133'h09acce0d9bc75215c0de3a90ae00000000;
      expv[11] = 133'h09acce0d97b9ad8e60bdcd6c7300000000;
      expv[12] = 133'h09acce0d96f2beb800b795f5c000000000;
      expv[13] = 133'h09acce0d96f2beb800b795f5c000000000;
      expv[14] = 133'h09acce0d96f2beb820b795f5c100000000;
      expv[15] = 133'h09acce0d95f2ea3880af9751c400000000;
      expv[16] = 133'h09acce0d88b103b66645881db300000000;
      expv[17] = 133'h09acce0d88b103b67845881db300000000;
      expv[18] = 133'h09acce0d8ff6a5f9e07fb52fcf00000000;
      expv[19] = 133'h09acce0d8ff6a5fa007fb52fd000000000;
      expv[20] = 133'h09acce0d8ff6a5fa207fb52fd100000000;
      expv[21] = 133'h09acce0d8ff6a5fa207fb52fd100000000;
      expv[22] = 133'h09acce0d82e9474b20174a3a5900000000;
      expv[23] = 133'h09acce0d82e9474b40174a3a5a00000000;
      expv[24] = 133'h09acce0d8d1fe62e6068ff317300000000;
      expv[25] = 133'h09acce0d8b23532b80591a995c00000000;
      expv[26] = 133'h09acce0d8b23532b86591a995c00000000;
      expv[27] = 133'h09acce0d8900af630048057b1800000000;
      expv[28] = 133'h09acce0d8eac0d17a6756068bd00000000;
      expv[29] = 133'h09acce0d99108dc7c6c8846e3e00000000;
      expv[30] = 133'h09acce0d99108dc7c0c8846e3e00000000;
      expv[31] = 133'h09acce0d89d3d21f404e9e90fa00000000;
      expv[32] = 133'h09acce0d89d3d21f404e9e90fa00000000;
      expv[33] = 133'h09acce0d9689737cc0b44b9be600000000;
      expv[34] = 133'h09acce0d9689737ce0b44b9be700000000;
      expv[35] = 133'h09acce0d9689737ce0b44b9be700000000;
      expv[36] = 133'h09acce0d9689737d06b44b9be800000000;
      expv[37] = 133'h1c8eaa2a3689737d10b44b9be800000000;
      expv[38] = 133'h1c8eaa2a3689737d00b44b9be800000000;
      expv[39] = 133'h1c8eaa2a28a3b0c7c6451d863e00000000;
      expv[40] = 133'h1c8eaa2a284b36dae04259b6d700000000;
      expv[41] = 133'h1c8eaa2a2e87bc3f20743de1f900000000;
      expv[42] = 133'h1c8eaa2a2e87bc3f46743de1fa00000000;
      expv[43] = 133'h17bc0c8afe90282780f481413c00000000;
      expv[44] = 133'h17bc0c8ae7b6b05c003db582e000000000;
      expv[45] = 133'h17bc0c8afc69c9de40e34e4ef200000000;
      expv[46] = 133'h17bc0c8afaacbd9a80d565ecd400000000;
      expv[47] = 133'h17bc0c8af75c535700bae29ab800000000;
      expv[48] = 133'h17bc0c8af75c535720bae29ab900000000;
      expv[49] = 133'h17bc0c8af225bf7d80912dfbec00000000;
      expv[50] = 133'h17bc0c8af225bf7d80912dfbec00000000;
      expv[51] = 133'h17bc0c8ae7ded83d063ef6c1e800000000;
      expv[52] = 133'h17bc0c8ae7ded83d183ef6c1e800000000;
      expv[53] = 133'h17bc0c8af9b40658e6cda032c700000000;
      expv[54] = 133'h17bc0c8af9b40658f8cda032c700000000;
      expv[55] = 133'h17bc0c8affc9be9e40fe4df4f200000000;
      expv[56] = 133'h17bc0c8affc9be9e40fe4df4f200000000;
      expv[57] = 133'h17bc0c8af9208bdd80c9045eec00000000;
      expv[58] = 133'h17bc0c8af9208bdd80c9045eec00000000;
      expv[59] = 133'h17bc0c8af9208bdd86c9045eec00000000;
      expv[60] = 133'h0677c76b09b599eb804daccf5c00000000;
      expv[61] = 133'h0677c76b09b599eb804daccf5c00000000;
      expv[62] = 133'h0677c76b09b599eb804daccf5c00000000;
      expv[63] = 133'h0677c76b09b599eba04daccf5d00000000;
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
