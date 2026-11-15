// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 148;
  localparam OW = 147;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_208955 dut (
    .clk(clk),
    .RegWrite_in(in_vec[147:147]),
    .MemtoReg_in(in_vec[146:146]),
    .Branch_in(in_vec[145:145]),
    .MemRead_in(in_vec[144:144]),
    .MemWrite_in(in_vec[143:143]),
    .ALUSrc_in(in_vec[142:142]),
    .RegDst_in(in_vec[141:141]),
    .ALUop_in(in_vec[140:139]),
    .PC_4_in(in_vec[138:107]),
    .Read_Data_1_in(in_vec[106:75]),
    .Read_Data_2_in(in_vec[74:43]),
    .SignExtend_in(in_vec[42:11]),
    .Rt_in(in_vec[10:6]),
    .Rd_in(in_vec[5:1]),
    .rst(in_vec[0:0]),
    .RegWrite_out(out_vec[146:146]),
    .MemtoReg_out(out_vec[145:145]),
    .Branch_out(out_vec[144:144]),
    .MemRead_out(out_vec[143:143]),
    .MemWrite_out(out_vec[142:142]),
    .ALUSrc_out(out_vec[141:141]),
    .RegDst_out(out_vec[140:140]),
    .ALUop_out(out_vec[139:138]),
    .PC_4_out(out_vec[137:106]),
    .Read_Data_1_out(out_vec[105:74]),
    .Read_Data_2_out(out_vec[73:42]),
    .SignExtend_out(out_vec[41:10]),
    .Rt_out(out_vec[9:5]),
    .Rd_out(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 148'h1b3d6679cd129a10e68052e2220db26bc93cf;
    stim[1] = 148'h7036585c5ad77eb8437321cb979279a85666f;
    stim[2] = 148'h5f81657dfcb86392f9979683c92ccda258b0a;
    stim[3] = 148'hbe343e7a4e06ef702e1d4a3623f98815c6178;
    stim[4] = 148'h1da3af438eb0e283b64f553b078e49d0a5ed2;
    stim[5] = 148'h91d30d8042798c9fee5b7bdb9d08453aa6db0;
    stim[6] = 148'he4fa95d8347021e5d66e051864d7393cc21fc;
    stim[7] = 148'h349b8db6f87fc83d5842310027f8dcfb3fc6a;
    stim[8] = 148'h43e278c351bc0a31560a734d2e3d39f512f82;
    stim[9] = 148'h89cc1a404351c5422e9bf62d420542f809402;
    stim[10] = 148'h380cc0414e6ba6822e9377e7d5adebf83825e;
    stim[11] = 148'h63aadb4b88fc986b5752f7210e1368fb784da;
    stim[12] = 148'hbc5344a3fb802dedda12df94708327d14c0a8;
    stim[13] = 148'h1e421bb13ad5d5f3feaaf38e35c0cc3645a0e;
    stim[14] = 148'ha4baea757addb076ec3244ec49b7290b98e4e;
    stim[15] = 148'hd7f56c869d45a9cd4243fc6286e878ee92d60;
    stim[16] = 148'hb519f9405f529d7173d7e23fbb30d664fbd30;
    stim[17] = 148'h8ae18724c84d5fb37ca3d6bfc9de3febb6ab2;
    stim[18] = 148'ha1b4da039806f8ccdc6a98f6870b8272c4042;
    stim[19] = 148'hab0ad5923b16d2f8e57a6d6c88fe20ce72c6e;
    stim[20] = 148'hdd7337f787b2be1844b3e261eb9e5cbec27fc;
    stim[21] = 148'h880808a21d7b81501350f85057ed6758c338c;
    stim[22] = 148'h8927ff0e29487aaac9921bda0ac8b602acaa2;
    stim[23] = 148'h31817ca1dc53555054c1200ff295b822c4962;
    stim[24] = 148'h4c6954bbb6d7dc0ea3cfd398e24c4ebb6ab60;
    stim[25] = 148'h008adb40772c49ac609a47682d98be8b578c8;
    stim[26] = 148'hbfa2898c762143ce6a63ac55513e2e1c6af60;
    stim[27] = 148'h1e2047bf0c9488ab81f2fd72bc3e04a6a356c;
    stim[28] = 148'hd3bbb82e0098a776fdc6440330f865038919f;
    stim[29] = 148'h1913ea0c4fbeb0e101c63522b77b64f4f25e6;
    stim[30] = 148'h8774554ff66b92c541c3578c6a254e8509b30;
    stim[31] = 148'h1eb0584c63d002e5e343075eff98a9a43f652;
    stim[32] = 148'hbafc390cc3a2d2771364b29ec85b681718d90;
    stim[33] = 148'h959f9102aea1887c990a807858ad1f00b4fd4;
    stim[34] = 148'h8a07313de03865122adef9909d5fba77fcb0a;
    stim[35] = 148'h8c1468b0689249d89fc5ce00247350acc4bba;
    stim[36] = 148'h7b7d862d8f360ca1fe44e15014571c2b234ba;
    stim[37] = 148'h172041f06f575c47eae3f1fb38bdb15a1e35a;
    stim[38] = 148'hae269041db84687e3d843196b92713b3b937a;
    stim[39] = 148'heabc7858fdca2e78b5a6768a6078ad5bf57e6;
    stim[40] = 148'h914ad47acbee502bd6d687000efc4093e506e;
    stim[41] = 148'hf05821fbe3c3f49afcb8345f93848c3be777a;
    stim[42] = 148'hcdc89ed21ad483f79bc2c19d29df6f8af6cba;
    stim[43] = 148'h8c630fadaa4e85f429672014b7f9f44e153ca;
    stim[44] = 148'hadba3614183a35daa51e8a29f604343c5edf8;
    stim[45] = 148'hae722355ffd7687536fd8a46a2a8f3239f35c;
    stim[46] = 148'h3c4da7d120d092e950ae99af2da55e9a968a8;
    stim[47] = 148'h29d32c96bb9ed117f94efb2145f7fb6201d5c;
    stim[48] = 148'h3a5acc9871011c97dad7f41b672b09c927876;
    stim[49] = 148'h2af644f1f310f810a061723ca01fd0c23c656;
    stim[50] = 148'h23918bbbcbaaed8cac84abdf2b4d7d1e3e6e0;
    stim[51] = 148'h1b59309cfdaaef50b07fd8705cba6c9b55876;
    stim[52] = 148'h366a816723a17a6c11caa748e71e186d2f60a;
    stim[53] = 148'hf60cf2996fd85c9be494b6400e3eeb482443c;
    stim[54] = 148'hcf2dc3bfcad8d0ab5d10c62ac87904b08a05e;
    stim[55] = 148'h6906a381713b1f98951858ab1086c765bb432;
    stim[56] = 148'h3fbea267b5c5c6968632db469ee384f0043f6;
    stim[57] = 148'hbff7f1a01ed2709ae099249c25b19669a4948;
    stim[58] = 148'hd999f873d0d1fee80741a1eb81b6a70ad1c28;
    stim[59] = 148'h15ce0657e9d44848706f8577ea32cedb23c84;
    stim[60] = 148'hbccf9cad5b93e994e69a351d67bec1a43add4;
    stim[61] = 148'hc3c4eb253e68239f891d834e810883aa0ffec;
    stim[62] = 148'hd212d93b07796aeb2e96f68c80391930c0ad2;
    stim[63] = 148'h67272525999015f5f5edd3dee5966b28eb6b4;
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
      expv[0] = 147'h0000000000000000000000000000000000000;
      expv[1] = 147'h0000000000000000000000000000000000000;
      expv[2] = 147'h0000000000000000000000000000000000000;
      expv[3] = 147'h2fc0b2befe5c31c97ccbcb41e49666d12c585;
      expv[4] = 147'h5f1a1f3d270377b8170ea51b11fcc40ae30bc;
      expv[5] = 147'h0ed1d7a1c7587141db27aa9d83c724e852f69;
      expv[6] = 147'h48e986c0213cc64ff72dbdedce84229d536d8;
      expv[7] = 147'h727d4aec1a3810f2eb37028c326b9c9e610fe;
      expv[8] = 147'h1a4dc6db7c3fe41eac21188013fc6e7d9fe35;
      expv[9] = 147'h21f13c61a8de0518ab0539a6971e9cfa897c1;
      expv[10] = 147'h44e60d2021a8e2a1174dfb16a102a17c04a01;
      expv[11] = 147'h1c066020a735d3411749bbf3ead6f5fc1c12f;
      expv[12] = 147'h31d56da5c47e4c35aba97b908709b47dbc26d;
      expv[13] = 147'h5e29a251fdc016f6ed096fca384193e8a6054;
      expv[14] = 147'h0f210dd89d6aeaf9ff5579c71ae0661b22d07;
      expv[15] = 147'h525d753abd6ed83b7619227624db9485cc727;
      expv[16] = 147'h6bfab6434ea2d4e6a121fe3143743c77496b0;
      expv[17] = 147'h5a8cfca02fa94eb8b9ebf11fdd986b327de98;
      expv[18] = 147'h4570c3926426afd9be51eb5fe4ef1ff5db559;
      expv[19] = 147'h50da6d01cc037c666e354c7b4385c13962021;
      expv[20] = 147'h55856ac91d8b697c72bd36b6447f106739637;
      expv[21] = 147'h6eb99bfbc3d95f0c2259f130f5cf2e5f613fe;
      expv[22] = 147'h440404510ebdc0a809a87c282bf6b3ac619c6;
      expv[23] = 147'h4493ff8714a43d5564c90ded05645b0156551;
      expv[24] = 147'h18c0be50ee29aaa82a609007f94adc11624b1;
      expv[25] = 147'h2634aa5ddb6bee0751e7e9cc7126275db55b0;
      expv[26] = 147'h00456da03b9624d6304d23b416cc5f45abc64;
      expv[27] = 147'h5fd144c63b10a1e73531d62aa89f170e357b0;
      expv[28] = 147'h0000000000000000000000000000000000000;
      expv[29] = 147'h0000000000000000000000000000000000000;
      expv[30] = 147'h0c89f50627df587080e31a915bbdb27a792f3;
      expv[31] = 147'h43ba2aa7fb35c962a0e1abc63512a74284d98;
      expv[32] = 147'h0f582c2631e80172f1a183af7fcc54d21fb29;
      expv[33] = 147'h5d7e1c8661d1693b89b2594f642db40b8c6c8;
      expv[34] = 147'h4acfc8815750c43e4c85403c2c568f805a7ea;
      expv[35] = 147'h4503989ef01c3289156f7cc84eafdd3bfe585;
      expv[36] = 147'h460a3458344924ec4fe2e7001239a856625dd;
      expv[37] = 147'h3dbec316c79b0650ff2270a80a2b8e1591a5d;
      expv[38] = 147'h0b9020f837abae23f571f8fd9c5ed8ad0f1ad;
      expv[39] = 147'h57134820edc2343f1ec218cb5c9389d9dc9bd;
      expv[40] = 147'h755e3c2c7ee5173c5ad33b45303c56adfabf3;
      expv[41] = 147'h48a56a3d65f72815eb6b4380077e2049f2837;
      expv[42] = 147'h782c10fdf1e1fa4d7e5c1a2fc9c2461df3bbd;
      expv[43] = 147'h66e44f690d6a41fbcde160ce94efb7c57b65d;
      expv[44] = 147'h463187d6d52742fa14b3900a5bfcfa270a9e5;
      expv[45] = 147'h56dd1b0a0c1d1aed528f4514fb021a1e2f6fc;
      expv[46] = 147'h573911aaffebb43a9b7ec52351547991cf9ae;
      expv[47] = 147'h1e26d3e890684974a8574cd796d2af4d4b454;
      expv[48] = 147'h14e9964b5dcf688bfca77d90a2fbfdb100eae;
      expv[49] = 147'h1d2d664c38808e4bed6bfa0db39584e493c3b;
      expv[50] = 147'h157b2278f9887c085030b91e500fe8611e32b;
      expv[51] = 147'h11c8c5dde5d576c6564255ef95a6be8f1f370;
      expv[52] = 147'h0dac984e7ed577a8583fec382e5d364daac3b;
      expv[53] = 147'h1b3540b391d0bd3608e553a4738f0c3697b05;
      expv[54] = 147'h7b06794cb7ec2e4df24a5b20071f75a41221e;
      expv[55] = 147'h6796e1dfe56c6855ae886315643c82584502f;
      expv[56] = 147'h348351c0b89d8fcc4a8c2c55884363b2dda19;
      expv[57] = 147'h1fdf5133dae2e34b43196da34f71c278021fb;
      expv[58] = 147'h5ffbf8d00f69384d704c924e12d8cb34d24a4;
      expv[59] = 147'h6cccfc39e868ff7403a0d0f5c0db538568e14;
      expv[60] = 147'h0ae7032bf4ea24243837c2bbf519676d91e42;
      expv[61] = 147'h5e67ce56adc9f4ca734d1a8eb3df60d21d6ea;
      expv[62] = 147'h61e275929f3411cfc48ec1a7408441d507ff6;
      expv[63] = 147'h69096c9d83bcb575974b7b46401c8c9860569;
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
