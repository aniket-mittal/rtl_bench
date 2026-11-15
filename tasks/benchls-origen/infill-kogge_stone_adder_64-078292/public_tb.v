// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 129;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_078292 dut (
    .A(in_vec[128:65]),
    .B(in_vec[64:1]),
    .Cin(in_vec[0:0]),
    .S(out_vec[64:1]),
    .Cout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 129'h099237ed339570a5f1af4f0dc83e0be53;
    stim[1] = 129'h1491beb2f53e8a7d4de4bf8cc15192728;
    stim[2] = 129'h0051ab16c1227c3135392fd856ada43c1;
    stim[3] = 129'h13b80cc160fb4f3ce2dda53f7326774d0;
    stim[4] = 129'h18f7854f57f0c6c37109d5a1c784e2b5c;
    stim[5] = 129'h15d4f71c7064b6ef5c317865e1757d3d4;
    stim[6] = 129'h111557bb6c0a965b850ad692a4fe23cc8;
    stim[7] = 129'h0a8a10cb43ccf140d9387d98a9ccea9fc;
    stim[8] = 129'h185e5ffaac636856e13ad339390fe7960;
    stim[9] = 129'h0ec1bd1dd0e2a2faae334610f549b2015;
    stim[10] = 129'h0c71f07f136fd2dc02616eee59abf3d36;
    stim[11] = 129'h06138f20fae162171a96ebe84bf1d2416;
    stim[12] = 129'h1d89c11f9472e31395e70c3e9dea77492;
    stim[13] = 129'h05579b20cf1c118c536b08c076354dc7e;
    stim[14] = 129'h0b647b3c9dba7b053189d1b690c35c0bf;
    stim[15] = 129'h1735bc8e5de6493b7bdf594a7ca11e19d;
    stim[16] = 129'h14e1139d14782a8527efb8b855c509e8f;
    stim[17] = 129'h0ed820f37516b64eb156cf72fa3855e91;
    stim[18] = 129'h151968a3177d801a46bbbbf71052c88f9;
    stim[19] = 129'h13ab3c82edb392b447c68cd57b6b3fadf;
    stim[20] = 129'h0ea445efd86f80886dc889e40daa4a1d8;
    stim[21] = 129'h1e2e395b382fddc99f07be5a3dce1bab7;
    stim[22] = 129'h15ce81d6162dfb5b15c0bdef83e901f7e;
    stim[23] = 129'h1d20649aa6c7d05dcbe46b339e36795f0;
    stim[24] = 129'h02ca8406b1718838080386bb837589155;
    stim[25] = 129'h02dcf962b33b497d7408af7cb2042dc84;
    stim[26] = 129'h0fa39938faba1281ec66fd0e9f0e55378;
    stim[27] = 129'h075d5fc56e43c321a6f9dcc39ab04492f;
    stim[28] = 129'h07a72c290f5398cafb7b770a05f078eef;
    stim[29] = 129'h10cb2fb9d34f7748bbb0658b54c9a8b88;
    stim[30] = 129'h07d045184109b7816ef73037735ac07dd;
    stim[31] = 129'h01bd5265a50e5bf8c585f449d8b8c3eb0;
    stim[32] = 129'h17b3656ce64a5a5561f006cdba962e6f7;
    stim[33] = 129'h009f4935f15207f8b387766b806753862;
    stim[34] = 129'h1d8a67e02f2ee84e6a676441b96158ab5;
    stim[35] = 129'h1cfada34b4382e9f4d050e4c52abf6e81;
    stim[36] = 129'h1c837f5458c1b5d0003ffe2a7e8403bbe;
    stim[37] = 129'h021b0b93f4be9b83632a7781ce27a2228;
    stim[38] = 129'h0e52dda85ac61587e316461fdae8fbc08;
    stim[39] = 129'h0dd056c5adb884156572db78e75fef81d;
    stim[40] = 129'h1171caef08d393bb7f879323950d31083;
    stim[41] = 129'h01fa09099f0d75ada65778da78e9baa03;
    stim[42] = 129'h189536cec2b764b264e3364f659b75e8b;
    stim[43] = 129'h17aa6d9571b3b6fe19b475654c25d9705;
    stim[44] = 129'h0fa15b4bb9475f467cfa0b38e39b09c97;
    stim[45] = 129'h03360438e4a29f177da56274733cde473;
    stim[46] = 129'h11070f9c852da6fc6ce0a7e20458d9fc3;
    stim[47] = 129'h160e7ca173d83d579c6ecba5e4bc5375a;
    stim[48] = 129'h14d89ca373f49029fe67dffe758c3a7b3;
    stim[49] = 129'h0221f52ad0267199a07600cb4ffb8f51b;
    stim[50] = 129'h04651ee2c1797a0e5c0c03ccc07b34061;
    stim[51] = 129'h0cec42af841c9bef93375b3281e90cd2a;
    stim[52] = 129'h114edbecffcedac43b964ea04c37e869d;
    stim[53] = 129'h17c371d1203f01fcd918e7c250b7bdeab;
    stim[54] = 129'h1b39b40dc8526b47ccb53d2764a67bec5;
    stim[55] = 129'h1dcdd0f331171e49a62fccd7cbb231579;
    stim[56] = 129'h1dff783a4e428bf4fe983ee5f233734a7;
    stim[57] = 129'h0ad52d5122b18096613650fbb6c8db37e;
    stim[58] = 129'h1ded11d5ec26519ad6fa2ea0f34fb4bfa;
    stim[59] = 129'h0a775aa48063a2bd7f8665159a25e855e;
    stim[60] = 129'h114c4848bdf8bb7430ba7c1cfa7be9fc5;
    stim[61] = 129'h1c46ed2efafa15891ef0942f690b8eb34;
    stim[62] = 129'h0b130f678fef07f32a591b0206917e2ab;
    stim[63] = 129'h180ec6cc147f11ba8a15a03b9addebdf3;
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
      expv[0] = 65'h1b4186fafbd37c8b2;
      expv[1] = 65'h02767e3fb6901cefd;
      expv[2] = 65'h158adaef17d0206d4;
      expv[3] = 65'h1695b200d421c689e;
      expv[4] = 65'h0a015af11f75a9793;
      expv[5] = 65'h12066f8251da342c9;
      expv[6] = 65'h16202e4e1108ba280;
      expv[7] = 65'h03c28e63ed99dbe09;
      expv[8] = 65'h19993333e5734fece;
      expv[9] = 65'h1cf5032ec62c54fc0;
      expv[10] = 65'h0ed35f6d6d1bc6af6;
      expv[11] = 65'h00aa7b0946d334587;
      expv[12] = 65'h1370cd5e325d5a5cb;
      expv[13] = 65'h18c2a3e145515f542;
      expv[14] = 65'h1cee4cf32e7dd7112;
      expv[15] = 65'h131515d8da8767555;
      expv[16] = 65'h1cd0cc556a3d346e2;
      expv[17] = 65'h002ef0666f4f0c37d;
      expv[18] = 65'h1bd5249a27d048a9e;
      expv[19] = 65'h1b71c958691ed2624;
      expv[20] = 65'h1c6ccfd3e619caa5e;
      expv[21] = 65'h1d35f7b575fdf9751;
      expv[22] = 65'h0b8f3fc59a16fd52f;
      expv[23] = 65'h0904cfce44fe49bcd;
      expv[24] = 65'h0ace0ac234e7114d6;
      expv[25] = 65'h16e5a8df653f7745a;
      expv[26] = 65'h1c0a964799c867b96;
      expv[27] = 65'h0e573c8908f407b4a;
      expv[28] = 65'h0322a333154411b9f;
      expv[29] = 65'h0c7b9545281920013;
      expv[30] = 65'h16c7754fb46477ff4;
      expv[31] = 65'h074346af7dc71fe3c;
      expv[32] = 65'h19a36c3aa0e088c4e;
      expv[33] = 65'h1426bfa171b95b7ec;
      expv[34] = 65'h07f1cc21e89040f9d;
      expv[35] = 65'h09ffe88106e425877;
      expv[36] = 65'h1cc37d7ed745b98be;
      expv[37] = 65'h05458315c2e63da5e;
      expv[38] = 65'h116923c835af11486;
      expv[39] = 65'h1343323e951873974;
      expv[40] = 65'h10f95e129de0c4c3b;
      expv[41] = 65'h085181e417f7304de;
      expv[42] = 65'h1d786d1e2852da9b2;
      expv[43] = 65'h115ee2fabdd9906e7;
      expv[44] = 65'h0c9b66849ce2690ff;
      expv[45] = 65'h00db66ad57df7d5eb;
      expv[46] = 65'h1de7b77e898680f8a;
      expv[47] = 65'h127d4847589490cd3;
      expv[48] = 65'h13407ca1e980caa53;
      expv[49] = 65'h0297f5f6202200eb6;
      expv[50] = 65'h007122af81f4ae147;
      expv[51] = 65'h00239de20605a8c23;
      expv[52] = 65'h0ce52a8d4c06c32e1;
      expv[53] = 65'h10dc599370f6bfe79;
      expv[54] = 65'h07eef1352cf8e7343;
      expv[55] = 65'h03fd9dcafcc94fa15;
      expv[56] = 65'h1c97b7204075ff3f7;
      expv[57] = 65'h0c0b7e4cd97a5bce4;
      expv[58] = 65'h14e74076df76065a7;
      expv[59] = 65'h09fdbfba1a898b135;
      expv[60] = 65'h0206c465b874a5709;
      expv[61] = 65'h1b37815e6405a43c5;
      expv[62] = 65'h156c2a699680861de;
      expv[63] = 65'h02246707af5cfd99d;
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
