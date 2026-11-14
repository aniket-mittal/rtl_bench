// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 177;
  localparam OW = 164;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08794 dut (
    .clk(clk),
    .instructionin(in_vec[176:145]),
    .datahazard(in_vec[144:144]),
    .DatabusAin(in_vec[143:112]),
    .DatabusBin(in_vec[111:80]),
    .immin(in_vec[79:48]),
    .PCplusin(in_vec[47:16]),
    .RegDstin(in_vec[15:14]),
    .RegWrin(in_vec[13:13]),
    .ALUSrc1in(in_vec[12:12]),
    .ALUSrc2in(in_vec[11:11]),
    .ALUFunin(in_vec[10:5]),
    .Signin(in_vec[4:4]),
    .MemWrin(in_vec[3:3]),
    .MemRdin(in_vec[2:2]),
    .MemtoRegin(in_vec[1:0]),
    .RegDstout(out_vec[163:162]),
    .RegWrout(out_vec[161:161]),
    .ALUSrc1out(out_vec[160:160]),
    .ALUSrc2out(out_vec[159:159]),
    .ALUFunout(out_vec[158:153]),
    .Signout(out_vec[152:152]),
    .MemWrout(out_vec[151:151]),
    .MemRdout(out_vec[150:150]),
    .MemtoRegout(out_vec[149:148]),
    .shamt(out_vec[147:143]),
    .Rsout(out_vec[142:138]),
    .Rtout(out_vec[137:133]),
    .Rdout(out_vec[132:128]),
    .DatabusAout(out_vec[127:96]),
    .DatabusBout(out_vec[95:64]),
    .immout(out_vec[63:32]),
    .PCplusout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 177'h07e6cd452ba9adcdd1c2d6fe6fc262cb447d8e821123c;
    stim[1] = 177'h119391cef3ba24a0c9244732046eace5b038049da4f77;
    stim[2] = 177'h06100ea3300a580faf71452d8762a3d57985adab50680;
    stim[3] = 177'h031dfb9de2f3b87ab920404fa7f673f17d79e0096869c;
    stim[4] = 177'h1f18e31f23bbb36689d3e4d1970f22bfefc85a6a1042e;
    stim[5] = 177'h0f8983c29665cfaff960ae1d9015f1c6a29e61d0cb873;
    stim[6] = 177'h1156b885d89157b971d09db6f31254500ca71d4b09075;
    stim[7] = 177'h0c7acbf340d637f00c70e54d98de3611eac36fc0b873d;
    stim[8] = 177'h1bcaba17cf3885f3fc3de8385356400ab46a0b84bbe11;
    stim[9] = 177'h0c5645619a7fc78900046eef548c449714bc0facf8342;
    stim[10] = 177'h03cc99b65c39f8502a7b395e625a89cede0edbea8b963;
    stim[11] = 177'h12c016c78a2f4e724da0a321f0ab05f1a5417d820e91a;
    stim[12] = 177'h09d0044548c61a931ea4c180b62808f5d60f305e97951;
    stim[13] = 177'h0aca7fd0bdcb2ce2458adda8042c9e7c5b6500e00bf81;
    stim[14] = 177'h140b6a1ffbd099684a3fd6558480916978d5f546599a4;
    stim[15] = 177'h17c1e4a8eb0f30cffbd6c39993c57c62f979a47a59171;
    stim[16] = 177'h0fffae834e4dab573498e3d43c52c9f68835c56fc6cdf;
    stim[17] = 177'h136c30b78da52eb309e61e848803eae7ac203fa805e77;
    stim[18] = 177'h0df6eef0af7f6d1ebda259f3ac9982565bfa3dce453a1;
    stim[19] = 177'h0e85df933f17f886c3bbf525f394c0b09e05fa8976fa5;
    stim[20] = 177'h10cf33cc7f925a6e049e6eff68e1cf4fabdc0f81714f6;
    stim[21] = 177'h0a28323521b8462b0d079581f099e898e8dad2f74c25b;
    stim[22] = 177'h1eec9a77ca697b9ff180ceadd1b5290ec02720cf0be4f;
    stim[23] = 177'h1069692042a29e839ed3618c7a321176c7650923dec7f;
    stim[24] = 177'h1edc7431cab786060df4334729c9cb53a7f4836cc6fd0;
    stim[25] = 177'h0686e2fcd009b8f834352e94109a78bacf15e46042efc;
    stim[26] = 177'h054c5a749cab5218eb29728b936e26b840cc9a07ce78b;
    stim[27] = 177'h131164ad7acdb5a461eb2813a2087cf0d7057fbe3af67;
    stim[28] = 177'h05cdf83a8abb8fc3c63e1832661afc117454ed1c97a42;
    stim[29] = 177'h07edca1e09a2b7b3d01e525d78dd47e09dc1261a1a715;
    stim[30] = 177'h1347368f13f694145f4e9a4d437c090e4776478fdf303;
    stim[31] = 177'h0dde98e6222aeb3fc8977f8059f98e4be6418dceebf30;
    stim[32] = 177'h1b266f9bbd68fc5c30ffcd8098f618c558e1a363a9bcd;
    stim[33] = 177'h1915868d6fcca228640b7861ce208ad6cd7b9f4bacea7;
    stim[34] = 177'h094e493d7ffd491b2ad4156f19cfad9ddb5f59d374c0d;
    stim[35] = 177'h1208e18b5dc80cf094b1d4f3de46612a2d2db9ce9677f;
    stim[36] = 177'h1611a55ae52aa18a1e412adc99bed6346581a2b00ba78;
    stim[37] = 177'h1a2173cedddc9baafb4789622661a8c97627077034608;
    stim[38] = 177'h0fae7583f4068643b4f7ff3f0b9bab811d4b1f5342f53;
    stim[39] = 177'h1e5adf87af59ede11ed33128b94090fa391b867c1d4f9;
    stim[40] = 177'h17e53a9c72972f52ef9a37fde13d63b7e9fcd0b455ba3;
    stim[41] = 177'h09589abc7ad1031f8b5bfa4edf0121f5273854c9e86aa;
    stim[42] = 177'h0f70ea8fe9110e403e0a7071599278392ba0691c89701;
    stim[43] = 177'h19718397e39800bebd5fca701395ef147e0650054cc4b;
    stim[44] = 177'h1c49020a2ed024abdd00b235efd77fb64c15af3ff20a4;
    stim[45] = 177'h0319ea87b681b84dbdbe890d1321b42e9533f4abb7271;
    stim[46] = 177'h13c06ff1518bc4357c1d7405e72e3b067d2ec9f63cd1a;
    stim[47] = 177'h0c1f628fb0a4c5bb04e37314a5a9f62d9e6bf2350d4b1;
    stim[48] = 177'h0b3073964cb2fbd309d8f4aed54344166a09e60b1d3c6;
    stim[49] = 177'h1f679160f1a80b08d738ebabf00d85185f8d832cc802a;
    stim[50] = 177'h1a7a9a85e16e26180f41f75a5205828dda123c40ef3c8;
    stim[51] = 177'h0637160ca29809ee1c7dff8b3ee6c705b752871d93655;
    stim[52] = 177'h17481c03443611f4d9a19f470e954413fa2f0299abbc7;
    stim[53] = 177'h138e99429a13ebb018221b66661e5989a03d5e73827c2;
    stim[54] = 177'h1e42e83986bfc1c27ff2e46aa89d81a36cf475d698e44;
    stim[55] = 177'h0c4facbe54d2988187e576e257968e6c9c335f71079e4;
    stim[56] = 177'h1cc0e7530b41bcb022436f91e267eb2b1f61dd132a316;
    stim[57] = 177'h1719c512bad8bbcc1761599ca31c0dd410bce3a84d712;
    stim[58] = 177'h0f4c2566dd794ef931b8bc3eee34a7a6e420d5c57e705;
    stim[59] = 177'h18f5923b11eebbc872fdf1d759b931c8c855ee2f88827;
    stim[60] = 177'h03502223820fa8d334f2170c155c581aa7de636524651;
    stim[61] = 177'h0867e77ef60eede6d20326280b4a696aa0329caf844ac;
    stim[62] = 177'h13d25d4c6ea169a0e6a1cd4fe2219ec2d2e7b984970cc;
    stim[63] = 177'h022a64d02b90aee786c698123c296b1550971aaef7ce3;
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
      expv[0] = 164'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 164'h123c466cdba9adcdd1c2d6fe6fc262cb447d8e821;
      expv[2] = 164'h123c466cdba9adcdd1c2d6fe6fc262cb447d8e821;
      expv[3] = 164'h123c466cdba9adcdd1c2d6fe6fc262cb447d8e821;
      expv[4] = 164'h869c99dff2f3b87ab920404fa7f673f17d79e0096;
      expv[5] = 164'h042e198e33bbb36689d3e4d1970f22bfefc85a6a1;
      expv[6] = 164'h042e198e33bbb36689d3e4d1970f22bfefc85a6a1;
      expv[7] = 164'h042e198e33bbb36689d3e4d1970f22bfefc85a6a1;
      expv[8] = 164'h873df7adf0d637f00c70e54d98de3611eac36fc0b;
      expv[9] = 164'hbe1114abff3885f3fc3de8385356400ab46a0b84b;
      expv[10] = 164'hbe1114abff3885f3fc3de8385356400ab46a0b84b;
      expv[11] = 164'hbe1114abff3885f3fc3de8385356400ab46a0b84b;
      expv[12] = 164'he91ac401aa2f4e724da0a321f0ab05f1a5417d820;
      expv[13] = 164'h7951450008c61a931ea4c180b62808f5d60f305e9;
      expv[14] = 164'h7951450008c61a931ea4c180b62808f5d60f305e9;
      expv[15] = 164'h7951450008c61a931ea4c180b62808f5d60f305e9;
      expv[16] = 164'h9171ac1ffb0f30cffbd6c39993c57c62f979a47a5;
      expv[17] = 164'h6cdf87fbde4dab573498e3d43c52c9f68835c56fc;
      expv[18] = 164'h5e77b6c21da52eb309e61e848803eae7ac203fa80;
      expv[19] = 164'h53a1f76f7f7f6d1ebda259f3ac9982565bfa3dce4;
      expv[20] = 164'h53a1f76f7f7f6d1ebda259f3ac9982565bfa3dce4;
      expv[21] = 164'h53a1f76f7f7f6d1ebda259f3ac9982565bfa3dce4;
      expv[22] = 164'hc25b3283a1b8462b0d079581f099e898e8dad2f74;
      expv[23] = 164'hbe4f76c9fa697b9ff180ceadd1b5290ec02720cf0;
      expv[24] = 164'hec7f2697a2a29e839ed3618c7a321176c7650923d;
      expv[25] = 164'h6fd035c63ab786060df4334729c9cb53a7f4836cc;
      expv[26] = 164'h6fd035c63ab786060df4334729c9cb53a7f4836cc;
      expv[27] = 164'h6fd035c63ab786060df4334729c9cb53a7f4836cc;
      expv[28] = 164'h6fd035c63ab786060df4334729c9cb53a7f4836cc;
      expv[29] = 164'h7a423cdefabb8fc3c63e1832661afc117454ed1c9;
      expv[30] = 164'ha7151eddf9a2b7b3d01e525d78dd47e09dc1261a1;
      expv[31] = 164'ha7151eddf9a2b7b3d01e525d78dd47e09dc1261a1;
      expv[32] = 164'hbf30e5e9f22aeb3fc8977f8059f98e4be6418dcee;
      expv[33] = 164'hbf30e5e9f22aeb3fc8977f8059f98e4be6418dcee;
      expv[34] = 164'hcea78959afcca228640b7861ce208ad6cd7b9f4ba;
      expv[35] = 164'hcea78959afcca228640b7861ce208ad6cd7b9f4ba;
      expv[36] = 164'hcea78959afcca228640b7861ce208ad6cd7b9f4ba;
      expv[37] = 164'hba78591bf52aa18a1e412adc99bed6346581a2b00;
      expv[38] = 164'hba78591bf52aa18a1e412adc99bed6346581a2b00;
      expv[39] = 164'hba78591bf52aa18a1e412adc99bed6346581a2b00;
      expv[40] = 164'hd4f985adaf59ede11ed33128b94090fa391b867c1;
      expv[41] = 164'hd4f985adaf59ede11ed33128b94090fa391b867c1;
      expv[42] = 164'hd4f985adaf59ede11ed33128b94090fa391b867c1;
      expv[43] = 164'h97018f0ff9110e403e0a7071599278392ba0691c8;
      expv[44] = 164'hcc4b9719a39800bebd5fca701395ef147e0650054;
      expv[45] = 164'h20a40c902ed024abdd00b235efd77fb64c15af3ff;
      expv[46] = 164'h20a40c902ed024abdd00b235efd77fb64c15af3ff;
      expv[47] = 164'h20a40c902ed024abdd00b235efd77fb64c15af3ff;
      expv[48] = 164'h20a40c902ed024abdd00b235efd77fb64c15af3ff;
      expv[49] = 164'hd3c69307acb2fbd309d8f4aed54344166a09e60b1;
      expv[50] = 164'hd3c69307acb2fbd309d8f4aed54344166a09e60b1;
      expv[51] = 164'hf3c887a9a16e26180f41f75a5205828dda123c40e;
      expv[52] = 164'h36550b71629809ee1c7dff8b3ee6c705b752871d9;
      expv[53] = 164'hbbc70481f43611f4d9a19f470e954413fa2f0299a;
      expv[54] = 164'hbbc70481f43611f4d9a19f470e954413fa2f0299a;
      expv[55] = 164'h8e443c2ff6bfc1c27ff2e46aa89d81a36cf475d69;
      expv[56] = 164'h8e443c2ff6bfc1c27ff2e46aa89d81a36cf475d69;
      expv[57] = 164'ha316540ffb41bcb022436f91e267eb2b1f61dd132;
      expv[58] = 164'ha316540ffb41bcb022436f91e267eb2b1f61dd132;
      expv[59] = 164'ha316540ffb41bcb022436f91e267eb2b1f61dd132;
      expv[60] = 164'ha316540ffb41bcb022436f91e267eb2b1f61dd132;
      expv[61] = 164'h46512502120fa8d334f2170c155c581aa7de63652;
      expv[62] = 164'h46512502120fa8d334f2170c155c581aa7de63652;
      expv[63] = 164'h70cc4d252ea169a0e6a1cd4fe2219ec2d2e7b9849;
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
