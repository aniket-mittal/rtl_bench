// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 258;
  localparam OW = 129;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_123873 dut (
    .clk(clk),
    .rst_n(in_vec[257:257]),
    .start(in_vec[256:256]),
    .plaintext(in_vec[255:128]),
    .key(in_vec[127:0]),
    .ciphertext(out_vec[128:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 258'h0c40563917e6964a4fc17f83b521a8d19aae725a9260096d4ae445619e20a4fc7;
    stim[1] = 258'h08ccb82cd08945b5269376e8d935c8e015b3c0ec18a08a64a5c2fae6d7037c1ef;
    stim[2] = 258'h2b34d8063220639541a5dfbf424350c623038761a053259866a74d3479fa6c0f2;
    stim[3] = 258'h3b08b5defa7890d1c2bfb01e381464bfbe3de87b41a9ea624ba8e113087f2a31f;
    stim[4] = 258'h238a0821e2205b710d324643de949e9a28068ab8f216ee06f3458897925cb03f9;
    stim[5] = 258'h380b9ce9bc16a475ec7ded0a48fef55d07a410e63010cad13e7a7ab6614ad9084;
    stim[6] = 258'h2d41d71ea182a100285a6b3bd23fc0561a98f4be80c24aed71cd04fde0d0b6f4d;
    stim[7] = 258'h27d74d22b25afb42f10d5609661f72dcf9cded91677c0a50552ebe0effc0a3e4d;
    stim[8] = 258'h2ed6335dbb4b00e3abf884814b96bb6072b049012fb77d553bc8994d4866c0398;
    stim[9] = 258'h3f3ee859c20fc3dc8092418f0178d5c8aeae962ea7d94a326528f007f1f687e93;
    stim[10] = 258'h29e25455a1eebe00d9ad04618620689f032f559f95869d664fe3aaad6fa391616;
    stim[11] = 258'h39ca218510e99581bf5a8d8678f9b5b4f3befbd49cb12b5225ef09bd8af3d082a;
    stim[12] = 258'h2f1ba5f8796856812336649a7a2be014d5bc55efbe2598381098ed5249b315318;
    stim[13] = 258'h23d31943e0152dcfc47cd2fc615db14623d784db2424728999cad73b28ba1260a;
    stim[14] = 258'h24cd311022ad8d4f07df734052d58ce9cfdda944ec09d9c1ac25c39b1aadbda4f;
    stim[15] = 258'h37021350b907cdcf0065829dc98046e140774eb9ba461cabc9614b2713282c93b;
    stim[16] = 258'h3220187191f77a8cd56902c5bd45aeba81d46f31998b53a526b44829b5d2c1bde;
    stim[17] = 258'h37cc643e19cedd775172ad8f9fd0d18ae09a250024a1a0aa37990a2f3ddca9eab;
    stim[18] = 258'h282a6ddd242d95cd05d038733367b3228cb2b272f7de248c3d110bd27352d69c1;
    stim[19] = 258'h2b8074fccdb647e330d5099ab5f9eefb06c4a18db6799e7fe7e1406cb244dc4c2;
    stim[20] = 258'h3053264d17c645189e49029eb71d0c5c65d9db6d7df512be210da60de1535d40b;
    stim[21] = 258'h3c54f765caea0978608346575f349fa39f8b7d1aeb1e1f440b9be5e35685fc28d;
    stim[22] = 258'h3014c3eaa01443eb1deb247a6a65857ce89070bdb5caaa44bbdb519da317a067f;
    stim[23] = 258'h3f30f1539b7b62b46d341e54a7cad122b562d2fc1b0e109307d05622c3d9740b1;
    stim[24] = 258'h2d63bcd0d2f5ea59a58937e2149448a11a8775acab2fca3b1a83d6391653d2d16;
    stim[25] = 258'h3ed1cb4143704e096c21651b93b58255b57a548d4e276948f19b5cec91ca092a1;
    stim[26] = 258'h2dffd7aeee3d00e2d958f8debc54d8089feb0a371722b5915ddc9573ac0cc55cf;
    stim[27] = 258'h344a0ca7f784c46a5d30a70eb3c554b8f26fdfee28e1b09c4b5d93db2dfccf5cf;
    stim[28] = 258'h3ec983353efdb4e39832afa000fc8ee3a11f9633e31d502a16efa49d8d294260b;
    stim[29] = 258'h39d0475c63d40ebc5ac4b013d5ef24463136365680f8f5c5dcd7ea260a7dab6cd;
    stim[30] = 258'h20d5246877eb0eafaf4fc45a378e7a3b968e25cf8fd1f59792bf9278993e8f4f3;
    stim[31] = 258'h2e86b3787e219f20ead009a61da3be836b9c8ddbc55af3cc1bf74ad91f7c5059c;
    stim[32] = 258'h34f026fb6499fc8aee22a634995aa2114293474aa48a2ad1cc96494a812fcc440;
    stim[33] = 258'h38a57cc39440125eb9f30b5aa9eda03c082eac669cd1756edf4a76e3d5ef18397;
    stim[34] = 258'h398aefc0e4161cc740ce4e723fca94c301caea094478a891c175f0b0419466f71;
    stim[35] = 258'h2fda29c54ca84750f366c6ac08669f9c9b2b725d0c5bd1c1ef804237ade839dc6;
    stim[36] = 258'h3a35ec0d6720bd607e26b04036ae200a725d68cc1a4f689fd69c99a4e528f259d;
    stim[37] = 258'h229e6eb5103df763513b0bf6df93fd697a9f7c68821156660c8560c913d86a416;
    stim[38] = 258'h2546b81d7100c570946e933d29325cd133da94ba86ac2899cbbb4e4d40dd9741a;
    stim[39] = 258'h2b1543a5b3b8b3537fddff627ea390f9f1ce68f82becb253317248e892d12c1d8;
    stim[40] = 258'h3679c21ea341f2f19b854fb48577f1319b7d0346caa299edc0ff40bf18ecccdd4;
    stim[41] = 258'h25730c145fed1725228638274e2e4c82fbc8acf7cec811a72f8acc07df288ad36;
    stim[42] = 258'h28bbbf1421ff090d131c11e5b4dd4770e7cd9d1fb794646600b774d14a190e9f2;
    stim[43] = 258'h36e8839d3fc84c0bd2b4c795ed9abe93d46610a96a01b381e28d07665e551fd33;
    stim[44] = 258'h3d629be335edbd76742ea257aa20c1ebae12f5a97bcf8b744abb745a0a2d5b989;
    stim[45] = 258'h23ea4f3eeb592d1c9c61ec6c1939c0e7711ef1c10bb4eed385885af0c4d0dc5f1;
    stim[46] = 258'h220d85b28f4f58a1571ecc64081f804ce2c1b9f50eb13a8e48106f2e72612be96;
    stim[47] = 258'h2304d34f0ef1a9a4c38498eb399c20b0714271b8d0b8b4218b15315eb24edc20e;
    stim[48] = 258'h2693a78d82b75cf7ff2b85cc1fc4b3c28f0d9fb25516374894d586653d1b0a970;
    stim[49] = 258'h254df871af276b1dd9fe428a0cadb78148a3532952bdf6397aba13509787266e0;
    stim[50] = 258'h3f9e7f6e2763daa06884d61e6193e3efccf35166978062d895ee722d6c8a47f4f;
    stim[51] = 258'h37b8286e1e6fb34c074ec92e85825d69285bf894476ce44e6cc9d80d18d265cd5;
    stim[52] = 258'h216e961ea411e7ca281da1c607ba2ae3aac05a33bcb1d1dba8fe97b7e3c072b50;
    stim[53] = 258'h300abde4b8d89a105f1055f69430e3a6aa5c3022126cd6b103c703c44321315ea;
    stim[54] = 258'h2b33290dc3d34db7043ba407c744c610b6a62b6cb77a7e0607d7496b2d7dfcadc;
    stim[55] = 258'h3e61e347b11b77c7a716a03ae6a2d1b2ca868ad3409ce8c164780c9cc207bd1ef;
    stim[56] = 258'h2e03e8c247643f58bb1cdbb4ab5d8e7b0c5e8761853442d86140e76a76c6c6d47;
    stim[57] = 258'h0f34132e91fe53892b478f52341e4d1580e595eec45495871059136dbaa3bb9d8;
    stim[58] = 258'h33fb53bd68196e96d7a357073695f275155f1d298be31c730ccf7b6172512a844;
    stim[59] = 258'h3403db98ee2b9b767cb5f3dca0279b5f6abe797f4484b5c8a7843970a05f30982;
    stim[60] = 258'h3276c7b48e84c60134a121784debc71cb1fdf94c9ee5cea397f95b6d0cafe3beb;
    stim[61] = 258'h356e30caaf421f0440ca170d31ac36d526bdb79b5150bd0329ebc9a7eb4c770be;
    stim[62] = 258'h3f1599df8b6b6db1e19be30be8e9f312403cad28f31b47b6748397fcda5f6989b;
    stim[63] = 258'h3c6ee0f734803695ee5eabf0f39d6582482a409a775d675fcfaa3e402e0d57e00;
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
      expv[0] = 129'h000000000000000000000000000000000;
      expv[1] = 129'h000000000000000000000000000000000;
      expv[2] = 129'h000000000000000000000000000000000;
      expv[3] = 129'h000000000000000000000000000000000;
      expv[4] = 129'h000000000000000000000000000000000;
      expv[5] = 129'h17190532206d6aeffcef9da899905d4b6;
      expv[6] = 129'h17190532206d6aeffcef9da899905d4b6;
      expv[7] = 129'h17190532206d6aeffcef9da899905d4b7;
      expv[8] = 129'h17190532206d6aeffcef9da899905d4b7;
      expv[9] = 129'h17190532206d6aeffcef9da899905d4b7;
      expv[10] = 129'h17190532206d6aeffcef9da899905d4b6;
      expv[11] = 129'h159a039468d046cd2c9d5d99d307f3fcc;
      expv[12] = 129'h159a039468d046cd2c9d5d99d307f3fcc;
      expv[13] = 129'h159a039468d046cd2c9d5d99d307f3fcd;
      expv[14] = 129'h159a039468d046cd2c9d5d99d307f3fcd;
      expv[15] = 129'h159a039468d046cd2c9d5d99d307f3fcd;
      expv[16] = 129'h159a039468d046cd2c9d5d99d307f3fcc;
      expv[17] = 129'h07e8ee8010f85253e7ba95d8112ede0ec;
      expv[18] = 129'h07e8ee8010f85253e7ba95d8112ede0ec;
      expv[19] = 129'h07e8ee8010f85253e7ba95d8112ede0ed;
      expv[20] = 129'h07e8ee8010f85253e7ba95d8112ede0ed;
      expv[21] = 129'h07e8ee8010f85253e7ba95d8112ede0ec;
      expv[22] = 129'h07bf14fe43e82c78d63147681362c7168;
      expv[23] = 129'h07bf14fe43e82c78d63147681362c7168;
      expv[24] = 129'h07bf14fe43e82c78d63147681362c7169;
      expv[25] = 129'h07bf14fe43e82c78d63147681362c7169;
      expv[26] = 129'h07bf14fe43e82c78d63147681362c7168;
      expv[27] = 129'h0429bb33f23f6ae70908db5a20b03aa8c;
      expv[28] = 129'h0429bb33f23f6ae70908db5a20b03aa8c;
      expv[29] = 129'h0429bb33f23f6ae70908db5a20b03aa8d;
      expv[30] = 129'h0429bb33f23f6ae70908db5a20b03aa8c;
      expv[31] = 129'h0cb6034ff075f6707be0ac455d61eae94;
      expv[32] = 129'h0cb6034ff075f6707be0ac455d61eae94;
      expv[33] = 129'h0cb6034ff075f6707be0ac455d61eae95;
      expv[34] = 129'h0cb6034ff075f6707be0ac455d61eae94;
      expv[35] = 129'h10800b9340dd68ad03777d84fcbde4682;
      expv[36] = 129'h10800b9340dd68ad03777d84fcbde4682;
      expv[37] = 129'h10800b9340dd68ad03777d84fcbde4683;
      expv[38] = 129'h10800b9340dd68ad03777d84fcbde4683;
      expv[39] = 129'h10800b9340dd68ad03777d84fcbde4683;
      expv[40] = 129'h10800b9340dd68ad03777d84fcbde4683;
      expv[41] = 129'h10800b9340dd68ad03777d84fcbde4682;
      expv[42] = 129'h1d7741c7224a0d041a19e841220d8ca32;
      expv[43] = 129'h1d7741c7224a0d041a19e841220d8ca32;
      expv[44] = 129'h1d7741c7224a0d041a19e841220d8ca33;
      expv[45] = 129'h1d7741c7224a0d041a19e841220d8ca32;
      expv[46] = 129'h05e97dffc1db879e33d36d39bbd23970c;
      expv[47] = 129'h05e97dffc1db879e33d36d39bbd23970c;
      expv[48] = 129'h05e97dffc1db879e33d36d39bbd23970d;
      expv[49] = 129'h05e97dffc1db879e33d36d39bbd23970d;
      expv[50] = 129'h05e97dffc1db879e33d36d39bbd23970d;
      expv[51] = 129'h05e97dffc1db879e33d36d39bbd23970c;
      expv[52] = 129'h1fc7a1f4b206ae04d70e22473aa07148e;
      expv[53] = 129'h1fc7a1f4b206ae04d70e22473aa07148e;
      expv[54] = 129'h1fc7a1f4b206ae04d70e22473aa07148f;
      expv[55] = 129'h1fc7a1f4b206ae04d70e22473aa07148f;
      expv[56] = 129'h1fc7a1f4b206ae04d70e22473aa07148e;
      expv[57] = 129'h000000000000000000000000000000000;
      expv[58] = 129'h000000000000000000000000000000000;
      expv[59] = 129'h000000000000000000000000000000000;
      expv[60] = 129'h1d7b45cf555e5d7db663955800f1578e8;
      expv[61] = 129'h1d7b45cf555e5d7db663955800f1578e8;
      expv[62] = 129'h1d7b45cf555e5d7db663955800f1578e9;
      expv[63] = 129'h1d7b45cf555e5d7db663955800f1578e8;
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
