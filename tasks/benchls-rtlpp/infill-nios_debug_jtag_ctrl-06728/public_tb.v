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

  rtlpp_06728 dut (
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
    stim[0] = 122'h20c541340a07d59369bc019f2f13e33;
    stim[1] = 122'h2cb8e06a0687fbc6d4850a88c92f18f;
    stim[2] = 122'h1aa38d00dc58cb6383cb3a212e77ea2;
    stim[3] = 122'h30913b4eddb4a4611875ca0a2f176e4;
    stim[4] = 122'h12ec0d927d95f19769c060017370114;
    stim[5] = 122'h028b2ee838ae4abd3763c9457da484b;
    stim[6] = 122'h244dbfc43d3f6c478a49e917b28d69f;
    stim[7] = 122'h27388019ed8f0c4c97f10a050522381;
    stim[8] = 122'h344b08a58020fb110c5befc8c8dde23;
    stim[9] = 122'h1ca4982b9ede603f47eb0fd260f7255;
    stim[10] = 122'h112c2e6a60a4bc582caf6b6054f80a2;
    stim[11] = 122'h113bf5388b3d1faf42c0a9853ab869a;
    stim[12] = 122'h2de353ffd2a0b639adde5e0189029e3;
    stim[13] = 122'h30073f238370e1bc266a672821babe4;
    stim[14] = 122'h21a379d85a3cb52654705ac964e6efb;
    stim[15] = 122'h327ecfd63e322e99ad64555a570050c;
    stim[16] = 122'h0a3653eaa87de5e529c6ea69219566e;
    stim[17] = 122'h372e4c4a25b5fdb8c1e8c3733a6d963;
    stim[18] = 122'h0d8776d5efb04979b6ec4a42e0e23ac;
    stim[19] = 122'h08bf8fba67844546045a530c5a6ac29;
    stim[20] = 122'h0e39cb11a5a9e13825d9d20e37f5378;
    stim[21] = 122'h0b076e17468fcd86e3c0990d4dd1c43;
    stim[22] = 122'h2ccf81c8cf7aa0f563757b0550e6bc1;
    stim[23] = 122'h07d098b1ad2a1ae7644e933e4cc8894;
    stim[24] = 122'h39c2d79e52a741209d74919b01f9d5e;
    stim[25] = 122'h3a572d872cf4273fafdbbcb633aa9eb;
    stim[26] = 122'h2d9e9f82eee322b4a854ad92c44b4ca;
    stim[27] = 122'h35467bcad7d4a45827593a5088bb575;
    stim[28] = 122'h3975ed33a941838e77fadf1e238e86c;
    stim[29] = 122'h018d377ff96fd726e0464a4ebcb51eb;
    stim[30] = 122'h2f7a106c6aed38c422cce266bbd039d;
    stim[31] = 122'h18b015d5df3b74a555cf58b0a5cef1e;
    stim[32] = 122'h06042ceb120235c9586f6ba63943230;
    stim[33] = 122'h2f09f2754264d24d5d773c6556141a4;
    stim[34] = 122'h2f2b87f9bbdf833448f99c7d9e7a40c;
    stim[35] = 122'h09a64bbdd37472c836c3f815c1c6300;
    stim[36] = 122'h11f60ca86a05fabaf25e5af356992fc;
    stim[37] = 122'h139f4ff1e294c86c365d7bc1e8dc04b;
    stim[38] = 122'h03a08ff1f216332cb778ec0bcb7072d;
    stim[39] = 122'h0bf80753ee39f6eadc5166da2752128;
    stim[40] = 122'h126c292fbca833d012798bc1f30c3b6;
    stim[41] = 122'h206ff4ad57c6956f1859cfb532acc8c;
    stim[42] = 122'h0e0c88a2cf27fe893c5b434a9a411fa;
    stim[43] = 122'h3ddd5cc2ea5c5092e55e302ba50fd9e;
    stim[44] = 122'h27f6db94894f3ad3dc62b5434639d6b;
    stim[45] = 122'h335f44b7a383d7852455e26ebfcea4c;
    stim[46] = 122'h313782b787e8b550c5d40e4fe514939;
    stim[47] = 122'h3be6f254366e9733a3465fcb49f1c4a;
    stim[48] = 122'h25247a7f10c9f88bf9c3309eaf068e0;
    stim[49] = 122'h22ded707b0c6b8ea0dc25a851ffc5b0;
    stim[50] = 122'h01ed4b73647bcadd2afaa54bf8070f0;
    stim[51] = 122'h2db8e8d423e07d46d3d4ffabecd3fc4;
    stim[52] = 122'h064eba865786d2b0a94be7d24e2eef2;
    stim[53] = 122'h1df99a92ae851fcacfe802055cbe556;
    stim[54] = 122'h017f4ea4ecd99f59ccf948914c00bf1;
    stim[55] = 122'h1036443db8ed659dd4fa498dad52c9b;
    stim[56] = 122'h17320d6117cf5046fe72e66ccb4fee5;
    stim[57] = 122'h18f927e19986778902e23b2ec583fcd;
    stim[58] = 122'h0f7530ea22062a1fb352e2beee64ddb;
    stim[59] = 122'h3a8d5c022684e722cfd5c7d50403de7;
    stim[60] = 122'h3fc706fe7f6886d51fd0dcef33244eb;
    stim[61] = 122'h22594752ae1ab64f6670bc5a84fe94c;
    stim[62] = 122'h01e05bce98e9c215b4d3257837f7048;
    stim[63] = 122'h3f1622bfaafbe667d4f9cb74598095c;
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
      expv[0] = 50'h0067cbc4f380f;
      expv[1] = 50'h02a2324bcf00f;
      expv[2] = 50'h0e884b9dd200f;
      expv[3] = 50'h32828bc5e400f;
      expv[4] = 50'h18005cdc0400f;
      expv[5] = 50'h32515f691b00f;
      expv[6] = 50'h3a45eca34f00f;
      expv[7] = 50'h02814148a100f;
      expv[8] = 50'h3bf232377300f;
      expv[9] = 50'h03f4983dc500f;
      expv[10] = 50'h1ad8153e0280f;
      expv[11] = 50'h2a614eae0a40f;
      expv[12] = 50'h17806240b300f;
      expv[13] = 50'h19ca086e9400f;
      expv[14] = 50'h16b25939bb00f;
      expv[15] = 50'h155695c00c00f;
      expv[16] = 50'h3a9a48654e00f;
      expv[17] = 50'h30dcce9b5300f;
      expv[18] = 50'h1290b8388c40f;
      expv[19] = 50'h14c3169ab900f;
      expv[20] = 50'h34838dfd6800f;
      expv[21] = 50'h264353745300f;
      expv[22] = 50'h1ec15439b100f;
      expv[23] = 50'h24cf93321400f;
      expv[24] = 50'h2466c07e7e00f;
      expv[25] = 50'h2f2d8ceabb00f;
      expv[26] = 50'h2b64b112ea00f;
      expv[27] = 50'h0e94222ee500f;
      expv[28] = 50'h37c788e3bc00f;
      expv[29] = 50'h1293af2d4b00f;
      expv[30] = 50'h3899aef40d40f;
      expv[31] = 50'h162c29739e00f;
      expv[32] = 50'h1ae98e50c000f;
      expv[33] = 50'h0f1955852400f;
      expv[34] = 50'h271f679eac00f;
      expv[35] = 50'h3e0570718040f;
      expv[36] = 50'h16bcd5a66c00f;
      expv[37] = 50'h1ef07a372b00f;
      expv[38] = 50'h3b02f2dc2d00f;
      expv[39] = 50'h19b689d4a800f;
      expv[40] = 50'h22f07cc32600f;
      expv[41] = 50'h33ed4cab3c00f;
      expv[42] = 50'h10d2a6906a00f;
      expv[43] = 50'h0c0ae943fe00f;
      expv[44] = 50'h2d50d18e5b00f;
      expv[45] = 50'h389baff3bc00f;
      expv[46] = 50'h0393f9453900f;
      expv[47] = 50'h17f2d27c5a00f;
      expv[48] = 50'h0c27abc19000f;
      expv[49] = 50'h16a147ff0000f;
      expv[50] = 50'h2952fe01e040f;
      expv[51] = 50'h3feafb34f400f;
      expv[52] = 50'h39f4938b9200f;
      expv[53] = 50'h0081572f8600f;
      expv[54] = 50'h122453003100f;
      expv[55] = 50'h12636b54bb00f;
      expv[56] = 50'h399b32d3f500f;
      expv[57] = 50'h0ecbb160dd40f;
      expv[58] = 50'h38afbb993b00f;
      expv[59] = 50'h31f54100f700f;
      expv[60] = 50'h373bccc92b00f;
      expv[61] = 50'h2f16a13fbc00f;
      expv[62] = 50'h095e0dfde800f;
      expv[63] = 50'h32dd16603c00f;
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
