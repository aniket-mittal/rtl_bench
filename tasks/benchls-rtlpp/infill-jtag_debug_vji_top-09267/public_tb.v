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

  rtlpp_09267 dut (
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
    stim[0] = 122'h16bd3f9fefcbdf098a052f12822524f;
    stim[1] = 122'h3bf8a88012b1de5bae1d7e0ce824042;
    stim[2] = 122'h12da71e76c22eb7e0a7713319392fc9;
    stim[3] = 122'h00b88bde0d3010f19cffe53b22062a6;
    stim[4] = 122'h1653cc12b797f7dcc5ff41b5579f492;
    stim[5] = 122'h3faccd33fd3d200fcc738f5f8e56f03;
    stim[6] = 122'h16b6175e02d9ffdec9512fc8e49dd64;
    stim[7] = 122'h096ee2c4ce842b69e6f69cd071b6006;
    stim[8] = 122'h073815f53021b2b76cd61984f829f0b;
    stim[9] = 122'h1fcddcfdd31da4ccd5655ae5c7634b2;
    stim[10] = 122'h048891a3b9024b421951b317497dcbd;
    stim[11] = 122'h3f1d2f2f2348e9c4e0c15c1ca179aa0;
    stim[12] = 122'h3d204aefcf2a2b0d4eca1136d839019;
    stim[13] = 122'h0ef57a8d463c128700c766d9c3a4747;
    stim[14] = 122'h0b7a4800218cbe73c0f3dd22858e38a;
    stim[15] = 122'h3718c991d350280b605471f5c8f2f15;
    stim[16] = 122'h0b6af5f17353f13cc445e6260ff8053;
    stim[17] = 122'h34fa2a72d9615eda41e6f609a2d5bfa;
    stim[18] = 122'h136e04f9dce80fe05bec457a5c248a6;
    stim[19] = 122'h2c495d96a14c0b98d7d882b038f95fb;
    stim[20] = 122'h0c6c0d9b442892068156f6a944dbdf5;
    stim[21] = 122'h2ebe0d9acfb8de5640f61fe079ee80d;
    stim[22] = 122'h11f0af84eaa50b26467c358e5d9a419;
    stim[23] = 122'h00a9426e1b12e5af4af33b828eea4fd;
    stim[24] = 122'h0b55e431c294d1e12e4f12a4629df5f;
    stim[25] = 122'h3878691cf02701091aedf14cfdd38cf;
    stim[26] = 122'h11aa0513914b11b6e7548317cbe4db6;
    stim[27] = 122'h001886a453d72daa00735dc916004ad;
    stim[28] = 122'h29f85b361468ea009cf146825e1ef9b;
    stim[29] = 122'h0fdcc5d4b52f54fdcdec027ce1ed3bc;
    stim[30] = 122'h2030c0cb5ed2a07ae06158e1ab25283;
    stim[31] = 122'h10f612a081743270c871ae7e2817928;
    stim[32] = 122'h3b1418c7cd52fbd58556746bab42f8c;
    stim[33] = 122'h1af5714cf64d5430106234762994e56;
    stim[34] = 122'h1b294b024a9c43e00ff9180f6cc6ee7;
    stim[35] = 122'h20ee13bbff8ad9069f53489e3cfe174;
    stim[36] = 122'h137843770538d5186c55ef82e8afa56;
    stim[37] = 122'h04c47e7b5689b75b6e51c057d3666c0;
    stim[38] = 122'h27d768c0b258c5b271e212329ff17c7;
    stim[39] = 122'h2e59e6ed4dce78b217f61ff907232ec;
    stim[40] = 122'h3829c336f03207eb4a6cd77f4706d3e;
    stim[41] = 122'h1513acd648ea828365f0632f07c9c54;
    stim[42] = 122'h294e6024961eda675066e41dd82f025;
    stim[43] = 122'h3ca0ed78054b205ef87083e0d8439bc;
    stim[44] = 122'h3f7903cec16b07daf8773ac25201b43;
    stim[45] = 122'h2434523b6d3896a9f35bcf14d38940e;
    stim[46] = 122'h30503625ad60a4cdb0d720a719b9ef6;
    stim[47] = 122'h0692d8407efded0f59d120e9040584a;
    stim[48] = 122'h184a0e730bac91b290abb71a81dda81;
    stim[49] = 122'h3e468b316a0e35ee38491ecd014d51f;
    stim[50] = 122'h07fa2f4bf75a124660fe499ca9f0864;
    stim[51] = 122'h008d34a1cef367433bcbbeb2a3475c3;
    stim[52] = 122'h2521a15736a7ef4651fe910e958c72a;
    stim[53] = 122'h21160b9d82d4cfb61146b83211da550;
    stim[54] = 122'h000db1fdd6832b48aec10a9a2afa8ba;
    stim[55] = 122'h325cbc333f16350d87c4371bd170538;
    stim[56] = 122'h180fedd825dac066506e192b5697db7;
    stim[57] = 122'h34ce63e30ce2b4b9167d4b32ca31cc3;
    stim[58] = 122'h335ef9001188e21b5e49ef750cd9a44;
    stim[59] = 122'h12048e90fbef405fbdb6ac5d13a4d9e;
    stim[60] = 122'h033c251da4cb841dc84b7c87a4fce7e;
    stim[61] = 122'h36be0e484c3891b60e3bf969aac9ebd;
    stim[62] = 122'h29b5cf77652617ede741a6173e03fa1;
    stim[63] = 122'h123707e256c85ee21370455a981ed16;
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
      expv[0] = 53'h0297894112801f;
      expv[1] = 53'h06bf067412001f;
      expv[2] = 53'h038998c9c9005e;
      expv[3] = 53'h07f29d9103203f;
      expv[4] = 53'h07a0daabcf801f;
      expv[5] = 53'h01c7afc72b005e;
      expv[6] = 53'h0097e4724ec07e;
      expv[7] = 53'h034e6838db203f;
      expv[8] = 53'h030cc27c14e05e;
      expv[9] = 53'h02ad72e3b1801f;
      expv[10] = 53'h00d98ba4bec07e;
      expv[11] = 53'h00ae0e50bce01f;
      expv[12] = 53'h05089b6c1ce01f;
      expv[13] = 53'h03b36ce1d2601f;
      expv[14] = 53'h01ee9142c7201f;
      expv[15] = 53'h0238fae479407e;
      expv[16] = 53'h02f31307fc401f;
      expv[17] = 53'h037b04d16a801f;
      expv[18] = 53'h0622bd2e12001f;
      expv[19] = 53'h0441581c7cc01f;
      expv[20] = 53'h037b54a26dc07e;
      expv[21] = 53'h030ff03cf7207e;
      expv[22] = 53'h061ac72ecd001f;
      expv[23] = 53'h019dc14775203f;
      expv[24] = 53'h078952314ec01f;
      expv[25] = 53'h06f8a67ee9a01f;
      expv[26] = 53'h02418be5f2407e;
      expv[27] = 53'h01aee48b00003f;
      expv[28] = 53'h00a3412f0f205e;
      expv[29] = 53'h06013e70f6801f;
      expv[30] = 53'h00ac70d592801f;
      expv[31] = 53'h00d73f140b805e;
      expv[32] = 53'h033a35d5a1407e;
      expv[33] = 53'h011a3b14ca001f;
      expv[34] = 53'h048c07b663007e;
      expv[35] = 53'h01a44f1e7f403f;
      expv[36] = 53'h02f7c17457c07e;
      expv[37] = 53'h00e02be9b3401f;
      expv[38] = 53'h0109194ff8801f;
      expv[39] = 53'h030ffc8391803f;
      expv[40] = 53'h066bbfa383001f;
      expv[41] = 53'h00319783e4807e;
      expv[42] = 53'h03720eec17801f;
      expv[43] = 53'h0041f06c21807e;
      expv[44] = 53'h039d612900805e;
      expv[45] = 53'h05e78a69c4c03f;
      expv[46] = 53'h0390538cdce07e;
      expv[47] = 53'h0090748202c05e;
      expv[48] = 53'h05db8d40eea01f;
      expv[49] = 53'h048f6680a6c01f;
      expv[50] = 53'h0724ce54f8207e;
      expv[51] = 53'h05df5951a3c01f;
      expv[52] = 53'h0748874ac6001f;
      expv[53] = 53'h035c1908ed401f;
      expv[54] = 53'h00854d157d601f;
      expv[55] = 53'h021b8de8b8401f;
      expv[56] = 53'h070c95ab4b801f;
      expv[57] = 53'h06a5996518805e;
      expv[58] = 53'h04f7ba866cc01f;
      expv[59] = 53'h03562e89d2007e;
      expv[60] = 53'h05be43d27e401f;
      expv[61] = 53'h05fcb4d564807e;
      expv[62] = 53'h00d30b9f01c01f;
      expv[63] = 53'h0022ad4c0f007e;
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
