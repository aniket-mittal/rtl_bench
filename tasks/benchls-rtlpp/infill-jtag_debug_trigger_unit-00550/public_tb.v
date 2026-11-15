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

  rtlpp_00550 dut (
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
    stim[0] = 122'h316955b582b793ca1015df32fd90a24;
    stim[1] = 122'h16a8026ff2fb792cd72e15ae4568cd7;
    stim[2] = 122'h1342199ab175d18500d96c5d08de793;
    stim[3] = 122'h176c2676c0a02af2b6d285d0e45a4e5;
    stim[4] = 122'h354e8fe2f9908f3a6869a2a63ab9221;
    stim[5] = 122'h2950d6a0ce2c358e19fbf4da2cc7a54;
    stim[6] = 122'h0dbe22b232f1da5addda354b79dde55;
    stim[7] = 122'h13809049728370d7ecd0269651443a0;
    stim[8] = 122'h1026df0204f659e5b646d43303b22e1;
    stim[9] = 122'h23dee709ae495ddaa36d714e13034f7;
    stim[10] = 122'h3f2b9dbda852c78b5bf0d3a0dc2bd72;
    stim[11] = 122'h3a42aa100c0c944d06c0613e2bb7f18;
    stim[12] = 122'h1567f47b8f75e01936db1a8e7ac417d;
    stim[13] = 122'h3a601a15fe743ef2618e4cf5095354c;
    stim[14] = 122'h3ac5fd3d30befbe9b8523a7fecf7ca0;
    stim[15] = 122'h1d8c0c72e6269b48165d61b62af0479;
    stim[16] = 122'h2e218b92dbdcea0d36d80026afdf599;
    stim[17] = 122'h18ac269315727505f84ba611e6a86a0;
    stim[18] = 122'h004a017b3e4b32736bd81dd9d3f82c9;
    stim[19] = 122'h14e697a5b25e30776f4836f64c62674;
    stim[20] = 122'h10642305a0b863fe305e159a037163c;
    stim[21] = 122'h03a02e03e2377cfb1bf20b5e9051c4d;
    stim[22] = 122'h0823e0cee2735929dae590f7dc0bbaa;
    stim[23] = 122'h296d3cf4bce10c9828fdf7c6aacdcab;
    stim[24] = 122'h339b9ebeb060f48eae79e5fd7388e0b;
    stim[25] = 122'h020ddbc78b4019b9baf27b45adafdcf;
    stim[26] = 122'h050cd4f1b7435f736fc6e8facc8ea2a;
    stim[27] = 122'h1b2516d6ceacf916db4c6cfa8c0fb1a;
    stim[28] = 122'h1bc862d967d431444df55bcb5e5e767;
    stim[29] = 122'h3ecffdb820da41a2fb57bfbe718f01c;
    stim[30] = 122'h0e2dcebabcbd0f356d5680ab9efd7ea;
    stim[31] = 122'h0657ad9d2906aa7b104b2cfd879b4ef;
    stim[32] = 122'h09f745e9145058ed14cb75218340a3d;
    stim[33] = 122'h3d7a7424bc97c0ca614d17e065d5d97;
    stim[34] = 122'h3d3349f24a0a420cafe23b0bdee14dc;
    stim[35] = 122'h283d4292b0ae43b3636a0717ac85570;
    stim[36] = 122'h361f05a4e535029a68c29940e3e9064;
    stim[37] = 122'h24ee4ee2431d8c104673130671268af;
    stim[38] = 122'h12d4c68ce42f417754fc53d0e86e386;
    stim[39] = 122'h21b4b3ac6ea092e0ff48ac7dfe7938e;
    stim[40] = 122'h0522904c644d897bf57912f8a1555b7;
    stim[41] = 122'h203685640de75f0ed04cfda6cb9f9ba;
    stim[42] = 122'h1b9c9dc55c34a92e624bebae1ccd5ce;
    stim[43] = 122'h2c29eff2f3d75a0861d707c5a6a1184;
    stim[44] = 122'h035cdef51fe96ff17870aba91856a6e;
    stim[45] = 122'h1f181b94950b9a02becf654b8886614;
    stim[46] = 122'h07f0c1879830c00ba866926d5dc5341;
    stim[47] = 122'h1033f8796f2ee1f5cce9d6c9fa33502;
    stim[48] = 122'h3cef2339c29d98f48354a5e74128acf;
    stim[49] = 122'h199c8fb0c5da182d3d7f40f2a203beb;
    stim[50] = 122'h17784a30d4edae73154724145cf4e25;
    stim[51] = 122'h0fb031c744f422d00bd37a850f6dd7c;
    stim[52] = 122'h0f330589338d457336e241c33c41a38;
    stim[53] = 122'h2c09b91d3cee1a6e294e4a05b170d57;
    stim[54] = 122'h0ec2b0683037ba05405cd86a0b8e300;
    stim[55] = 122'h07ba100a56a4cd868ce72f0132f1674;
    stim[56] = 122'h27dfc67506e8f6c5abcda4914d7ae04;
    stim[57] = 122'h2429abc7b8a66b8bf64871678959fe9;
    stim[58] = 122'h338e7c057f4e7a966bf8df425cde476;
    stim[59] = 122'h32f88ade7ac637e922f0cef5c52b2c1;
    stim[60] = 122'h0c0569ff74468d91f7e4490b63ab90a;
    stim[61] = 122'h2db5ed2e1d6effc79dd35ea5cc6d96a;
    stim[62] = 122'h11505460359621d1cdc607dcc2802f1;
    stim[63] = 122'h12c17842729ba517edcdb6544d32f78;
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
      expv[0] = 53'h1056f2794220c2;
      expv[1] = 53'h1e5f6f259a8058;
      expv[2] = 53'h162eba30a0609f;
      expv[3] = 53'h1814055e56e08b;
      expv[4] = 53'h1f3211e74d400e;
      expv[5] = 53'h19c586b1c340c1;
      expv[6] = 53'h065e3b4b5be0c9;
      expv[7] = 53'h0e506e1afde087;
      expv[8] = 53'h009ecb3cb6e00e;
      expv[9] = 53'h15c92bbb544018;
      expv[10] = 53'h150a58f16b40d5;
      expv[11] = 53'h01819289a0e067;
      expv[12] = 53'h11eebc0326e0ab;
      expv[13] = 53'h1fce87de4c2021;
      expv[14] = 53'h0617df7d3760c6;
      expv[15] = 53'h1cc4d36902e0ae;
      expv[16] = 53'h1b7b9d41a6e0af;
      expv[17] = 53'h02ae4ea0bf6006;
      expv[18] = 53'h07c9664e6d60ad;
      expv[19] = 53'h164bc60eede000;
      expv[20] = 53'h14170c7fc660a2;
      expv[21] = 53'h1c46ef9f6340e9;
      expv[22] = 53'h1c4e6b253b4077;
      expv[23] = 53'h179c21930540ff;
      expv[24] = 53'h160c1e91d5c0fe;
      expv[25] = 53'h116803373740fb;
      expv[26] = 53'h16e86bee6de075;
      expv[27] = 53'h19d59f22db6074;
      expv[28] = 53'h0cfa862889c099;
      expv[29] = 53'h041b48345f60a0;
      expv[30] = 53'h1797a1e6ade0b4;
      expv[31] = 53'h0520d54f62603a;
      expv[32] = 53'h028a0b1da2e06b;
      expv[33] = 53'h1792f8194c6058;
      expv[34] = 53'h0941484195c021;
      expv[35] = 53'h1615c8766c4004;
      expv[36] = 53'h1ca6a0534d6003;
      expv[37] = 53'h0863b18208c0fa;
      expv[38] = 53'h1c85e82eeac093;
      expv[39] = 53'h0dd4125c1fe030;
      expv[40] = 53'h0c89b12f7ec098;
      expv[41] = 53'h01bcebe1da6076;
      expv[42] = 53'h0b869525cc6032;
      expv[43] = 53'h1e7aeb410c6081;
      expv[44] = 53'h03fd2dfe2f40f2;
      expv[45] = 53'h12a1734057e003;
      expv[46] = 53'h1306180175400e;
      expv[47] = 53'h0de5dc3eb9c017;
      expv[48] = 53'h1853b31e9060f8;
      expv[49] = 53'h18bb4305a7c0fc;
      expv[50] = 53'h1a9db5ce62e048;
      expv[51] = 53'h089e845a0160e1;
      expv[52] = 53'h0671a8ae66c067;
      expv[53] = 53'h079dc34dc56058;
      expv[54] = 53'h0606f740a86086;
      expv[55] = 53'h0ad499b0d1c003;
      expv[56] = 53'h00dd1ed8b56041;
      expv[57] = 53'h1714cd717ee06e;
      expv[58] = 53'h0fe9cf52cd4091;
      expv[59] = 53'h0f58c6fd24408f;
      expv[60] = 53'h0e88d1b23ec075;
      expv[61] = 53'h03addff8f3e0f5;
      expv[62] = 53'h06b2c43a39e00d;
      expv[63] = 53'h0e5374a2fde065;
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
