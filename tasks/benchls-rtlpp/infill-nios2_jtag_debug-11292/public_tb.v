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

  rtlpp_11292 dut (
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
    stim[0] = 122'h3933a0ccd59b3f4f3f983c6df9404cb;
    stim[1] = 122'h31aca754cabeabea4006980cf3cf118;
    stim[2] = 122'h172f5654785702cf19f46b85cc7ec63;
    stim[3] = 122'h1e069113fc6b2754f8d484acd9f201e;
    stim[4] = 122'h318a08813872953a71d9f5ee8630afb;
    stim[5] = 122'h2a2de60557b2e9b9eeeff02e0c59a33;
    stim[6] = 122'h1a598992b47d7fa33ecea709d53184e;
    stim[7] = 122'h0cb965caf1e28db3d64e00ee77b89b0;
    stim[8] = 122'h2f96dc3a4bb30d59f95262689d6ac5c;
    stim[9] = 122'h3613af30e4d016f209f7b9a237cf717;
    stim[10] = 122'h03434fffb20dcb492d7a3cf9614cc57;
    stim[11] = 122'h3c20fbbf1fdfcbb90148b2e577402d4;
    stim[12] = 122'h2065188a197411b38047fd9ae0bd9dd;
    stim[13] = 122'h24973f696240347ecd6e51a102dce70;
    stim[14] = 122'h0183b7fe612ad3cd275f6919e6ea8ca;
    stim[15] = 122'h077e93d3fceb01ec05e1f5dae8942e6;
    stim[16] = 122'h20e28e617c2ac0c4f855e8919fd9b8b;
    stim[17] = 122'h2276438a6120339b1be52d29760cf28;
    stim[18] = 122'h2d1f11c50edb0a68d3c6a65336eaa60;
    stim[19] = 122'h1b1718c6d75a337bbbfc230a623dac2;
    stim[20] = 122'h2b85f3601f3d3bf407c896239d37123;
    stim[21] = 122'h025892874fffbdf510d6163da08d4c3;
    stim[22] = 122'h304304b036216285a7638d2fefb2a89;
    stim[23] = 122'h3683428f081c87f8b6f1537e672764f;
    stim[24] = 122'h3ee0b34f130bc70300c49c7ee0689d6;
    stim[25] = 122'h364f8eb54762c49167f15e50b14de02;
    stim[26] = 122'h1c6fb847b4e25d8243ea9f38201c65c;
    stim[27] = 122'h186e2500598b4de82b4ec73bf8ea46b;
    stim[28] = 122'h0a4f77c1625aeead6b441e0f5744d38;
    stim[29] = 122'h220fd98cf8a0dbce92db81b9bb439a1;
    stim[30] = 122'h16664cbf8f4609d6e04d54934d85f47;
    stim[31] = 122'h02136b06421318c497d34145cfce898;
    stim[32] = 122'h0d04c4e4a428bf49b5d17ef9293a8b1;
    stim[33] = 122'h07f06cebfefdaae6ae716448e3edb3b;
    stim[34] = 122'h1a94a457370600112ed903608990b53;
    stim[35] = 122'h1bbc188202e336b3335e4c599b5fd4b;
    stim[36] = 122'h14503f136c18ca7fb147a540812f33f;
    stim[37] = 122'h09a8d71a965d1d18857976b0dcc9cef;
    stim[38] = 122'h19e07c39155089a7a6d0c214b2ade39;
    stim[39] = 122'h184a03492db0be1d5bd2bd0c11caf1a;
    stim[40] = 122'h063afe49d2aea86162631cee43cbb8b;
    stim[41] = 122'h0341a2560fe5849d7ecdc75b59ae7e1;
    stim[42] = 122'h1cf4ed6062e94307e6d9a7d131c8eab;
    stim[43] = 122'h38feab2b09f8b1638055f43b8790c64;
    stim[44] = 122'h0dea237a7b14698dc5ca43d74f4efe7;
    stim[45] = 122'h137d98006df4c374b8dd393b7d3a0df;
    stim[46] = 122'h183a302818be054947d72614212223b;
    stim[47] = 122'h076357f41b6b5e51786944305b2112e;
    stim[48] = 122'h0a1e1efd4dc2b07bd3cfd511da2c199;
    stim[49] = 122'h0e4f29c24bd2337c2b6c11ffc9f3b08;
    stim[50] = 122'h3548d1fe378f373f38cc449df626d6e;
    stim[51] = 122'h3cc6f9193eca2a89005637d71e5f665;
    stim[52] = 122'h2a7e8f260e8f113c63e4feafebb4586;
    stim[53] = 122'h3ad2d4eaf3e56a407bed7c829220e5e;
    stim[54] = 122'h05ebad647e579e07696a282358f80ce;
    stim[55] = 122'h23de6f2c68475f791458cc1ac5c7584;
    stim[56] = 122'h11c31a97592581e117d96f55839178d;
    stim[57] = 122'h0220aa71ca7ccefadf6799671170399;
    stim[58] = 122'h0b4b43afd6e6b17808fcef1608125b1;
    stim[59] = 122'h015a524b39bf51d775f84120468f7fd;
    stim[60] = 122'h29976ad0cba6c53c474b73949594f08;
    stim[61] = 122'h0687e62d170598184df6878cc5284a4;
    stim[62] = 122'h1653029bb6ff00f5b9f4d2316609286;
    stim[63] = 122'h383607c9da40c111674d4c7eddcaffc;
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
      expv[0] = 50'h383c6df9407f0;
      expv[1] = 50'h36980cf3cf00f;
      expv[2] = 50'h146b85cc7e5b9;
      expv[3] = 50'h3484acd9f2f91;
      expv[4] = 50'h09f5ee8630f33;
      expv[5] = 50'h1ff02e0c596c4;
      expv[6] = 50'h2ea709d531fc0;
      expv[7] = 50'h3e00ee77b894a;
      expv[8] = 50'h1262689d6abb1;
      expv[9] = 50'h37b9a237cf4bd;
      expv[10] = 50'h2a3cf9614c2b5;
      expv[11] = 50'h08b2e5774082f;
      expv[12] = 50'h07fd9ae0bd80f;
      expv[13] = 50'h1e51a102dc0ad;
      expv[14] = 50'h1f6919e6eaa76;
      expv[15] = 50'h31f5dae89442f;
      expv[16] = 50'h15e8919fd9b91;
      expv[17] = 50'h152d29760c5e8;
      expv[18] = 50'h06a65336ead6a;
      expv[19] = 50'h3c230a623d7f0;
      expv[20] = 50'h0896239d37c6e;
      expv[21] = 50'h16163da08dd1b;
      expv[22] = 50'h038d2fefb2266;
      expv[23] = 50'h01537e6727752;
      expv[24] = 50'h049c7ee068c0f;
      expv[25] = 50'h115e50b14d676;
      expv[26] = 50'h2a9f38201c46e;
      expv[27] = 50'h1ec73bf8eaae4;
      expv[28] = 50'h141e0f5744ae4;
      expv[29] = 50'h3b81b9bb43d5a;
      expv[30] = 50'h2d54934d85a07;
      expv[31] = 50'h134145cfced7a;
      expv[32] = 50'h217ef9293af33;
      expv[33] = 50'h316448e3ed2d4;
      expv[34] = 50'h0903608990ed4;
      expv[35] = 50'h0e4c599b5fb72;
      expv[36] = 50'h17a540812fb23;
      expv[37] = 50'h2976b0dcc903f;
      expv[38] = 50'h00c214b2ade56;
      expv[39] = 50'h02bd0c11cadf8;
      expv[40] = 50'h331cee43cb246;
      expv[41] = 50'h0dc75b59aefc0;
      expv[42] = 50'h19a7d131c8e56;
      expv[43] = 50'h05f43b879081f;
      expv[44] = 50'h1a43d74f4ec2f;
      expv[45] = 50'h1d393b7d3af91;
      expv[46] = 50'h0726142122c7e;
      expv[47] = 50'h0944305b21381;
      expv[48] = 50'h1fd511da2cd6a;
      expv[49] = 50'h1c11ffc9f32e4;
      expv[50] = 50'h0c449df626f81;
      expv[51] = 50'h0637d71e5f81f;
      expv[52] = 50'h04feafebb4666;
      expv[53] = 50'h3d7c8292207e0;
      expv[54] = 50'h1a282358f82a5;
      expv[55] = 50'h18cc1ac5c791b;
      expv[56] = 50'h196f558391d7a;
      expv[57] = 50'h37996711701e8;
      expv[58] = 50'h3cef16081249d;
      expv[59] = 50'h084120468f733;
      expv[60] = 50'h3b7394959486e;
      expv[61] = 50'h06878cc5284bd;
      expv[62] = 50'h24d23166097b1;
      expv[63] = 50'h3d4c7eddcaa66;
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
