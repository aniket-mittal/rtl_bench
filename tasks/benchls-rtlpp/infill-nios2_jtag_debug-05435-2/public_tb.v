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

  rtlpp_05435 dut (
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
    stim[0] = 122'h08193f7ad84628ad5b97ef544543d1e;
    stim[1] = 122'h3a4b90b6dde1dbfed1bca3f5c4cf16c;
    stim[2] = 122'h145439cbb52e3586b1fce4df0ab6d0b;
    stim[3] = 122'h144c464c856287a9e341011abb8d05a;
    stim[4] = 122'h134f39201bc46bf331c67173709e33d;
    stim[5] = 122'h38d534ef8f68c4827a7a3b2c638e625;
    stim[6] = 122'h36e236eb1009aff1287e659a1a5c3cc;
    stim[7] = 122'h3f8be6f191ca73c12e4c623eb447e93;
    stim[8] = 122'h3784ad4ce1f3c107d4f7ea166c25a3e;
    stim[9] = 122'h195b65f72f8e63de004a87f595a0583;
    stim[10] = 122'h1e9c1976cf83d0b1dc55e5ef5319853;
    stim[11] = 122'h00d24221b5be9526ecfbbcace5de2b3;
    stim[12] = 122'h057350192551337b1e42951abb91762;
    stim[13] = 122'h38ee0bfc48b18519b179ca6a9a7f231;
    stim[14] = 122'h3dd8a6f820e508ec9cf932370a6d420;
    stim[15] = 122'h3242d2d7a35f5b4207c18d2c2f89dce;
    stim[16] = 122'h1a198e8f097ac4650b43680c43e1aef;
    stim[17] = 122'h2a24c976bdfbf916417ea1e4f668c48;
    stim[18] = 122'h08cb7892dd056bdabded645f48d79e8;
    stim[19] = 122'h00112c93d7881780a4c764dfcb37416;
    stim[20] = 122'h20242ed83d9f834eb964abd996a9150;
    stim[21] = 122'h3377a8b2c1a8c75d5a733557511335f;
    stim[22] = 122'h1ab94dd6daffc5fd81c04311b18043f;
    stim[23] = 122'h2e103ac84ca17e1283f49ef753ffc6b;
    stim[24] = 122'h13ad6910300f33eea450a1d0bb832b0;
    stim[25] = 122'h3bb46185a0363e2d2572ae0914f19cb;
    stim[26] = 122'h17d0415055d5939f66fed3cd0a28231;
    stim[27] = 122'h083a816de85754b2f365c3fd35feb9c;
    stim[28] = 122'h18f0d2aab79facb36f7ee57f35a54a9;
    stim[29] = 122'h10eacde2cdb32a15435a0dc5b17a68b;
    stim[30] = 122'h21f57b300c83f09655f963af2b087f5;
    stim[31] = 122'h0c653b8f83a347ce964fc426fe775da;
    stim[32] = 122'h2dd5325a06687bf717f6faa372228a3;
    stim[33] = 122'h3cc22cd908112b4a48f2dfd00d25cd6;
    stim[34] = 122'h2cb861216f9e87bea156bd12385cf16;
    stim[35] = 122'h0887ffb8bb8d838edfcb1b4a3a6daee;
    stim[36] = 122'h38b61664b97cf1741fc09b5742d6394;
    stim[37] = 122'h110b2cd586efe7ae264591e8b4c7911;
    stim[38] = 122'h06bba313c3c41b8982d24ab3e77b90a;
    stim[39] = 122'h316cb59fd20e9c252a63a4b0f214a45;
    stim[40] = 122'h21d54464b516efb85bdaf8a393d7ee2;
    stim[41] = 122'h2400c9c66c1761a6bac4932492d46a6;
    stim[42] = 122'h1f4318052ead9cf0d6f064b43c4714e;
    stim[43] = 122'h24bbd494bc28c622b766c2669d31688;
    stim[44] = 122'h22a2aef9d3fed0e43a46cdce5ac9593;
    stim[45] = 122'h366159a7aa83e4397864e7ace4ae1d0;
    stim[46] = 122'h0d02b0f6ebca462e7e4ee7fcb059e1f;
    stim[47] = 122'h135fc38d8355af19ae46cce8025ae65;
    stim[48] = 122'h137ed5c2fdd363596957179f3934fdd;
    stim[49] = 122'h34fd80d9e6862a5bfedb4b0b4365003;
    stim[50] = 122'h1ec5a257b8f9383e305cbe63217856c;
    stim[51] = 122'h3083aa214a3028ffe060920fc1166ed;
    stim[52] = 122'h25401c478d6d179b4bca93bbe497ebd;
    stim[53] = 122'h2c2bbc691c618d528bc763bb09cffad;
    stim[54] = 122'h338f5f837934be8e02d8ab3ce025cc8;
    stim[55] = 122'h220b02a220c3c99ee257534b820b44d;
    stim[56] = 122'h27f475b186c3f18923ce03f92a04eb9;
    stim[57] = 122'h2c08a049ec0c4159d05b0ae9a5e7975;
    stim[58] = 122'h231f05e5401ec596ade77c2412266d6;
    stim[59] = 122'h311a38bc0029ad1853f8bd2ba7d54f8;
    stim[60] = 122'h3188f6654986f93c19b4a855632bbe9;
    stim[61] = 122'h3914097e08753ce951d0d0c53bd8a51;
    stim[62] = 122'h312e96353870a711995679dcc4252b8;
    stim[63] = 122'h24114bc24a7cd8b876f23b3dfec6048;
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
      expv[0] = 53'h0bf7aa22a18df2;
      expv[1] = 53'h1e51fae2678897;
      expv[2] = 53'h16726f855b00e6;
      expv[3] = 53'h18808d5dc6d10f;
      expv[4] = 53'h0338b9b84f4007;
      expv[5] = 53'h0d1d9631c70083;
      expv[6] = 53'h0732cd0d2e148b;
      expv[7] = 53'h06311f5a23c068;
      expv[8] = 53'h1bf50b3612aaf4;
      expv[9] = 53'h0543facad0401f;
      expv[10] = 53'h1af2f7a98cc0f0;
      expv[11] = 53'h1dde5672ef2089;
      expv[12] = 53'h014a8d5dc8cf11;
      expv[13] = 53'h14e5354d3f8087;
      expv[14] = 53'h14991b8536ae91;
      expv[15] = 53'h00c69617c4c37c;
      expv[16] = 53'h01b40621f0c07a;
      expv[17] = 53'h0f50f27b3400fe;
      expv[18] = 53'h16b22fa46b9e60;
      expv[19] = 53'h13b26fe59bf20d;
      expv[20] = 53'h1255eccb549c03;
      expv[21] = 53'h099aaba8898093;
      expv[22] = 53'h102188d8c0401f;
      expv[23] = 53'h124f7ba9ff80fe;
      expv[24] = 53'h1050e85dc1d28d;
      expv[25] = 53'h0157048a7880ec;
      expv[26] = 53'h0f69e68514208d;
      expv[27] = 53'h1ae1fe9aff1966;
      expv[28] = 53'h0f72bf9ad28089;
      expv[29] = 53'h0d06e2d8bd409f;
      expv[30] = 53'h0cb1d795840095;
      expv[31] = 53'h17e2137f3bcb15;
      expv[32] = 53'h037d51b91100f4;
      expv[33] = 53'h096fe80692a4fa;
      expv[34] = 53'h135e891c2e50ee;
      expv[35] = 53'h1d8da51d36cf70;
      expv[36] = 53'h004daba16b4f11;
      expv[37] = 53'h02c8f45a63c06c;
      expv[38] = 53'h112559f3bde1fe;
      expv[39] = 53'h01d258790a006a;
      expv[40] = 53'h0d7c51c9ebcdf2;
      expv[41] = 53'h124992496a7d03;
      expv[42] = 53'h18325a1e23ab95;
      expv[43] = 53'h1361334e989b05;
      expv[44] = 53'h0366e72d64c003;
      expv[45] = 53'h0a73d672571c03;
      expv[46] = 53'h0f73fe582cc060;
      expv[47] = 53'h136674012d4068;
      expv[48] = 53'h0b8bcf9c9a40ea;
      expv[49] = 53'h1da585a1b2e081;
      expv[50] = 53'h065f3190bc5887;
      expv[51] = 53'h184907e08b000f;
      expv[52] = 53'h0d49ddf24bc07a;
      expv[53] = 53'h13b1dd84e7c07a;
      expv[54] = 53'h04559e7012e1fe;
      expv[55] = 53'h1ba9a5c105c08f;
      expv[56] = 53'h0701fc9502406e;
      expv[57] = 53'h1d8574d2f3c0f6;
      expv[58] = 53'h13be1209131609;
      expv[59] = 53'h0c5e95d3ea8997;
      expv[60] = 53'h02542ab19580f2;
      expv[61] = 53'h0868629dec40f6;
      expv[62] = 53'h133cee6212cc93;
      expv[63] = 53'h091d9eff633b85;
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
