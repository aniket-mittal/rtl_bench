// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 248;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ibex_decoder dut (
    .instr_new_i(in_vec[33:33]),
    .instr_rdata_i(in_vec[32:1]),
    .illegal_c_insn_i(in_vec[0:0]),
    .illegal_insn_o(out_vec[247:247]),
    .ebrk_insn_o(out_vec[246:246]),
    .mret_insn_o(out_vec[245:245]),
    .dret_insn_o(out_vec[244:244]),
    .ecall_insn_o(out_vec[243:243]),
    .wfi_insn_o(out_vec[242:242]),
    .jump_set_o(out_vec[241:241]),
    .imm_a_mux_sel_o(out_vec[240:240]),
    .imm_b_mux_sel_o(out_vec[239:237]),
    .imm_i_type_o(out_vec[236:205]),
    .imm_s_type_o(out_vec[204:173]),
    .imm_b_type_o(out_vec[172:141]),
    .imm_u_type_o(out_vec[140:109]),
    .imm_j_type_o(out_vec[108:77]),
    .zimm_rs1_type_o(out_vec[76:45]),
    .regfile_wdata_sel_o(out_vec[44:43]),
    .regfile_we_o(out_vec[42:42]),
    .regfile_raddr_a_o(out_vec[41:37]),
    .regfile_raddr_b_o(out_vec[36:32]),
    .regfile_waddr_o(out_vec[31:27]),
    .alu_operator_o(out_vec[26:22]),
    .alu_op_a_mux_sel_o(out_vec[21:20]),
    .alu_op_b_mux_sel_o(out_vec[19:19]),
    .mult_en_o(out_vec[18:18]),
    .div_en_o(out_vec[17:17]),
    .multdiv_operator_o(out_vec[16:15]),
    .multdiv_signed_mode_o(out_vec[14:13]),
    .csr_access_o(out_vec[12:12]),
    .csr_op_o(out_vec[11:10]),
    .csr_status_o(out_vec[9:9]),
    .data_req_o(out_vec[8:8]),
    .data_we_o(out_vec[7:7]),
    .data_type_o(out_vec[6:5]),
    .data_sign_extension_o(out_vec[4:4]),
    .data_reg_offset_o(out_vec[3:2]),
    .jump_in_dec_o(out_vec[1:1]),
    .branch_in_dec_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h2650a6445;
    stim[1] = 34'h11d74cabc;
    stim[2] = 34'h2c5cc7bb8;
    stim[3] = 34'h2ab2f6dd2;
    stim[4] = 34'h1ecd675e7;
    stim[5] = 34'h29f0c4bd7;
    stim[6] = 34'h31e280899;
    stim[7] = 34'h3d70731cb;
    stim[8] = 34'h2bef89d54;
    stim[9] = 34'h130430704;
    stim[10] = 34'h075921e44;
    stim[11] = 34'h135b3712a;
    stim[12] = 34'h156da05b7;
    stim[13] = 34'h223a8abff;
    stim[14] = 34'h298766842;
    stim[15] = 34'h0cb00d3db;
    stim[16] = 34'h2e0e270b3;
    stim[17] = 34'h12dfc2dc1;
    stim[18] = 34'h383b83cd1;
    stim[19] = 34'h29efef306;
    stim[20] = 34'h301d054e3;
    stim[21] = 34'h110d8f434;
    stim[22] = 34'h0754b5ca1;
    stim[23] = 34'h26990423d;
    stim[24] = 34'h340a8bf59;
    stim[25] = 34'h136367c54;
    stim[26] = 34'h18ac065ef;
    stim[27] = 34'h0fa7986d0;
    stim[28] = 34'h29c5b41ea;
    stim[29] = 34'h1aca572f4;
    stim[30] = 34'h26cc7acc1;
    stim[31] = 34'h38c3c65dc;
    stim[32] = 34'h338272c33;
    stim[33] = 34'h3a6c2abd7;
    stim[34] = 34'h256b23610;
    stim[35] = 34'h2837457da;
    stim[36] = 34'h16c871960;
    stim[37] = 34'h2a98795f5;
    stim[38] = 34'h37b9ac5f5;
    stim[39] = 34'h16863b324;
    stim[40] = 34'h0ca23b33e;
    stim[41] = 34'h1a48745ac;
    stim[42] = 34'h205004b80;
    stim[43] = 34'h030239497;
    stim[44] = 34'h17accdfe5;
    stim[45] = 34'h266913b38;
    stim[46] = 34'h2f794677d;
    stim[47] = 34'h18abc6287;
    stim[48] = 34'h2b827e175;
    stim[49] = 34'h2e99a3ac5;
    stim[50] = 34'h069f67e89;
    stim[51] = 34'h2bcc9d9c1;
    stim[52] = 34'h37f75c401;
    stim[53] = 34'h1d31e6868;
    stim[54] = 34'h35de297c3;
    stim[55] = 34'h06099a75e;
    stim[56] = 34'h18ebddd4e;
    stim[57] = 34'h0c8619332;
    stim[58] = 34'h2774a6f98;
    stim[59] = 34'h18089c82c;
    stim[60] = 34'h36f87904d;
    stim[61] = 34'h3bb3c617e;
    stim[62] = 34'h241ede37d;
    stim[63] = 34'h206359842;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 248'h810000006500000064800000648650a6000000a66500000001494824f80000;
      expv[1] = 248'h811fffff1d7fffff1d5ffffe1d51d74c001fff4d1d400000028a8b54f80000;
      expv[2] = 248'h81000000c5c00000c7600001c74c5cc6000000c6c5c0000001898edcf80000;
      expv[3] = 248'h81000000ab200000a9a00001a98ab2f6000000f7ab00000001e9f96cf80000;
      expv[4] = 248'h801fffffecdfffffeebfffffee9ecd66001fff66ecc0000002d2c6acc80c00;
      expv[5] = 248'h810000009f0000009d6000019d49f0c4000000c49f0000000189985cf80000;
      expv[6] = 248'h811fffff1e3fffff1d1ffffe1d11e280001ffe811e00000001091144f80000;
      expv[7] = 248'h811fffffd71fffffd63fffffd61d7072001ffe72d700000000e8f88cf80000;
      expv[8] = 248'h81000000bee00000bfa00001bf8bef8800000189bec00000030b17ecf80000;
      expv[9] = 248'h811fffff305fffff30ffffff30d30430001ffe30304000000068623cf80000;
      expv[10] = 248'h810000007580000077c0000077c759200000012075800000024a4cf4f80000;
      expv[11] = 248'h811fffff35bfffff363fffff36135b36001fff3735800000026a6d8cf80000;
      expv[12] = 248'h811fffff56dfffff54bfffff54956da0001fffa056c00000034b562cf80000;
      expv[13] = 248'h8100000023a000002160000121423a8a0000008b2380000001091d5cf80000;
      expv[14] = 248'h81000000986000009900000099098766000001679840000002cac344f80000;
      expv[15] = 248'h81000000cb000000ca600001ca4cb00c0000000ccb0000000008189cf80000;
      expv[16] = 248'h81000000e0e00000e2000000e20e0e2600000027e0c0000000484784f80000;
      expv[17] = 248'h811fffff2dffffff2dbfffff2d92dfc2001fffc32dc00000038b8f6cf80000;
      expv[18] = 248'h811fffff83bfffff839ffffe83983b82001fff8383800000030b1de4f80000;
      expv[19] = 248'h810000009ee000009e6000019e49efee000001ef9ec0000003c3d798000000;
      expv[20] = 248'h811fffff01dfffff029ffffe02901d04001fff0401c00000020a0ea4f80000;
      expv[21] = 248'h811fffff10dfffff129ffffe12910d8e001fff8e10c00000030b06a4f80000;
      expv[22] = 248'h810000007540000077800000778754b4000000b47540000001696ae4f80000;
      expv[23] = 248'h810000006980000068400000684699040000010469800000020a0c14f80000;
      expv[24] = 248'h811fffff40bfffff43ffffff43d40a8a001ffe8b40800000010905fcf80000;
      expv[25] = 248'h811fffff363fffff379ffffe37936366001fff673600000002cad1e4f80000;
      expv[26] = 248'h811fffff8adfffff88bfffff8898ac06001ffe068ac000000008162cf80000;
      expv[27] = 248'h81000000fa600000f8c00000f8cfa79800000199fa400000032b3334f80000;
      expv[28] = 248'h810000009c4000009c2000019c09c5b4000001b49c400000036b620cf80000;
      expv[29] = 248'h811fffffacbfffffae5ffffeae5aca56001ffe57ac80000000a8a594f80000;
      expv[30] = 248'h810000006cc000006d8000006d86cc7a0000007a6cc0000000e8e664f80000;
      expv[31] = 248'h811fffff8c3fffff8cbfffff8c98c3c6001fffc78c000000038b812cf80000;
      expv[32] = 248'h811fffff383fffff399ffffe39938272001ffe733800000000e8e164f80000;
      expv[33] = 248'h811fffffa6dfffffa57fffffa55a6c2a001ffe2aa6c000000048565cf80000;
      expv[34] = 248'h8100000056a0000056c0000056c56b220000012356800000024a55b4f80000;
      expv[35] = 248'h810000008360000082e0000182c837440000014583400000028a9bbcf80000;
      expv[36] = 248'h811fffff6c9fffff6f3fffff6f16c870001ffe706c80000000e8e4ccf80000;
      expv[37] = 248'h81000000a9800000aaa00001aa8a987800000078a980000000e8ecacf80000;
      expv[38] = 248'h811fffff7b9fffff78bfffff7897b9ac001fffac7b800000034b5c2cf80000;
      expv[39] = 248'h811fffff687fffff6a7fffff6a56863a001ffe3b684000000068639cf80000;
      expv[40] = 248'h81000000ca200000ca600001ca4ca23a0000003bca0000000068719cf80000;
      expv[41] = 248'h811fffffa49fffffa4bfffffa49a4874001ffe74a480000000e8e42cf80000;
      expv[42] = 248'h8100000005000000056000010540500400000004050000000008085cf80000;
      expv[43] = 248'h810000003020000032800000328302380000003930000000006861a4f80000;
      expv[44] = 248'h811fffff7adfffff7bffffff7bd7accc001ffecc7ac00000018996fcf80000;
      expv[45] = 248'h810000006680000067600001674669120000011266800000022a34dcf80000;
      expv[46] = 248'h81000000f7800000f4e00001f4cf794600000146f7800000028a9c3cf80000;
      expv[47] = 248'h811fffff8abfffff885ffffe8858abc6001fffc78a800000038b9514f80000;
      expv[48] = 248'h81000000b8200000b8200001b80b827e0000007fb800000000e8e10cf80000;
      expv[49] = 248'h81000000e9800000eb400000eb4e99a2000001a2e9800000034b4cd4f80000;
      expv[50] = 248'h8100000069e000006bc000006bc69f660000016769c0000002cacff4f80000;
      expv[51] = 248'h81000000bcc00000bf200001bf0bcc9c0000009cbcc00000012926ccf80000;
      expv[52] = 248'h811fffff7f7fffff7c9ffffe7c97f75c001fff5d7f40000002aabb24f80000;
      expv[53] = 248'h811fffffd31fffffd11ffffed11d31e6001fffe6d300000003cbd844f80000;
      expv[54] = 248'h811fffff5dffffff5effffff5ed5de28001ffe295dc0000000484fbcf80000;
      expv[55] = 248'h810000006080000060e0000160c6099a0000019a60800000032b243cf80000;
      expv[56] = 248'h811fffff8ebfffff8fbfffff8f98ebdc001fffdd8e80000003abb5ecf80000;
      expv[57] = 248'h81000000c8600000ca600001ca4c861800000019c84000000028239cf80000;
      expv[58] = 248'h810000007740000075e0000175c774a6000000a67740000001495a7cf80000;
      expv[59] = 248'h811fffff809fffff811ffffe8118089c001ffe9c8080000001292444f80000;
      expv[60] = 248'h811fffff6f9fffff6e1ffffe6e16f878001ffe786f80000000e8fc84f80000;
      expv[61] = 248'h811fffffbb3fffffb83fffffb81bb3c6001fffc7bb000000038b990cf80000;
      expv[62] = 248'h8100000041e000004060000140441ede000000df41c0000001a9af1cf80000;
      expv[63] = 248'h81000000062000000700000007006358000001590600000002aab1c4f80000;
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
