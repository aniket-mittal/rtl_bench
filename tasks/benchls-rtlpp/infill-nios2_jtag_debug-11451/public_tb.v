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

  rtlpp_11451 dut (
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
    stim[0] = 122'h336706ff928305215c94fb396489e58;
    stim[1] = 122'h0c388559573ad401abb004720d6550f;
    stim[2] = 122'h3bb1c2564df0396dad63878543f3466;
    stim[3] = 122'h3c553113972989e5a9cdb31f3c0a0dd;
    stim[4] = 122'h222e58cee67e98699e57e53c1c4de34;
    stim[5] = 122'h0af5c0e211fe671854453f9f735d92a;
    stim[6] = 122'h04be957eb026e086a6cb2b23f8a2f32;
    stim[7] = 122'h3360186fa080e6979bf01562072d0eb;
    stim[8] = 122'h38e3fedd09d720b6bfd996cccedf4ad;
    stim[9] = 122'h23b06c99f4676ee3d6e143cf917e31a;
    stim[10] = 122'h195095a492629df4f4c2088979ac5c9;
    stim[11] = 122'h00168bcdb16f3d38d1fe9514b6ede6b;
    stim[12] = 122'h1883b78881bdce81c866134fc4b5012;
    stim[13] = 122'h0955d05d3106c9c6835f89a360a6f63;
    stim[14] = 122'h32f42d1e5417ce17abd07bb0a4c12ec;
    stim[15] = 122'h0d683686604e0934307e389016251aa;
    stim[16] = 122'h207b6840a81a487f49c2dc3b1e05b14;
    stim[17] = 122'h3819e34ca4b80ecd87cadbd1ba02f06;
    stim[18] = 122'h007869ca79c620bb8e44a1e2c557d70;
    stim[19] = 122'h03e57b36d09403e4095f7669c9df1c5;
    stim[20] = 122'h3e9ba119a236e7036e6a1459546d22b;
    stim[21] = 122'h2301b73ec789906615fade581d686c4;
    stim[22] = 122'h11eae63eaeabc8969de8f748fa5e401;
    stim[23] = 122'h121c920484cbb9e7f36e3e987335296;
    stim[24] = 122'h1c88a4d75fa0d3a784772e52fe82782;
    stim[25] = 122'h2ed1fa22d68b7393a3e9c9d3d133a47;
    stim[26] = 122'h2b0d435d5fd6d202dad1670837f7753;
    stim[27] = 122'h2ea5f974503804e89183d2515709ef7;
    stim[28] = 122'h26217a8d67fdab4f9045624ff81d896;
    stim[29] = 122'h2c15d06cbead75d0a3c95e2d61c596b;
    stim[30] = 122'h3e49ea62a4b4777e8ecf91fdf8c310e;
    stim[31] = 122'h19b73d1a9710833c2bf9cb1e575ed05;
    stim[32] = 122'h0df90480af8c459720e01f6572f0c43;
    stim[33] = 122'h228f9e6dd05227a35235fc978c3f4f9;
    stim[34] = 122'h1cc21aedd38b3d35df661bbca69aa87;
    stim[35] = 122'h086648e166e162193d5bc17ce8a50aa;
    stim[36] = 122'h0fdbd17d4bb167da7b7b3551d42c6d5;
    stim[37] = 122'h02f5c19fb03a75397ff54f6e7456008;
    stim[38] = 122'h0c261558ae9bc1660ae04b768d7f8a5;
    stim[39] = 122'h09917a1fde0cd015b186a00561045fd;
    stim[40] = 122'h2aba1242c04c9d4f505421153608df6;
    stim[41] = 122'h1ead09e267233618d56c7453da5cfb6;
    stim[42] = 122'h0fdcf5a930a1a9c8fe68d0d6b1e0fe6;
    stim[43] = 122'h0cdada3437b8cffd065868117706c9f;
    stim[44] = 122'h2bba7ae5ec417b88a173b652b43a77a;
    stim[45] = 122'h1c969eafc4742f5ca3c12a786639772;
    stim[46] = 122'h17438bfec1819fc12a5d19d86cddaff;
    stim[47] = 122'h267a3bdcfd78be1836f152bbd823aae;
    stim[48] = 122'h20967e068300b3f36973b3ca6c5292b;
    stim[49] = 122'h39049e15ebcb04fa07cc02299fa891a;
    stim[50] = 122'h08463e04e834e88d3c53558349777d9;
    stim[51] = 122'h1e3480136e48b62afd776b3c9dd8703;
    stim[52] = 122'h384b033d04e0c7929f46fb975507149;
    stim[53] = 122'h06c54be62ff46f7a88d573c94b636c0;
    stim[54] = 122'h140856eaeec6bd4acb7277233f5af87;
    stim[55] = 122'h14570c1bac738bf9c0e6e35961007af;
    stim[56] = 122'h3bb153affc8b8f49c4ee7acd2d3335e;
    stim[57] = 122'h26f6c4fab5b3b7211b6b779dad2f1d2;
    stim[58] = 122'h2eb7f8701d0a8c62e0fb954e1838c82;
    stim[59] = 122'h1b341f28c943cbdcfa7fffdcccb9c97;
    stim[60] = 122'h1cd82655e34bbf421146df18034b5a2;
    stim[61] = 122'h042caa4c5be89c31eb68b9f84134c7c;
    stim[62] = 122'h037d5c3e02bc5558b165ee56dc981e0;
    stim[63] = 122'h23adc22feeb8d3d1abc876d45271db6;
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
      expv[0] = 53'h1f25060a42a000;
      expv[1] = 53'h12ae75a8030000;
      expv[2] = 53'h0c9be072db0000;
      expv[3] = 53'h072e5313cbxxxx;
      expv[4] = 53'h1dccfd30d3xxxx;
      expv[5] = 53'h0423fcce30xxxx;
      expv[6] = 53'h1d604dc10dxxxx;
      expv[7] = 53'h1f4101cd2fxxxx;
      expv[8] = 53'h1a13ae416dxxxx;
      expv[9] = 53'h13e8ceddc7xxxx;
      expv[10] = 53'h0924c53be9xxxx;
      expv[11] = 53'h1b62de7a71xxxx;
      expv[12] = 53'h11037b9d03xxxx;
      expv[13] = 53'h1a620d938dxxxx;
      expv[14] = 53'h1ca82f9c2fxxxx;
      expv[15] = 53'h0cc09c1268xxxx;
      expv[16] = 53'h01503490fexxxx;
      expv[17] = 53'h1949701d9bxxxx;
      expv[18] = 53'h14f38c4177xxxx;
      expv[19] = 53'h0da12807c8xxxx;
      expv[20] = 53'h13446dce06xxxx;
      expv[21] = 53'h1d8f1320ccxxxx;
      expv[22] = 53'h1d5d57912dxxxx;
      expv[23] = 53'h09099773cfxxxx;
      expv[24] = 53'h0ebf41a74fxxxx;
      expv[25] = 53'h05ad16e727xxxx;
      expv[26] = 53'h1abfada405xxxx;
      expv[27] = 53'h08a07009d10000;
      expv[28] = 53'h1acffb569f4000;
      expv[29] = 53'h197d5aeba1xxxx;
      expv[30] = 53'h054968eefdxxxx;
      expv[31] = 53'h152e210678xxxx;
      expv[32] = 53'h015f188b2exxxx;
      expv[33] = 53'h1ba0a44f468000;
      expv[34] = 53'h1ba7167a6b8000;
      expv[35] = 53'h02cdc2c432xxxx;
      expv[36] = 53'h1a9762cfb4xxxx;
      expv[37] = 53'h1f6074ea72xxxx;
      expv[38] = 53'h115d3782ccxxxx;
      expv[39] = 53'h1fbc19a02b0000;
      expv[40] = 53'h0580993a9ec000;
      expv[41] = 53'h04ce466c31xxxx;
      expv[42] = 53'h1261435391xxxx;
      expv[43] = 53'h086f719ffaxxxx;
      expv[44] = 53'h0bd882f711xxxx;
      expv[45] = 53'h1f88e85eb9xxxx;
      expv[46] = 53'h1d83033f82xxxx;
      expv[47] = 53'h19faf17c30xxxx;
      expv[48] = 53'h0d060167e6xxxx;
      expv[49] = 53'h0bd79609f4xxxx;
      expv[50] = 53'h09d069d11axxxx;
      expv[51] = 53'h06dc916c55xxxx;
      expv[52] = 53'h1a09c18f25xxxx;
      expv[53] = 53'h0c5fe8def5xxxx;
      expv[54] = 53'h15dd8d7a95xxxx;
      expv[55] = 53'h1758e717f3xxxx;
      expv[56] = 53'h1ff9171e93xxxx;
      expv[57] = 53'h156b676e42xxxx;
      expv[58] = 53'h003a1518c5xxxx;
      expv[59] = 53'h11928797b9xxxx;
      expv[60] = 53'h0bc6977e84xxxx;
      expv[61] = 53'h18b7d13863xxxx;
      expv[62] = 53'h1c0578aab1xxxx;
      expv[63] = 53'h1fdd71a7a3xxxx;
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
