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

  rtlpp_09277 dut (
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
    stim[0] = 122'h35e88c2b7d66485243b612bb07e99ef;
    stim[1] = 122'h0317b93c59428c18fc31068f4191107;
    stim[2] = 122'h0a7c0a10b64ca40fe2dd570bb507911;
    stim[3] = 122'h0ad85a4cdd404a0953ed2d6e5578fce;
    stim[4] = 122'h0352240617605aaae04849e700b3465;
    stim[5] = 122'h2f2868ff0d67a59659ddfbab32174bf;
    stim[6] = 122'h05e4e98eca66e23055b53802688cd2c;
    stim[7] = 122'h008aa83728f753fca5ec31df47a6255;
    stim[8] = 122'h06e6bd79a9e5d54fa66fd6fb7ec816b;
    stim[9] = 122'h304e2d14f774c1c8fee4903e2c962e9;
    stim[10] = 122'h0b7a60ea693843f3a3fb641d5657da9;
    stim[11] = 122'h073e12dd4b83d928f8fd2ebd6d550ad;
    stim[12] = 122'h2001759fc70376cf247f2804004a2f0;
    stim[13] = 122'h14a651ed57b9c1b733d4967207970e8;
    stim[14] = 122'h32b8300a2f46788d32c8b9e1af8e9d8;
    stim[15] = 122'h13b27d1c3ddeca37a3f602c3bc32ed6;
    stim[16] = 122'h04389bae3a2c1aa0a86016c0ef73438;
    stim[17] = 122'h2744fdf49bdf4167a8524778cd1c496;
    stim[18] = 122'h3b9ae58b3cd684070ece11b268f365c;
    stim[19] = 122'h304530a6d67ed474c74e769e96a5208;
    stim[20] = 122'h25482806bf82045cbbe37258cf81d38;
    stim[21] = 122'h1f83f1a376cd400954e7b2c6e9d6bc1;
    stim[22] = 122'h2dd9771911f55f9e8356e4bcbd1fc68;
    stim[23] = 122'h16bfb78378dd1bccf567e1692a69a34;
    stim[24] = 122'h04fc84f51515065252c9f467af8834b;
    stim[25] = 122'h0196e4983114c3f7264dcd233d19f89;
    stim[26] = 122'h07c1b3baca5fcd5ae7dbaf21e060525;
    stim[27] = 122'h3b83de4e328cb832125e5309c01abb8;
    stim[28] = 122'h126c6e09ec4aa987faeff02243a8e41;
    stim[29] = 122'h3db3aa474c35b169faca7be61e20d2b;
    stim[30] = 122'h03d26928372fa7ce1ceced4f4ffc6c8;
    stim[31] = 122'h19df3dcb89d5c40d28d1a28326dd207;
    stim[32] = 122'h3ce901450f7bcc8d444b81a670ce613;
    stim[33] = 122'h108388a9235ebb440dfaae0726f7615;
    stim[34] = 122'h067985bc72d7271bacfddc1d7a41a90;
    stim[35] = 122'h31e33f631a1311b3f1d37457663f9e7;
    stim[36] = 122'h0f29995b0b269c89e2ad37f1d411815;
    stim[37] = 122'h246defb34fcdd03ee5e551fd1c0c704;
    stim[38] = 122'h220975f1076938871947de30b5a5c59;
    stim[39] = 122'h245f9dc3fd3ebefab8c0271b2afd700;
    stim[40] = 122'h2a6cae7500692888afd0ce142aa3ecc;
    stim[41] = 122'h110fc0d70eb7be21d4e53ce1f6ada76;
    stim[42] = 122'h02ae85619939c320edf605058a88543;
    stim[43] = 122'h340fc1209626785c4655a6449fec055;
    stim[44] = 122'h1e9caccacbcb14dff0ea0e5d57eece5;
    stim[45] = 122'h0bc6f75e90c8450be966da632af786a;
    stim[46] = 122'h118be2a58c348723377a981033509ac;
    stim[47] = 122'h39f076a7e7a1e32c51d5b383e76baac;
    stim[48] = 122'h235ede290367c3a9fd7118addb8cb71;
    stim[49] = 122'h25424e065bb72fa12cf7315d2eee9d3;
    stim[50] = 122'h09b6ebf4e2161eaa08507c59c94f9e5;
    stim[51] = 122'h010da1088cfb2a06df539fc565a5421;
    stim[52] = 122'h073fbddfeb276f94e1f2997a303bd68;
    stim[53] = 122'h2270e79d65b6b035ca7e9a6da0145ea;
    stim[54] = 122'h04aac19881c3c0239068d1b1af65bc0;
    stim[55] = 122'h11817aa0f2d4e0708c56f595ab34998;
    stim[56] = 122'h3c20048381f7de3e6960b19e67a7baf;
    stim[57] = 122'h1d66509706ec31487ff5e079b4238e1;
    stim[58] = 122'h0c9adc05390682f0fcefb4d48d6c2e9;
    stim[59] = 122'h3b6e9b2facf77928a978b3936609179;
    stim[60] = 122'h33a85cbfbdb0d55dcafc3c1b3fede65;
    stim[61] = 122'h05940a9a78ba6c9185f75b9e19253a1;
    stim[62] = 122'h10300c1d316c4e1130f6e2c0ff23531;
    stim[63] = 122'h01525595b043721f0368fa48eccc433;
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
      expv[0] = 50'h000000000044e;
      expv[1] = 50'h000000000044e;
      expv[2] = 50'h0000000000c4e;
      expv[3] = 50'h000000000044e;
      expv[4] = 50'h0000000000c4e;
      expv[5] = 50'h0000000000c4e;
      expv[6] = 50'h000000000044e;
      expv[7] = 50'h000000000044e;
      expv[8] = 50'h000000000044e;
      expv[9] = 50'h000000000044e;
      expv[10] = 50'h000000000044e;
      expv[11] = 50'h000000000044e;
      expv[12] = 50'h000000000044e;
      expv[13] = 50'h0000000000c4e;
      expv[14] = 50'h0000000000c4e;
      expv[15] = 50'h000000000044e;
      expv[16] = 50'h000000000044e;
      expv[17] = 50'h0000000000c4e;
      expv[18] = 50'h0000000000c4e;
      expv[19] = 50'h0000000000c4e;
      expv[20] = 50'h000000000044e;
      expv[21] = 50'h000000000044e;
      expv[22] = 50'h0000000000c4e;
      expv[23] = 50'h000000000044e;
      expv[24] = 50'h0000000000c4e;
      expv[25] = 50'h0000000000c4e;
      expv[26] = 50'h0000000000c4e;
      expv[27] = 50'h0000000000c4e;
      expv[28] = 50'h000000000044e;
      expv[29] = 50'h0000000000c4e;
      expv[30] = 50'h000000000044e;
      expv[31] = 50'h0000000000c4e;
      expv[32] = 50'h0000000000c4e;
      expv[33] = 50'h000000000044e;
      expv[34] = 50'h000000000044e;
      expv[35] = 50'h0000000000c4e;
      expv[36] = 50'h000000000044e;
      expv[37] = 50'h000000000044e;
      expv[38] = 50'h0000000000c4e;
      expv[39] = 50'h0000000000c4e;
      expv[40] = 50'h0000000000c4e;
      expv[41] = 50'h000000000044e;
      expv[42] = 50'h000000000044e;
      expv[43] = 50'h0000000000c4e;
      expv[44] = 50'h000000000044e;
      expv[45] = 50'h000000000044e;
      expv[46] = 50'h000000000044e;
      expv[47] = 50'h0000000000c4e;
      expv[48] = 50'h000000000044e;
      expv[49] = 50'h000000000044e;
      expv[50] = 50'h0000000000c4e;
      expv[51] = 50'h0000000000c4e;
      expv[52] = 50'h000000000044e;
      expv[53] = 50'h000000000044e;
      expv[54] = 50'h000000000044e;
      expv[55] = 50'h0000000000c4e;
      expv[56] = 50'h000000000044e;
      expv[57] = 50'h000000000044e;
      expv[58] = 50'h000000000044e;
      expv[59] = 50'h000000000044e;
      expv[60] = 50'h000000000044e;
      expv[61] = 50'h000000000044e;
      expv[62] = 50'h000000000044e;
      expv[63] = 50'h000000000044e;
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
