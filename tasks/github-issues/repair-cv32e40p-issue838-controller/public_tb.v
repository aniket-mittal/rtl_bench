// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 300;
  localparam OW = 100;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  cv32e40p_controller dut (
    .clk(clk),
    .clk_ungated_i(in_vec[299:299]),
    .rst_n(in_vec[298:298]),
    .fetch_enable_i(in_vec[297:297]),
    .is_fetch_failed_i(in_vec[296:296]),
    .illegal_insn_i(in_vec[295:295]),
    .ecall_insn_i(in_vec[294:294]),
    .mret_insn_i(in_vec[293:293]),
    .uret_insn_i(in_vec[292:292]),
    .dret_insn_i(in_vec[291:291]),
    .mret_dec_i(in_vec[290:290]),
    .uret_dec_i(in_vec[289:289]),
    .dret_dec_i(in_vec[288:288]),
    .wfi_i(in_vec[287:287]),
    .ebrk_insn_i(in_vec[286:286]),
    .fencei_insn_i(in_vec[285:285]),
    .csr_status_i(in_vec[284:284]),
    .instr_valid_i(in_vec[283:283]),
    .pc_id_i(in_vec[282:251]),
    .is_compressed_i(in_vec[250:250]),
    .hwlp_start_addr_i(in_vec[249:186]),
    .hwlp_end_addr_i(in_vec[185:122]),
    .hwlp_counter_i(in_vec[121:58]),
    .data_req_ex_i(in_vec[57:57]),
    .data_we_ex_i(in_vec[56:56]),
    .data_misaligned_i(in_vec[55:55]),
    .data_load_event_i(in_vec[54:54]),
    .data_err_i(in_vec[53:53]),
    .mult_multicycle_i(in_vec[52:52]),
    .apu_en_i(in_vec[51:51]),
    .apu_read_dep_i(in_vec[50:50]),
    .apu_write_dep_i(in_vec[49:49]),
    .branch_taken_ex_i(in_vec[48:48]),
    .ctrl_transfer_insn_in_id_i(in_vec[47:46]),
    .ctrl_transfer_insn_in_dec_i(in_vec[45:44]),
    .irq_req_ctrl_i(in_vec[43:43]),
    .irq_sec_ctrl_i(in_vec[42:42]),
    .irq_id_ctrl_i(in_vec[41:37]),
    .irq_wu_ctrl_i(in_vec[36:36]),
    .current_priv_lvl_i(in_vec[35:34]),
    .debug_req_i(in_vec[33:33]),
    .debug_single_step_i(in_vec[32:32]),
    .debug_ebreakm_i(in_vec[31:31]),
    .debug_ebreaku_i(in_vec[30:30]),
    .trigger_match_i(in_vec[29:29]),
    .regfile_we_id_i(in_vec[28:28]),
    .regfile_alu_waddr_id_i(in_vec[27:22]),
    .regfile_we_ex_i(in_vec[21:21]),
    .regfile_waddr_ex_i(in_vec[20:15]),
    .regfile_we_wb_i(in_vec[14:14]),
    .regfile_alu_we_fw_i(in_vec[13:13]),
    .reg_d_ex_is_reg_a_i(in_vec[12:12]),
    .reg_d_ex_is_reg_b_i(in_vec[11:11]),
    .reg_d_ex_is_reg_c_i(in_vec[10:10]),
    .reg_d_wb_is_reg_a_i(in_vec[9:9]),
    .reg_d_wb_is_reg_b_i(in_vec[8:8]),
    .reg_d_wb_is_reg_c_i(in_vec[7:7]),
    .reg_d_alu_is_reg_a_i(in_vec[6:6]),
    .reg_d_alu_is_reg_b_i(in_vec[5:5]),
    .reg_d_alu_is_reg_c_i(in_vec[4:4]),
    .id_ready_i(in_vec[3:3]),
    .id_valid_i(in_vec[2:2]),
    .ex_valid_i(in_vec[1:1]),
    .wb_ready_i(in_vec[0:0]),
    .ctrl_busy_o(out_vec[99:99]),
    .is_decoding_o(out_vec[98:98]),
    .deassert_we_o(out_vec[97:97]),
    .hwlp_mask_o(out_vec[96:96]),
    .instr_req_o(out_vec[95:95]),
    .pc_set_o(out_vec[94:94]),
    .pc_mux_o(out_vec[93:90]),
    .exc_pc_mux_o(out_vec[89:87]),
    .trap_addr_mux_o(out_vec[86:85]),
    .hwlp_dec_cnt_o(out_vec[84:83]),
    .hwlp_jump_o(out_vec[82:82]),
    .hwlp_targ_addr_o(out_vec[81:50]),
    .data_err_ack_o(out_vec[49:49]),
    .apu_stall_o(out_vec[48:48]),
    .irq_ack_o(out_vec[47:47]),
    .irq_id_o(out_vec[46:42]),
    .exc_cause_o(out_vec[41:37]),
    .debug_mode_o(out_vec[36:36]),
    .debug_cause_o(out_vec[35:33]),
    .debug_csr_save_o(out_vec[32:32]),
    .debug_p_elw_no_sleep_o(out_vec[31:31]),
    .debug_wfi_no_sleep_o(out_vec[30:30]),
    .debug_havereset_o(out_vec[29:29]),
    .debug_running_o(out_vec[28:28]),
    .debug_halted_o(out_vec[27:27]),
    .wake_from_sleep_o(out_vec[26:26]),
    .csr_save_if_o(out_vec[25:25]),
    .csr_save_id_o(out_vec[24:24]),
    .csr_save_ex_o(out_vec[23:23]),
    .csr_cause_o(out_vec[22:17]),
    .csr_irq_sec_o(out_vec[16:16]),
    .csr_restore_mret_id_o(out_vec[15:15]),
    .csr_restore_uret_id_o(out_vec[14:14]),
    .csr_restore_dret_id_o(out_vec[13:13]),
    .csr_save_cause_o(out_vec[12:12]),
    .operand_a_fw_mux_sel_o(out_vec[11:10]),
    .operand_b_fw_mux_sel_o(out_vec[9:8]),
    .operand_c_fw_mux_sel_o(out_vec[7:6]),
    .halt_if_o(out_vec[5:5]),
    .halt_id_o(out_vec[4:4]),
    .misaligned_stall_o(out_vec[3:3]),
    .jr_stall_o(out_vec[2:2]),
    .load_stall_o(out_vec[1:1]),
    .perf_pipeline_stall_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 300'h8f81a5f6a2b5124dae0505815f0777dfb14e1728ecd9a3f9e8f23cec9e01b4aa0c90c91f049;
    stim[1] = 300'h363aafd7edfa49b9d66eff808a0b768efbb541f27d62327b0641ac0728343be9f022682dfef;
    stim[2] = 300'h7ac11801d4139cc03f56c332c08bfbd3ba3855ce8446e128fdce3885abd38cf9ad23caa834a;
    stim[3] = 300'hdbf06049023236698eb29a041d019e684550fe742c28594460f2b686ebab94a5cc639c7fbcd;
    stim[4] = 300'hc0390d6b99de73d2d2791d21e38153e3e5b86bce2d2eda40f69a6454d22b22737244858e487;
    stim[5] = 300'he0ca1c6a6d3a9b42ffe5bc2a9339d64fde69a4a1371d8835f0007232c14cd54e433b306bb91;
    stim[6] = 300'h4bdb8aa177a8e093e7bbeedd51903fe5ddf97222a793775501722fcf4114af4d71aa7a06fab;
    stim[7] = 300'hf867c0390602415f2722077ebf49737e4c40e1e9a1c7ff8d801dc3eab832f5fbc9d9d6719b0;
    stim[8] = 300'h49584fa205c8278767dd7c7e1107e0d671fc7f1749b1f99d9e73c7ec8c9cbd84bb879d78ef2;
    stim[9] = 300'hc95741e760621efa7c176532f547a02a330ef0a2974cd730b34b35e070e8334ba19f97e37fc;
    stim[10] = 300'h6618308e82a7f9b745c454d15213aef7e471520c0dd4cd277f473cdf5b2aca02362ccea35ae;
    stim[11] = 300'he504324657d70c76cab7cdf00188bd8236ac1a3df66ef43870f6d64a6498ac1a8160b1b1ea2;
    stim[12] = 300'h750f26e4bd6e3808e229831c716e61685985cd145447321c333531a266501690eec822a8c28;
    stim[13] = 300'h7b8cada75a8a9f50c2fdeca1b0775469dfc1b3ead70eaefc014a5e6231435a414db862e5b46;
    stim[14] = 300'h66aa92c3e93b6da4fce2f9efb00e6e8626636deefb376424814de347288fa9de68a5a6b33b4;
    stim[15] = 300'h79ea3a5e5c9d2a70eb2a527700f77df3866f3877a1af4cccea3385ac22354aad7b35a336522;
    stim[16] = 300'h5b88e73bee800b5c256c1d2e8932b1a4377766d93529b7ba4892bf4775159f0d7cd9cd42103;
    stim[17] = 300'hc330b008f8415741fb07630b75161f67cec98b3edde10908dac89e53f0c7e423f2d34ace162;
    stim[18] = 300'hdbe4d05a4e4ceb204553f24854549b06c952102c90551dcb1d43f1f1623ccfe2b4636b06662;
    stim[19] = 300'h798ade4f3f73d58496227fc0bcb9dd8a967a4fa7c61c211c8ead985bd16b0dbd34caf8ddebd;
    stim[20] = 300'h45fce44d6c960a42a0e4224c6d4c88ba15352a049551be7e7d4a89bde2cc33abd57d9ef68c3;
    stim[21] = 300'hc958922335317131df665291cd48b46926950c0b2f2ec71aae5966ab9bf721b94fc8534c508;
    stim[22] = 300'h4aba37853abc438b2f591fbe7f8eb03b59b1933c1fc1cf0c322dc7b388c0b4bbb5acd6b72d5;
    stim[23] = 300'hea9dd58ef5991120643348881ea294cf480de074f15041a94f553c2f02ae7dcc8c865f0e899;
    stim[24] = 300'hd77d8af75ce1d6413180eba151325e8b2271e8a65c8a410245d4739034adbd1907a62f5fb57;
    stim[25] = 300'h7a380fdca87fc0bac9aa04df68510d09fe1451bb1ca3750052291057818471e48c4a11b0701;
    stim[26] = 300'heeb960e92b802a6888e913a471898bc44b2bf3a8fcacc466579bd7b4efb388ef370f0cb39f1;
    stim[27] = 300'h790217569932e09e1a5265f4a11ad2e2e4d2f2c59073625d9c74e9b5e2e2a9ab207fab8b865;
    stim[28] = 300'hcfd9b39effe6375be7f24d3cdd8053faa9dfb8ed0835e99ec9ec26471adfedab825bb659c57;
    stim[29] = 300'hc862eb04da7e086fb5e6767980805c3febc874e4e203b9e00a3ec3d5f6bb6fba8d7de8f4385;
    stim[30] = 300'hcd080639f5b528d811c9bbd0207deeba0afa9ce445fc95958a7a8737f29054c2c29955ced15;
    stim[31] = 300'h55644b554d8a97dd4d257623be150b9224280738d3502f3f8c6ae0ed2755225f108eaa0ea03;
    stim[32] = 300'hd302c2d28e7045be23d33dde9655db39c875930181ab1de57d29b3e9dda06e707ac25f72639;
    stim[33] = 300'hd89dab9e7d0df31b17b2c17364ace8509b48a8fb8e5f01bbbd50cd0fc3749ec7f8f6bb56652;
    stim[34] = 300'h76f276af37602521a7e1f3848ba892615cf21e94265125d34298928fef6df3cbd4931c0c86e;
    stim[35] = 300'hc06beb62e150839f2c3938e6df371c30dab7792ef37f46fcdb2275ff0002572e27deadad3ca;
    stim[36] = 300'h51c51c58d26e02ef6410d2a18fc58e0805d308231c633821f11a1888ef56ee25acfb5ee8195;
    stim[37] = 300'hfff81e1abb0183208f0e02f3c05c5be1217ed13326c2fca5e9bbed077c3e06ed31541800831;
    stim[38] = 300'h6e375ea69bad13be3ed9bfc0c585c0b81c55a57da4664d1fb1defc1d2e39634f345418da3a2;
    stim[39] = 300'h4fd689870e20718f412f7f4137193a1376b0afe478623ede00c9e694a50117fe4c3fbee3c6b;
    stim[40] = 300'hc0bd651818c8c39ae064a967f1a42eb84bbc8eb0114e5e18bfc0e3395e17899f64b6cdb3b9d;
    stim[41] = 300'h613099dd53cdf8edefa64956e2376d8f1a6d01ae98fec05c09a04e89d77711ffa74b52c2b53;
    stim[42] = 300'h4dc486262c991f6479e7cf26d9e454155a3aa9f2905196571ed6aa6c2fef97e7770265f33b7;
    stim[43] = 300'h6eb521bb4a5acdd7d2839af27612a0efef1041aa2a8ec96577506fb4ad865f30d4d912f531b;
    stim[44] = 300'hce7690e161aa80a97758a6ca68559f7f8d6586891e0ae97d9e3bcb38c0b6e9527b3a597bfba;
    stim[45] = 300'hd985f939d30727f2de961c33578ecf2cc3a50227e8d270a6c08e882c2d2c16565b336c97601;
    stim[46] = 300'hcb0f7b7dcaa28e44c64c258cb2306d9d9ac4ac75292d7e9c21fae2feff410868b5b5bd754a7;
    stim[47] = 300'hef3d8a3d902e0741caa66458c941c24bade5f8c49a02a0f2d4d0f65008e2aaaa7bb004c6dbf;
    stim[48] = 300'h478389f884e49e333b2e25d2ab7c9ae0561a6b118615b4777f7d669a75505560e49715323c8;
    stim[49] = 300'h6b3970840bf8dcbdd2e748830de50c906387baceb05bdfbb6ada2d4bdbeb265bb65e94dacbc;
    stim[50] = 300'hcc1f703fb63a36fae0810a9f25c5397a885415408c84fcae3e24b80fa4a7db206acdf387452;
    stim[51] = 300'hdf8d4b6a721bdd8fcd81632b699fb9eecac6db4d69002c3d1f6be13674257cdfeeefa3c6c32;
    stim[52] = 300'hc97f7b6665ef2fac7ca5709b4646ebc40f08f876733a09c080920205977ea823e0892f95d92;
    stim[53] = 300'h49e5d0a83bece87dfd0c820ee07d369a42e433a5767b6bdaa22382af73837e7564ab990df4c;
    stim[54] = 300'hde46c659bdcfa55c33a67402f83c78c6a3a6df7f26772a22b196e394b3474b72969d0342cea;
    stim[55] = 300'h7ab18f935f1f675b8657e0e34cc8ede6d5d4e7b70ffe0e52c9f4672f6a90311af43fa9ddb17;
    stim[56] = 300'he2c0ac22425bc0d92c743c2c6233d5d606e10a5ba1a417a66dddfcdbc86f96f0e8e2472cfd5;
    stim[57] = 300'h64dbd90a66cc464d7e690e3f74ceaf64a5b12a03ea154e3c8386241844d8f5fa2a1ffd9e611;
    stim[58] = 300'headf98f2c65ae078efaf6c80e0e363d0216b4f2d6168f891565a31a736c76282a460863e661;
    stim[59] = 300'h62384fe6b8583b3dd2d7842596a8f29b6cfd19e9df578db787eb195b43d4e8bd56d0d4477a3;
    stim[60] = 300'h55e75c0bcba1ae8d20e9030d27d95d0bb6087efb1c7e2e40ed2078d5ff5d1c122589addf60d;
    stim[61] = 300'h609b3db5ff6773ae566b4402bd6322fd180ba5025e3d1881e1fc867c3536c20031cac8c1ec6;
    stim[62] = 300'hd78147ccc150d961eded92b038258fc963ca12ef286ba7f9c3ef24c961fcf7529054cae885b;
    stim[63] = 300'hdd45b6180a85ae4b7b1d9d36bd141f4faafb29197b6cdbc6fe02ebe981daee1b24e565d6635;
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
      expv[0] = 100'ha00805815f0740002e0000404;
      expv[1] = 100'ha00809b9d66ed0002e4000488;
      expv[2] = 100'ha0080332c08bd0002e4000408;
      expv[3] = 100'hac081a041d0180002e4000680;
      expv[4] = 100'had101d21e38150007e6001080;
      expv[5] = 100'ha8083c2a9339d0012cc000041;
      expv[6] = 100'ha8082edd519030012cc8a14ba;
      expv[7] = 100'had00077ebf49500b2cc000072;
      expv[8] = 100'ha8083c7e1107c0012cc000409;
      expv[9] = 100'ha8082532f547b0012cc8e1572;
      expv[10] = 100'had0014d15213800f2cc00043c;
      expv[11] = 100'hacc80df0018880012cc000408;
      expv[12] = 100'hacc8031c716e40012cc000000;
      expv[13] = 100'ha8082ca1b07770012cc8e143a;
      expv[14] = 100'had0039efb00e500f2cc00047e;
      expv[15] = 100'ha808127700f760012cc8a143a;
      expv[16] = 100'had001d2e8932800b2cc000438;
      expv[17] = 100'hc8081741fb0750012cc000520;
      expv[18] = 100'ha80832485454b0012cc8a143e;
      expv[19] = 100'had003fc0bcb9c00f2cc0004b8;
      expv[20] = 100'ha808224c6d4ca0012cc8e1472;
      expv[21] = 100'had001291cd48800f2cc000272;
      expv[22] = 100'hacc8038b2f5900012cc000442;
      expv[23] = 100'he80808881ea290012cc00046a;
      expv[24] = 100'ha8082ba1513240012cd04047a;
      expv[25] = 100'had1804df685110032cc000070;
      expv[26] = 100'ha80813a4718990012cc000448;
      expv[27] = 100'ha80825f4a11ac0012ce02043a;
      expv[28] = 100'had180d3cdd8040012cc00043a;
      expv[29] = 100'hacc83679808040012cc00048c;
      expv[30] = 100'ha8083bd0207dd0012cc000241;
      expv[31] = 100'hacc83623be1510012cc000802;
      expv[32] = 100'hacc83dde9655d0012cc00044a;
      expv[33] = 100'ha808017364acf0012cc8e147a;
      expv[34] = 100'had0033848ba8900b2cc000072;
      expv[35] = 100'ha80838e6df3730012cc8e1a76;
      expv[36] = 100'had0012a18fc5900f2cc000438;
      expv[37] = 100'ha80802f3c05c70012cc8a1030;
      expv[38] = 100'had003fc0c585d00f2cc000170;
      expv[39] = 100'hacc83f41371910012cc000544;
      expv[40] = 100'hacc82967f1a400012cc000448;
      expv[41] = 100'hacc80956e23750012cc000440;
      expv[42] = 100'ha8080f26d9e470012cc8e1170;
      expv[43] = 100'had000dd7d283900b2cc000438;
      expv[44] = 100'hacc800a9775890012cc000448;
      expv[45] = 100'hacc81c33578ed0012cc000804;
      expv[46] = 100'ha808258cb23050012cc000488;
      expv[47] = 100'ha8082458c941e0012cc8a1478;
      expv[48] = 100'had0025d2ab7c900b2cc000470;
      expv[49] = 100'hacc808830de510012cc000140;
      expv[50] = 100'ha80836fae08130012cc8e147a;
      expv[51] = 100'had001d8fcd81500b2cc00047a;
      expv[52] = 100'ha808309b4646d0012cc00048a;
      expv[53] = 100'hacc8020ee07d10012cc00040a;
      expv[54] = 100'hacc83402f83c50012cc00040c;
      expv[55] = 100'hacc820e34cc8c0012cc000a44;
      expv[56] = 100'hacc83c2c6233d0012cc000a80;
      expv[57] = 100'hacc8064d7e6910012cc000844;
      expv[58] = 100'ha8082c80e0e360012cc8a1536;
      expv[59] = 100'had00042596a8c00f2cc0004b8;
      expv[60] = 100'hacc8030d27d940012cc00040c;
      expv[61] = 100'ha8080402bd6320012cc8a1030;
      expv[62] = 100'had0012b03825900b2cc000072;
      expv[63] = 100'hacc81d36bd1400012cc000448;
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
