// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 122;
  localparam OW = 50;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11587 dut (
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
    .jdo(out_vec[49:12]),
    .jrst_n(out_vec[11:11]),
    .st_ready_test_idle(out_vec[10:10]),
    .take_action_break_a(out_vec[9:9]),
    .take_action_break_b(out_vec[8:8]),
    .take_action_break_c(out_vec[7:7]),
    .take_action_ocimem_a(out_vec[6:6]),
    .take_action_ocimem_b(out_vec[5:5]),
    .take_action_tracectrl(out_vec[4:4]),
    .take_no_action_break_a(out_vec[3:3]),
    .take_no_action_break_b(out_vec[2:2]),
    .take_no_action_break_c(out_vec[1:1]),
    .take_no_action_ocimem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 122'h1154639d9f2547caf29d2a93db18fcd;
    stim[1] = 122'h2a44e1a34b0e7139ceb9d503433a2f6;
    stim[2] = 122'h31453d449204744595456e761297d7f;
    stim[3] = 122'h0f12d5aa919305e4b5c22da2c5dc9b5;
    stim[4] = 122'h3bc356426f7413d8b36a670a9f1313f;
    stim[5] = 122'h05d650ed177a4b74c979844da2759f2;
    stim[6] = 122'h00ed2c11b6ed0f40364bcb56b0239c9;
    stim[7] = 122'h24b672423de9810ee8e61a67cf511da;
    stim[8] = 122'h2432ca02a26dfa381f7414fae7f6161;
    stim[9] = 122'h2111724e0d8fec6981647eeafa7d311;
    stim[10] = 122'h382b21648cb4bd594ed95616fc5b516;
    stim[11] = 122'h1f49c6c280c4733d63c2d59951fc417;
    stim[12] = 122'h1d8baa6ad37345470e7045d6db10912;
    stim[13] = 122'h3528a3f6daf0c8bf12d9079dffc2f76;
    stim[14] = 122'h28396825f78850640f65550c4ce9679;
    stim[15] = 122'h106b4a1840b8aafecb70da17294eed0;
    stim[16] = 122'h35b9e73aae87dc1b83e7473088dd307;
    stim[17] = 122'h2e51254a230e3bda49fe2120f1a7561;
    stim[18] = 122'h229844d35c0bd96624fb70ad636822c;
    stim[19] = 122'h2bf91db4f4029b43a944d965f592f0d;
    stim[20] = 122'h17c1c4007c47e5105641be3afcea66b;
    stim[21] = 122'h030878537f949cf50b581e42a7f1161;
    stim[22] = 122'h0c2520600f1ec9118145245544bf80a;
    stim[23] = 122'h3a988d85ee6afbfa1d43f8a733556cf;
    stim[24] = 122'h0ac027d0c1a1a9b7b452cb7eec23011;
    stim[25] = 122'h13a282f701713d7ee5701b42222fb23;
    stim[26] = 122'h0db9a449d922b6c14247d98554e494b;
    stim[27] = 122'h33550d1b923a8253b9cf4fb80610109;
    stim[28] = 122'h2b3e3dae715b26e74a49d6f4e8cc45b;
    stim[29] = 122'h2c2baa02ed121189f0528830d038bb0;
    stim[30] = 122'h096cddc7b928dff5ecd5125cb34d853;
    stim[31] = 122'h099eacd8efa79630d14e8995c373bfd;
    stim[32] = 122'h1799f0993c3ac158271794645c41d76;
    stim[33] = 122'h0c07d448f2f942d4cff6f71fa2220d8;
    stim[34] = 122'h30f83bd87cfd2cf66a63e2af9705083;
    stim[35] = 122'h212c920ea4f2d4dbd2e9b0c4f4383d6;
    stim[36] = 122'h38a22828abbef8fc9f67d50ed6ad485;
    stim[37] = 122'h023c97ece16793337e43c0bdb661ff0;
    stim[38] = 122'h3b83771c03ba746d574589b6fdda941;
    stim[39] = 122'h2dc94b11141c7fb8fe640f22b8c94f9;
    stim[40] = 122'h26d78f5dfff92a145d61c4232f95d91;
    stim[41] = 122'h0fe3c6ac8c9815fec85a1e7574ca0c3;
    stim[42] = 122'h3979a894f02c41c228dc16f6e36763e;
    stim[43] = 122'h028d887bb1da274918cee035805dacb;
    stim[44] = 122'h291ddef3491da6be3dcdf29f2c0e7dd;
    stim[45] = 122'h00d62c8bd257e12f145fdf42fd2da8a;
    stim[46] = 122'h2265085e01b1b539b3520fe4bba347e;
    stim[47] = 122'h16e901238d581157915690a277d4a22;
    stim[48] = 122'h1c176bdba7d81fd99e6029e93d313b5;
    stim[49] = 122'h13dddca61ecd50106a5736a405df65d;
    stim[50] = 122'h307814400cd8537e7b65e1a25fe652a;
    stim[51] = 122'h25fb5fac3c48b544775238e884fc132;
    stim[52] = 122'h116ff11095d96a7ec6c50b34398866b;
    stim[53] = 122'h3420e2023d97e7c56971f30b12b7b09;
    stim[54] = 122'h2fdf3fb44509d65d90c6953aa2fafb6;
    stim[55] = 122'h1aaff9d7c168b0d2d660c20910b0851;
    stim[56] = 122'h14c5f900fb722bc369f2ae3b0372690;
    stim[57] = 122'h3d512ec47b3c5b9684d9aef29e01ae0;
    stim[58] = 122'h3909f60621c2ec4a2cee8e0421120b0;
    stim[59] = 122'h103ad62abdd640ab7d7d9b805ff32ab;
    stim[60] = 122'h376dbf33c3b0f71d03773dbdde41830;
    stim[61] = 122'h397ceb37a8b90441ec46215c4a79e3e;
    stim[62] = 122'h0dcfebd6020dd2f3a6ff4549c36d18c;
    stim[63] = 122'h2dbac2953c6c167e05ea58a5d210dac;
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
      expv[0] = 50'hxxxxxxxxxx052;
      expv[1] = 50'hxxxxxxxxxx0a1;
      expv[2] = 50'hxxxxxxxxxx911;
      expv[3] = 50'hxxxxxxxxxx803;
      expv[4] = 50'hxxxxxxxxxx311;
      expv[5] = 50'hxxxxxxxxxx0c0;
      expv[6] = 50'hxxxxxxxxxx813;
      expv[7] = 50'hxxxxxxxxxx691;
      expv[8] = 50'hxxxxxxxxxx029;
      expv[9] = 50'hxxxxxxxxxx00f;
      expv[10] = 50'hxxxxxxxxxx8a1;
      expv[11] = 50'hxxxxxxxxxxa01;
      expv[12] = 50'hxxxxxxxxxx0c0;
      expv[13] = 50'hxxxxxxxxxx940;
      expv[14] = 50'hxxxxxxxxxx01d;
      expv[15] = 50'hxxxxxxxxxx04c;
      expv[16] = 50'hxxxxxxxxxx001;
      expv[17] = 50'hxxxxxxxxxx02d;
      expv[18] = 50'hxxxxxxxxxx437;
      expv[19] = 50'hxxxxxxxxxx815;
      expv[20] = 50'hxxxxxxxxxx911;
      expv[21] = 50'hxxxxxxxxxx82d;
      expv[22] = 50'hxxxxxxxxxx811;
      expv[23] = 50'hxxxxxxxxxx991;
      expv[24] = 50'hxxxxxxxxxx823;
      expv[25] = 50'hxxxxxxxxxx240;
      expv[26] = 50'hxxxxxxxxxx811;
      expv[27] = 50'hxxxxxxxxxx811;
      expv[28] = 50'hxxxxxxxxxx891;
      expv[29] = 50'hxxxxxxxxxx842;
      expv[30] = 50'hxxxxxxxxxxec0;
      expv[31] = 50'hxxxxxxxxxx81b;
      expv[32] = 50'hxxxxxxxxxx240;
      expv[33] = 50'hxxxxxxxxxx03d;
      expv[34] = 50'hxxxxxxxxxx281;
      expv[35] = 50'hxxxxxxxxxx101;
      expv[36] = 50'hxxxxxxxxxx009;
      expv[37] = 50'hxxxxxxxxxx801;
      expv[38] = 50'hxxxxxxxxxx80b;
      expv[39] = 50'hxxxxxxxxxx011;
      expv[40] = 50'hxxxxxxxxxx009;
      expv[41] = 50'hxxxxxxxxxx8a1;
      expv[42] = 50'hxxxxxxxxxxeb1;
      expv[43] = 50'hxxxxxxxxxxd91;
      expv[44] = 50'hxxxxxxxxxx811;
      expv[45] = 50'hxxxxxxxxxx950;
      expv[46] = 50'hxxxxxxxxxxb31;
      expv[47] = 50'hxxxxxxxxxx940;
      expv[48] = 50'hxxxxxxxxxx009;
      expv[49] = 50'hxxxxxxxxxx835;
      expv[50] = 50'hxxxxxxxxxx391;
      expv[51] = 50'hxxxxxxxxxxb21;
      expv[52] = 50'hxxxxxxxxxx811;
      expv[53] = 50'hxxxxxxxxxx054;
      expv[54] = 50'hxxxxxxxxxxd01;
      expv[55] = 50'hxxxxxxxxxx00b;
      expv[56] = 50'hxxxxxxxxxx025;
      expv[57] = 50'hxxxxxxxxxxc4e;
      expv[58] = 50'hxxxxxxxxxx405;
      expv[59] = 50'hxxxxxxxxxx3b1;
      expv[60] = 50'hxxxxxxxxxx04e;
      expv[61] = 50'hxxxxxxxxxxa91;
      expv[62] = 50'hxxxxxxxxxx037;
      expv[63] = 50'hxxxxxxxxxx01f;
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
