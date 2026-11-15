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

  rtlpp_11344 dut (
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
    stim[0] = 122'h217ed378a6b5189c2824feca70cf5fd;
    stim[1] = 122'h29a6e9d3db6b1d3cb634d52c96ab0c9;
    stim[2] = 122'h2214725859994c7fe863d3ebb573de8;
    stim[3] = 122'h199a09d27e3f0ca611e0872e8a2af98;
    stim[4] = 122'h12c0c6126a203509b96f0cd50fe5a5f;
    stim[5] = 122'h1e6575fc4fa6b8ee2d6a61f8e5b9daf;
    stim[6] = 122'h1be3655b5bab44b68b597944a53b961;
    stim[7] = 122'h1510788df8459e25a8e83f7a3d73032;
    stim[8] = 122'h0b8778b5cdccda0d7f66452ae1ee55d;
    stim[9] = 122'h078552d0379f73422a73a19ae066c29;
    stim[10] = 122'h2faed99b612f45c78277691ad25d548;
    stim[11] = 122'h2b47609561e10aa166ddfd6146d13e2;
    stim[12] = 122'h3402d69f917181a21547bff047cdc39;
    stim[13] = 122'h1d39fe600198a0dbfbdb617913a8ae1;
    stim[14] = 122'h040c1314011d8efbacee8fefe7de9e1;
    stim[15] = 122'h078ab6dee634bd302a6fe852fefce72;
    stim[16] = 122'h038650d5f8062c52896f98f385b7147;
    stim[17] = 122'h23c7bc4a6b3379b8897aa7ba70f5c63;
    stim[18] = 122'h0646b127e3b78544875cd7095bec563;
    stim[19] = 122'h0a69b31b58d584b066f1a633231ca72;
    stim[20] = 122'h33a79a2e91bad697f5cc17de3c93d04;
    stim[21] = 122'h33351f856c645156e76412b984406b6;
    stim[22] = 122'h15bc70281af07992e0570e4bc496b6c;
    stim[23] = 122'h3d2476405010bd4f1ff9481fe330e57;
    stim[24] = 122'h009d9efedb52d648ee754550188ccb3;
    stim[25] = 122'h1a9f90c4a9bbc655e2e8143f8ed5a6f;
    stim[26] = 122'h0f2b92a0550d7c27cae099add0d4328;
    stim[27] = 122'h1e3db4b4f9a10242c8428ba98adc99b;
    stim[28] = 122'h159aa2227e1852bf00da5191a36c5fd;
    stim[29] = 122'h127efa0f80fb1e29b368302193fe361;
    stim[30] = 122'h116a8aef3c1aead04075cd8d9c972c4;
    stim[31] = 122'h03cf957747c1a4ff04e51afb2456aef;
    stim[32] = 122'h1791bde17c34ad13de627ecf8a78a9f;
    stim[33] = 122'h054e014f0be98b9e9fe3eb76618bff4;
    stim[34] = 122'h28cfc5fe52df4b115d67980ce040bd7;
    stim[35] = 122'h0e7b33cc64198db5b4593e6c43b30d3;
    stim[36] = 122'h16b08f1faa92ea4ddfced4c2c48052e;
    stim[37] = 122'h01e18613848808fccee47dac4815a37;
    stim[38] = 122'h298fbe540fa6ebe5cdc44f6f47bde54;
    stim[39] = 122'h367c45791dc754b64f6529d30e689c0;
    stim[40] = 122'h1fecf7cf2a7d2b05284c49357dbd166;
    stim[41] = 122'h1057b215683eb246a5ca1db4f13923f;
    stim[42] = 122'h095506f151ed7acf7ec9bd98913db70;
    stim[43] = 122'h2cb6e8d09b14ba67445d8fbc5d05691;
    stim[44] = 122'h3612628f7f8ad77a0a5e4261811a1ff;
    stim[45] = 122'h1cfca9d33bf39d7a954429c711132f2;
    stim[46] = 122'h039c03d77ddcfc9015e5f1bfcd7cdfc;
    stim[47] = 122'h226fdcbbeb664d2ec860868e0782503;
    stim[48] = 122'h0f232868eca42a717acc0d9427032b3;
    stim[49] = 122'h3541233e48f653e67ce6c3938b4768d;
    stim[50] = 122'h159e1863df08f3a589f194c6060ff83;
    stim[51] = 122'h3bfa5901d8e7e2fe4ac8ee1e40153cc;
    stim[52] = 122'h01892eb5c76fa948e177220edf8a275;
    stim[53] = 122'h3ff903e93f9ecadcd444bcc9e312e93;
    stim[54] = 122'h08c31d3bcb4ccd063f532d5ccf441d1;
    stim[55] = 122'h1219f4553ceb958b894405f56e083e0;
    stim[56] = 122'h1d383877dccaafffd6fce1beae19b56;
    stim[57] = 122'h1a07d2330fc6b22e0156b9cd1315a30;
    stim[58] = 122'h33a5fe4927908b96b861022821be176;
    stim[59] = 122'h26d98876aafdcce379763c941e69ff3;
    stim[60] = 122'h0a8fbe3afc29f5ca6ee11d90d59abdb;
    stim[61] = 122'h2bc486ff7eaa2baf4fe4f130859c78c;
    stim[62] = 122'h1803d98055fc0a583fc2bf5757f0123;
    stim[63] = 122'h1ef393d3ba2b84378cfdb957448f822;
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
      expv[0] = 53'h085fb4de20003e;
      expv[1] = 53'h0a69ba74f0009f;
      expv[2] = 53'h08851c9610005e;
      expv[3] = 53'h0666827490205e;
      expv[4] = 53'h04b03184901c62;
      expv[5] = 53'h07995d7f10146a;
      expv[6] = 53'h06f8d956d0415f;
      expv[7] = 53'h05441e2370340a;
      expv[8] = 53'h02e1de2d70013e;
      expv[9] = 53'h01e154b40000df;
      expv[10] = 53'h0bebb666d0009f;
      expv[11] = 53'h0ad1d82550720d;
      expv[12] = 53'h0d00b5a7e0405e;
      expv[13] = 53'h074e7f9800635d;
      expv[14] = 53'h010304c500205e;
      expv[15] = 53'h01e2adb7b0144a;
      expv[16] = 53'h00e1943570043a;
      expv[17] = 53'h08f1ef1290045b;
      expv[18] = 53'h0191ac49f0411f;
      expv[19] = 53'h029a6cc6d0324d;
      expv[20] = 53'h0ce9e68ba0607e;
      expv[21] = 53'h0ccd47e150112e;
      expv[22] = 53'h056f1c0a0040ff;
      expv[23] = 53'h0f491d90102f71;
      expv[24] = 53'h002767bfb0144b;
      expv[25] = 53'h06a7e43120326c;
      expv[26] = 53'h03cae4a810221c;
      expv[27] = 53'h078f6d2d30445a;
      expv[28] = 53'h0566a8889060bf;
      expv[29] = 53'h049fbe83e0011e;
      expv[30] = 53'h045aa2bbc0003f;
      expv[31] = 53'h00f3e55dd0207e;
      expv[32] = 53'h05e46f78500c72;
      expv[33] = 53'h01538053c0237c;
      expv[34] = 53'h0a33f17f900c72;
      expv[35] = 53'h039eccf3105807;
      expv[36] = 53'h05ac23c7e06f30;
      expv[37] = 53'h00786184e02678;
      expv[38] = 53'h0a63ef9500607e;
      expv[39] = 53'h0d9f115e40015e;
      expv[40] = 53'h07fb3df3c0542a;
      expv[41] = 53'h0415ec8550702e;
      expv[42] = 53'h025541bc50625c;
      expv[43] = 53'h0b2dba3420401f;
      expv[44] = 53'h0d8498a3d044bb;
      expv[45] = 53'h073f2a74c04816;
      expv[46] = 53'h00e700f5d0207e;
      expv[47] = 53'h089bf72ef0041a;
      expv[48] = 53'h03c8ca1a307e00;
      expv[49] = 53'h0d5048cf90203e;
      expv[50] = 53'h05678618f0245b;
      expv[51] = 53'h0efe964070623c;
      expv[52] = 53'h00624bad70003f;
      expv[53] = 53'h0ffe40fa404856;
      expv[54] = 53'h0230c74ef0411f;
      expv[55] = 53'h04867d1540401e;
      expv[56] = 53'h074e0e1df02a75;
      expv[57] = 53'h0681f48cc0405f;
      expv[58] = 53'h0ce97f92401c22;
      expv[59] = 53'h09b6621da01c43;
      expv[60] = 53'h02a3ef8eb03648;
      expv[61] = 53'h0af121bfd0233c;
      expv[62] = 53'h0600f660107f00;
      expv[63] = 53'h07bce4f4e0245b;
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
