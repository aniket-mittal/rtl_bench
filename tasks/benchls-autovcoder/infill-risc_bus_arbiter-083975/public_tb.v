// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 136;
  localparam OW = 140;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_083975 dut (
    .io_mainClk(clk),
    .io_iBus_cmd_valid(in_vec[135:135]),
    .io_iBus_cmd_payload_pc(in_vec[134:103]),
    .io_dBus_cmd_valid(in_vec[102:102]),
    .io_dBus_cmd_payload_wr(in_vec[101:101]),
    .io_dBus_cmd_payload_address(in_vec[100:69]),
    .io_dBus_cmd_payload_data(in_vec[68:37]),
    .io_dBus_cmd_payload_size(in_vec[36:35]),
    .io_masterBus_cmd_ready(in_vec[34:34]),
    .io_masterBus_rsp_valid(in_vec[33:33]),
    .io_masterBus_rsp_payload_data(in_vec[32:1]),
    .resetCtrl_systemReset(in_vec[0:0]),
    .io_iBus_cmd_ready(out_vec[139:139]),
    .io_iBus_rsp_valid(out_vec[138:138]),
    .io_iBus_rsp_payload_error(out_vec[137:137]),
    .io_iBus_rsp_payload_inst(out_vec[136:105]),
    .io_dBus_cmd_ready(out_vec[104:104]),
    .io_dBus_rsp_ready(out_vec[103:103]),
    .io_dBus_rsp_error(out_vec[102:102]),
    .io_dBus_rsp_data(out_vec[101:70]),
    .io_masterBus_cmd_valid(out_vec[69:69]),
    .io_masterBus_cmd_payload_write(out_vec[68:68]),
    .io_masterBus_cmd_payload_address(out_vec[67:36]),
    .io_masterBus_cmd_payload_data(out_vec[35:4]),
    .io_masterBus_cmd_payload_mask(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 136'he8df24848715a5b3eb21dd4a9f9d1b1f2d;
    stim[1] = 136'hbcc3f7977644a9fd1a2e2f41b856980925;
    stim[2] = 136'h6f84767d81c3aeed3944410e6e9b95ea9a;
    stim[3] = 136'hc6fa5d7733632c1748a5cced054d80ef1e;
    stim[4] = 136'ha9051571e7d90ff7e0aecb35f97728d7b8;
    stim[5] = 136'h3723ba8cdb4526457f502a6ef4016780f4;
    stim[6] = 136'h24cf1efd21c88e5b05d0db6a172c9ca4f0;
    stim[7] = 136'h6104ce205f1485113ebe82766c42e6eada;
    stim[8] = 136'hd3d23a4960300d294dbbcf9e1d8a31ab8c;
    stim[9] = 136'h785d7522b779420046d4c80ee9ddab34b8;
    stim[10] = 136'h2f10df2f9b52cda19d7309a9b60f501be8;
    stim[11] = 136'h2f02a94650d6ad9a98a57e407a9dc7ba46;
    stim[12] = 136'h173ec76121356398ad97a74250d2821d14;
    stim[13] = 136'h68f50700387b10da3cbdf014bd0c35035c;
    stim[14] = 136'h020fc60c943c7ab2fa551fda32793a2c6c;
    stim[15] = 136'h66cd5c5af7723c669256ab975b885faf3a;
    stim[16] = 136'hcdb5530badc1cc646bec8bb6c804282e7e;
    stim[17] = 136'h14c3cf9121610c399818b94f77ff2c4cfa;
    stim[18] = 136'hf06818c1ff774411d9074f0b04726d6f2c;
    stim[19] = 136'h7259ffe2a50322d568077c7a31933256fc;
    stim[20] = 136'hd17f48b3a6709b75e67e013c2ad599d6c0;
    stim[21] = 136'h387227444a7d4feb574ed0a4005dae8d5e;
    stim[22] = 136'h6b060a1191e884237a39c31500d9b21694;
    stim[23] = 136'h50b2fdca3ccca10a9514e2db069e179a7a;
    stim[24] = 136'hc2def14b4d99112a59c8de8026a78a5874;
    stim[25] = 136'h7e2f7dbdea5231e3b164a3ed55fbc3710c;
    stim[26] = 136'h3573ba66adf59a6968a81d031c1854b9d6;
    stim[27] = 136'he093ddb6871c224887ae02266ff3e54c88;
    stim[28] = 136'h7731b7562093981455cdec92d135d46d78;
    stim[29] = 136'h276f5064e864632cf18f686c63f3a4fb14;
    stim[30] = 136'haa56fd8f543890e10afec4ea33f11972ea;
    stim[31] = 136'h58eca2238994f3f27ef4d9f7df8ca0db38;
    stim[32] = 136'he4d633e16e35a6698e964b4e50aae5b4d0;
    stim[33] = 136'hcb1fc517138d3cfe686e2459169f85183e;
    stim[34] = 136'h34293e9dc6918e9b62cce5ed037259d0fc;
    stim[35] = 136'h2cf149e958cf96fdc267e9af14ad0b8ab4;
    stim[36] = 136'h72771c5a394fa585aeddead351c8d3fd52;
    stim[37] = 136'h90a9a8a3097697587e84327c6ad4e18cb4;
    stim[38] = 136'hfc844d442a355d44501a94b5f3066693a6;
    stim[39] = 136'hf98926c9d468963694cf8d85b0c0db1c70;
    stim[40] = 136'hb9dbca6c48be810e0c9ad546de7c5e6b62;
    stim[41] = 136'h58f6acfb15e623570af91e0950ca436fb4;
    stim[42] = 136'h676948d6a31db05bb96b514a88cbfb056a;
    stim[43] = 136'h04d48f52189060f31c630a1f6fbb764146;
    stim[44] = 136'h8a9c19574f699e384e42d3a2e331f34676;
    stim[45] = 136'h8da5a565607728324fd126d3357854040e;
    stim[46] = 136'h8656a21b55a1e91e28c0f8e6690da7dd2c;
    stim[47] = 136'h08dbe47cdf1a683b364dc73843f01c8754;
    stim[48] = 136'h458683a61ca28a00adf6719a7fd57220da;
    stim[49] = 136'hbd95bbfb186018af4a0c27cf4d41c95f88;
    stim[50] = 136'hb25d58a0d0f3ad5df0eab3f796ca5932ce;
    stim[51] = 136'h0deba04d92d8f31cc7fde20948a529f41a;
    stim[52] = 136'he3c46ec71309b5709a376eb20da3f849a2;
    stim[53] = 136'h89cac89149e8cfe03e0880ca1149d6d7c4;
    stim[54] = 136'hc85d23a2bb4bf57a87806612a2cf7d8654;
    stim[55] = 136'hb07160f29ea4f61e1855c331bf2d8b2f3e;
    stim[56] = 136'hd7c9a18b5a5c6bfc627bf61f721257ab00;
    stim[57] = 136'hd7c6f000948e935cae6b6b3a4be00d5f08;
    stim[58] = 136'h93de5213d75463e451ac379f3dbb37b966;
    stim[59] = 136'h5c7f98bd54380d1ba16e6c401236668538;
    stim[60] = 136'hd693bd958c082b5c57ea09a9a12346cb66;
    stim[61] = 136'h5eaa29879f7ddaa2d05581e581082b933e;
    stim[62] = 136'hbee38052d73586a86070dc884e8b657bf8;
    stim[63] = 136'h584eadb8ca379a2a1e9c20e245212ad0e2;
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
      expv[0] = 140'hd9d1b1f2d33a363e5ad1be4909590eea548;
      expv[1] = 140'h0569809240ad30124bb2254fe8d1717a0df;
      expv[2] = 140'hc9b95ea9b1372bd534df08ecfbca2208736;
      expv[3] = 140'h94d80ef1f29b01de3e8df4baee452e67684;
      expv[4] = 140'h17728d7b82ee51af713ec87fbf057659af8;
      expv[5] = 140'h0016780f4002cf01e8da29322bfa8153778;
      expv[6] = 140'hd2c9ca4f12593949e0499e3dfa2e86db50f;
      expv[7] = 140'h042e6eadb085cdd5b6f8a42889f5f413b36;
      expv[8] = 140'h18a31ab8c3146357190180694a6dde7cf0c;
      expv[9] = 140'h1ddab34b83bb566970f0baea4536a64077c;
      expv[10] = 140'h80f501be981ea037d05e21be5feb984d4df;
      expv[11] = 140'h09dc7ba4693b8f748e86b56cd4c52bf203f;
      expv[12] = 140'h0d2821d141a5043a282e7d8ec26cbd3a12e;
      expv[13] = 140'h90c35035d2186a06b8d1ea0e00e5ef80a5e;
      expv[14] = 140'h0793a2c6c8f27458d8041f8c19d2a8fed18;
      expv[15] = 140'h1885faf3ab10bf5e77bb91e33492b55cbaf;
      expv[16] = 140'h004282e7e008505cfe9b6aa6175f645db68;
      expv[17] = 140'h9ff2c4cfbbfe5899f429879f22c0c5ca7bf;
      expv[18] = 140'h0726d6f2d0e4dade5bfbba208ec83a78584;
      expv[19] = 140'h1933256fc32664adf8e4b3ffc5403be3d18;
      expv[20] = 140'h0d599d6c09ab33ad82a2fe916733f009e18;
      expv[21] = 140'h05dae8d5e0bb5d1abe53ea7f5aba7685204;
      expv[22] = 140'h0d9b216941b3642d28d60c1423d1ce18a88;
      expv[23] = 140'h89e179a7b93c2f34f4a165fb94a8a716d81;
      expv[24] = 140'h0a78a587594f14b0ea6cc88952ce46f4014;
      expv[25] = 140'h1fbc3710c3f786e21952918f1d8b251f6ae;
      expv[26] = 140'h01854b9d6030a973ac6ae774cd4540e8188;
      expv[27] = 140'h9f3e54c89be7ca9912c127bb6d3d7011333;
      expv[28] = 140'h135d46d7826ba8daf0ee636eacae6f6496c;
      expv[29] = 140'h5f3a4fb143e749f62b432319678c7b43638;
      expv[30] = 140'h5f11972ea3e232e5d6a1c4870857f62751f;
      expv[31] = 140'hd8ca0db3931941b670b1d94447f7a6cfbe8;
      expv[32] = 140'h0aae5b4d0155cb69a371ad334c74b25a72f;
      expv[33] = 140'hc9f85183f13f0a307e963f8a2e437122c88;
      expv[34] = 140'h57259d0fc2e4b3a1fa348c74db16672f688;
      expv[35] = 140'h0ad0b8ab515a17156ac67cb7ee133f4d78c;
      expv[36] = 140'h1c8d3fd52391a7faa4e4ee38b476ef569ae;
      expv[37] = 140'h0d4e18cb49a9c3196a21535146f42193e38;
      expv[38] = 140'h1066693a6a0ccd274ef9089a8880d4a5afc;
      expv[39] = 140'h0c0db1c70181b638e2a344b1b4a67c6c2df;
      expv[40] = 140'h07c5e6b638f8bcd6c645f4087064d6aa36f;
      expv[41] = 140'h0ca436fb419486df68b1ed59f657c8f04af;
      expv[42] = 140'h0cbfb056a197f60ad4ced291adcb5a8a546;
      expv[43] = 140'h9bb764147b76ec828c09a91ea4e31850fb3;
      expv[44] = 140'h131f34676a63e68cee7b4cf1c272169d174;
      expv[45] = 140'h17854040f2f0a8081f03b941927e893699c;
      expv[46] = 140'h10da7dd2c21b4fba5aad0f48f14607c7336;
      expv[47] = 140'h1f01c8754be0390eaaf8d341d9b26e39c22;
      expv[48] = 140'h9d57220dbbaae441b48b0d074c6fb38cd3e;
      expv[49] = 140'h941c95f8928392bf127b2b77f650613e7ac;
      expv[50] = 140'h4ca5932cf194b2659e879d6aef87559fbc8;
      expv[51] = 140'h0a529f41a14a53e8341bd7409b3fef104ac;
      expv[52] = 140'h1a3f849a2347f09344c788dd8ed1bb75903;
      expv[53] = 140'h149d6d7c4293adaf884f467f01f0440650e;
      expv[54] = 140'h0cf7d865499efb0caa90ba47453c0330951;
      expv[55] = 140'h92d8b2f3fa5b165e7e60e2c1e5c2ae198df;
      expv[56] = 140'h41257ab00024af5602d2e35fe313dfb0fb8;
      expv[57] = 140'h5e00d5f083c01abe12af8de001735b59d26;
      expv[58] = 140'h1bb37b9673766f72cebaa31f228d61bcf9c;
      expv[59] = 140'h03666853886ccd0a72a1c068dd0b736200e;
      expv[60] = 140'h12346cb662468d96cead277b2bbf504d4d4;
      expv[61] = 140'h1082b933e21057267cbd54530f82ac0f2c4;
      expv[62] = 140'h08b657bf9916caf7f2b9ac35430386e4428;
      expv[63] = 140'h1212ad0e224255a1c451bcd150f4e107121;
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
