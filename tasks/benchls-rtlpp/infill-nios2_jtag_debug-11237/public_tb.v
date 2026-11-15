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

  rtlpp_11237 dut (
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
    stim[0] = 122'h189821902ad681b717226f17ab358f2;
    stim[1] = 122'h21436a70a033a66e37bf3968751e71a;
    stim[2] = 122'h3c65debb1ded5f0836cc8c27aa0ae18;
    stim[3] = 122'h3d00ba82a45adad3d1e68457068d056;
    stim[4] = 122'h14b51b5cd966182a245f20ac86c78e0;
    stim[5] = 122'h1dfb9d0ada1203d9bde30cde90a09e0;
    stim[6] = 122'h315302498b23624c7df7214d88917f7;
    stim[7] = 122'h0882da05fd5eb7afcac6980c02bec7b;
    stim[8] = 122'h31b2ed640bd2dd1e4d52bebb6f489b0;
    stim[9] = 122'h22ff126eac0dc02e61729e194c92037;
    stim[10] = 122'h3a323d807ac2f22dcbee502aafb3eb2;
    stim[11] = 122'h325ded156bcae1f0977fbc1524643d5;
    stim[12] = 122'h06a2e6c2a097a97b63ee72974b1965b;
    stim[13] = 122'h284015a81ac8354f407b7ef45128147;
    stim[14] = 122'h12df72a2988cbb78c84927363de47e0;
    stim[15] = 122'h1ee34f6ad3683c7505e044720fe9652;
    stim[16] = 122'h36b90e40a3f7a4de186f0d01eef8b2c;
    stim[17] = 122'h247c74dedcfe8a877bc8904e5d8f870;
    stim[18] = 122'h21b2160581a888ac54eb220e2b86292;
    stim[19] = 122'h37f59b15c98ab1d722506600f28ed82;
    stim[20] = 122'h299bfb20595940dfe8ef8010da4f159;
    stim[21] = 122'h114fd415c96caa82ee69305e40ccdb2;
    stim[22] = 122'h2ba127548c10f452967fffd3eb265ca;
    stim[23] = 122'h28a1fb33f1694ad06540d5dfec63da2;
    stim[24] = 122'h0c30460a730d36f688d6cf5f5f0d5db;
    stim[25] = 122'h05365ff0c29a0a10a1cad7f8961b2c1;
    stim[26] = 122'h03138ddd1c058b082cfdf377a92a9f2;
    stim[27] = 122'h0c33c5d26e0c61ba01ef315924e88ca;
    stim[28] = 122'h24de0b270ff6eb9f6f572abe9d11225;
    stim[29] = 122'h315dd41f54c427ba4b585197e75fc84;
    stim[30] = 122'h1c89d1c1a10f4407684363969107741;
    stim[31] = 122'h0f32c526f6d1293ca642eae25ea7ed3;
    stim[32] = 122'h00455e0edc5baaaefffd77d0ab01a68;
    stim[33] = 122'h3c329bdd1d3706886374344a3baad6d;
    stim[34] = 122'h313cdc9d7a4fa513d1f1d8548dcb7db;
    stim[35] = 122'h05b093d936c1991d57cedd51b464e7b;
    stim[36] = 122'h11d44c27d03180274d4fa46e19191c4;
    stim[37] = 122'h1d010a65cdbb97cf2f4c049dd2f73ad;
    stim[38] = 122'h15c8670bc176eadc3de077b35a19f8c;
    stim[39] = 122'h13e2ce915e64f8e09fcb90a60de6fe0;
    stim[40] = 122'h3f46afeed07123b5c7c7d829d702402;
    stim[41] = 122'h012bad038633522a42665f92b4bdb72;
    stim[42] = 122'h38afd442d6d23deb284297ec46ec199;
    stim[43] = 122'h278865de62986f395102d7db29aecd0;
    stim[44] = 122'h27755e2fb47955ad725f71be9b3b187;
    stim[45] = 122'h1374eefa637d32dea0f9a77800e2eff;
    stim[46] = 122'h0ab7feb46188f32c906470abe521545;
    stim[47] = 122'h251198c6d2753c6ebbeec71cb56243e;
    stim[48] = 122'h0fcba3d223a76e45f7683b3ec84c8a2;
    stim[49] = 122'h29e5126f7849c39856f14fc65ceb133;
    stim[50] = 122'h1be2008b58fc6e05bcfb3f44a76d6a7;
    stim[51] = 122'h3c34173ff220b3157bf20ded878a37f;
    stim[52] = 122'h30ef9a598d169b120dc13b159c68880;
    stim[53] = 122'h0195ab16d82cd78d41ec8b43feda8d2;
    stim[54] = 122'h1a3f2c79f2397d9915dc869cb8aac62;
    stim[55] = 122'h384dce73151d694f5e4de1fdee2f04a;
    stim[56] = 122'h3f6e0d0ce92a1503d5d651c119b22ff;
    stim[57] = 122'h045cbd58f55aedbd63d4b3b7ca991e9;
    stim[58] = 122'h268690d62a581478b5781e017c7b059;
    stim[59] = 122'h10eee0fc49bd6da2a863884c90b918a;
    stim[60] = 122'h0bacacb3b2feb0d0dae746a102933eb;
    stim[61] = 122'h1dcefddf40cc3b383bc81f422632e0b;
    stim[62] = 122'h243413de0ff8f56a48776530cd733e0;
    stim[63] = 122'h06685892cc6a39121a478c20ec0ff60;
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
      expv[0] = 53'h0000000000401f;
      expv[1] = 53'h0000000000401f;
      expv[2] = 53'h0000000000601f;
      expv[3] = 53'h0000000000401f;
      expv[4] = 53'h0000000000401f;
      expv[5] = 53'h0000000000401f;
      expv[6] = 53'h0000000000401f;
      expv[7] = 53'h0000000000601f;
      expv[8] = 53'h0000000000401f;
      expv[9] = 53'h0000000000401f;
      expv[10] = 53'h0000000000401f;
      expv[11] = 53'h0000000000401f;
      expv[12] = 53'h0000000000401f;
      expv[13] = 53'h0000000000401f;
      expv[14] = 53'h0000000000401f;
      expv[15] = 53'h0000000000401f;
      expv[16] = 53'h0000000000401f;
      expv[17] = 53'h0000000000401f;
      expv[18] = 53'h0000000000601f;
      expv[19] = 53'h0000000000401f;
      expv[20] = 53'h0000000000601f;
      expv[21] = 53'h0000000000401f;
      expv[22] = 53'h0000000000401f;
      expv[23] = 53'h0000000000401f;
      expv[24] = 53'h0000000000601f;
      expv[25] = 53'h0000000000401f;
      expv[26] = 53'h0000000000601f;
      expv[27] = 53'h0000000000401f;
      expv[28] = 53'h0000000000401f;
      expv[29] = 53'h0000000000401f;
      expv[30] = 53'h0000000000401f;
      expv[31] = 53'h0000000000401f;
      expv[32] = 53'h0000000000401f;
      expv[33] = 53'h0000000000401f;
      expv[34] = 53'h0000000000401f;
      expv[35] = 53'h0000000000401f;
      expv[36] = 53'h0000000000401f;
      expv[37] = 53'h0000000000401f;
      expv[38] = 53'h0000000000401f;
      expv[39] = 53'h0000000000401f;
      expv[40] = 53'h0000000000401f;
      expv[41] = 53'h0000000000401f;
      expv[42] = 53'h0000000000401f;
      expv[43] = 53'h0000000000001f;
      expv[44] = 53'h0000000000401f;
      expv[45] = 53'h0000000000601f;
      expv[46] = 53'h0000000000401f;
      expv[47] = 53'h0000000000401f;
      expv[48] = 53'h0000000000401f;
      expv[49] = 53'h0000000000601f;
      expv[50] = 53'h0000000000601f;
      expv[51] = 53'h0000000000401f;
      expv[52] = 53'h0000000000401f;
      expv[53] = 53'h0000000000401f;
      expv[54] = 53'h0000000000401f;
      expv[55] = 53'h0000000000401f;
      expv[56] = 53'h0000000000401f;
      expv[57] = 53'h0000000000401f;
      expv[58] = 53'h0000000000401f;
      expv[59] = 53'h0000000000401f;
      expv[60] = 53'h0000000000601f;
      expv[61] = 53'h0000000000401f;
      expv[62] = 53'h0000000000401f;
      expv[63] = 53'h0000000000401f;
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
