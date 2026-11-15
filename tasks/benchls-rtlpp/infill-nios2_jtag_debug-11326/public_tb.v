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

  rtlpp_11326 dut (
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
    stim[0] = 122'h321f5aa7085b71589e04222102f9657;
    stim[1] = 122'h3822ae149ff508948d221bc5151c5e1;
    stim[2] = 122'h2c8ef91e8a26ee5381a67531f1c0115;
    stim[3] = 122'h1945d2fb054801ca927b363f794f55b;
    stim[4] = 122'h2fe1d95921a4dab2447e966a6b144b0;
    stim[5] = 122'h3e9221d060f41e6630e6be9df1a1537;
    stim[6] = 122'h214e4d01b028215d777361f8b947a55;
    stim[7] = 122'h2800f95d5250800b8c68dc19d4ea1eb;
    stim[8] = 122'h0915038eb33f4930f35c92fa5b9ab37;
    stim[9] = 122'h344864e6500908b7564bda1fcddd3ce;
    stim[10] = 122'h0914a9db4d7a6078e17152737dc4dba;
    stim[11] = 122'h316d5e89485932f52edce0e3ceb5665;
    stim[12] = 122'h34dd1b7237fa7a29e1c09fcf3c92a7a;
    stim[13] = 122'h2ceb09e8c5a7a405c5eccdae71688ce;
    stim[14] = 122'h0d5d0031fc50a1d607cd9101f57676b;
    stim[15] = 122'h2e8efd5356320e3755579ed789c1780;
    stim[16] = 122'h07776341d73efe9c50e9ed9d6299f30;
    stim[17] = 122'h1279620bfb3c9bc26d4bdf2e21cf363;
    stim[18] = 122'h0e805f77af1536087ff8fb3f977e12a;
    stim[19] = 122'h2c1db5d5eccdafbca04535c78098adf;
    stim[20] = 122'h119aa603a9cd58a390e8484c28dae83;
    stim[21] = 122'h0a8445e99aae949b3f695825a6affcd;
    stim[22] = 122'h1afadddf4258eb179a799716a6dff2e;
    stim[23] = 122'h3709500bea210bd7d8dc57bb4a65db1;
    stim[24] = 122'h2df92adaa9d98428b1d1d4f7fe4bfd3;
    stim[25] = 122'h3582ad468af59bc5254e68d7bc8e696;
    stim[26] = 122'h26f9e7ab12c7bc180173ccf8e2c01d3;
    stim[27] = 122'h3aa5de8c80b37db08df11cffcd4813b;
    stim[28] = 122'h0b4762f7b683e4c53cc0bbc75cdb3d7;
    stim[29] = 122'h1e8bd00d3bf1fd493ee5d8b457c220a;
    stim[30] = 122'h05bd40800d1ef04c66e9d1231b1aac0;
    stim[31] = 122'h3e6e407f957bad79e75916f8835496c;
    stim[32] = 122'h1705330b71ad42da15fbe5afd69519a;
    stim[33] = 122'h3c89100dcf2336b957e32f2811bb852;
    stim[34] = 122'h0013741ca0273564b04c88c9cba0957;
    stim[35] = 122'h2c8696545b664b1408c280d06ce919a;
    stim[36] = 122'h2516bc6d469fdf14b1447e17239163a;
    stim[37] = 122'h1335d51d2ea39cab2165ff8d07c6d0f;
    stim[38] = 122'h2eb0019d5a9cbd7ccdd494eb0621278;
    stim[39] = 122'h1c06d5726cd667ddc1e4fe518c1e1eb;
    stim[40] = 122'h304db247ba38d8c789fca6aa8a6acdc;
    stim[41] = 122'h3b43ac55b0d1abc9de4b31b1201a425;
    stim[42] = 122'h17e38d375adc74fdf86f0f863d57bf0;
    stim[43] = 122'h32fca9c96dbd159a5dea7e17bfe7887;
    stim[44] = 122'h30b2337cc323b801e254a3242c144e5;
    stim[45] = 122'h2f4c48f82074a2c4405dec46e33ee5e;
    stim[46] = 122'h2d9f45f4abccbd2fd0d64b0a88c1dcd;
    stim[47] = 122'h2516af4dd0b1445781c09dcec6e8ac1;
    stim[48] = 122'h304807d98f80e4ca5977193bb5ec0be;
    stim[49] = 122'h0e9b6c6f19c4f691bdc743c1d8d2045;
    stim[50] = 122'h113b2222af2074f2096b962e51b0351;
    stim[51] = 122'h1e2272f446b442770ecd48ec5fae200;
    stim[52] = 122'h035e245944906cb264c99aaee7945e9;
    stim[53] = 122'h1fcf3db544ffc105975b757b250b502;
    stim[54] = 122'h111d4615f5f257ae48e57ec07166b6e;
    stim[55] = 122'h1e9926ad7e7f98569e7654b7b302f92;
    stim[56] = 122'h3a38c639b91d2e21ebc7b23f184c6f7;
    stim[57] = 122'h01d16166bd8c7bd810e22ec650787bf;
    stim[58] = 122'h15e63be32346406b16732f02d693150;
    stim[59] = 122'h34b0a47cf84589e448df7580da91979;
    stim[60] = 122'h0dc8755b6e826121e1da52f0923e13a;
    stim[61] = 122'h06c24ef544b22ddb644ff545f8d7ace;
    stim[62] = 122'h0bf5dce41a61d51870e1823ac3c7682;
    stim[63] = 122'h061b939278586678c5d40067edc9dde;
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
      expv[0] = 50'h1c216dc562070;
      expv[1] = 50'h127fd42252000;
      expv[2] = 50'h3a289bb94e001;
      expv[3] = 50'h2c1520072a2b0;
      expv[4] = 50'h2486936ac9008;
      expv[5] = 50'h0183d07998401;
      expv[6] = 50'h06c0a08575350;
      expv[7] = 50'h354942002e002;
      expv[8] = 50'h3accfd24c3b70;
      expv[9] = 50'h19402422dd8e0;
      expv[10] = 50'h2d35e981e300e;
      expv[11] = 50'h252164cbd4e50;
      expv[12] = 50'h08dfe9e8a7806;
      expv[13] = 50'h23169e9017007;
      expv[14] = 50'h07f14287588b0;
      expv[15] = 50'h0d58c838dd808;
      expv[16] = 50'h075cfbfa71404;
      expv[17] = 50'h2fecf26f09800;
      expv[18] = 50'h1ebc54d8212a0;
      expv[19] = 50'h17b336bef2807;
      expv[20] = 50'h0ea735628e404;
      expv[21] = 50'h266aba526c1d0;
      expv[22] = 50'h3d0963ac5e3e0;
      expv[23] = 50'h2fa8842f5fc0c;
      expv[24] = 50'h2aa76610a280c;
      expv[25] = 50'h1a2bd66f14801;
      expv[26] = 50'h2c4b1ef060008;
      expv[27] = 50'h3202cdf6c200a;
      expv[28] = 50'h1eda0f9314c01;
      expv[29] = 50'h34efc7f5244a0;
      expv[30] = 50'h00347bc131500;
      expv[31] = 50'h3e55eeb5e7bc0;
      expv[32] = 50'h2dc6b50b6800a;
      expv[33] = 50'h373c8cdae5120;
      expv[34] = 50'h32809cd592805;
      expv[35] = 50'h116d992c50c02;
      expv[36] = 50'h351a7f7c52802;
      expv[37] = 50'h34ba8e72ac007;
      expv[38] = 50'h356a72f5f380a;
      expv[39] = 50'h09b3599f77002;
      expv[40] = 50'h1ee8e3631e00f;
      expv[41] = 50'h16c346af27850;
      expv[42] = 50'h1d6b71d3f7004;
      expv[43] = 50'h25b6f45669005;
      expv[44] = 50'h330c8ee007a50;
      expv[45] = 50'h2081d28b1180f;
      expv[46] = 50'h12af32f4bfc0f;
      expv[47] = 50'h3742c5115e804;
      expv[48] = 50'h263e03932900b;
      expv[49] = 50'h3c6713da46801;
      expv[50] = 50'h0abc81d3c8000;
      expv[51] = 50'h111ad109dcc00;
      expv[52] = 50'h251241b2c9c02;
      expv[53] = 50'h1513ff0416a20;
      expv[54] = 50'h17d7c95eb9407;
      expv[55] = 50'h35f9fe615a320;
      expv[56] = 50'h26e474b887870;
      expv[57] = 50'h1af631ef60403;
      expv[58] = 50'h0c8d1901ac200;
      expv[59] = 50'h33e1162791c0e;
      expv[60] = 50'h2dba09848780a;
      expv[61] = 50'h1512c8b76d807;
      expv[62] = 50'h1069875461400;
      expv[63] = 50'h09e16199e380f;
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
