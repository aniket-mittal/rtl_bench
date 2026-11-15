// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 192;
  localparam OW = 68;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_053154 dut (
    .clk(clk),
    .data_in_rx_uns(in_vec[191:128]),
    .data_in(in_vec[127:64]),
    .enable(in_vec[63:63]),
    .sync_info(in_vec[62:61]),
    .rst(in_vec[60:60]),
    .blocksync_out(in_vec[59:59]),
    .valid_frame(in_vec[58:58]),
    .ber_poly(in_vec[57:0]),
    .data_out(out_vec[67:2]),
    .ber_sync(out_vec[1:1]),
    .sync_init(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 192'h1d341b8cac43728dcfb8af8b5b977672fea50076199764f6;
    stim[1] = 192'h07ee101a0d1332acadc39304e3259fe7ba30a96a2476aa99;
    stim[2] = 192'h09ee7e51de855b89852bcefee3123aa5ecba2b45452dc511;
    stim[3] = 192'h091ca748f7260cd5a746b11f642ca687a8f718d4a61c930b;
    stim[4] = 192'haceebcafba3d4dbdf13eca17d55db570010d7d046d1dc399;
    stim[5] = 192'h759cdc5f2116e0a0f307547eb030054fc94f43452fec84ae;
    stim[6] = 192'he1885fbc96363681e96ebfba31a35b6f44bec8e855f44662;
    stim[7] = 192'hd9514998961e0a79bc5c3a376c846947c57eb13bfe4b245e;
    stim[8] = 192'h0af2a0d99cc4b8daaa1b5715f7f4d538e1c20c9569d77d76;
    stim[9] = 192'hdbc39bbe2b949b2ffe057c8aa085a878c55c0077b72c29ab;
    stim[10] = 192'hce000c78f439763ee0afa90c9d3ad719c76d1bc62e767eb4;
    stim[11] = 192'hc3ef569421bb83b5eba28e81af396db0206a30d3fe61f1cc;
    stim[12] = 192'h3c09926db0d47a614e1f11b3ce8d0d1cc23f4c6cbc6ac3c2;
    stim[13] = 192'h0076fed6f51cb579b60f2ca749423fa822ed7b8edac39114;
    stim[14] = 192'hd04d8ff343073091b0530cf616b90e2b0067dac6c130a44b;
    stim[15] = 192'h9998b79cd4df328a1ad8f3b53082ac27a35c04594c013ac3;
    stim[16] = 192'h21eaa4191546a6c1496c8cf226d8d3b12c75285731c76e02;
    stim[17] = 192'hc47220c6c84b9958c22be28539ce5af9ee2696386e3832a0;
    stim[18] = 192'h5a53423f9b0ae4d7e4204e64225f3272ad4cb18bbb92a256;
    stim[19] = 192'he9d84b43d875a86640fcfa8444b13bab069e78f4ac0032af;
    stim[20] = 192'h1182dd0deece11caa877584037409497e13513adc7ee7008;
    stim[21] = 192'headc31c2163f7153fb0116396e86dc578b31995dc7f58817;
    stim[22] = 192'hcbd7cab2f6d486f0b3124f6976483c8fcd3a5a1c171b30c0;
    stim[23] = 192'h62060f30d6ef31b69e7fa28d13e9e03ec59c6e969d6c0001;
    stim[24] = 192'hb7b6e415980167e71f7fb710efd74badef92dd495617527c;
    stim[25] = 192'hd00c62eb495e1f1b0cb259fce8123895853703017c1ee893;
    stim[26] = 192'h13c519347f6f8cc149e5222c0912f1240180f6c13c381fd5;
    stim[27] = 192'h4a6e92b70dc0b56d7a860a107f933047ca70423668dd9108;
    stim[28] = 192'hba26adb71feec6f583f82c251b57a151c73f1de6ebec4aed;
    stim[29] = 192'h9f8b49af84402a6055f9d52fef1696a3c0f700e79e3f88b4;
    stim[30] = 192'hab72a0dd3485f9a39c9d8cba108033c52c7036d010ee9108;
    stim[31] = 192'he59bad07d6250e4773b858a6fda1bdc4ad26ab79d5e3046e;
    stim[32] = 192'h026aae3fb76048d5f6fa529eb65a94c644e32f892ee4031b;
    stim[33] = 192'h56f28ca22eae131cb244955666ca7878eaca0778ea8e68d6;
    stim[34] = 192'h0a3055cf6d2d9a5b7650e31039f8fa2500068119f76e66d8;
    stim[35] = 192'h3d9acbf4c441851c7d31b4ab5ab498b0a9aa7885a14f30a5;
    stim[36] = 192'ha228ebd184767545d1a9edcf6dc9177b67cd6fc5e11b5d05;
    stim[37] = 192'h9ec7556baf8147410bfccdc5255b42e1cb80183fc842c879;
    stim[38] = 192'h945d923be91982d27a6d692e58dc0e51e229396076527f50;
    stim[39] = 192'h330dcdcdaef3f170448c83671313c232adca6ee4d5b312ca;
    stim[40] = 192'h86d59ebd38bf72e51ee6499993c89adec680d86f507c59ac;
    stim[41] = 192'h207bfee9dd6d3ea48725d8f4558ef1c94eef4e7828546207;
    stim[42] = 192'hcb1e0165a0c92ca8fbc15a3276a2d602e9d7a5f41c6e55f8;
    stim[43] = 192'h8e11db55e93b3a74eb8f2689ba716bd6026bd066e581620c;
    stim[44] = 192'hf4bd0e232bad179289cd24bcea392d4a20593b00049907ae;
    stim[45] = 192'h8e7f9066b72938296b0aade100fa81bfe0d6cb035e7f72e2;
    stim[46] = 192'h6fb1082dc72eed1f0bfaead670b1ba2160a3c9837fe3f10e;
    stim[47] = 192'h23047969ec03f52327e0cfc2b4de63696dab8256093e6dac;
    stim[48] = 192'hd678709b18cbd1cbb95b50ecaf469365012791e550e9affd;
    stim[49] = 192'h9666e9fa0f0f88a2da8758e5f4b2726a871c729ff9580d39;
    stim[50] = 192'h9e9f30ba0d2866b705a6d56003a30b5fce6d0c919a1ada5f;
    stim[51] = 192'h1233e9e32840d2ffc023053265400fa86e2f94526fc4054b;
    stim[52] = 192'h005c88537825646829e0bd4bdc6345b64f1ba6a349bb06fc;
    stim[53] = 192'he20b56ce9cf8f5841b8cea01771e22790c8d2252ea172061;
    stim[54] = 192'h9b3a44ea36b7ffaaca6b8900902b1537c0f7e0faf514565d;
    stim[55] = 192'h66c42b7e724839c705c531e6b74e5cd8efe87eba43bc2c74;
    stim[56] = 192'hda8494c56f2d47db8af0da2c21dfa86149654fb505ca1fc6;
    stim[57] = 192'h219e7460d8a7ad99a3ac14bb3086174289995defd5a6451b;
    stim[58] = 192'h039cd91bdc336524082a92bbe32c65762826c285ec652317;
    stim[59] = 192'h74db83a922c9ac15b35ec59e4d57caac61239b0b7ce6642f;
    stim[60] = 192'h3e6f8e13b7b3b3697f9e2dbbc741e7ade37ee2f3624c402b;
    stim[61] = 192'h964bcf1dd6148100f5cabf39ce1c4349a8c707f5a1bd98f7;
    stim[62] = 192'h5896cbcddb27ade494f5aa9c42be78df022a92f62131d007;
    stim[63] = 192'h26f8a0c591839d9b0f06e2258733903e66092616608f2187;
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
      expv[0] = 68'hxxxxxxxxxxxxxxxxx;
      expv[1] = 68'hxxxxxxxxxxxxxxxxc;
      expv[2] = 68'hxxxxxxxxxxxxxxxx4;
      expv[3] = 68'hxxxxxxxxxxxxxxxxf;
      expv[4] = 68'hxxxxxxxxxxxxxxxx4;
      expv[5] = 68'hxxxxxxxxxxxxxxxx4;
      expv[6] = 68'h8xxxxxxxxxxxxxxx8;
      expv[7] = 68'h8xxxxxxxxxxxxxxx8;
      expv[8] = 68'h8xxxxxxxxxxxxxxx8;
      expv[9] = 68'hbxxxxxxxxxxxxxxxc;
      expv[10] = 68'hfxxxxxxxxxxxxxxx8;
      expv[11] = 68'he7xxxxxxxxxxxxxx8;
      expv[12] = 68'he7xxxxxxxxxxxxxx8;
      expv[13] = 68'h4dxxxxxxxxxxxxxx8;
      expv[14] = 68'h4dxxxxxxxxxxxxxx8;
      expv[15] = 68'h4dxxxxxxxxxxxxxx8;
      expv[16] = 68'h9bxxxxxxxxxxxxxx4;
      expv[17] = 68'h9bxxxxxxxxxxxxxx4;
      expv[18] = 68'h02xxxxxxxxxxxxxxf;
      expv[19] = 68'h845xxxxxxxxxxxxx7;
      expv[20] = 68'h845xxxxxxxxxxxxx7;
      expv[21] = 68'h184xxxxxxxxxxxxxc;
      expv[22] = 68'ha31xxxxxxxxxxxxx0;
      expv[23] = 68'h9f1xxxxxxxxxxxxxb;
      expv[24] = 68'h8878xxxxxxxxxxxx8;
      expv[25] = 68'h147cxxxxxxxxxxxxf;
      expv[26] = 68'h8933xxxxxxxxxxxx0;
      expv[27] = 68'h8933xxxxxxxxxxxx0;
      expv[28] = 68'hb846xxxxxxxxxxxx8;
      expv[29] = 68'h62985xxxxxxxxxxx8;
      expv[30] = 68'h2549exxxxxxxxxxx8;
      expv[31] = 68'h2549exxxxxxxxxxx8;
      expv[32] = 68'hcbe04xxxxxxxxxxx7;
      expv[33] = 68'hcbe04xxxxxxxxxxx7;
      expv[34] = 68'h6e689xxxxxxxxxxxc;
      expv[35] = 68'h6e689xxxxxxxxxxxc;
      expv[36] = 68'h9327b3xxxxxxxxxx4;
      expv[37] = 68'h9327b3xxxxxxxxxx4;
      expv[38] = 68'h7cf7cexxxxxxxxxx8;
      expv[39] = 68'h41e8e8xxxxxxxxxxc;
      expv[40] = 68'h594e43xxxxxxxxxx7;
      expv[41] = 68'h100729exxxxxxxxx8;
      expv[42] = 68'h100729exxxxxxxxx8;
      expv[43] = 68'h7cb1ea0xxxxxxxxxc;
      expv[44] = 68'h7cb1ea0xxxxxxxxxc;
      expv[45] = 68'h7cb1ea0xxxxxxxxxc;
      expv[46] = 68'h28b2f5fxxxxxxxxxc;
      expv[47] = 68'h28b2f5fxxxxxxxxxc;
      expv[48] = 68'h28b2f5fxxxxxxxxxc;
      expv[49] = 68'h28b2f5fxxxxxxxxxc;
      expv[50] = 68'h7b5b74exxxxxxxxx0;
      expv[51] = 68'h5548c367xxxxxxxxb;
      expv[52] = 68'h5548c367xxxxxxxxb;
      expv[53] = 68'h5548c367xxxxxxxxb;
      expv[54] = 68'h5548c367xxxxxxxxb;
      expv[55] = 68'h621c8203xxxxxxxx8;
      expv[56] = 68'hd1feb467xxxxxxxxf;
      expv[57] = 68'hd1feb467xxxxxxxxf;
      expv[58] = 68'hc9b1d67bxxxxxxxx0;
      expv[59] = 68'hc9b1d67bxxxxxxxx0;
      expv[60] = 68'hc9b1d67bxxxxxxxx0;
      expv[61] = 68'h4a90ccdbbxxxxxxxc;
      expv[62] = 68'h6f4dcf89fxxxxxxx4;
      expv[63] = 68'h6f4dcf89fxxxxxxx4;
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
