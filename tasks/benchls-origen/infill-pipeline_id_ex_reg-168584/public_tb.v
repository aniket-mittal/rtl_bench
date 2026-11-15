// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 205;
  localparam OW = 204;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_168584 dut (
    .clk_i(clk),
    .rst_n(in_vec[204:204]),
    .MemtoReg_i(in_vec[203:203]),
    .MemRead_i(in_vec[202:202]),
    .MemWrite_i(in_vec[201:201]),
    .Branch_i(in_vec[200:200]),
    .RegWrite_i(in_vec[199:199]),
    .BranchType_i(in_vec[198:198]),
    .RegDst_i(in_vec[197:197]),
    .ALUSrc_i(in_vec[196:196]),
    .ALUOP_i(in_vec[195:192]),
    .program_suppose_i(in_vec[191:160]),
    .readData1_i(in_vec[159:128]),
    .readData2_i(in_vec[127:96]),
    .instance_signExtend_i(in_vec[95:64]),
    .instance_zeroFilled_i(in_vec[63:32]),
    .instruction_i(in_vec[31:0]),
    .MemtoReg_o(out_vec[203:203]),
    .MemRead_o(out_vec[202:202]),
    .MemWrite_o(out_vec[201:201]),
    .Branch_o(out_vec[200:200]),
    .RegWrite_o(out_vec[199:199]),
    .BranchType_o(out_vec[198:198]),
    .RegDst_o(out_vec[197:197]),
    .ALUSrc_o(out_vec[196:196]),
    .ALUOP_o(out_vec[195:192]),
    .program_suppose_o(out_vec[191:160]),
    .readData1_o(out_vec[159:128]),
    .readData2_o(out_vec[127:96]),
    .instance_signExtend_o(out_vec[95:64]),
    .instance_zeroFilled_o(out_vec[63:32]),
    .instruction_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 205'h0fcf770256ed0c820369a2be4a69eec9780a173fb11a3d3c8495;
    stim[1] = 205'h01963461d49be25ab1eeabe9fc6bc0811cd9cd6ecd4e9ca6c1c4;
    stim[2] = 205'h1fb06a4d758fa836c10989fa66bb457f184674806324d3884997;
    stim[3] = 205'h1eac59bedc66ce40cace814875ee2a4dec21f70b7da8ec0c4718;
    stim[4] = 205'h1bcd4b0bcfed139d469fd3e451bab141083cd3c55acecb10ef27;
    stim[5] = 205'h15cd509a984e1f1928655cf3037c3496079291a8eed9951dbf9d;
    stim[6] = 205'h1e4b57c46676247bb01c053ca2b14bf055c06ab25ec4dcfd81c4;
    stim[7] = 205'h1e453e7fbc18431f257697f04757880f8bb84db5bafc31897397;
    stim[8] = 205'h16daca904c0088008a2ea08c5e4ab2c18992e9af8a796c3d6278;
    stim[9] = 205'h15678342d5e3ef052704512b6a685e44953665ce3fc09e812415;
    stim[10] = 205'h1a245d3ffbfbf5ba7ef181a87c3e985365d981706b92f2e1d581;
    stim[11] = 205'h107895d6ec9bae96217c5e097c7c89cb2f4ddb2a438f602d1909;
    stim[12] = 205'h1681176ba6dcd8219c0dbd9944d28b0de3d1515c82c86a52eafa;
    stim[13] = 205'h12fbeca9298bba7b4f7ad2d13bd51afc3a02a8237b703fbff324;
    stim[14] = 205'h1e37b76023b95069b93566ffb02b6d43bee9f48a173d31324202;
    stim[15] = 205'h1bbf89bbcebac572352f0fecaa2d056deb2cbf32e78b0cb74c80;
    stim[16] = 205'h1e838071a3019ec05fba7034ea224630ebb4d300dfa5665109ca;
    stim[17] = 205'h1483b9c7497eef9babc2eba1478ea6fd8637ded2d9dba68bf504;
    stim[18] = 205'h1a5fc221b4bcdf83516788b1d6105e75e6af83b8879b1fc8257b;
    stim[19] = 205'h13b8158bd191a3991e081d2367edbe2e115aca63f58fd35224bd;
    stim[20] = 205'h1ff1a6d4e8acebc392099cb5ebb3acfec576118b8bb8995d30c7;
    stim[21] = 205'h1e262cf6b007a87f155fefb4b22b15043eab069612a5e45c1fe6;
    stim[22] = 205'h189b09463c2e48b65dc9a87a2cfa9f812fdd51effbd4200f75ee;
    stim[23] = 205'h17b8f8a84b00b4a4954baaff04a18d598c459f934ba8f32a5a27;
    stim[24] = 205'h169a26744ffd179d6b264ed6080de7aa31589d3269f75d021f52;
    stim[25] = 205'h1fc5a98de626c2aea4c13bbdb69d01532a224770a62c2dc05b4a;
    stim[26] = 205'h16ad255696a23ee2358b0a46d3f63f07773da77ecc88138a18fb;
    stim[27] = 205'h19a9edb740e70073a72c5e2e0ebeef260840f5bd7cc7385b66f9;
    stim[28] = 205'h1e5a32c55cd57078c58c8fcb15c62fd36e8b650f699f6ed77ced;
    stim[29] = 205'h1e13e825d8441987fe480aa12c1d79e7eae26f461efe2cc7e4c1;
    stim[30] = 205'h17611711ee2f209bc83da801f8fdb6fa863d2ff30ed520190ec6;
    stim[31] = 205'h13a1aa918142d0813d1785ebc7def88d5e75322184c0f50d10d2;
    stim[32] = 205'h10dd3a9e22fd7ea6ada378786ab1301323e9821c68daf3437ec9;
    stim[33] = 205'h1852878e914e4d3567514666c9db92064b0251ef515d49e9f580;
    stim[34] = 205'h1c04a16ba1c20d711daa90523f09b02fec5d87e65fad752e1f4d;
    stim[35] = 205'h15546f881728981c59bda266d7be0d9259ce1bbb8143437fb7b4;
    stim[36] = 205'h1d47701415742df334bb49c7ca5546d0c2fa9270e03c1229382a;
    stim[37] = 205'h1956466f7db9dde3e18d5f8f8d85b3f89011d15c80495f43cf01;
    stim[38] = 205'h14f617aac0f847126e85d1952fa6415b87c34ed0cf4d039e6c81;
    stim[39] = 205'h1bc0c2941c527310ddb362a5f43681bba949405e79c89915e098;
    stim[40] = 205'h1b6bb61c9fb0b0720cfc66952026861c020c5a55b29b91520647;
    stim[41] = 205'h1092b10e14a5181c4630b988f3035e913253417d534bebe2ffc3;
    stim[42] = 205'h114c4a41e7f7b6af8e602abe3c4433b46a67828baa265cba47c0;
    stim[43] = 205'h154d4866907cc59fed9f881c5b8ed6588377bdc3f66262a1cba3;
    stim[44] = 205'h16923a808cfcb209d087b6f5c5e17c9153e9d94b1e2bdca0df30;
    stim[45] = 205'h1c7e9b4d0790cda49d62bc28b289c58536cd7c6900293ff3d14d;
    stim[46] = 205'h1ed496b0f99174f6fb9dadc6b0352190cf440c2c489f6fd23fe7;
    stim[47] = 205'h1d507a4870ab5e504034735ce3b4d637c3e6f2df7fa7d31d220a;
    stim[48] = 205'h1dc72202ec469674086089095f9cdeb7f9ead7f2baad259f7a89;
    stim[49] = 205'h16827d350b439954bece3ed4319dffd5300ef901815d9b234aee;
    stim[50] = 205'h1a1696d091372d3f650f8f8e4d82e1bbce2839a1b72042dadf25;
    stim[51] = 205'h1136632d607e12e7564e6aeedaf16f4f3ca2a6b78eac6fac8e7c;
    stim[52] = 205'h17b8eb9dc35c68be154b510e1d84670a11177bfe15c8c6fb3919;
    stim[53] = 205'h1a636b932aa448d42247bdadbadcf60f2e0edc1070eddfdd08ae;
    stim[54] = 205'h16b6b4e9e70cd8cfb4ac269d678ef642040b814e3f5f0c4121ce;
    stim[55] = 205'h00819a4c3d299b900dd45d84497de363fbc6e0734aec349a14f5;
    stim[56] = 205'h1ed0af12253ae348d39dfd8462f01bd1f21efcba1eea9ae8f734;
    stim[57] = 205'h15b6a737fdc77d40a1fdc6b7bc30d5acde65e0aef9af7cfc8cb5;
    stim[58] = 205'h1c70646c823379839078fa5a44707ce1ce98c03c0813be18259c;
    stim[59] = 205'h12af07b6bb59169f540c42e1970be1f3f39e596814615d916379;
    stim[60] = 205'h1da4ec3f4a574ad0862851b0b93f627b3eeafc7ac3812f00ff8a;
    stim[61] = 205'h1e63176154d71f78abc8c67abe3856d53ca32d1644a884f6042d;
    stim[62] = 205'h1e1497d8c450deacecac1c323d453ac8f3831a3cdbbc1c35f422;
    stim[63] = 205'h1287fcb3a1f07ff44fe60ead910ca0bda4a31f63dea5cba2ff78;
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
      expv[0] = 204'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 204'h000000000000000000000000000000000000000000000000000;
      expv[2] = 204'h000000000000000000000000000000000000000000000000000;
      expv[3] = 204'hfb06a4d758fa836c10989fa66bb457f184674806324d3884997;
      expv[4] = 204'heac59bedc66ce40cace814875ee2a4dec21f70b7da8ec0c4718;
      expv[5] = 204'hbcd4b0bcfed139d469fd3e451bab141083cd3c55acecb10ef27;
      expv[6] = 204'h5cd509a984e1f1928655cf3037c3496079291a8eed9951dbf9d;
      expv[7] = 204'he4b57c46676247bb01c053ca2b14bf055c06ab25ec4dcfd81c4;
      expv[8] = 204'he453e7fbc18431f257697f04757880f8bb84db5bafc31897397;
      expv[9] = 204'h6daca904c0088008a2ea08c5e4ab2c18992e9af8a796c3d6278;
      expv[10] = 204'h5678342d5e3ef052704512b6a685e44953665ce3fc09e812415;
      expv[11] = 204'ha245d3ffbfbf5ba7ef181a87c3e985365d981706b92f2e1d581;
      expv[12] = 204'h07895d6ec9bae96217c5e097c7c89cb2f4ddb2a438f602d1909;
      expv[13] = 204'h681176ba6dcd8219c0dbd9944d28b0de3d1515c82c86a52eafa;
      expv[14] = 204'h2fbeca9298bba7b4f7ad2d13bd51afc3a02a8237b703fbff324;
      expv[15] = 204'he37b76023b95069b93566ffb02b6d43bee9f48a173d31324202;
      expv[16] = 204'hbbf89bbcebac572352f0fecaa2d056deb2cbf32e78b0cb74c80;
      expv[17] = 204'he838071a3019ec05fba7034ea224630ebb4d300dfa5665109ca;
      expv[18] = 204'h483b9c7497eef9babc2eba1478ea6fd8637ded2d9dba68bf504;
      expv[19] = 204'ha5fc221b4bcdf83516788b1d6105e75e6af83b8879b1fc8257b;
      expv[20] = 204'h3b8158bd191a3991e081d2367edbe2e115aca63f58fd35224bd;
      expv[21] = 204'hff1a6d4e8acebc392099cb5ebb3acfec576118b8bb8995d30c7;
      expv[22] = 204'he262cf6b007a87f155fefb4b22b15043eab069612a5e45c1fe6;
      expv[23] = 204'h89b09463c2e48b65dc9a87a2cfa9f812fdd51effbd4200f75ee;
      expv[24] = 204'h7b8f8a84b00b4a4954baaff04a18d598c459f934ba8f32a5a27;
      expv[25] = 204'h69a26744ffd179d6b264ed6080de7aa31589d3269f75d021f52;
      expv[26] = 204'hfc5a98de626c2aea4c13bbdb69d01532a224770a62c2dc05b4a;
      expv[27] = 204'h6ad255696a23ee2358b0a46d3f63f07773da77ecc88138a18fb;
      expv[28] = 204'h9a9edb740e70073a72c5e2e0ebeef260840f5bd7cc7385b66f9;
      expv[29] = 204'he5a32c55cd57078c58c8fcb15c62fd36e8b650f699f6ed77ced;
      expv[30] = 204'he13e825d8441987fe480aa12c1d79e7eae26f461efe2cc7e4c1;
      expv[31] = 204'h7611711ee2f209bc83da801f8fdb6fa863d2ff30ed520190ec6;
      expv[32] = 204'h3a1aa918142d0813d1785ebc7def88d5e75322184c0f50d10d2;
      expv[33] = 204'h0dd3a9e22fd7ea6ada378786ab1301323e9821c68daf3437ec9;
      expv[34] = 204'h852878e914e4d3567514666c9db92064b0251ef515d49e9f580;
      expv[35] = 204'hc04a16ba1c20d711daa90523f09b02fec5d87e65fad752e1f4d;
      expv[36] = 204'h5546f881728981c59bda266d7be0d9259ce1bbb8143437fb7b4;
      expv[37] = 204'hd47701415742df334bb49c7ca5546d0c2fa9270e03c1229382a;
      expv[38] = 204'h956466f7db9dde3e18d5f8f8d85b3f89011d15c80495f43cf01;
      expv[39] = 204'h4f617aac0f847126e85d1952fa6415b87c34ed0cf4d039e6c81;
      expv[40] = 204'hbc0c2941c527310ddb362a5f43681bba949405e79c89915e098;
      expv[41] = 204'hb6bb61c9fb0b0720cfc66952026861c020c5a55b29b91520647;
      expv[42] = 204'h092b10e14a5181c4630b988f3035e913253417d534bebe2ffc3;
      expv[43] = 204'h14c4a41e7f7b6af8e602abe3c4433b46a67828baa265cba47c0;
      expv[44] = 204'h54d4866907cc59fed9f881c5b8ed6588377bdc3f66262a1cba3;
      expv[45] = 204'h6923a808cfcb209d087b6f5c5e17c9153e9d94b1e2bdca0df30;
      expv[46] = 204'hc7e9b4d0790cda49d62bc28b289c58536cd7c6900293ff3d14d;
      expv[47] = 204'hed496b0f99174f6fb9dadc6b0352190cf440c2c489f6fd23fe7;
      expv[48] = 204'hd507a4870ab5e504034735ce3b4d637c3e6f2df7fa7d31d220a;
      expv[49] = 204'hdc72202ec469674086089095f9cdeb7f9ead7f2baad259f7a89;
      expv[50] = 204'h6827d350b439954bece3ed4319dffd5300ef901815d9b234aee;
      expv[51] = 204'ha1696d091372d3f650f8f8e4d82e1bbce2839a1b72042dadf25;
      expv[52] = 204'h136632d607e12e7564e6aeedaf16f4f3ca2a6b78eac6fac8e7c;
      expv[53] = 204'h7b8eb9dc35c68be154b510e1d84670a11177bfe15c8c6fb3919;
      expv[54] = 204'ha636b932aa448d42247bdadbadcf60f2e0edc1070eddfdd08ae;
      expv[55] = 204'h6b6b4e9e70cd8cfb4ac269d678ef642040b814e3f5f0c4121ce;
      expv[56] = 204'h000000000000000000000000000000000000000000000000000;
      expv[57] = 204'hed0af12253ae348d39dfd8462f01bd1f21efcba1eea9ae8f734;
      expv[58] = 204'h5b6a737fdc77d40a1fdc6b7bc30d5acde65e0aef9af7cfc8cb5;
      expv[59] = 204'hc70646c823379839078fa5a44707ce1ce98c03c0813be18259c;
      expv[60] = 204'h2af07b6bb59169f540c42e1970be1f3f39e596814615d916379;
      expv[61] = 204'hda4ec3f4a574ad0862851b0b93f627b3eeafc7ac3812f00ff8a;
      expv[62] = 204'he63176154d71f78abc8c67abe3856d53ca32d1644a884f6042d;
      expv[63] = 204'he1497d8c450deacecac1c323d453ac8f3831a3cdbbc1c35f422;
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
