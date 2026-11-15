// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 132;
  localparam OW = 130;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  SDP_Y_CORE_Y_mul_core_chn_mul_op_rsci_chn_mul_op_wait_dp dut (
    .nvdla_core_clk(clk),
    .nvdla_core_rstn(in_vec[131:131]),
    .chn_mul_op_rsci_oswt(in_vec[130:130]),
    .chn_mul_op_rsci_biwt(in_vec[129:129]),
    .chn_mul_op_rsci_bdwt(in_vec[128:128]),
    .chn_mul_op_rsci_d(in_vec[127:0]),
    .chn_mul_op_rsci_bawt(out_vec[129:129]),
    .chn_mul_op_rsci_wen_comp(out_vec[128:128]),
    .chn_mul_op_rsci_d_mxwt(out_vec[127:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 132'h3308d25c238dd105b3a412a36ed9f1b1a;
    stim[1] = 132'h6d224a49524e85decd652b65246efbeee;
    stim[2] = 132'hdd7ba447fd703e8ecef6e1ed7e8ec7ee6;
    stim[3] = 132'hd8b7f1abb5bbb97529487d0e401715e01;
    stim[4] = 132'ha306da5d83081dda98749d790bc9f238d;
    stim[5] = 132'hbf019aed9533d247da8beaf42c55d483c;
    stim[6] = 132'hf174cde6d6a24682b351bf97ed92bdace;
    stim[7] = 132'hac79d26fde8cc26cce74c1ab14d7ecf98;
    stim[8] = 132'hd3dee345214f0f4804845d4481d4c27a4;
    stim[9] = 132'ha85316cb73c02fc3b5dd8ddb2c5f69e98;
    stim[10] = 132'hd9e838c68399df93e15b57256503fa372;
    stim[11] = 132'h8b12c9c69a2d0ce7d38aadd50a28d3dcc;
    stim[12] = 132'hbf6c5970866ea0eb6a620a6dda9217d08;
    stim[13] = 132'hc92cad3dfc60b2e56f062105c894f3231;
    stim[14] = 132'hd2b59d5234c902530cd4d78c7c0ed60ba;
    stim[15] = 132'hc21b9c4c82dedd8b30b8cbceadb312556;
    stim[16] = 132'h74e86997242d2e0ad85b4b3e49f341701;
    stim[17] = 132'hdbafe9571dcbc3082493bad0495ff15d7;
    stim[18] = 132'h8d805518b7dabaa5c08ebeef236981bfe;
    stim[19] = 132'hc19da83df6aad2d244217265bbd0f820a;
    stim[20] = 132'hd220076ce01f265dd150fbb533a73f39b;
    stim[21] = 132'hde0e5e15223e517bdfe031381a8bd1ada;
    stim[22] = 132'haf48185909d4ccb455d843bdd4b0ff301;
    stim[23] = 132'hf5ba85d03fb82ec5d46bc798fb3e6e10a;
    stim[24] = 132'hc263d913949d47364c4fc4e52dfa65f4b;
    stim[25] = 132'haf38ceb23958ddd4d9d4f2e774e70229f;
    stim[26] = 132'hb3681767925ff7a9a17ed2f5971e3b11e;
    stim[27] = 132'hbd95eb4ed6147aea80c2176e2da27df77;
    stim[28] = 132'hcd1fdf56eef8c40ee90e8dfb5d927e5be;
    stim[29] = 132'hca2ab858bbcd0fa953de1dae402d3e599;
    stim[30] = 132'hd442bd8cf8b49b019c7df197f2f7c07cf;
    stim[31] = 132'h96e05ee3b43d4520ce5b7a80f2be4f516;
    stim[32] = 132'h871caee59116bc291ce0f58e180286632;
    stim[33] = 132'hdc3c8006dc023fb72d9329bb7d9dbb940;
    stim[34] = 132'hc1c9913df0c77a6a9fd1367b47eb63643;
    stim[35] = 132'hf19c2f4371ec459b65c30edc1f84b1e47;
    stim[36] = 132'hbb5b9d5d091f7c1e0f43e64d3bbdecb63;
    stim[37] = 132'hab6da5dc08e96092b2077cda542b084c5;
    stim[38] = 132'ha378d5917ff293e13be64cdc3d30ecc56;
    stim[39] = 132'hc23e2dfa3f709d60e83926750e82d9e65;
    stim[40] = 132'he494db7ee11b8e0cbdfbe2efab38a2d12;
    stim[41] = 132'hcf82e033e748aae76b76002412f02dc20;
    stim[42] = 132'h941bab831695bee26f392450cc9751844;
    stim[43] = 132'hf42ad083162859643b4e28ca8c8b6fdff;
    stim[44] = 132'ha497b92ec21d6939d9da4a1690f008b75;
    stim[45] = 132'h9ace36f64bd32f374b1f07a435ae19ff6;
    stim[46] = 132'h8980e0968a853cddfe6136e81bf6c054b;
    stim[47] = 132'hec97094682afd51a9ec7b42fc6fe07c84;
    stim[48] = 132'hbeb46e3ccf7ca7f697d0dfd5d414a954d;
    stim[49] = 132'hfb28876bf31919ceec3cbac95a3f64c91;
    stim[50] = 132'hd7ef28921db1cfd6a3fa2bfb3233f249a;
    stim[51] = 132'hed35c45f454d9dc2020052bcfd244c475;
    stim[52] = 132'hc127f425d6341b88dd4e5e18c2a3991dd;
    stim[53] = 132'hb66972c4d2081376bb3269fc4a1c1241c;
    stim[54] = 132'h885243ad1cdb84ddc766f6240ebe877b7;
    stim[55] = 132'hed1ce19564c52ae10351505b18f75ec16;
    stim[56] = 132'hd5cb544ef528766ebd7584390cdbe07f2;
    stim[57] = 132'hb67163f93920e8baa052033e0f15d0bb0;
    stim[58] = 132'hac255bd0aaf782586a1ce61dd7bcad0e1;
    stim[59] = 132'h94fb185e10b3ab101a2477c68dd4f3fa3;
    stim[60] = 132'hfabd63ffb5cc97fa688691aa83c3bb922;
    stim[61] = 132'hb2e08686450271e19ec9508516fd385d0;
    stim[62] = 132'hbb5776e90a569ec9e3a661fc8ee4e0c3c;
    stim[63] = 132'he29552b02478016f33e5d9fbb16618662;
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
      expv[0] = 130'h3308d25c238dd105b3a412a36ed9f1b1a;
      expv[1] = 130'h3d224a49524e85decd652b65246efbeee;
      expv[2] = 130'h0d7ba447fd703e8ecef6e1ed7e8ec7ee6;
      expv[3] = 130'h08b7f1abb5bbb97529487d0e401715e01;
      expv[4] = 130'h3306da5d83081dda98749d790bc9f238d;
      expv[5] = 130'h3306da5d83081dda98749d790bc9f238d;
      expv[6] = 130'h3174cde6d6a24682b351bf97ed92bdace;
      expv[7] = 130'h3c79d26fde8cc26cce74c1ab14d7ecf98;
      expv[8] = 130'h3c79d26fde8cc26cce74c1ab14d7ecf98;
      expv[9] = 130'h385316cb73c02fc3b5dd8ddb2c5f69e98;
      expv[10] = 130'h385316cb73c02fc3b5dd8ddb2c5f69e98;
      expv[11] = 130'h1b12c9c69a2d0ce7d38aadd50a28d3dcc;
      expv[12] = 130'h3f6c5970866ea0eb6a620a6dda9217d08;
      expv[13] = 130'h092cad3dfc60b2e56f062105c894f3231;
      expv[14] = 130'h02b59d5234c902530cd4d78c7c0ed60ba;
      expv[15] = 130'h021b9c4c82dedd8b30b8cbceadb312556;
      expv[16] = 130'h34e86997242d2e0ad85b4b3e49f341701;
      expv[17] = 130'h0bafe9571dcbc3082493bad0495ff15d7;
      expv[18] = 130'h1d805518b7dabaa5c08ebeef236981bfe;
      expv[19] = 130'h019da83df6aad2d244217265bbd0f820a;
      expv[20] = 130'h0220076ce01f265dd150fbb533a73f39b;
      expv[21] = 130'h0e0e5e15223e517bdfe031381a8bd1ada;
      expv[22] = 130'h3f48185909d4ccb455d843bdd4b0ff301;
      expv[23] = 130'h3f48185909d4ccb455d843bdd4b0ff301;
      expv[24] = 130'h0263d913949d47364c4fc4e52dfa65f4b;
      expv[25] = 130'h3f38ceb23958ddd4d9d4f2e774e70229f;
      expv[26] = 130'h3f38ceb23958ddd4d9d4f2e774e70229f;
      expv[27] = 130'h3d95eb4ed6147aea80c2176e2da27df77;
      expv[28] = 130'h0d1fdf56eef8c40ee90e8dfb5d927e5be;
      expv[29] = 130'h0a2ab858bbcd0fa953de1dae402d3e599;
      expv[30] = 130'h0442bd8cf8b49b019c7df197f2f7c07cf;
      expv[31] = 130'h16e05ee3b43d4520ce5b7a80f2be4f516;
      expv[32] = 130'h171caee59116bc291ce0f58e180286632;
      expv[33] = 130'h0c3c8006dc023fb72d9329bb7d9dbb940;
      expv[34] = 130'h01c9913df0c77a6a9fd1367b47eb63643;
      expv[35] = 130'h319c2f4371ec459b65c30edc1f84b1e47;
      expv[36] = 130'h3b5b9d5d091f7c1e0f43e64d3bbdecb63;
      expv[37] = 130'h3b6da5dc08e96092b2077cda542b084c5;
      expv[38] = 130'h3b6da5dc08e96092b2077cda542b084c5;
      expv[39] = 130'h3b6da5dc08e96092b2077cda542b084c5;
      expv[40] = 130'h3b6da5dc08e96092b2077cda542b084c5;
      expv[41] = 130'h3b6da5dc08e96092b2077cda542b084c5;
      expv[42] = 130'h3b6da5dc08e96092b2077cda542b084c5;
      expv[43] = 130'h342ad083162859643b4e28ca8c8b6fdff;
      expv[44] = 130'h3497b92ec21d6939d9da4a1690f008b75;
      expv[45] = 130'h3497b92ec21d6939d9da4a1690f008b75;
      expv[46] = 130'h1980e0968a853cddfe6136e81bf6c054b;
      expv[47] = 130'h3c97094682afd51a9ec7b42fc6fe07c84;
      expv[48] = 130'h3c97094682afd51a9ec7b42fc6fe07c84;
      expv[49] = 130'h3b28876bf31919ceec3cbac95a3f64c91;
      expv[50] = 130'h07ef28921db1cfd6a3fa2bfb3233f249a;
      expv[51] = 130'h3d35c45f454d9dc2020052bcfd244c475;
      expv[52] = 130'h3d35c45f454d9dc2020052bcfd244c475;
      expv[53] = 130'h3d35c45f454d9dc2020052bcfd244c475;
      expv[54] = 130'h185243ad1cdb84ddc766f6240ebe877b7;
      expv[55] = 130'h3d1ce19564c52ae10351505b18f75ec16;
      expv[56] = 130'h3d1ce19564c52ae10351505b18f75ec16;
      expv[57] = 130'h367163f93920e8baa052033e0f15d0bb0;
      expv[58] = 130'h3c255bd0aaf782586a1ce61dd7bcad0e1;
      expv[59] = 130'h3c255bd0aaf782586a1ce61dd7bcad0e1;
      expv[60] = 130'h3abd63ffb5cc97fa688691aa83c3bb922;
      expv[61] = 130'h32e08686450271e19ec9508516fd385d0;
      expv[62] = 130'h3b5776e90a569ec9e3a661fc8ee4e0c3c;
      expv[63] = 130'h329552b02478016f33e5d9fbb16618662;
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
