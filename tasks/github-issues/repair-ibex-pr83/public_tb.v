// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 181;
  localparam OW = 100;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ibex_cs_registers dut (
    .clk_i(clk),
    .rst_ni(in_vec[180:180]),
    .core_id_i(in_vec[179:176]),
    .cluster_id_i(in_vec[175:170]),
    .boot_addr_i(in_vec[169:138]),
    .csr_access_i(in_vec[137:137]),
    .csr_addr_i(in_vec[136:125]),
    .csr_wdata_i(in_vec[124:93]),
    .csr_op_i(in_vec[92:91]),
    .debug_cause_i(in_vec[90:88]),
    .debug_csr_save_i(in_vec[87:87]),
    .pc_if_i(in_vec[86:55]),
    .pc_id_i(in_vec[54:23]),
    .csr_save_if_i(in_vec[22:22]),
    .csr_save_id_i(in_vec[21:21]),
    .csr_restore_mret_i(in_vec[20:20]),
    .csr_restore_dret_i(in_vec[19:19]),
    .csr_cause_i(in_vec[18:13]),
    .csr_save_cause_i(in_vec[12:12]),
    .insn_ret_i(in_vec[11:11]),
    .id_valid_i(in_vec[10:10]),
    .is_compressed_i(in_vec[9:9]),
    .is_decoding_i(in_vec[8:8]),
    .imiss_i(in_vec[7:7]),
    .pc_set_i(in_vec[6:6]),
    .jump_i(in_vec[5:5]),
    .branch_i(in_vec[4:4]),
    .branch_taken_i(in_vec[3:3]),
    .mem_load_i(in_vec[2:2]),
    .mem_store_i(in_vec[1:1]),
    .lsu_busy_i(in_vec[0:0]),
    .csr_rdata_o(out_vec[99:68]),
    .m_irq_enable_o(out_vec[67:67]),
    .mepc_o(out_vec[66:35]),
    .depc_o(out_vec[34:3]),
    .debug_single_step_o(out_vec[2:2]),
    .debug_ebreakm_o(out_vec[1:1]),
    .illegal_csr_insn_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 181'h041a7f198f49f3cee5543e982b7f5dad0c6afe43583c27;
    stim[1] = 181'h085d1c24814e92a8b6cfdbaa5d35d729415046011f94b6;
    stim[2] = 181'h12576c27734797df7530f1e69e7dd1c6d39270b501873d;
    stim[3] = 181'h1f113a20423e68291626dc2600089a8997bb660dbfe8c0;
    stim[4] = 181'h14f602ef979e639cf9894c75ef8841fa53b14aae49fbb7;
    stim[5] = 181'h17acde9b4b21da8c3d3e75007d339cec7279f490da36b6;
    stim[6] = 181'h11391f88e7b60c43bb0036ead630d177f00d2c5219cb1c;
    stim[7] = 181'h1665c6a4d0fbfe62f3a91543abff983251833299124307;
    stim[8] = 181'h1612104fdfda4e30e5f81a8cf93c3fa951fd689a8361b9;
    stim[9] = 181'h127c8c72d89decd08dbedfc1234fc5fd71b28c22a2ee12;
    stim[10] = 181'h1440e0a8549b891bab9959a43922898bab940121f5b390;
    stim[11] = 181'h1793d2912720839f4c82a2d824f3aa054f03cef80a3fd5;
    stim[12] = 181'h1930a585c5c41081fd3bb885a56d8c4539c38913d874d3;
    stim[13] = 181'h1aed5a67f2dff4f3496e378c89db53fa87817965be361e;
    stim[14] = 181'h1dc173b6b37e4e43a285ebbe066b472e756b6b97d63141;
    stim[15] = 181'h140d83976e71bd01b5c0c01c336ddae78776b88e1e0762;
    stim[16] = 181'h1dba6a0c6f1d2b464c9e027f4a059eb360689bf7b3a69f;
    stim[17] = 181'h10ec670b56e815d36f850c54e15c897ec628b6dc1ff48b;
    stim[18] = 181'h1f359e1c5c70157432a45e5a6b36381678e3b21320432b;
    stim[19] = 181'h13e9a819246128cc371576eac35224586bd7cfe54a74d0;
    stim[20] = 181'h161ccc16df923e6ae1968ad31b38a2cb95f532031c79e8;
    stim[21] = 181'h1086c2035b926fa8a1005d3ba3f43f759d470e5b5983f4;
    stim[22] = 181'h1d27e6205dbe6d9e856472418e8ec4b5f4492e2c88c2e0;
    stim[23] = 181'h195366d406d3e5bc87e81442e56c3f33f6efbcc60212c9;
    stim[24] = 181'h1e13a419723570783ac35a2f1b5154bf53e4231ad52bcf;
    stim[25] = 181'h1bb56d3d255a37d4ee946987977850e6ef35932e659955;
    stim[26] = 181'h122d43850321ccca8b9bbf5cdd6e1c979aa3dd36e784e4;
    stim[27] = 181'h1c66909b428de5010bf013eb26c01e78e0e7a0f09545c8;
    stim[28] = 181'h10e3bc26e2467c30e09945e64ea087073adef82c33b2b6;
    stim[29] = 181'h1806a879933c6ad8878722d4b8041e15ffaa15b31f2565;
    stim[30] = 181'h12a2a9cdf36aa2945aa5caf646411ae73e3afe08f371b6;
    stim[31] = 181'h1186caaab50dc2163211611e7697758811aa84a520fa03;
    stim[32] = 181'h194b1c8cd94609664c8817a521636c1a4f9c3896387a82;
    stim[33] = 181'h1f782a6f4b20fd0250dd9a6896be31d0b923d70999e476;
    stim[34] = 181'h1b4b19895291d418ade90c9116100e4f00a81cf18a5e28;
    stim[35] = 181'h11e94817df65f92678b1acbf7c9e8450e7cffa366a69f2;
    stim[36] = 181'h17bcdd5a94e8033bbc9a47c8e2964050eaee52528aacf3;
    stim[37] = 181'h1a0b426c3bd2ff8e003964edde063a5b9c533495225d23;
    stim[38] = 181'h1fd8aef4fc26cbe6d6fd0d879dab9eeef77d3151fc8f5b;
    stim[39] = 181'h186c73ad1141b366f8658c4e1637a06738ced2bc536a23;
    stim[40] = 181'h19041a818538eece735b1880c803aa011b05e73bdaae8a;
    stim[41] = 181'h11262a3308da5dcc0518923df8ae20b28b23fba3c55a69;
    stim[42] = 181'h1e3f9661a3535df2a8a21a13248df97aa0252b9ea3f29a;
    stim[43] = 181'h16db791665780dba9272314867e1431a993e51060d145f;
    stim[44] = 181'h1ee2091a8640d6aae5e539e35d02b5f33d4486d58b160a;
    stim[45] = 181'h13ec6863e30ecb45a48055927bdeb5e8603485498eeeaf;
    stim[46] = 181'h1605d5fd1f6d703f01c62326dfa20336b0602fe44e9c6c;
    stim[47] = 181'h1ca31d03873361958cf247e7f299601e05033edd968738;
    stim[48] = 181'h13d9ebf7454dc54d1f7082ed57dff97d528482e5db6512;
    stim[49] = 181'h13b34049247000ae9ae3714d8bdf59ce9d86f5bc8f878b;
    stim[50] = 181'h1504f2c90a2b741ff03eacc48c44bddd220ae63067d3c5;
    stim[51] = 181'h1bd5da22621246f9d6856459f94b2a792c3290227f5dc6;
    stim[52] = 181'h1be5baeb1209637cf9a3368b0e14f26668a574a66dce08;
    stim[53] = 181'h1d7773081b4e15a4da537d0abad5ade1d9c559b349f913;
    stim[54] = 181'h1a5dae30d8470baadb46be4c45c3ad6e2bc352e3476fb4;
    stim[55] = 181'h1a7a2151fe48d0747c4a42f97e4bba8cdfbdf0a8f8075e;
    stim[56] = 181'h144e1b213a54f338b865654518c464b9fdb04a6100c7ee;
    stim[57] = 181'h13180ddf074f1f728d3561c5a7c5f9a22c63ca78e43a53;
    stim[58] = 181'h1e2779278b63e1341e5207101c8becfcab873eb8b14266;
    stim[59] = 181'h1b01ae13b7e779114cc140d86a3d018aa383b3639db636;
    stim[60] = 181'h1de4b68248cb15b32c4c1916a145609951851d3522c3ea;
    stim[61] = 181'h1265666e1f738683d236495bf44aae395b51e88e263710;
    stim[62] = 181'h1c59db9e513b4b2cc9323313d9efe32076c25642514fe7;
    stim[63] = 181'h1eb51c3240d4b40f2eaeee1a10815a950b8d13b0423b2a;
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
      expv[0] = 100'h0000000000000000000000001;
      expv[1] = 100'h0000000000000000000000001;
      expv[2] = 100'h0000000000000000000000001;
      expv[3] = 100'h0000000000000000000000000;
      expv[4] = 100'h0000000000000000000000001;
      expv[5] = 100'h00000000000000006f8841fa0;
      expv[6] = 100'h000000007d339cec6f8841fa1;
      expv[7] = 100'h000000007d339cec6f8841fa1;
      expv[8] = 100'h00000000fd339cec6f8841fa1;
      expv[9] = 100'h00000000fd339cec6f8841fa0;
      expv[10] = 100'h00000000fd339cec6f8841fa1;
      expv[11] = 100'h000000003922898bef8841fa0;
      expv[12] = 100'h000000004f03cef86f8841fa0;
      expv[13] = 100'h000000004f03cef8256d8c451;
      expv[14] = 100'h000000004f03cef8078179659;
      expv[15] = 100'h00000000066b472e078179659;
      expv[16] = 100'h00000000066b472e078179658;
      expv[17] = 100'h00000000866b472e078179658;
      expv[18] = 100'h00000000866b472e4628b6dc0;
      expv[19] = 100'h00000000866b472e4628b6dc0;
      expv[20] = 100'h00000000866b472e435224581;
      expv[21] = 100'h0000000015f53203435224581;
      expv[22] = 100'h0000000095f53203435224581;
      expv[23] = 100'h0000000095f53203435224581;
      expv[24] = 100'h0000000095f5320376efbcc60;
      expv[25] = 100'h0000000095f5320376efbcc61;
      expv[26] = 100'h0000000095f53203177850e69;
      expv[27] = 100'h0000000095f53203177850e69;
      expv[28] = 100'h0000000095f53203177850e69;
      expv[29] = 100'h000000003adef82c177850e68;
      expv[30] = 100'h00000000badef82c177850e69;
      expv[31] = 100'h0000000046411ae7177850e69;
      expv[32] = 100'h0000000011aa84a5177850e69;
      expv[33] = 100'h000000004f9c3896177850e68;
      expv[34] = 100'h000000004f9c3896177850e69;
      expv[35] = 100'h0000000000a81cf1977850e69;
      expv[36] = 100'h0000000000a81cf1977850e68;
      expv[37] = 100'h0000000080a81cf1977850e69;
      expv[38] = 100'h0000000080a81cf19c5334951;
      expv[39] = 100'h0000000080a81cf19c5334951;
      expv[40] = 100'h0000000080a81cf19c5334950;
      expv[41] = 100'h0000000080a81cf19c5334951;
      expv[42] = 100'h0000000080a81cf1f8ae20b29;
      expv[43] = 100'h0000000020252b9ef8ae20b28;
      expv[44] = 100'h00000000193e510678ae20b28;
      expv[45] = 100'h000000003d4486d5f8ae20b29;
      expv[46] = 100'h000000003d4486d5f8ae20b28;
      expv[47] = 100'h000000003d4486d5dfa203368;
      expv[48] = 100'h00000000bd4486d5dfa203369;
      expv[49] = 100'h00000000bd4486d5dfa203368;
      expv[50] = 100'h00000000bd4486d5dfa203369;
      expv[51] = 100'h00000000bd4486d58c44bddd1;
      expv[52] = 100'h00000000bd4486d5f94b2a790;
      expv[53] = 100'h00000000bd4486d5f94b2a791;
      expv[54] = 100'h00000000bd4486d5bad5ade19;
      expv[55] = 100'h00000000bd4486d5bad5ade18;
      expv[56] = 100'h00000000bd4486d5bad5ade18;
      expv[57] = 100'h00000000bd4486d5bad5ade19;
      expv[58] = 100'h00000000bd4486d5a7c5f9a21;
      expv[59] = 100'h00000000bd4486d5a7c5f9a21;
      expv[60] = 100'h000000002383b363a7c5f9a21;
      expv[61] = 100'h000000002383b363a7c5f9a21;
      expv[62] = 100'h000000002383b363db51e88e1;
      expv[63] = 100'h00000000a383b363db51e88e0;
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
