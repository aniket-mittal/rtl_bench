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

  rtlpp_07392 dut (
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
    stim[0] = 122'h1907f30821a99a062e9d57d9cefc182;
    stim[1] = 122'h09c7cf62e1d97c927f0a95b8f23b2d8;
    stim[2] = 122'h27e1001994a6f4b1ab532157581d531;
    stim[3] = 122'h0043b11a49ed274c09527ee7896fcf8;
    stim[4] = 122'h0844f041c3b8c713ad6033d9634ed53;
    stim[5] = 122'h11042497768ea352d05c61bf1dac953;
    stim[6] = 122'h14f543758a0dbbfc195acc9ce667b00;
    stim[7] = 122'h36e12d6777562d2456e41b9d08f0052;
    stim[8] = 122'h2fdef3c1771145eba47f637cd8b9dd1;
    stim[9] = 122'h1a0490a0df3d1f8900651939da95401;
    stim[10] = 122'h3d1d593f51bc18a413f6d4d8bfeb27b;
    stim[11] = 122'h0a55b08adcd5c5184748bf67c01314d;
    stim[12] = 122'h1de4744fff5a88d5ea59b6074bc9036;
    stim[13] = 122'h011d31db8dac70dd5cd7df666189189;
    stim[14] = 122'h123959af337699ad7a4680b59b43fd1;
    stim[15] = 122'h2b60b475104a3b2419fc2cdbbaa5ebf;
    stim[16] = 122'h3aa4f4a5e502cc7b5a54677e06bdb93;
    stim[17] = 122'h3cc91d875652835390c3f2f78f0192f;
    stim[18] = 122'h0aabcfde13a5311c096fb1cc1248f9e;
    stim[19] = 122'h20d111cb41ec80d74ff822369a7fd2c;
    stim[20] = 122'h11b861b36741e69562cc8acd5e4b926;
    stim[21] = 122'h1931ae43d734246cdad0e83aab0ee7e;
    stim[22] = 122'h0e2060df6f05a457d84aca29647ae7e;
    stim[23] = 122'h03880663a02463febd4c2a992f5ad65;
    stim[24] = 122'h33db9645dc13a77bfa4da2986269c8c;
    stim[25] = 122'h28cb4b70b0bec9dd00db97cc6d9f3ca;
    stim[26] = 122'h3be9f3de9725557ac7ee09f0c03f1df;
    stim[27] = 122'h3585433ae6a2aff4fd6963b6a6bb99b;
    stim[28] = 122'h08e609c10bc86ee1d9cdc7d6ee8e6ac;
    stim[29] = 122'h3376940aff017a69287fdb9166a60dd;
    stim[30] = 122'h3ba830ec80ecc20a5cdffa3e7faf9af;
    stim[31] = 122'h00f24826c9252605e2f2c0b566a1f33;
    stim[32] = 122'h1d95b998f38274dd5f5ba670b4b4967;
    stim[33] = 122'h1ad700e37ecaaaacb7ed7c71f593df0;
    stim[34] = 122'h2fd1f0ca1e66abf5fffc2d3e21d48ad;
    stim[35] = 122'h2225a855a9b3ed2ac76465c03e3b042;
    stim[36] = 122'h2d37cb704fe0090486de6262aeddaa9;
    stim[37] = 122'h1a8b969c7b48e69eb25a8205edf137b;
    stim[38] = 122'h39af23d9cacc347aacf7404859f08bf;
    stim[39] = 122'h1d8221423b07e8302ac57d1639fce64;
    stim[40] = 122'h2372c529ce7db84e8fe14342133fcf1;
    stim[41] = 122'h2c7276d445c6c4cdcd7060cce5041cf;
    stim[42] = 122'h3c824385ffd4d16775d18e5464371cc;
    stim[43] = 122'h025910407d04490222e0eda5b4eaab3;
    stim[44] = 122'h038fa22471d9c65a59c1cd8782bc220;
    stim[45] = 122'h304f76d10bc87513ddebf7890762f68;
    stim[46] = 122'h157aeeed8ea7e3cb29f6acbfd700ab7;
    stim[47] = 122'h263387946ba3737d906ee966f949834;
    stim[48] = 122'h36d956f2ccfd6953d149d1db800035b;
    stim[49] = 122'h18fdc60efe44751d80cf1bf807bf0c9;
    stim[50] = 122'h13369a599bd5bb71144f9e54b7b664b;
    stim[51] = 122'h1a7c8c65e2feebfaa5f56a552cd9ca8;
    stim[52] = 122'h1dabeec9717454d1c845715141700f2;
    stim[53] = 122'h134db0acd3139adfdfc5864762b02e0;
    stim[54] = 122'h332ee5f076fec07733e61ae081f60ae;
    stim[55] = 122'h13ebdbe28b9081ef484ee00fe5264a5;
    stim[56] = 122'h23fa72ec80d824e509c494d87980cc1;
    stim[57] = 122'h2e4dd950f6be824075ca8f980e1ef3b;
    stim[58] = 122'h2f2611b5c38b4a785168a4b7c551834;
    stim[59] = 122'h28a3067e8862b28a4e5321b9f6fbf82;
    stim[60] = 122'h18375a19370621900b763e8e67d09ee;
    stim[61] = 122'h364d7be57ace6f32cfcb020617146c3;
    stim[62] = 122'h2ca0a1d4d339d28a7a530a95d31141b;
    stim[63] = 122'h2619534527038b0669fe1616fb93427;
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
      expv[3] = 53'h004fc2003315ca;
      expv[4] = 53'h000087623484fa;
      expv[5] = 53'h001089e083952b;
      expv[6] = 53'h002208492e8b95;
      expv[7] = 53'h0029ea86eb0cf2;
      expv[8] = 53'h006dc25aceaa15;
      expv[9] = 53'h005fbde78291ce;
      expv[10] = 53'h0034092141805e;
      expv[11] = 53'h007a3ab27ea8f6;
      expv[12] = 53'h0014ab6115827c;
      expv[13] = 53'h003bc8e89f97c8;
      expv[14] = 53'h00023a63b72ed0;
      expv[15] = 53'h002472b35e1e60;
      expv[16] = 53'h0056c168ea2cd2;
      expv[17] = 53'h007549e94b8ed0;
      expv[18] = 53'h0079923b0ea956;
      expv[19] = 53'h0015579fbc041b;
      expv[20] = 53'h0041a22396a6f8;
      expv[21] = 53'h002370c366b26c;
      expv[22] = 53'h0032635c87afb1;
      expv[23] = 53'h001c40c1be8f31;
      expv[24] = 53'h0007100cc71d23;
      expv[25] = 53'h0067b72c8b9f40;
      expv[26] = 53'h00519696e120fe;
      expv[27] = 53'h0077d3e7bd237c;
      expv[28] = 53'h006b0a86759f60;
      expv[29] = 53'h0011cc13822f31;
      expv[30] = 53'h0066ed281594ab;
      expv[31] = 53'h00775061d92ef0;
      expv[32] = 53'h0001e4904db3cc;
      expv[33] = 53'h003b2b73318e91;
      expv[34] = 53'h0035ae01c6b966;
      expv[35] = 53'h005fa3e1943f81;
      expv[36] = 53'h00444b50ab037c;
      expv[37] = 53'h005a6f96e0a1de;
      expv[38] = 53'h0035172d3899c6;
      expv[39] = 53'h00735e47b3b58b;
      expv[40] = 53'h003b044284340b;
      expv[41] = 53'h0046e58a53a57a;
      expv[42] = 53'h0058e4eda88799;
      expv[43] = 53'h007904870bbae4;
      expv[44] = 53'h0004b22080b02f;
      expv[45] = 53'h00071f4448ae11;
      expv[46] = 53'h00609eeda22f31;
      expv[47] = 53'h002af5dddb348b;
      expv[48] = 53'h004c670f288956;
      expv[49] = 53'h006db2ade58b15;
      expv[50] = 53'h0031fb8c1da17e;
      expv[51] = 53'h00266d34b30837;
      expv[52] = 53'h0034f918cbb1ce;
      expv[53] = 53'h003b57dd928719;
      expv[54] = 53'h00269b6159af11;
      expv[55] = 53'h00665dcbe0b827;
      expv[56] = 53'h0027d7b7c50639;
      expv[57] = 53'h0047f4e5d9241b;
      expv[58] = 53'h005c9bb2a1ba25;
      expv[59] = 53'h005e4c236b8a54;
      expv[60] = 53'h0051460cfd06f8;
      expv[61] = 53'h00306eb432049b;
      expv[62] = 53'h006c9af7caa719;
      expv[63] = 53'h00594143a99ec0;
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
