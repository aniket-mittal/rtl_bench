// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 256;
  localparam OW = 256;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_025557 dut (
    .diff_i(in_vec[255:0]),
    .bpx_o(out_vec[255:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 256'hf49b7990695c87feeb78911ba6a1fc6c3d63eca3ede9d6d9a2fc1917199e30f0;
    stim[1] = 256'h203d162bc1796beda03e5bfacc647656002cd1b4c079c43b246d05b956a61430;
    stim[2] = 256'hcc2e4a3201344652040fe25dd1b07f795642c5492010d1894e93b74dce43328c;
    stim[3] = 256'hdcdead1b6f362ffa6961f1b35f5e1033618cde38fc0578230129f483eb9c9ea4;
    stim[4] = 256'h87c5ebadb2fd413de2236c4bdd18546df74fa5005afe5b8c3390bf01a610999f;
    stim[5] = 256'hbcb88c344d54fa8baa110108f49866e92aa1229f59a3f6f787e6d8182cfdaed2;
    stim[6] = 256'hadb1842ea90ed25bff4e6e966437975d88ba5a7988f58c6a44d26037c2996f56;
    stim[7] = 256'h00b95be3a912140fca83e99c8f2b2087926e8895fdd521290c104f5be9a27fe4;
    stim[8] = 256'heb0e41e86c2de9f789a9c192383725f003471a821a2ca6bc5e8809d72662b6f3;
    stim[9] = 256'hcf5c075916ceebf04381ca98b1e57fad1babed14c8dbe4652da28805045d7053;
    stim[10] = 256'h443c2e74c8bcdaa49ce80db11c55f85a55def8879130e227843b2a5bbe844f9f;
    stim[11] = 256'h4d54b1bc4f909a9843022cf2781f0aa4848aa9cd45fbad49c6d237400c7a86ed;
    stim[12] = 256'h1489eb3434ca5eff06a13c8f1b4c1fd0681803c8b74e1a2ac24af9e1977117ba;
    stim[13] = 256'hb9217945f238fd47edfcc1638cc078a72531fa3d76f8741860fea71b90106a8d;
    stim[14] = 256'hcfa09674efe7386cffc2f3c6856fa4b4b5882b3298c6d70f617bc7fdd9aa2c64;
    stim[15] = 256'hafda591b8396f3f34230201e249ad0da1551fbdc8f5ec69c5c6ba374c9d7753c;
    stim[16] = 256'h8119b61ba40e16849fa7522b48296e479d6f2e6555ddcebb73a316a7cd8cf016;
    stim[17] = 256'hb7c167cf783e0032c21ae43ce0fb9c654dcdee6cc0a784f9d38d8e91962c62d3;
    stim[18] = 256'ha5e0bda32ecd88a1a692b601c3049712ebbd718b231ea00aecb1a882d736cc57;
    stim[19] = 256'h3c75381cd55686bd072a3d30b5a403bb5bdec624d461a4933e4b7932b72c2547;
    stim[20] = 256'h020df57e1c320dbf30af502347371cafd0aa2a170adc7c0da188a03724fa596b;
    stim[21] = 256'hafab82eac45613084432567a30c50ae58307d85eb703da1c315c3a4a15d0abb0;
    stim[22] = 256'h3c067268d99c339a82b74a68803e4a12972b060c985bba094152c111654896da;
    stim[23] = 256'hbbe66d1c92c082995cbf5c9e55148b292c00fd7faa8446b5d1500acba98506e0;
    stim[24] = 256'h1eee57ef625a480734306377edb72d96416fc4752160d0aaeec72ba28e2df659;
    stim[25] = 256'h02ec4fa0b15b6f18b5a8f08991f0b9ba7809c6602f59b1445116a98c8574f185;
    stim[26] = 256'h7af9a59d11816ecf8001d2dde33a0cb3fb693b3bb713a3cbf6e6fc9689ecf947;
    stim[27] = 256'hc48ff88f4ddd311b52411fa2ac43391a8f97abfcf044f5626947db1652ab01d0;
    stim[28] = 256'h1f8894e3fdedc7539be9179ce92c4dab48fa33605916678cbc59c6fd38149be6;
    stim[29] = 256'ha804fa628a8abeae0d40fe36bde83c52864760fde82d11490814e590666aa82d;
    stim[30] = 256'hab78c515a70e47786d8f6ac16169ba3e7442ac60ab817d52e68b0d4de2df6ad3;
    stim[31] = 256'hd2fda8dccba4ccf9f2495532ce8b9e91eeb6f6cfa489cab25ce2413b35caf57a;
    stim[32] = 256'h9339bf2f02db5b4c03a5a451a43f7abf11f9a33d2f7a80f35c4fcac6339fb366;
    stim[33] = 256'h5fc1ee51f5576b9da1eaec07ceffeea34de6a2e264130b1cc70e7d5ce34a6264;
    stim[34] = 256'h197bee7096180cfcc2577ff4075ecec9803004210ae0404e168f907d7e51dc83;
    stim[35] = 256'hc48bbb43db1f082fb27ec0e576b81a5d14e7ecbf2f99db1cc2422164f69e7f69;
    stim[36] = 256'h5536b7e40f12e6971cf217b9eaab09d6c0042e8042509960f18305ac2a11bfbb;
    stim[37] = 256'h5e820a6c3c875672a9ee75196aefac74c18b7a191e1377a88bc1f243c79e8181;
    stim[38] = 256'hcea9ede51bdc8ad988720e14b1d3b83eebe56d6bf59b287e5c319b53e0e102a9;
    stim[39] = 256'h127b050069ba7deb53723511ac87a9dfdbe6571b4c73012d725ef03096662700;
    stim[40] = 256'h99fa41ef4f7da383f164ce2a7c7351ce290761db1ef9322ba403fda77149df4b;
    stim[41] = 256'hb67386366846642af008a7ae2336a74ef212f43676342689acec00dff11c5933;
    stim[42] = 256'h3d536b9282cad70309c1d4681b5500e1121c514f518805f8a4a4ccf17def0fee;
    stim[43] = 256'h1a81abe4d655144ce9accc945f91f422d949873f1f8ec1d3e7a2dd55fb8672a4;
    stim[44] = 256'hcf5a354ae8eff2658f08a8d540439cd526d360f91e5b222f53456053efe00db4;
    stim[45] = 256'h0660bf68dbea3ed6f29437fe19ce58c57a07e63e0e4654c700913fdb5ece7737;
    stim[46] = 256'hcfd7227a5bbaf67f7eac64bc1b894918e70a283dc9d43314818b2c93aca78ed9;
    stim[47] = 256'hfa74f1f809250c97e602833f5ce8c636ba4d2f08ffd9666c60ff1a19e76eed05;
    stim[48] = 256'ha04a1e1ad142249a7a1db395a0e474e2e7af0015959b8553831b776dcc7bf26b;
    stim[49] = 256'h513d9ee04e1e4ae6c7d1fe1f6fa7fb943497a8537634d75c24d25223c1742992;
    stim[50] = 256'h93bafa498f8e02cf42650c80d88231f7151a54c3ee6edbe3bb7d87d60e752db0;
    stim[51] = 256'h07e0593d64bf7cd0ef8305dc6dd357a72661ed93d6110a49d5c10e5f69c91b3e;
    stim[52] = 256'h078e1632445a4f2ac075c7f449f947efbde09afd59c73c0796b41310d91485e9;
    stim[53] = 256'h9301b142970149f61b6d072bc0587b4c2dcf937c4542be890d6e887a5c25cec0;
    stim[54] = 256'hc1d22d3fea835f92be6d99a300c17ea85f7b1666a98719285d4007c733c758b0;
    stim[55] = 256'h154df0dafa13fc5138dfb8bcd86c929a9a182d722222ac231a04ff2a63520a75;
    stim[56] = 256'h00e644d47e29e4c36004492068bad8b6b1504e38f361df0007b8fef59729d541;
    stim[57] = 256'hddb654d72b615aede4bfde55bd96394a9e33a87f1de4cb93c8129733105d1580;
    stim[58] = 256'h6a10cc7e3ca3804404846c7104f4c14e7f1ae900abc4e24145e96376d25d5877;
    stim[59] = 256'h7d35910136cc9287bb0c09a09a0683072092b032e0c3c1cd10368b3e05bdcd40;
    stim[60] = 256'hc3cb599ff7ef263d5a2152532b764547be502e6b6fb2967451b9cb92bd65323b;
    stim[61] = 256'h7306123d0529a9b24a5d0a997d8e4a93c4cd51c348d9f3a0c130a2e57c06e2e1;
    stim[62] = 256'h39b55931fce091956a13b9aa9411eb782848a3cf30c72076c9d99edaa8cfbd66;
    stim[63] = 256'h40a64cd7632aa57d5e32f82e786aa27fd6de0a1b062ee830aeb7281cbb15de49;
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
      expv[0] = 256'hd3ae3fc5fe6d5084840c9382dcbd7fbc18a12e13ead807384493f8c0292c8fac;
      expv[1] = 256'h09983a1406a7145cd8e97b9d33a560ce330b704b363717be533c53e26d53247c;
      expv[2] = 256'h802c2369a317d1f5771cfabe41388e40f54c97fba681b12035b060577b39f39a;
      expv[3] = 256'he130683fa8dcc217661d3141facea14faeb340689580166931114d3d65e4a4c2;
      expv[4] = 256'hfc88a56b1a336b6b5b5a6aa830ef2a4f3833c1c4e016aa0afdfb2b80df892c1a;
      expv[5] = 256'he38d57e76d865c82dc80ec2b84c7fc7bbdd9830bd79f8bf03f88a40d0ae3ea47;
      expv[6] = 256'hea92ce4c697bfba7db4560d91b3b2167de768f53a91efd95230967c8de71754d;
      expv[7] = 256'h58f9bc0d6859f036688607343e36d75d0facf5e86aa5351936d49c954ca0df0c;
      expv[8] = 256'h93f11353a8d053c6a46e479a1e522e9cdfd5047313ce6a7a8c12bd05e6f23aae;
      expv[9] = 256'h877d6e60d0db416754a94cc55a15f7c58f2978a3ba34df38c2a5f7dd9c6d21d4;
      expv[10] = 256'h0fd27a8d9595989f6f15c57a23cdcb3138748c229b47b1f457ad82f42235ca28;
      expv[11] = 256'h3711f6c3ff89eb1678a13bf047252241ec327369c30beda652f3de4da2527bc7;
      expv[12] = 256'h655118b942548c4d1e651dc1a24bc31a7c159d4efc88db6b3c2c23c146c007f5;
      expv[13] = 256'h8aed2469311b0aabd525d020c09181be88884a0f3503af321ad8b213faa0f843;
      expv[14] = 256'hecfbce3cf10fc8c54253b62e6d062a8fb925f306b61bee6d916bb057a058949c;
      expv[15] = 256'hcf073b2c2c844df2e0eb56ad743fd5e48742c85ef40da25edb8db1f3e495c60a;
      expv[16] = 256'ha9c0875e29ebd9d4287d2f585af6fc71263e6aaf7b5d193119309dcce626be29;
      expv[17] = 256'hd0ae6ff92803967ad590cc85a06b349f1100f0fda865070881f7d2c7c5c1e17a;
      expv[18] = 256'hf7ead2fa33e27271bda84a6f59c38ea90e63b1ef82a6912d344dd992adf16554;
      expv[19] = 256'h0b0d6b08470d8769ad7dfadf9c44df06cc58095ceecdba6b596f9b564f6864b2;
      expv[20] = 256'h2141c4e4116942e305fde4ba0873f4ab66e5f951200c785fee126f0d76006986;
      expv[21] = 256'hf805aa0764b09853ccec3af75621334ed76a089fddb76a3afad7877ab47712b8;
      expv[22] = 256'h0dc88a2335fa8ece8a6646e59d11cc5bb273d156d972ef0f27a3564969a723fb;
      expv[23] = 256'hcf522d9d2bfa1f4c84e98bd8f9bd88c9a80f89f8410f0f3ebaaead34eb192bae;
      expv[24] = 256'h500d23da2e35d51926c6ab75fc2b4fb5f2df53aea79531638caa31344c0b999f;
      expv[25] = 256'h58ff223b3edb97bd3cc32fa057481ce06afc4af605d3e56dc481011d089b66eb;
      expv[26] = 256'h75b98bfeb6814a19a1353b01ba3846548b234d9c6004f9dbb03fb7247e7440da;
      expv[27] = 256'hf418fa25d8dce5cc0ede246d05b961bd5a88ea9da10366f40d9d372c0ed3039a;
      expv[28] = 256'h7ed941b361939bc20307a8e8b5fd1e47e56fa504e2e9ce6fbd9761968c4a4c71;
      expv[29] = 256'haf2c98321f49e11e835b450311052e7f8d950fd76c14c9ee7c8b14653fb9972d;
      expv[30] = 256'ha8522ccd4beeff52aa13691518ac398f94e4a9737b2688c2b0a2eb7bb4bf47ba;
      expv[31] = 256'hff8fff46a4674da13e785bbcb42388c02afdf70e2d646e1fdeb40bdf41fbe76f;
      expv[32] = 256'ha4696336237b26c7777d38fa9678a8851110896a466a44318fea35aac852d431;
      expv[33] = 256'h69ef70889781a8375489a094b7e37d1bbe6a86448e504a858b61bf3ff9caf066;
      expv[34] = 256'h299384635864837d00c75306ac4414a6ba5349e44c59288043902813a887199c;
      expv[35] = 256'he8b4768cf0cd145739a51ae00d13ef354388a809ea1ec6197893a3d000db04ed;
      expv[36] = 256'h335d92d3a1141f536015ac1b97ad271c6d6f249cf33f422914cc4879c65b2aac;
      expv[37] = 256'h44c6c1efd7ab63970a82815892de1d04b3ef47a0a6b97388f92b64b063f8b867;
      expv[38] = 256'hf78ecc2dc2ca35b1450f02d17d14f6bde2fcba51db92de21be54fcb273696947;
      expv[39] = 256'h050fc0284ece2ccc04aba952899bf14e09fa2db86d26f00ee7e89d802e7243cc;
      expv[40] = 256'hd3a114b22f4e209d2a3393979252b99298b7830d4050d595475c13e1e4b3ae2c;
      expv[41] = 256'ha0b2a1d86e330982953f16938b3a42d659d5fdc9bf663f02c308e4c53515db0a;
      expv[42] = 256'h1e6105f578143cc8c66438e0f23de8c5f6b4bc37a6bc07c07d2cc2e89cc5aa19;
      expv[43] = 256'h78f6a7ed655c64572d69d371bedd89f1aff645123e92e09db773017b4c85c676;
      expv[44] = 256'h8eb3500dd1ae24f1703dc7d14d33efbcbef1419bf9719441f31746d3f3119a42;
      expv[45] = 256'h2dd521547042864a2b27173d5d4a225815e40a479d6be7138cc18210079dbc4c;
      expv[46] = 256'hc6548cdf9df600de6c523e2d6869a53dc2466f7ade2fed45bc785778b6865883;
      expv[47] = 256'hb1a68c4ac128c384841be400858c27beeb0571065d879639c668c1232cc3c637;
      expv[48] = 256'h893dce8a45ba4fb5ce2841083b5ddd514832593b53969e6557f71fdf7dd11a12;
      expv[49] = 256'h31e76249aa0d79254ac4b7fab55d73f30a49fe670387ee86420395f5ef60086b;
      expv[50] = 256'hed1d1bb15cd424e5518a32938048ef121d23ac1f7049e2b4e2e4f3c6f6c6cc5e;
      expv[51] = 256'h45d538c42e4b5118351789d5699ffc9a018e3faca8238b8e9a7c3282b028efed;
      expv[52] = 256'h40b5f4cb4e4aa8c21faa8e48250168bd735900f5ad7e2dcf9d50b266f54cb88b;
      expv[53] = 256'ha90863233a473f78321dce0f88d4a04c2b51e1e20bb6093490d3bc9cf7408fd6;
      expv[54] = 256'hcdb50c1587f3dcc3729589df6b71bb826941290908217f366d504088e9e63a80;
      expv[55] = 256'h3a7b82204137920d51f82f14954fef9c6506321798a9c0d35e17bfdfd903bc97;
      expv[56] = 256'h53078a7a28ade4493537f247569a460e1429e81e766f10de334408124c25a437;
      expv[57] = 256'hd1eca7a1e65db1257a7b6294bfb4ad6ef91563fafa9726a22b994f56c73f8846;
      expv[58] = 256'h26462e48977189b7ad030d8e44206a6ee035285901cc6cd3adec4eac101363dc;
      expv[59] = 256'h279a6f26a39a6025cc90b757a218c880ee6071e2c9ad006846ca552efa2c535e;
      expv[60] = 256'hdc008678b0b7dfdc63fbe4eb36f87a944c3c7fb26a8f1365c1ba153fa3e6a6de;
      expv[61] = 256'h0315d7b383df292897c2fde0a651253327a76a404eb28c14b9ebd23afffe64b7;
      expv[62] = 256'h4f3a34fe63b9612bf030fedea7dea279d3ded98c61bbc5d949da2012f3b401f3;
      expv[63] = 256'h5222c2caeb8f00c976d2c5eb5e96d6b63454a7e5562cba6d2f46301c47d6ec87;
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
