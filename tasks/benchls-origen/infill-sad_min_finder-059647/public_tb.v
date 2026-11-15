// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 171;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_059647 dut (
    .clk(clk),
    .resetn(in_vec[170:170]),
    .compare_work(in_vec[169:169]),
    .mad_1(in_vec[168:148]),
    .mad_2(in_vec[147:127]),
    .mad_3(in_vec[126:106]),
    .mad_4(in_vec[105:85]),
    .mad_5(in_vec[84:64]),
    .mad_6(in_vec[63:43]),
    .mad_7(in_vec[42:22]),
    .mad_8(in_vec[21:1]),
    .compare_refresh(in_vec[0:0]),
    .vector_x(out_vec[7:4]),
    .vector_y(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 171'h3783f8c01a184d48c9c777238504d57b863b55a1339;
    stim[1] = 171'h36ad97518071368e940a4c035651ee644162326ac86;
    stim[2] = 171'h542e2e579bf5725c7c0db551cce62a340e9995ea859;
    stim[3] = 171'h4caeb8c4f7e6925cda1680c0c7fef0e5ed74bdb5abb;
    stim[4] = 171'h52a7f0ecdc29517008dc870dc617386cd6ee7673fa1;
    stim[5] = 171'h5d38c80b48f72092257fcebf85ba6a244d753ae6bbc;
    stim[6] = 171'h44fe2e205fe3a072d835346e253e81f289d4f99688e;
    stim[7] = 171'h6d711e76d5bce3e6b297beefac1918a3d9f5beecae1;
    stim[8] = 171'h4f5d288f1393cb8059f71c3479c5989cf48462fdeb7;
    stim[9] = 171'h617432b4ab23972c77aa53b3c006085771938489bf9;
    stim[10] = 171'h07e302ed0ea9dd962fedf0a19983eca3ce61673edce;
    stim[11] = 171'h53aa6483012b67b5c67a8c04cc94d67c8976ee20d63;
    stim[12] = 171'h55104212f646ffda7666081fc6d703783a34fcf7813;
    stim[13] = 171'h785104b8c1f8c32e3f05b660654e1204b5eaf2b66c2;
    stim[14] = 171'h4328beedf6c926ce003a1dd8f94d836f15714644486;
    stim[15] = 171'h4b5214c8825ffb7e77f6f2184d3a479f51ca370cbb8;
    stim[16] = 171'h4b251e7e927e4cfe6f00472547b80066a62506ae39d;
    stim[17] = 171'h42191489276fd553dfb9d8c168af0d2e4fc1917da87;
    stim[18] = 171'h55fe8b5fb168a475a1ec485697bffb472796379fa1f;
    stim[19] = 171'h7b346f17066406748064d29dd3ab1cbf54d26b05819;
    stim[20] = 171'h690b002c58d8ce2b62e2cf4d7526464b9ac429fd7b4;
    stim[21] = 171'h52507dd5dcfcf840c86945e23221b9e4403e7639520;
    stim[22] = 171'h74a6c152b7f530a2ae48009c4cec4187119181e18e2;
    stim[23] = 171'h7acba1ef7309e25ca4f6ea367d89a29be23f18ed8bd;
    stim[24] = 171'h419611c0cc5b6f66879a02641c894645fcffd67f0ee;
    stim[25] = 171'h65c49ba5c68061583129202298d3e6e92c439d3df7a;
    stim[26] = 171'h593a1527d93de4c1c14c526750e0f3e8d3f4d5274ac;
    stim[27] = 171'h6c967b4d696c32d3d34f42bb8ce9bb6738fcb63da5a;
    stim[28] = 171'h41fce2ed3d89cd3408a036ff669c9d02a26480d073f;
    stim[29] = 171'h40c128d1927b59a0d0305efa2b129b725b8742185f1;
    stim[30] = 171'h72d4ece4e0d1113fbfec2d3ecd6c8b96bae43d0ccc6;
    stim[31] = 171'h7d4bc10830bfa7fec767ffae38ca884cfc3827810d9;
    stim[32] = 171'h51898b66de248977e58106318ee20cd77c2c83f68f0;
    stim[33] = 171'h12eb9c4fbdf5d5e7394e89eb6d7613f184cf363c85b;
    stim[34] = 171'h4918f9f51ff8cc99573c57a0193a9587033fb71c73f;
    stim[35] = 171'h6d58945f640dc799572babfb6d74214f48731b78ada;
    stim[36] = 171'h75886cf8670d997e16204c323906f0492d879a37d97;
    stim[37] = 171'h4322c84ccc33007a7f496b84c4e5a607637d79190f8;
    stim[38] = 171'h7c7ddfcbcfc21cf8489f6f8e33e09cd58fb5dd0848b;
    stim[39] = 171'h7f1a79d1698032e7d57e510dcf5f78697da4c0fda61;
    stim[40] = 171'h74609e4db6712a41eef3ec39ff317eb4f71ecf3376e;
    stim[41] = 171'h7b8bb4935d555df7b7df76c73778110e0918c661ad4;
    stim[42] = 171'h4f3b5e31d4734b7e591def9532e62870451f21ada91;
    stim[43] = 171'h67779540de65a8e2d69248c0848aa062e38d2394e0f;
    stim[44] = 171'h657cbb2cf4cd8151ccfa0adf259bfecaab12f8f51bb;
    stim[45] = 171'h6c3bf723361db0c36e63e86a5c72861e2f29180167b;
    stim[46] = 171'h5ed8ec6b113ded06c2ef18db766cf6e312ecbb8d4bb;
    stim[47] = 171'h7b002a75947769ab85c69045399c19bd22382f666f9;
    stim[48] = 171'h696c896fd2b1f687b5cbe18e9f8087ccc248eb2a7bc;
    stim[49] = 171'h7c3ebd91a4de9491d97f2c8c40fc011177e8d46f9d7;
    stim[50] = 171'h57379de914f53a832294e5320d696fece3c503f9b15;
    stim[51] = 171'h455151c435e06d1ac0f2d0314b8eadbe43a533f45a7;
    stim[52] = 171'h64618486dec51a17c5b5b2368c2936480f30602cc64;
    stim[53] = 171'h50307bc82257291283716fa91e5a1bba1cdf571de63;
    stim[54] = 171'h4c429d396ae6c789a2ec197746af7e9d3d9c6ac6c53;
    stim[55] = 171'h7abebbcca513a91961f10e28756b48e0109244a635d;
    stim[56] = 171'h6f8f170c488c6c1be956c3a979ae01df62070dd9caa;
    stim[57] = 171'h2cc05e23b7bac73e0f8ae80d6bd93383c3352571cdf;
    stim[58] = 171'h79ff2f0160204a7e6c8b06d09adfdc572a8847a9f01;
    stim[59] = 171'h6509e67dd5cb39d5c13a3f622d62e2836c2ef710457;
    stim[60] = 171'h545fce1f7fe90c46ca253389acd01bf8ae784ca6898;
    stim[61] = 171'h73bb828682b6dc15fb3dfb24922850094da23a32abb;
    stim[62] = 171'h7a42fc7880827dba8f481400a98d6ad36e2e4066511;
    stim[63] = 171'h7d4cca29c42e1e637d45b70045fa9abcb5010c58ea3;
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
      expv[0] = 8'hxx;
      expv[1] = 8'h87;
      expv[2] = 8'h87;
      expv[3] = 8'h87;
      expv[4] = 8'h87;
      expv[5] = 8'h87;
      expv[6] = 8'h87;
      expv[7] = 8'h87;
      expv[8] = 8'h87;
      expv[9] = 8'h87;
      expv[10] = 8'h87;
      expv[11] = 8'h87;
      expv[12] = 8'h87;
      expv[13] = 8'h87;
      expv[14] = 8'h87;
      expv[15] = 8'h87;
      expv[16] = 8'h87;
      expv[17] = 8'hf3;
      expv[18] = 8'h87;
      expv[19] = 8'h87;
      expv[20] = 8'h87;
      expv[21] = 8'h87;
      expv[22] = 8'h87;
      expv[23] = 8'h87;
      expv[24] = 8'ha2;
      expv[25] = 8'ha2;
      expv[26] = 8'ha2;
      expv[27] = 8'ha2;
      expv[28] = 8'ha2;
      expv[29] = 8'h7e;
      expv[30] = 8'h87;
      expv[31] = 8'h87;
      expv[32] = 8'h97;
      expv[33] = 8'h97;
      expv[34] = 8'h87;
      expv[35] = 8'h87;
      expv[36] = 8'h87;
      expv[37] = 8'h91;
      expv[38] = 8'h91;
      expv[39] = 8'h87;
      expv[40] = 8'h87;
      expv[41] = 8'h87;
      expv[42] = 8'h87;
      expv[43] = 8'h6b;
      expv[44] = 8'h87;
      expv[45] = 8'h87;
      expv[46] = 8'h87;
      expv[47] = 8'h87;
      expv[48] = 8'h87;
      expv[49] = 8'h87;
      expv[50] = 8'he1;
      expv[51] = 8'h87;
      expv[52] = 8'h87;
      expv[53] = 8'h87;
      expv[54] = 8'h5b;
      expv[55] = 8'h87;
      expv[56] = 8'h87;
      expv[57] = 8'h87;
      expv[58] = 8'h87;
      expv[59] = 8'h87;
      expv[60] = 8'h87;
      expv[61] = 8'h87;
      expv[62] = 8'h87;
      expv[63] = 8'h87;
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
