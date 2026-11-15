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

  rtlpp_00551 dut (
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
    stim[0] = 122'h2253f75a91327f5685af58c2c4efd4f;
    stim[1] = 122'h37d348611ef64d339bbb117d3de70f7;
    stim[2] = 122'h0d51fb9f909a6fbc1d58d328110f2e4;
    stim[3] = 122'h3bc8f03461c353a628cf81092570cac;
    stim[4] = 122'h06acbeda81c0fcd0c029b1356b6eb3c;
    stim[5] = 122'h0d342934f23bd2daf2641f76056b2bc;
    stim[6] = 122'h3dcfcc09c5714fe24650e7492985f17;
    stim[7] = 122'h257798b5a2b4aa16eb43a120c887f4f;
    stim[8] = 122'h30633c8ad03400c90de9d8ee872f26d;
    stim[9] = 122'h18a093ca10780f8427695e6e7cb95c5;
    stim[10] = 122'h1915ae9b556d3e3606c935d0282e876;
    stim[11] = 122'h1d15d341d32f5da75d6c3f1564bcbeb;
    stim[12] = 122'h1310e8d9dd06ea2d8bc87f3b98e861b;
    stim[13] = 122'h1c73224add20f9bd86d25d6c4cc39e3;
    stim[14] = 122'h15e3b58e2e08d57fcbf06be3132ea7c;
    stim[15] = 122'h0e078429567d9b62a06d2e7e14b8722;
    stim[16] = 122'h1754076ad423d576a967b2729e3dcc2;
    stim[17] = 122'h1590baa32486216bce4b02003f962ba;
    stim[18] = 122'h2c35783c55fd02ed1cc6563c1a93f19;
    stim[19] = 122'h0e06e1a2c88878e2a1408a994d3f848;
    stim[20] = 122'h2e9ca950114d400aa6daf355f6322b4;
    stim[21] = 122'h32d729875ce6703eb0524d5e3d9b5f2;
    stim[22] = 122'h35d615c17a8b07e53c6fb5be4c3f38e;
    stim[23] = 122'h0f26ccab0a5a2e8dbbc1118cb3a9b0a;
    stim[24] = 122'h276f3491811036a0ae1ca918019fe6b;
    stim[25] = 122'h23cba993626d3e26ef1dc00d560fb79;
    stim[26] = 122'h12cfb386bff424dde644748af3bd738;
    stim[27] = 122'h007efb1742139b33a57fd2163dadfec;
    stim[28] = 122'h03cdcbb3948eddd3ded131d652e6c17;
    stim[29] = 122'h00d639b8db479b87dc4fef6330fbc83;
    stim[30] = 122'h0674b1bb2a047bba67429b03617b67a;
    stim[31] = 122'h232063bf15c6836594ef146851e23d3;
    stim[32] = 122'h32036c0d3305ab918bf78fd6fc47be4;
    stim[33] = 122'h3e6fb18ee513a43b2cd145a1e6eb92b;
    stim[34] = 122'h32221c8ba6a666e18c4da344e247d38;
    stim[35] = 122'h28b6a563c73418031ef62655252d9ca;
    stim[36] = 122'h2dfa9f3cf622b35a64c71d7b07b0319;
    stim[37] = 122'h2bbcb863e5f2652bea6c501998ceb54;
    stim[38] = 122'h0695602da810033b3cea17c066ae936;
    stim[39] = 122'h11959b846e0407156e7557dcb879cb3;
    stim[40] = 122'h03ed4fb158dba663257f15e68d816c1;
    stim[41] = 122'h23b20d9c7a43ab0a4f701669f23c006;
    stim[42] = 122'h000b89d4c934a41609ff7bd57dcfcb3;
    stim[43] = 122'h0ebdc21d5b16561ca068ebc42daf3e3;
    stim[44] = 122'h32ae4ae9cde2bbb9ca6d09fa7e62740;
    stim[45] = 122'h13202aee03e79a101b7a6fd1829ed94;
    stim[46] = 122'h2834654a5936cdd206765f1bac7c23a;
    stim[47] = 122'h29377fd97713ff947846092012c5bc9;
    stim[48] = 122'h0ab009f145447f6211ffb57aa523ee0;
    stim[49] = 122'h2682c7238a5f2e6db4c822369c15805;
    stim[50] = 122'h196897dfe379221550ec46328a42470;
    stim[51] = 122'h2fc697a31d9056e3b342a9857b91d31;
    stim[52] = 122'h30a8849c6ca9a70f7b49b7140edd353;
    stim[53] = 122'h3e3b5d5011f8aa28cd5b93aaec9b59b;
    stim[54] = 122'h0fb3b0c351a96d763c49f2b738ab398;
    stim[55] = 122'h048b2e1f5b93b38786ec0b60c0bd60b;
    stim[56] = 122'h2370c39784a5fac7806ad7098a56e6d;
    stim[57] = 122'h38685c7092fc600f79ead4aa82a058a;
    stim[58] = 122'h2367ea34e3d1d75d56d528bdc68f125;
    stim[59] = 122'h059c0cbfdb9d5dd773cbf6489525dfe;
    stim[60] = 122'h0e556440e4651aaab476329f0a83765;
    stim[61] = 122'h0f4c84dbf5e4509c41fc7081c4ff811;
    stim[62] = 122'h29ba4df93d52dc771542fc1d9449234;
    stim[63] = 122'h1aa0809aaa72e4badfff085e0bef3ef;
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
      expv[0] = 53'h00000000000000;
      expv[1] = 53'h00000000000000;
      expv[2] = 53'h00000000000000;
      expv[3] = 53'h00000000000000;
      expv[4] = 53'h00000000000000;
      expv[5] = 53'h00000000000000;
      expv[6] = 53'h00000000000000;
      expv[7] = 53'h00000000000000;
      expv[8] = 53'h00000000000000;
      expv[9] = 53'h00000000000000;
      expv[10] = 53'h00000000000000;
      expv[11] = 53'h00000000000000;
      expv[12] = 53'h00000000000000;
      expv[13] = 53'h00000000000000;
      expv[14] = 53'h00000000000000;
      expv[15] = 53'h00000000000000;
      expv[16] = 53'h00000000000000;
      expv[17] = 53'h00000000000000;
      expv[18] = 53'h00000000000000;
      expv[19] = 53'h00000000000000;
      expv[20] = 53'h00000000000000;
      expv[21] = 53'h00000000000000;
      expv[22] = 53'h00000000000000;
      expv[23] = 53'h00000000000000;
      expv[24] = 53'h00000000000000;
      expv[25] = 53'h00000000000000;
      expv[26] = 53'h00000000000000;
      expv[27] = 53'h00000000000000;
      expv[28] = 53'h00000000000000;
      expv[29] = 53'h00000000000000;
      expv[30] = 53'h00000000000000;
      expv[31] = 53'h00000000000000;
      expv[32] = 53'h00000000000000;
      expv[33] = 53'h00000000000000;
      expv[34] = 53'h00000000000000;
      expv[35] = 53'h00000000000000;
      expv[36] = 53'h00000000000000;
      expv[37] = 53'h00000000000000;
      expv[38] = 53'h00000000000000;
      expv[39] = 53'h00000000000000;
      expv[40] = 53'h00000000000000;
      expv[41] = 53'h00000000000000;
      expv[42] = 53'h00000000000000;
      expv[43] = 53'h00000000000000;
      expv[44] = 53'h00000000000000;
      expv[45] = 53'h00000000000000;
      expv[46] = 53'h00000000000000;
      expv[47] = 53'h00000000000000;
      expv[48] = 53'h00000000000000;
      expv[49] = 53'h00000000000000;
      expv[50] = 53'h00000000000000;
      expv[51] = 53'h00000000000000;
      expv[52] = 53'h00000000000000;
      expv[53] = 53'h00000000000000;
      expv[54] = 53'h00000000000000;
      expv[55] = 53'h00000000000000;
      expv[56] = 53'h00000000000000;
      expv[57] = 53'h00000000000000;
      expv[58] = 53'h00000000000000;
      expv[59] = 53'h00000000000000;
      expv[60] = 53'h00000000000000;
      expv[61] = 53'h00000000000000;
      expv[62] = 53'h00000000000000;
      expv[63] = 53'h00000000000000;
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
