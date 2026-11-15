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
    stim[0] = 34'h17f2c1e5b;
    stim[1] = 34'h323114edc;
    stim[2] = 34'h355bcddbd;
    stim[3] = 34'h11661b2c5;
    stim[4] = 34'h209babec6;
    stim[5] = 34'h197c75542;
    stim[6] = 34'h25a884d24;
    stim[7] = 34'h16672ebc5;
    stim[8] = 34'h098e768e3;
    stim[9] = 34'h3e5a560c3;
    stim[10] = 34'h00cffb182;
    stim[11] = 34'h0d350cd86;
    stim[12] = 34'h14b422f3b;
    stim[13] = 34'h237cbe7d7;
    stim[14] = 34'h1f7549a28;
    stim[15] = 34'h3eb2bb863;
    stim[16] = 34'h167ffde15;
    stim[17] = 34'h2e90c93d9;
    stim[18] = 34'h152c76e74;
    stim[19] = 34'h2ba4a1a5b;
    stim[20] = 34'h1c1ac8925;
    stim[21] = 34'h142744359;
    stim[22] = 34'h2638c051a;
    stim[23] = 34'h1b36e34eb;
    stim[24] = 34'h1d315bd54;
    stim[25] = 34'h18a4581fd;
    stim[26] = 34'h27114c5e9;
    stim[27] = 34'h25ab7aa39;
    stim[28] = 34'h00ad2dbe5;
    stim[29] = 34'h1d8c7b1c1;
    stim[30] = 34'h3774b943b;
    stim[31] = 34'h3aa26fd27;
    stim[32] = 34'h2179ca2bf;
    stim[33] = 34'h38a436f83;
    stim[34] = 34'h1e86fdef4;
    stim[35] = 34'h04075d4de;
    stim[36] = 34'h350d7c1b3;
    stim[37] = 34'h29e10c0ca;
    stim[38] = 34'h342d216c1;
    stim[39] = 34'h2ae3a1b12;
    stim[40] = 34'h2c7d0d2fe;
    stim[41] = 34'h0d593d689;
    stim[42] = 34'h3c2ae7b0a;
    stim[43] = 34'h1cd141426;
    stim[44] = 34'h2e5681879;
    stim[45] = 34'h0842d81db;
    stim[46] = 34'h2363c6220;
    stim[47] = 34'h3ae279ebd;
    stim[48] = 34'h2ffb55e2d;
    stim[49] = 34'h34d4b80f1;
    stim[50] = 34'h3426dc24b;
    stim[51] = 34'h0c2e5e201;
    stim[52] = 34'h28ed37083;
    stim[53] = 34'h022819e71;
    stim[54] = 34'h0f4e66cd5;
    stim[55] = 34'h00832ac36;
    stim[56] = 34'h02bf32ed7;
    stim[57] = 34'h3f596b00f;
    stim[58] = 34'h17edaf5f6;
    stim[59] = 34'h3edfccc9e;
    stim[60] = 34'h30479070e;
    stim[61] = 34'h3afd33633;
    stim[62] = 34'h207e22808;
    stim[63] = 34'h02cd6ff3f;
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
      expv[0] = 248'h811fffff7f3fffff7fdffffe7fd7f2c0001ffec17f000000018999f4f80000;
      expv[1] = 248'h811fffff231fffff21dffffe21d23114001fff1423000000022a3874f80000;
      expv[2] = 248'h811fffff55bfffff57bfffff57955bcc001fffcd55800000038b8decf80000;
      expv[3] = 248'h811fffff167fffff165ffffe1651661a001ffe1b1640000000283394f80000;
      expv[4] = 248'h0100000009a000000bc000000bc09baa000001ab09800000034b4df3800001;
      expv[5] = 248'h811fffff97dfffff96bfffff96997c74001ffe7497c0000000e8feacf80000;
      expv[6] = 248'h810000005a80000059a000015985a884000000845a8000000109146cf80000;
      expv[7] = 248'h811fffff667fffff657fffff6556672e001fff2f66400000024a535cf80000;
      expv[8] = 248'h8100000098e000009900000099098e760000007798c0000000e8e744f80000;
      expv[9] = 248'h811fffffe5bfffffe41ffffee41e5a56001ffe57e580000000a8ad04f80000;
      expv[10] = 248'h810000000ce000000e2000010e00cffa000001fb0cc0000003ebe78cf80000;
      expv[11] = 248'h81000000d3400000d1a00001d18d350c0000010cd3400000020a1a6cf80000;
      expv[12] = 248'h811fffff4b5fffff49ffffff49d4b422001ffe224b40000000485a7cf80000;
      expv[13] = 248'h8100000037c0000034e0000134c37cbe000000be37c0000001697e3cf80000;
      expv[14] = 248'h811ffffff75ffffff75ffffef75f7548001fff48f7400000028a9ad4f80000;
      expv[15] = 248'h811fffffeb3fffffeb1ffffeeb1eb2ba001ffebbeb000000016979c4f80000;
      expv[16] = 248'h811fffff67ffffff67dffffe67d67ffc001ffffd67c0000003ebfff4f80000;
      expv[17] = 248'h81000000e9000000ea600001ea4e90c8000000c8e90000000189889cf80000;
      expv[18] = 248'h811fffff52dfffff51dffffe51d52c76001ffe7652c0000000e8f674f80000;
      expv[19] = 248'h81000000ba400000bb400000bb4ba4a0000000a0ba400000014952d4f80000;
      expv[20] = 248'h811fffffc1bfffffc13fffffc11c1ac8001ffec9c180000001898d4cf80000;
      expv[21] = 248'h811fffff427fffff407fffff40542744001fff4542400000028a931cf80000;
      expv[22] = 248'h810000006380000060a00001608638c0000000c06380000001899c2cf80000;
      expv[23] = 248'h811fffffb37fffffb29ffffeb29b36e2001ffee3b340000001c9dba4f80000;
      expv[24] = 248'h811fffffd31fffffd3bfffffd39d315a001fff5ad300000002aab8ecf80000;
      expv[25] = 248'h811fffff8a5fffff883fffff8818a458001ffe588a40000000a8b20cf80000;
      expv[26] = 248'h810000007100000070a000017087114c0000014c71000000028a882cf80000;
      expv[27] = 248'h810000005aa00000594000005945ab7a0000017b5a80000002eaf554f80000;
      expv[28] = 248'h810000000ac000000b6000010b40ad2c0000012c0ac00000024a56dcf80000;
      expv[29] = 248'h811fffffd8dfffffda3fffffda1d8c7a001ffe7ad8c0000000e8e68cf80000;
      expv[30] = 248'h811fffff775fffff769ffffe769774b8001ffeb87740000001697aa4f80000;
      expv[31] = 248'h811fffffaa3fffffabbfffffab9aa26e001ffe6faa00000000c8d1e9080000;
      expv[32] = 248'h810000001780000014400000144179ca000001ca17800000038b9c14f80000;
      expv[33] = 248'h811fffff8a5fffff89ffffff89d8a436001ffe368a4000000068727cf80000;
      expv[34] = 248'h811fffffe87fffffebdffffeebde86fc001ffefde840000001e9e3f4f80000;
      expv[35] = 248'h01a0000040600000428000004284075c0000015d4040000002aea3a0280002;
      expv[36] = 248'h811fffff50dfffff503fffff50150d7c001fff7c50c0000002eae60cf80000;
      expv[37] = 248'h810000009e0000009c0000009c09e10c0000010c9e000000020a1004f80000;
      expv[38] = 248'h811fffff42dfffff42dffffe42d42d20001fff2042c00000024a56b4f80000;
      expv[39] = 248'h81000000ae200000af600001af4ae3a0000001a1ae000000034b51dcf80000;
      expv[40] = 248'h81000000c7c00000c6400000c64c7d0c0000010cc7c00000020a1e94f80000;
      expv[41] = 248'h81000000d5800000d6c00000d6cd593c0000013cd5800000026a6cb4f80000;
      expv[42] = 248'h811fffffc2bfffffc37fffffc35c2ae6001ffee7c280000001c9d5dcf80000;
      expv[43] = 248'h011fffffcd1fffffce9ffffece9cd140001fff40cd000000028e88a0080000;
      expv[44] = 248'h81000000e5600000e7000000e70e568000000081e540000001090bc4f80000;
      expv[45] = 248'h810000008420000084200001840842d8000000d98400000001a9a10cf80000;
      expv[46] = 248'h810000003620000034400000344363c6000001c736000000038b9114f80000;
      expv[47] = 248'h811fffffae3fffffafdffffeafdae278001ffe79ae00000000e8f1f4f80000;
      expv[48] = 248'h81000000ffa00000ffc00000ffcffb5400000155ff80000002aabdf4f80000;
      expv[49] = 248'h811fffff4d5fffff4c1ffffe4c14d4b8001ffeb84d40000001696a04f80000;
      expv[50] = 248'h811fffff427fffff405ffffe405426dc001ffedd4240000001a9b314f80000;
      expv[51] = 248'h81000000c2e00000c0400000c04c2e5e0000005fc2c0000000a8b714f80000;
      expv[52] = 248'h810000008ec000008e0000008e08ed36000001368ec00000026a7684f80000;
      expv[53] = 248'h810000002280000023c0000023c228180000001822800000002834f4f80000;
      expv[54] = 248'h81000000f4e00000f5800000f58f4e6600000067f4c0000000c8c764f80000;
      expv[55] = 248'h8100000008200000098000000980832a0000012b08000000024a4164f80000;
      expv[56] = 248'h810000002be0000029c0000029c2bf32000001332bc00000026a7f74f80000;
      expv[57] = 248'h811ffffff59ffffff61ffffef61f596a001fff6af580000002cacc84f80000;
      expv[58] = 248'h811fffff7edfffff7ebfffff7e97edae001fffae7ec00000034b56acf80000;
      expv[59] = 248'h811fffffedffffffed9ffffeed9edfcc001fffcdedc00000038b8f64f80000;
      expv[60] = 248'h811fffff047fffff04ffffff04d04790001fff9104400000032b233cf80000;
      expv[61] = 248'h811fffffafdfffffaedffffeaedafd32001fff32afc00000026a7eb4f80000;
      expv[62] = 248'h8100000007e000000500000005007e220000002307c0000000485f44f80000;
      expv[63] = 248'h810000002cc000002fe000012fc2cd6e0000016e2cc0000002cac6fcf80000;
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
