// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 129;
  localparam OW = 43;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00539 dut (
    .tck(clk),
    .MonDReg(in_vec[128:97]),
    .break_readreg(in_vec[96:65]),
    .dbrk_hit0_latch(in_vec[64:64]),
    .dbrk_hit1_latch(in_vec[63:63]),
    .dbrk_hit2_latch(in_vec[62:62]),
    .dbrk_hit3_latch(in_vec[61:61]),
    .debugack(in_vec[60:60]),
    .ir_in(in_vec[59:58]),
    .jtag_state_rti(in_vec[57:57]),
    .monitor_error(in_vec[56:56]),
    .monitor_ready(in_vec[55:55]),
    .reset_n(in_vec[54:54]),
    .resetlatch(in_vec[53:53]),
    .tdi(in_vec[52:52]),
    .tracemem_on(in_vec[51:51]),
    .tracemem_trcdata(in_vec[50:15]),
    .tracemem_tw(in_vec[14:14]),
    .trc_im_addr(in_vec[13:7]),
    .trc_on(in_vec[6:6]),
    .trc_wrap(in_vec[5:5]),
    .trigbrktype(in_vec[4:4]),
    .trigger_state_1(in_vec[3:3]),
    .vs_cdr(in_vec[2:2]),
    .vs_sdr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .ir_out(out_vec[42:41]),
    .jrst_n(out_vec[40:40]),
    .sr(out_vec[39:2]),
    .st_ready_test_idle(out_vec[1:1]),
    .tdo(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 129'h1581b4149efd6875c6e28cec6fad9283a;
    stim[1] = 129'h0d771f1529ffcba7e779a6369b6115f5d;
    stim[2] = 129'h1bc3b1cdcee444fb34b5ba9190e9bf6af;
    stim[3] = 129'h096dd9641789335046162288adcc967e6;
    stim[4] = 129'h0920f698c6c6a1a783178e9d69d7f54cc;
    stim[5] = 129'h0fc6dc0870cedfb431d472593a9662e31;
    stim[6] = 129'h0f720533cef7992bf7ffdfc79b05f21c3;
    stim[7] = 129'h0c69ce21f10aa994630631736204dc1a8;
    stim[8] = 129'h0fbecca3fe20e6cd55074518b5fde90f3;
    stim[9] = 129'h0398c0b818456a129984d0ce426219b90;
    stim[10] = 129'h1d16710441506c17fd8f0b1d7fad4672e;
    stim[11] = 129'h158ec2d20bf41ade3a5c0e8120535fee2;
    stim[12] = 129'h023b5903178ee72849ee04d83dff8f59c;
    stim[13] = 129'h1ebcb2388b9224b36b5da7e90a84380a8;
    stim[14] = 129'h0585648b6977fc8cd98f397d9018af2f8;
    stim[15] = 129'h0aeefe59d2f35928094a2348474a16f21;
    stim[16] = 129'h031425ca82982a917267c8d641f6c9e0e;
    stim[17] = 129'h1f689ddf51f5eb05c96698404e3bfae38;
    stim[18] = 129'h13e114a5e77102b087f78cdf72df42825;
    stim[19] = 129'h087407f62e6abc0868f58f1b38ad32b11;
    stim[20] = 129'h1de52f1297bb59f38847946886fd59a7b;
    stim[21] = 129'h196ec53469f95fd32b8ccd87d8707156b;
    stim[22] = 129'h09f043fb8506ab6a9e5f9445ba03a2b29;
    stim[23] = 129'h0a5e0b4c3b42d4ded7f76623ba91a7308;
    stim[24] = 129'h1dd20e56c1e01a585f5482d6613cdb8fd;
    stim[25] = 129'h0558dbec2094901064041afd14203ce33;
    stim[26] = 129'h0401615904a7ed70a2ec5fc7db39219dd;
    stim[27] = 129'h15e89a0c58db55d4b7ef57b2d01054902;
    stim[28] = 129'h1bd65d24b49d71fd87fe0ffc8e0b9246a;
    stim[29] = 129'h0ad6ccc34055b33af40d0332afa0e8040;
    stim[30] = 129'h0a1ee11e963f2de79407dc96a0dc69c3a;
    stim[31] = 129'h16680693e6c9110333c6d435e66fe9b85;
    stim[32] = 129'h08294ed0f306fdafad3d1c1a3274abaf9;
    stim[33] = 129'h1927af36e14bb14a19cad9e15d6f57e1f;
    stim[34] = 129'h0e584f718707fb73188f070cd704957d7;
    stim[35] = 129'h0c565eb32a49bed48f36296a10c7f8882;
    stim[36] = 129'h0f81e606279dc9f6ce57841b7db42393c;
    stim[37] = 129'h17805006b8d6edbbf5276c157442ee1fa;
    stim[38] = 129'h0eff9a370f6bd82d866cb683594ef8ac1;
    stim[39] = 129'h0d5a3c480a642b04c33725aa1364befaa;
    stim[40] = 129'h16f78368aba80fb952ad5ff556615d2d0;
    stim[41] = 129'h0e01dc643e4ff376d606c58c453749f97;
    stim[42] = 129'h1389dc400b556493813fdac99efa95bc6;
    stim[43] = 129'h1527831f8b521b5e7bf4b9c33953c2901;
    stim[44] = 129'h055fd7c8a1d79dba343e233ec1fcdc52d;
    stim[45] = 129'h1c07f8d541cf7ef4b5558bb19af109fb4;
    stim[46] = 129'h09cfcb1a84a3a37f2556922d7990883b7;
    stim[47] = 129'h062c52bc960893c89c5414bbcec9eefee;
    stim[48] = 129'h1093b9f95950389836c4d0e19a8ee9dcb;
    stim[49] = 129'h09dbf05e3dc9cb02f1751c94aab481576;
    stim[50] = 129'h0f2c0f3125f04139926eded30995b5238;
    stim[51] = 129'h145e1790e26214bc7d4f38390c9b31210;
    stim[52] = 129'h10591fd38def4a577dee26bf27c98617f;
    stim[53] = 129'h17fb16756e3e166e856f11fe0a715b1bd;
    stim[54] = 129'h1af163bbebc8e0bcb23dae031fab1418d;
    stim[55] = 129'h1052843817ff0a22ac069447f3b1c24b6;
    stim[56] = 129'h07cbb91ed89c3f827af53e7ca6b8b58b7;
    stim[57] = 129'h194847ee7e02014bcb0769b0c153cb229;
    stim[58] = 129'h0e6922df3ef9b242b9f5846ca1d0306ce;
    stim[59] = 129'h0bad42d4732ba5ae96d7b6fc1291236f4;
    stim[60] = 129'h169683239c4782c8f1cd2de392a33e0c4;
    stim[61] = 129'h18e32775c26dbd28d77fec43d22e3571d;
    stim[62] = 129'h0a1a3ebe594bad7a16befe89392c2a683;
    stim[63] = 129'h158e842f80e62085ba050cd0d21710621;
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
      expv[0] = 43'h0xxxxxxxxxx;
      expv[1] = 43'h0xxxxxxxxxx;
      expv[2] = 43'h1d31b4db08a;
      expv[3] = 43'h1e98da6d845;
      expv[4] = 43'h174c6d36c20;
      expv[5] = 43'h15a483da630;
      expv[6] = 43'h15a483da632;
      expv[7] = 43'h5ad241ed318;
      expv[8] = 43'h5ad241ed318;
      expv[9] = 43'h7d6920f698d;
      expv[10] = 43'h5d6920f698d;
      expv[11] = 43'h5eb4907b4c5;
      expv[12] = 43'h555a483da62;
      expv[13] = 43'h755a48006b0;
      expv[14] = 43'h355a48006b0;
      expv[15] = 43'h055a48006b0;
      expv[16] = 43'h155a48006b2;
      expv[17] = 43'h1aad240035a;
      expv[18] = 43'h1aad240035a;
      expv[19] = 43'h1aad240050a;
      expv[20] = 43'h5aad2400508;
      expv[21] = 43'h5d569220285;
      expv[22] = 43'h16ab4910140;
      expv[23] = 43'h16ab4910142;
      expv[24] = 43'h76ab4910140;
      expv[25] = 43'h3416b309e6d;
      expv[26] = 43'h520b5984f37;
      expv[27] = 43'h520b5980337;
      expv[28] = 43'h1905ace019a;
      expv[29] = 43'h3482d6500cd;
      expv[30] = 43'h7482d6500cd;
      expv[31] = 43'h7a416b28065;
      expv[32] = 43'h3a416b00372;
      expv[33] = 43'h0a416b00370;
      expv[34] = 43'h1520b5801b8;
      expv[35] = 43'h1a905ae00df;
      expv[36] = 43'h15482d7006d;
      expv[37] = 43'h3420dbeda12;
      expv[38] = 43'h5a106df6d0a;
      expv[39] = 43'h1a106df6d0a;
      expv[40] = 43'h5d0836fb687;
      expv[41] = 43'h3d0836fb685;
      expv[42] = 43'h56841b7db42;
      expv[43] = 43'h3b420dbeda2;
      expv[44] = 43'h1b420dbeda2;
      expv[45] = 43'h7b957f5f22d;
      expv[46] = 43'h545d8cd7885;
      expv[47] = 43'h302ec66bc40;
      expv[48] = 43'h50176335e20;
      expv[49] = 43'h500bb19af12;
      expv[50] = 43'h1805d8ed78a;
      expv[51] = 43'h1805d8ed788;
      expv[52] = 43'h5805d8ed78a;
      expv[53] = 43'h3402ec56bc7;
      expv[54] = 43'h708ff0538af;
      expv[55] = 43'h736bc58eefd;
      expv[56] = 43'h71b5e2c777f;
      expv[57] = 43'h3adaf163bbd;
      expv[58] = 43'h1adaf163bbf;
      expv[59] = 43'h1f6d78b1ddd;
      expv[60] = 43'h5f6d78806dd;
      expv[61] = 43'h5f6d7880417;
      expv[62] = 43'h1f621e9171a;
      expv[63] = 43'h77b10f48b8d;
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
