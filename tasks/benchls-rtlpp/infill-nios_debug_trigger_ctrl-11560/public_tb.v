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

  rtlpp_11560 dut (
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
    stim[0] = 122'h110169bd46574d980e83f81b0f1246e;
    stim[1] = 122'h20554d462b593693020ffa457833912;
    stim[2] = 122'h3153b9a7019983bd97519f1b715d66e;
    stim[3] = 122'h10c4da0a0007b8c9354e6f81469d40b;
    stim[4] = 122'h2ed6ab329ff689ac03ca96c7a61c3b5;
    stim[5] = 122'h1665ac11b26fc8f41765b611e5331a6;
    stim[6] = 122'h07e4b0f5401afede63c80ccda5f9dc4;
    stim[7] = 122'h03ebd06bd1e346f8c2c20a182b0b304;
    stim[8] = 122'h10b0809aaa2218f4e2e31ec3f65a417;
    stim[9] = 122'h2e67c416e85e45d8bc5a1d0637ba785;
    stim[10] = 122'h135dfc99d1f9993ee565bb2c17ff855;
    stim[11] = 122'h3134384a75e40a3c23eecc330105132;
    stim[12] = 122'h3b5cb8dcdabd3940bb7ebcd7accbe08;
    stim[13] = 122'h04b33059848cc44a2cd1b89d16a3f34;
    stim[14] = 122'h1de7861cbb4e01b644ee5e6087e8a08;
    stim[15] = 122'h102887c177e66f3720660525f7db970;
    stim[16] = 122'h34fe2932a27e1fb00bd8ee36af6f0de;
    stim[17] = 122'h0b9d72c1da91e2084bfacfd0841923e;
    stim[18] = 122'h0435e8a660bddd212b6ded65f1919a0;
    stim[19] = 122'h0335a626a6bd277ecb6f22fe3f04feb;
    stim[20] = 122'h3c91274e4dca9080f3c2daeb7f69d4b;
    stim[21] = 122'h34d0454e844671052c4ee6fbf85fb77;
    stim[22] = 122'h0b255a5853c6639fb44a94bede691dc;
    stim[23] = 122'h20dc2c692a99f603fec49271deb7168;
    stim[24] = 122'h0253c83b1403fc531752edb3fe674db;
    stim[25] = 122'h39b182e803bf362d8f58e9ab5d8f6c5;
    stim[26] = 122'h14e71e0064d28e144a4c2a8e4c8111f;
    stim[27] = 122'h06b53fa808e9a3557f6a940b77af24c;
    stim[28] = 122'h2e2b43d39725343bd4cb658de3101ca;
    stim[29] = 122'h0291ef4e7d7ad0babbcd4539c911abe;
    stim[30] = 122'h2477d3795b3b1e85d16879d3b92b531;
    stim[31] = 122'h037cc403be9e33868fd85f53a76fdd1;
    stim[32] = 122'h2c1b3c7b111fa0b66c7ad3d9ffdf9d7;
    stim[33] = 122'h2683dc5309f59931b94280332a6801f;
    stim[34] = 122'h32e8419d2036058ad9d3449357054f6;
    stim[35] = 122'h0a4c0c516df81bf63bd6fd92e9024c1;
    stim[36] = 122'h1e0a7017681f2f0e3e43d5a96fb4b1f;
    stim[37] = 122'h2d6cebf9f56378b66b5421dfa281641;
    stim[38] = 122'h3bb7cac14403677c205c1e7f3234369;
    stim[39] = 122'h2d36c8e740082e6b424ffd9f8439adb;
    stim[40] = 122'h39c07a3b9deac76375cda9f99548db0;
    stim[41] = 122'h199e57a84154d954274041a3bd92036;
    stim[42] = 122'h0494fdb8cc2e8ef9bd5493f8a487dc2;
    stim[43] = 122'h135876ef28a31624fb6400ba8e48498;
    stim[44] = 122'h3f71d079102d1d6d36697604ac63385;
    stim[45] = 122'h1340c5df0585bd1ddeef54db71d2731;
    stim[46] = 122'h145f6f581b2502f6de7e6f6986a739b;
    stim[47] = 122'h284c99a5b12dd11fe661176f57260ca;
    stim[48] = 122'h27ef261dc420ac346ce1fed18c7dd5f;
    stim[49] = 122'h3399328bd5a0df91564ece24268822a;
    stim[50] = 122'h2ce606e2b8ee4f36e2598fb87732250;
    stim[51] = 122'h143d55cddf44a87c134ba91ff8385c5;
    stim[52] = 122'h30609cb3519cea17cd49ed5ec1a298c;
    stim[53] = 122'h3c6dd18dcda14624d467314493eddce;
    stim[54] = 122'h286b08b76436849d1af539307d1a8a7;
    stim[55] = 122'h0b0714e686cf18248b59ac30f7e9879;
    stim[56] = 122'h1fdb8ef05542487552e9d086ba7ea2a;
    stim[57] = 122'h0317b104e9fe84d1b5e8144c802dca1;
    stim[58] = 122'h0cf7df02eae88f2dd0cb29e7ef66053;
    stim[59] = 122'h200662584360a56450659a45a54b52c;
    stim[60] = 122'h0abc21c8dc2ff60b7af7c987dd9d2f6;
    stim[61] = 122'h12b07a4665fc6c32e9dcdaca3e9a1a9;
    stim[62] = 122'h1e08698d0e1194a3c5567f04a00fc3f;
    stim[63] = 122'h0aed9cb824de3691ca57f87d5146266;
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
      expv[0] = 50'h00000000004x0;
      expv[1] = 50'h00000000000x0;
      expv[2] = 50'h00000000009x1;
      expv[3] = 50'h00000000008xa;
      expv[4] = 50'h00000000008x0;
      expv[5] = 50'h00000000001x0;
      expv[6] = 50'h0000000000ax0;
      expv[7] = 50'h0000000000cx0;
      expv[8] = 50'h00000000006x0;
      expv[9] = 50'h00000000008xf;
      expv[10] = 50'h00000000000x8;
      expv[11] = 50'h00000000002x0;
      expv[12] = 50'h00000000003x0;
      expv[13] = 50'h0000000000cxc;
      expv[14] = 50'h00000000004x8;
      expv[15] = 50'h00000000000x0;
      expv[16] = 50'h00000000008x1;
      expv[17] = 50'h00000000000x1;
      expv[18] = 50'h00000000002x0;
      expv[19] = 50'h00000000000x0;
      expv[20] = 50'h0000000000bx0;
      expv[21] = 50'h00000000008xc;
      expv[22] = 50'h00000000008xa;
      expv[23] = 50'h0000000000fx0;
      expv[24] = 50'h00000000009x1;
      expv[25] = 50'h00000000008x1;
      expv[26] = 50'h00000000008x0;
      expv[27] = 50'h00000000003x0;
      expv[28] = 50'h0000000000cxa;
      expv[29] = 50'h0000000000bx0;
      expv[30] = 50'h00000000000x2;
      expv[31] = 50'h00000000008x0;
      expv[32] = 50'h00000000000xc;
      expv[33] = 50'h00000000008x6;
      expv[34] = 50'h00000000008x7;
      expv[35] = 50'h0000000000bx1;
      expv[36] = 50'h0000000000bx0;
      expv[37] = 50'h0000000000ax1;
      expv[38] = 50'h00000000008x1;
      expv[39] = 50'h00000000008x0;
      expv[40] = 50'h00000000008xa;
      expv[41] = 50'h0000000000ax0;
      expv[42] = 50'h00000000008xe;
      expv[43] = 50'h00000000003x0;
      expv[44] = 50'h00000000003x0;
      expv[45] = 50'h00000000005x0;
      expv[46] = 50'h00000000001x1;
      expv[47] = 50'h00000000002x0;
      expv[48] = 50'h00000000004xc;
      expv[49] = 50'h00000000009x0;
      expv[50] = 50'h0000000000ax1;
      expv[51] = 50'h00000000009x0;
      expv[52] = 50'h00000000008xc;
      expv[53] = 50'h00000000000xa;
      expv[54] = 50'h00000000005x0;
      expv[55] = 50'h00000000008x0;
      expv[56] = 50'h00000000005x0;
      expv[57] = 50'h00000000000xa;
      expv[58] = 50'h0000000000cx2;
      expv[59] = 50'h00000000000x2;
      expv[60] = 50'h00000000007x1;
      expv[61] = 50'h00000000008x5;
      expv[62] = 50'h00000000008x8;
      expv[63] = 50'h00000000008x1;
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
