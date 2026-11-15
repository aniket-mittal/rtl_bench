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
    stim[0] = 300'h3e1fcf29df813f05c30b97d40af7da8060f15ef69321078fff58a1aa1cc28097c07607f333b;
    stim[1] = 300'h035cd676e1a189f3fa0d6d9e65235182d6b1a422de6681618f110f91587d236f5a9a97001b3;
    stim[2] = 300'hdec8d939a88a83aeecdf62ec805fe660631be967531400c1929c726c3598435e7a5892845ba;
    stim[3] = 300'hc1da5dcccd46a4850447d608432d8ba6b61803d92a51d74115cc4056afd35bceffba2dd7c5f;
    stim[4] = 300'h4c09ec477d49cf220960c87817be53f5940306d51ba071a79dfa59a1beb8e30a5ee0f0ea394;
    stim[5] = 300'hcf74aea1a3b78693decf8c378c1be932c3a8c53f04c1a8d4fd6e3439e8105e6a7c844833f29;
    stim[6] = 300'heb8b33f060ea8ee8db6d42fdeb4bf089990b53a04f4099635a5919f5ac1308fe02696404088;
    stim[7] = 300'h4e5bab830a160a20414ea1fc8d8f620d73014df384a2fe717f9947464c0cf0ef67629101a05;
    stim[8] = 300'h6328aad8292dadec3ecc560caeae1e7d2e76e507e457ffad6e10ecd409a36f3e54fad441e75;
    stim[9] = 300'hcabd6dec10fc35bda51de3910fa2804af49bfb35599c503675d038057132e28ac6500ba3b2b;
    stim[10] = 300'hfe70e73c2b05f44199c04a051a5aac7c54a05a048c85d44e92ebdbd2484eb7a8d2e9d571e49;
    stim[11] = 300'h48af5ea05f1fb390e6b7dbc7d867f6b3a054c7219d4bee6918845ad25aea59959cd5ff4f52c;
    stim[12] = 300'hc6744184986c989ce7df7536e2e48cf58ec42679858de4516850b239110818a15943eeae1b0;
    stim[13] = 300'h7dc4856345a413869bcc792a7f81205edd46d1075461d39b67bf2d39797c7661c35de78335f;
    stim[14] = 300'hec4b017f81b6f8a1c2b5f3a8931e0e28ea0362b531efbd5e4b37226d3b93e8b07567e785812;
    stim[15] = 300'h61df0e5c7deacc0203d84b19d8963ebc15511a85b7fd749d7aa15350b4cbaad3747503c06f7;
    stim[16] = 300'he681b31ab1f1e275549875dd7acb93c03238747245313bd3ad340cf366108439f6b30aa43db;
    stim[17] = 300'h11c1ed858330e6f2ea95234ed3fb61010d9a165e78c0c70f05d5bccc1721759ef8cca2878ac;
    stim[18] = 300'heb96f775f3830758606f5db0168905fd697260453871b6bbd6cc6125f25226a0c7a5d49ce82;
    stim[19] = 300'h4d0a916108517b51e71426d09509ffeb390f3cf2c11b2105e742dab46d6b61084124dedccf8;
    stim[20] = 300'heb57bfd132769eab5a2129a11b3de76daff82f9fa7548084a3752e3ee9f6a1a7eacf0edc5d9;
    stim[21] = 300'he1d51ea18d9339bc7f16377989282498d381d6472b9f18fe28c41a002a454258b18c2c25cff;
    stim[22] = 300'h6179fbf175b1daa47a0446352253c17289a2daea0f2b359aae0f171c3cbd2b86589b30b44dc;
    stim[23] = 300'he9ad6694ce5525ab16d414d4cf91c60b5bb5f8f2cbc74b1ee08057642c0ba4ddd0e2fcc1764;
    stim[24] = 300'h51fda661a84e884046eb013240b909e00d7d7958110038e44b3688ad0602c29be714d1d53da;
    stim[25] = 300'h566467e741f075f47f057c1eae467516a7b1071157d3571d12e0f218bfb91c1c1e097246d07;
    stim[26] = 300'hf2ede14866d1156d74e87fb428d0edaada64e635c1bcfd6c08456fbd6342f3d90b9b3f5f6f1;
    stim[27] = 300'h6e3219017689bb522ff763a5058dcdb01f7b9ba8f5cd3cfadfc3a460e253df735f85acce138;
    stim[28] = 300'hda35a365c57ca531a43389f804a241842558a7a0a4ec2644e9190d7d28f1eff8206ba1631ca;
    stim[29] = 300'h705e07ed2254f097c966e690e25b74635ec71c8a5747adefd966dcb4c7ea3c9fcc862f51879;
    stim[30] = 300'hf226664f0f7b86a7b95bb1fd4d3c781ce28eb06bedc93c713ace0ffda86c649dc4684e88191;
    stim[31] = 300'hc2a0f4657c04a72c9f988de591ced2b8847c17371a2abe77f9fd7353a044ec0c8e18b9899ab;
    stim[32] = 300'h50d966f1c0ba55be049cc96ac103958596e5a468d37befe8baf21f3adf9c1cf868f677db9c7;
    stim[33] = 300'h6f475c5379b073882d921f2c07fe2df08532a6b98c35e0f031bb9fd9692c76d19fe9bae1460;
    stim[34] = 300'h62d42d0ffc3640dc4976bdc857442a9447372cb6855213be08b9ea02d9acacc561bba1fc25b;
    stim[35] = 300'h712e91cfb14804a293ad03ceef7411306abba575bf9405b7bc1f38bfc790b8e3a9d7e26c2e2;
    stim[36] = 300'hdbe25c878d3c1312e17bda40cf9b9e42998194a95319d8fe969c8117a2e6b14a42e3aa656f0;
    stim[37] = 300'hcb7f273e434b72d1c6f743cfca18bbf5cd4cee7929debc4630f6e9bf98baac226e80f9b96cd;
    stim[38] = 300'h7d23836cd0bdab3685e584de2723817b4e934dec024884e08e22c95ffb2fc85864e1763ddd0;
    stim[39] = 300'hf39b347fca7a858392af1f94e2435a354091bb093a499f95b9457951bc3687f5593e8db47b7;
    stim[40] = 300'hf1bc050572a11b359e618c448076cf6a38b43a59a5cacae6936aa0ca095629cc54a9bc454c8;
    stim[41] = 300'h41e14e090fdd0b953d1901753154e08bf00649e082b775b71e556e32ebc4420e8b4b2bd7b15;
    stim[42] = 300'h6dc6c1a0d72125466ba50aafd521fef9a30d62ada8a2bb8f81e05e2d7078a874d810ec462ae;
    stim[43] = 300'hd0a7d6f0212625cd49cfd36c69e76cefdee3af341b021ef0f1445011d105726bae6ea644dab;
    stim[44] = 300'hc60633010b537cf1dd9392f330022f9083b1d5c418de77f34025224e9b99ac7df041b58209b;
    stim[45] = 300'h6250d920174bf381ee7b354fd517b55fab9aa5dd840e9c932a4b7e054f770459955ce1fd6b4;
    stim[46] = 300'h51e0b9ad51557a02fdda5501ce44eb162f95ab002b5b63c72232e7e0e9c58995285ee938eab;
    stim[47] = 300'h40d9fea5679e389ff388e6d0ad53f809a97d3c08005761672a8d0eb02b377ff784601407cfc;
    stim[48] = 300'h6b56af8621024d3039ebfc3e79c004a908e4314061d05caf202f3a4192beb0505a066620e99;
    stim[49] = 300'hc5e40a282d470410374c335999f9fdd1916bc786cbf99035f518c19461ab9a400e1cc03fe47;
    stim[50] = 300'h45fc2e515c4620c423eb02ee158f5f52e7b942bcfa595ba10154124f1d8d4f8dfe8ec5342b8;
    stim[51] = 300'hfadfcee17f8e2c40132ded114cd1e552663be23ab37cfbcd1001500cc196609a2711f2d941e;
    stim[52] = 300'h40f65119134aa83caf3465194102834ef859152a0afbf5070e80d00ffaae5b39d6428601267;
    stim[53] = 300'he572d480eeafcd71c6cce6f8fc3b852e2fa3cea915d330fcf3d0b3e3c61facdd63bbf697a9c;
    stim[54] = 300'hde4e87a813a9d7af7edf66137d8859178b55d47c97dbbc6f5a60169f695b60f7fc5af520e7f;
    stim[55] = 300'h4b0e6ad1ef092f70d0c72a15626266e613d64ecd97d7ef7071e8f06e52d17973c9d9eb7009f;
    stim[56] = 300'h6d82432fb6b95f7932d50a83c322e2e3b5e6aa260d820e76cd90aa7039c23032053b311cd9d;
    stim[57] = 300'hf8facdb347d5a3d1239f319a1d27797ad1d8216b63a13f08ced6c799dd7b788bc41aea0c93a;
    stim[58] = 300'hd408c00951f9cc99d5a040d8d84a3df56b3efc062de520ace8c122e366904ed149a3969f268;
    stim[59] = 300'hda217c9d9fe3f123e4588e154c9449551d06588711488f1e0d02ee1830bbe818d225f7f6076;
    stim[60] = 300'hd47322f83b5bc5a533c440b71bb232585a53bb4932ca8ca1e03d6b155dfa8472827adcb6e8d;
    stim[61] = 300'haea1af9b75d1f1e06ff95701eb63bc63c9db35b914188b55f8bc1dd2f162cb148a957c7f7e6;
    stim[62] = 300'hf8a9745633003335cc41ea8d604652976b43fc779e496880166fc2b670cc1105bb7127060a8;
    stim[63] = 300'hc4bd42a762d85978608066b6e4ce39833a313efdf18ece599e9ea82eb09e243ff778a339918;
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
      expv[0] = 100'ha00817d40af7c0002e4000140;
      expv[1] = 100'ha0082d9e652350002e0000040;
      expv[2] = 100'ha00822ec805fd0002e0000242;
      expv[3] = 100'ha0081608432d90002e400044c;
      expv[4] = 100'ha008087817be4000264000040;
      expv[5] = 100'ha0080693decf9000220000408;
      expv[6] = 100'ha0080ee8db6d5000264000488;
      expv[7] = 100'hac080a20414e90002e4000000;
      expv[8] = 100'had10160caeae10007e6001408;
      expv[9] = 100'ha80823910fa2a0012cc8a1136;
      expv[10] = 100'had000a051a5a800b2cc000070;
      expv[11] = 100'hacc81bc7d867c0012cc00040a;
      expv[12] = 100'ha8083536e2e480012cc000448;
      expv[13] = 100'ha808392a7f8130012cc8e1472;
      expv[14] = 100'had0033a8931e000f2cc00043a;
      expv[15] = 100'hacc80b19d89610012cc00040a;
      expv[16] = 100'hacc835dd7acb90012cc000a80;
      expv[17] = 100'ha008234ed3fb4000220000146;
      expv[18] = 100'ha0081db0168900002e4000882;
      expv[19] = 100'hac0826d09509c0002e4000042;
      expv[20] = 100'had101eab5a2100007e6001242;
      expv[21] = 100'hacc83779892810012cc000080;
      expv[22] = 100'ha80806352253e0012cc8a14ba;
      expv[23] = 100'had0014d4cf91d00f2cc000030;
      expv[24] = 100'hacc8013240b900012cc000a82;
      expv[25] = 100'hacc83c1eae4640012cc000408;
      expv[26] = 100'hacc83fb428d0d0012cc000542;
      expv[27] = 100'hacc823a5058dd0012cc000448;
      expv[28] = 100'hacc809f804a250012cc000408;
      expv[29] = 100'hacc82690e25b40012cc00040a;
      expv[30] = 100'hacc806a7b95b80012cc000000;
      expv[31] = 100'hc8080de591cec0012cc000428;
      expv[32] = 100'ha808096ac10390012cc000438;
      expv[33] = 100'had001f2c07fe10012cc000032;
      expv[34] = 100'ha80800dc497690012cc000409;
      expv[35] = 100'ha80803ceef7410012ce0204b8;
      expv[36] = 100'had181a40cf9b90032cc000876;
      expv[37] = 100'ha80803cfca1890012cc000409;
      expv[38] = 100'hacc804de272390012cc00048a;
      expv[39] = 100'hacc81f94e24350012cc000a40;
      expv[40] = 100'ha8080c448076d0012ce0204ba;
      expv[41] = 100'ha80801753154c0012cc000a74;
      expv[42] = 100'had180aafd521d0012cc000488;
      expv[43] = 100'ha808136c69e770012cc8e12b2;
      expv[44] = 100'had0012f33002100f2cc000478;
      expv[45] = 100'hacc8354fd51790012cc000882;
      expv[46] = 100'hacc81501ce44c0012cc000408;
      expv[47] = 100'hacc826d0ad53d0012cc00044a;
      expv[48] = 100'hacc83c3e79c010012cc000002;
      expv[49] = 100'ha8080410374c30012cc8e1438;
      expv[50] = 100'had0002ee158f400f2cc0004b8;
      expv[51] = 100'hacc82d114cd1c0012cc000006;
      expv[52] = 100'hacc82519410290012cc000408;
      expv[53] = 100'hacc826f8fc3b90012cc00044a;
      expv[54] = 100'hacc826137d8850012cc000000;
      expv[55] = 100'hacc82a15626250012cc000408;
      expv[56] = 100'hacc80a83c322d0012cc000280;
      expv[57] = 100'ha80823d1239f00012ce02043a;
      expv[58] = 100'had1800d8d84a10032cc00043a;
      expv[59] = 100'hacc80e154c9440012cc000448;
      expv[60] = 100'hacc800b71bb210012cc000884;
      expv[61] = 100'ha0081701eb6380002e000048a;
      expv[62] = 100'ha0082a8d604640002e4000140;
      expv[63] = 100'hac081978608050002e4000002;
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
