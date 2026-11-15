// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 272;
  localparam OW = 272;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_035368 dut (
    .clk(clk),
    .d_icode(in_vec[271:268]),
    .d_ifun(in_vec[267:264]),
    .d_rA(in_vec[263:260]),
    .d_rB(in_vec[259:256]),
    .d_valC(in_vec[255:192]),
    .d_valP(in_vec[191:128]),
    .d_valA(in_vec[127:64]),
    .d_valB(in_vec[63:0]),
    .e_icode(out_vec[271:268]),
    .e_ifun(out_vec[267:264]),
    .e_rA(out_vec[263:260]),
    .e_rB(out_vec[259:256]),
    .e_valC(out_vec[255:192]),
    .e_valP(out_vec[191:128]),
    .e_valA(out_vec[127:64]),
    .e_valB(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 272'h4ab80fa779da8af20d09e6c53ee03516aac7a6541f853d36b9ba383aebef72f1185f;
    stim[1] = 272'ha13fe0480d3b8519a48d55d005a5e65cd0ed1ed713cadf715365669c737823a851b9;
    stim[2] = 272'h1f112337055669fdeb975e3b697239f6843615b150f6ab416288eb569c9da87387fc;
    stim[3] = 272'h10be0aa0b15cceff33bdda2a96fcaa7fe0bda8e74c456c19add5006ff22c5e4022d8;
    stim[4] = 272'h72c7126cb0c0b3b897d0553febd4fcbe9cd3afd788b7ce1a1b3ff661019a5521d353;
    stim[5] = 272'h494a3f6e9ab9464a9a81c5e6ae6bbc237b3829d02b971ce401a1d0c87317095defd7;
    stim[6] = 272'h248cb1d103d742d1a3122c490ca6eb7afd4b2205abfd2c4cd0756a0575b07e3f4c32;
    stim[7] = 272'h33b45389baec3bcd372caca51133095f126235b7fb9ce267acbe9472e1289225528e;
    stim[8] = 272'hb48abf3cdca1a87369c521ac4ab730ff0be37d2ddacf988d9da98ba2fc6d241d4ee6;
    stim[9] = 272'h471baa02f4237b3bd66a61bd590cb5ff9f62f21db0cd05912045abb6532eb8bc2dec;
    stim[10] = 272'h8e84864b2e86f0e339a72d6d65415bc5d9ce73251af058f4e90e22b48583916ad842;
    stim[11] = 272'h3ae3234b6981eae56adc79a5d3533d7e5b1440d82e917f3eb0e8ea7e4ee6d255b965;
    stim[12] = 272'hbad265a747c66154891fcddcf42bccf77a5e2943cbc5236d22849f0816beb5730251;
    stim[13] = 272'h44c7212529335b89325f631350cce48e0a59dfab4b5b652c08ea1c2c8de1fcd56f49;
    stim[14] = 272'hde2ff27431819a3337d1d6aa6b85acfb61b41ef547f51858ffa34325b09d6d7e4722;
    stim[15] = 272'h545ee3603360ae5a9efe33f5e6edbe3bce7416ac2b684704f9056470c528d069f4e0;
    stim[16] = 272'h5405117efe8037996477b56507eab3594fcfc8712180965fae9f9e2255b0a2e30edc;
    stim[17] = 272'h0926d7bf16b25e0750726b0f5d7e4de5e88f5af3b6d0258f1e17a895d99ea57e4211;
    stim[18] = 272'hdff004f248c4dfb4a6e5c18429d3d89deb027442ce455a9e706aa93688051011d952;
    stim[19] = 272'hbaacdec06be9cc7b9c62135300f586b0746f545257326937da7869ec8b0bcd321d87;
    stim[20] = 272'hb0e353b00dbe76223e5d8bc24584744feda170a6de1df7eb046c70c3c47b4058c3be;
    stim[21] = 272'h86f9cc2bf2de3f9544295d44cbb68d4b99e8f5a3d08af5f28247494516011f0be07d;
    stim[22] = 272'h3492644d8ef99715bf78af100b92fde968b88dce2f23f133ccb4049a2f77b74525bb;
    stim[23] = 272'h8ef4739e7b1c25e8af229ab365f68f449f63716962bb4119bedd9cb1f6775a64b927;
    stim[24] = 272'he940a73cb988f9b44d616d4c520cff9d8418a9a9e2870761b62bb8ac8aefbbecc7e0;
    stim[25] = 272'h467d60ddabfa1f5fa56e8c681ed4832a5c5d78dd01d18077e28e38005951427f63af;
    stim[26] = 272'hdf84eb7cb427ffa6c7e77dee4b28c1616603548021ebaaa427bea5d3fcbc51fa49b2;
    stim[27] = 272'hb8bd121ee8d0a6608e6ce25b32eb1bacbeafbbf8163d1db5aea4d73f4876e0ac5f57;
    stim[28] = 272'h57b49d10ba1c127c1a20b23e9529cbc5fdccfd2ee5359143738cdf16ea133f6b8dec;
    stim[29] = 272'h9152684c9ec91622328b50f859e96c0f215949668ac479612fe4075c0d20b343ebda;
    stim[30] = 272'h424759cedc3b738f821d22be3732949bf573e97e86e2ed8cca657d323d99e997f75f;
    stim[31] = 272'h80a76c94f77b1e2484f2837dbac7f5c58277901e525dec367e6a076d374a8e3242a9;
    stim[32] = 272'h8870bba8f3417ed8abb578d9dd74e31be60bf69d7f2c7b365288da63753934032910;
    stim[33] = 272'h0ce54ef07a9efb3bde9f5a52c72583e79cb41b16708f5f9dde1334de5f39c6076a03;
    stim[34] = 272'h85cd1ff42b3b62ca31cba8f3cee456adbdd5a7995a87438678cf6351034aa34d264c;
    stim[35] = 272'h26ab011057fc2887b0455f5152cb85a1474e7ea06f1022dd05f5d5bc97cc9d667429;
    stim[36] = 272'h07479810c48a18a6eb83e6b14d4ea710c8517d8d72911e8a5f517de93cae0e4b084c;
    stim[37] = 272'h55eadfb107ddb6be7f7970281f8c67f3fc82b017511352c96fb4ab2a14aa49685a39;
    stim[38] = 272'hb7a660ddba2edc8c9fb66fe019baaad087f562f417470cc4a3f443bd978161924ddc;
    stim[39] = 272'h71e9c4a5ff9f5d0b35e1d94c1c9a51329f22b2762d597bd82298e70a6120688ba261;
    stim[40] = 272'h615287989930f75760ff6b82e9575ec088e8ec95fe29bc8b5328a35e042ada1afa6e;
    stim[41] = 272'hc92a28882e4f08f6d3af836e55b97f10e5c256eae92fee1c6e2c8fdc5b7ff9c8a32d;
    stim[42] = 272'hf80a0cdfd8506eb2b4b903fd4c98de5f7b4e77df807d3d21a2f83070264decdfbd28;
    stim[43] = 272'h86850eaa6de1ed9b17808bd8620015fb5b117741d7cae8c9e57f32927beb8f5e6e08;
    stim[44] = 272'h7b8989d39651e143141a10593f2892f4007a024f99e0c624255da419d332e6c8c9d9;
    stim[45] = 272'h434c904df00eb445556cc83b78ad63287aef8efe51511774724bac9d98d2a214d2ad;
    stim[46] = 272'hf2545be9cae910a011c38bbc077f009cb26b8f9f73114c03f47e433f06035c689d71;
    stim[47] = 272'hb6086770a720f947d3f545ebde23e087e5f41c10fdecf1a131593b7dab181d6cc7ff;
    stim[48] = 272'hb4172b22ae3ef2bee814a6834972082d2887de8b78914bd6dcbc54a95370c9a8155d;
    stim[49] = 272'h989d6eb48366bc29ed285acf43abe90f25134da06c13e1595f50c0c34f10ee531303;
    stim[50] = 272'hb41a852905949efe473da987de986d0a3d0d6b98cb18928073231df46a9008aead6c;
    stim[51] = 272'hc7e93baf30e641b2ec2cd2116d34228e9e5aa02288e0c810aac85b49cd14109591ce;
    stim[52] = 272'h3ded5a2b4ccf17edfd0092c3abff522432d04b80069aefa787e200b4bba84c5b6ba8;
    stim[53] = 272'h449d82fda0fcd0c86a208f95209e34a8209349df4481b627e9172d82864cebffd487;
    stim[54] = 272'hcbc6be3fe90519f24680f963833670ebdb5b145a2ddf2f83605c77a1b337ca200646;
    stim[55] = 272'h4fe9f6dd31b311c2174dbec2b8ea49412b09a8fcbe0c57fc037a24c9c8c23033fb03;
    stim[56] = 272'he03391a638a0c4fb6fe295fd932ceffe16bd0e0b59652c8b225cea30a7328f588337;
    stim[57] = 272'h8ad7e65d32ce3e1d6ae6848aa6ab39fd073425a91f5beee3a93a34cb25034bd0df48;
    stim[58] = 272'haa45ae85530c772f0c6c878529bce95dfe44f7296117c351bdae8ce22d20ae06a8bb;
    stim[59] = 272'ha2ec0ffa39fcdea88cb29c41b8c9ce018cf3f6d6bed7b1d20e4057e86601d74da37d;
    stim[60] = 272'hb8b58fda2f1e016f0401db00de2ee1028c0542fe7650b5ea87640af876ca7301df03;
    stim[61] = 272'he97dda1586126693701baf66abf0b0f46d62cbe1e5c6fb24a0afeb587477fdceac4a;
    stim[62] = 272'h2e7c67e118817800b2c1d44a2c4f5038e775cd550486b4509d1bae88ce193a3ca39e;
    stim[63] = 272'hbfbdc0830e02b8ba5e62d5401fd7276a4db05d6388822d4884b22e7d71df15aaf922;
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
      expv[0] = 272'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 272'h4ab80fa779da8af20d09e6c53ee03516aac7a6541f853d36b9ba383aebef72f1185f;
      expv[2] = 272'ha13fe0480d3b8519a48d55d005a5e65cd0ed1ed713cadf715365669c737823a851b9;
      expv[3] = 272'h1f112337055669fdeb975e3b697239f6843615b150f6ab416288eb569c9da87387fc;
      expv[4] = 272'h10be0aa0b15cceff33bdda2a96fcaa7fe0bda8e74c456c19add5006ff22c5e4022d8;
      expv[5] = 272'h72c7126cb0c0b3b897d0553febd4fcbe9cd3afd788b7ce1a1b3ff661019a5521d353;
      expv[6] = 272'h494a3f6e9ab9464a9a81c5e6ae6bbc237b3829d02b971ce401a1d0c87317095defd7;
      expv[7] = 272'h248cb1d103d742d1a3122c490ca6eb7afd4b2205abfd2c4cd0756a0575b07e3f4c32;
      expv[8] = 272'h33b45389baec3bcd372caca51133095f126235b7fb9ce267acbe9472e1289225528e;
      expv[9] = 272'hb48abf3cdca1a87369c521ac4ab730ff0be37d2ddacf988d9da98ba2fc6d241d4ee6;
      expv[10] = 272'h471baa02f4237b3bd66a61bd590cb5ff9f62f21db0cd05912045abb6532eb8bc2dec;
      expv[11] = 272'h8e84864b2e86f0e339a72d6d65415bc5d9ce73251af058f4e90e22b48583916ad842;
      expv[12] = 272'h3ae3234b6981eae56adc79a5d3533d7e5b1440d82e917f3eb0e8ea7e4ee6d255b965;
      expv[13] = 272'hbad265a747c66154891fcddcf42bccf77a5e2943cbc5236d22849f0816beb5730251;
      expv[14] = 272'h44c7212529335b89325f631350cce48e0a59dfab4b5b652c08ea1c2c8de1fcd56f49;
      expv[15] = 272'hde2ff27431819a3337d1d6aa6b85acfb61b41ef547f51858ffa34325b09d6d7e4722;
      expv[16] = 272'h545ee3603360ae5a9efe33f5e6edbe3bce7416ac2b684704f9056470c528d069f4e0;
      expv[17] = 272'h5405117efe8037996477b56507eab3594fcfc8712180965fae9f9e2255b0a2e30edc;
      expv[18] = 272'h0926d7bf16b25e0750726b0f5d7e4de5e88f5af3b6d0258f1e17a895d99ea57e4211;
      expv[19] = 272'hdff004f248c4dfb4a6e5c18429d3d89deb027442ce455a9e706aa93688051011d952;
      expv[20] = 272'hbaacdec06be9cc7b9c62135300f586b0746f545257326937da7869ec8b0bcd321d87;
      expv[21] = 272'hb0e353b00dbe76223e5d8bc24584744feda170a6de1df7eb046c70c3c47b4058c3be;
      expv[22] = 272'h86f9cc2bf2de3f9544295d44cbb68d4b99e8f5a3d08af5f28247494516011f0be07d;
      expv[23] = 272'h3492644d8ef99715bf78af100b92fde968b88dce2f23f133ccb4049a2f77b74525bb;
      expv[24] = 272'h8ef4739e7b1c25e8af229ab365f68f449f63716962bb4119bedd9cb1f6775a64b927;
      expv[25] = 272'he940a73cb988f9b44d616d4c520cff9d8418a9a9e2870761b62bb8ac8aefbbecc7e0;
      expv[26] = 272'h467d60ddabfa1f5fa56e8c681ed4832a5c5d78dd01d18077e28e38005951427f63af;
      expv[27] = 272'hdf84eb7cb427ffa6c7e77dee4b28c1616603548021ebaaa427bea5d3fcbc51fa49b2;
      expv[28] = 272'hb8bd121ee8d0a6608e6ce25b32eb1bacbeafbbf8163d1db5aea4d73f4876e0ac5f57;
      expv[29] = 272'h57b49d10ba1c127c1a20b23e9529cbc5fdccfd2ee5359143738cdf16ea133f6b8dec;
      expv[30] = 272'h9152684c9ec91622328b50f859e96c0f215949668ac479612fe4075c0d20b343ebda;
      expv[31] = 272'h424759cedc3b738f821d22be3732949bf573e97e86e2ed8cca657d323d99e997f75f;
      expv[32] = 272'h80a76c94f77b1e2484f2837dbac7f5c58277901e525dec367e6a076d374a8e3242a9;
      expv[33] = 272'h8870bba8f3417ed8abb578d9dd74e31be60bf69d7f2c7b365288da63753934032910;
      expv[34] = 272'h0ce54ef07a9efb3bde9f5a52c72583e79cb41b16708f5f9dde1334de5f39c6076a03;
      expv[35] = 272'h85cd1ff42b3b62ca31cba8f3cee456adbdd5a7995a87438678cf6351034aa34d264c;
      expv[36] = 272'h26ab011057fc2887b0455f5152cb85a1474e7ea06f1022dd05f5d5bc97cc9d667429;
      expv[37] = 272'h07479810c48a18a6eb83e6b14d4ea710c8517d8d72911e8a5f517de93cae0e4b084c;
      expv[38] = 272'h55eadfb107ddb6be7f7970281f8c67f3fc82b017511352c96fb4ab2a14aa49685a39;
      expv[39] = 272'hb7a660ddba2edc8c9fb66fe019baaad087f562f417470cc4a3f443bd978161924ddc;
      expv[40] = 272'h71e9c4a5ff9f5d0b35e1d94c1c9a51329f22b2762d597bd82298e70a6120688ba261;
      expv[41] = 272'h615287989930f75760ff6b82e9575ec088e8ec95fe29bc8b5328a35e042ada1afa6e;
      expv[42] = 272'hc92a28882e4f08f6d3af836e55b97f10e5c256eae92fee1c6e2c8fdc5b7ff9c8a32d;
      expv[43] = 272'hf80a0cdfd8506eb2b4b903fd4c98de5f7b4e77df807d3d21a2f83070264decdfbd28;
      expv[44] = 272'h86850eaa6de1ed9b17808bd8620015fb5b117741d7cae8c9e57f32927beb8f5e6e08;
      expv[45] = 272'h7b8989d39651e143141a10593f2892f4007a024f99e0c624255da419d332e6c8c9d9;
      expv[46] = 272'h434c904df00eb445556cc83b78ad63287aef8efe51511774724bac9d98d2a214d2ad;
      expv[47] = 272'hf2545be9cae910a011c38bbc077f009cb26b8f9f73114c03f47e433f06035c689d71;
      expv[48] = 272'hb6086770a720f947d3f545ebde23e087e5f41c10fdecf1a131593b7dab181d6cc7ff;
      expv[49] = 272'hb4172b22ae3ef2bee814a6834972082d2887de8b78914bd6dcbc54a95370c9a8155d;
      expv[50] = 272'h989d6eb48366bc29ed285acf43abe90f25134da06c13e1595f50c0c34f10ee531303;
      expv[51] = 272'hb41a852905949efe473da987de986d0a3d0d6b98cb18928073231df46a9008aead6c;
      expv[52] = 272'hc7e93baf30e641b2ec2cd2116d34228e9e5aa02288e0c810aac85b49cd14109591ce;
      expv[53] = 272'h3ded5a2b4ccf17edfd0092c3abff522432d04b80069aefa787e200b4bba84c5b6ba8;
      expv[54] = 272'h449d82fda0fcd0c86a208f95209e34a8209349df4481b627e9172d82864cebffd487;
      expv[55] = 272'hcbc6be3fe90519f24680f963833670ebdb5b145a2ddf2f83605c77a1b337ca200646;
      expv[56] = 272'h4fe9f6dd31b311c2174dbec2b8ea49412b09a8fcbe0c57fc037a24c9c8c23033fb03;
      expv[57] = 272'he03391a638a0c4fb6fe295fd932ceffe16bd0e0b59652c8b225cea30a7328f588337;
      expv[58] = 272'h8ad7e65d32ce3e1d6ae6848aa6ab39fd073425a91f5beee3a93a34cb25034bd0df48;
      expv[59] = 272'haa45ae85530c772f0c6c878529bce95dfe44f7296117c351bdae8ce22d20ae06a8bb;
      expv[60] = 272'ha2ec0ffa39fcdea88cb29c41b8c9ce018cf3f6d6bed7b1d20e4057e86601d74da37d;
      expv[61] = 272'hb8b58fda2f1e016f0401db00de2ee1028c0542fe7650b5ea87640af876ca7301df03;
      expv[62] = 272'he97dda1586126693701baf66abf0b0f46d62cbe1e5c6fb24a0afeb587477fdceac4a;
      expv[63] = 272'h2e7c67e118817800b2c1d44a2c4f5038e775cd550486b4509d1bae88ce193a3ca39e;
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
