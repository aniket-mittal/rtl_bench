// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 202;
  localparam OW = 192;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06541 dut (
    .clk(clk),
    .reset(in_vec[201:201]),
    .rn(in_vec[200:198]),
    .we(in_vec[197:197]),
    .din(in_vec[196:165]),
    .psw_we(in_vec[164:164]),
    .psw_new(in_vec[163:132]),
    .tlb_index_we(in_vec[131:131]),
    .tlb_index_new(in_vec[130:99]),
    .tlb_entry_hi_we(in_vec[98:98]),
    .tlb_entry_hi_new(in_vec[97:66]),
    .tlb_entry_lo_we(in_vec[65:65]),
    .tlb_entry_lo_new(in_vec[64:33]),
    .mmu_bad_addr_we(in_vec[32:32]),
    .mmu_bad_addr_new(in_vec[31:0]),
    .dout(out_vec[191:160]),
    .psw(out_vec[159:128]),
    .tlb_index(out_vec[127:96]),
    .tlb_entry_hi(out_vec[95:64]),
    .tlb_entry_lo(out_vec[63:32]),
    .mmu_bad_addr(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 202'h2851e033e6354fbbdbb5e039b5a4fd47eb49b5ff83755e92942;
    stim[1] = 202'h2dcb22d45271d6c6e7cfc69c122f722c0344947254ad71107b6;
    stim[2] = 202'h10a066ba0b641ce684e4618e63d68f503d6c1c20ac207d6eb5f;
    stim[3] = 202'h1c6f38c68ba81864be5df5edbc45cb07058ebd69a0eab9e65b3;
    stim[4] = 202'h0d82dcdf4cd1f660ca2d9cd14c5feb570cdbc7200957746e3ed;
    stim[5] = 202'h1e03712427c6e11daf232fcd461b9f1852fc3aee5ed2c695d0e;
    stim[6] = 202'h0a2f705a371a247582353beccc2bf04b64b967d895a7e96a5f1;
    stim[7] = 202'h0e2569c96a6ca32aba3e87f2bf458ae43fa48d0fb23867d4971;
    stim[8] = 202'h068141955ff12411ef031d2a314f5f76ad316b1b6eac89f6167;
    stim[9] = 202'h019cdf065267416fb2687a5d7742eedb8431299b28897c42896;
    stim[10] = 202'h15e47226cd1effb474a6e027525a1500bc0c6119916b0768cd3;
    stim[11] = 202'h16171277520da43aaf73402b1b2daa05e815c77a89edf3b2c8c;
    stim[12] = 202'h071031e71bdb137171b8c411d83b2ce0dde8e62463254d4d1b8;
    stim[13] = 202'h133e95655425757b61daa5735dbe4aa2400f9a5235bf5c9e863;
    stim[14] = 202'h037136510d8d181a51f37443a2584c5f72cd8d229eb81fd643e;
    stim[15] = 202'h1e32beb90e11dfb06ac0f61dc8c609098198740b53fae4d1685;
    stim[16] = 202'h0f86acead7fae697a990aae27680e9c72b1525456b8ea19f617;
    stim[17] = 202'h11623671dc124f0b3f2bbda72c760a0508c51de5fc46def8ab0;
    stim[18] = 202'h1b0509fc4fcec046c71bada5633fbf49c1cee7863de59c61a8f;
    stim[19] = 202'h18bd94ef9ce2dc0a694c872b3a279f67b21701120f680528482;
    stim[20] = 202'h0bf066d14bb1417b07304c098f1224937b09d634df087a7aced;
    stim[21] = 202'h0634a20a2d79db8f11df1072d07d765930e654347b133bb0ec8;
    stim[22] = 202'h02700e9b7fc4c1632299a0f31daaafb24731ac04004f97091ef;
    stim[23] = 202'h0b43abe09238e6ff4f35cddc39ccbdb9b6f05f7dc777f800c8e;
    stim[24] = 202'h16d581914b116c9bba92f595b40cb62eeeefb901a112218bfed;
    stim[25] = 202'h0094aa07d45f5532374e30f5f122ab99646d720ccae153d3c96;
    stim[26] = 202'h1fe7f8c949d2026187cfb7750b1819e043750c2df361f666089;
    stim[27] = 202'h09b3f185d1465827a15e7ec0a372b3b22a411f354756d487c46;
    stim[28] = 202'h0b2f1ee6fd869378434ea22380753ba9b52adc12725cd43ee1f;
    stim[29] = 202'h03537e5934e2965cc596aa2f111969dc03de2c6ba0c6e3824b0;
    stim[30] = 202'h0b099352a360fdaf939c6dcfe30013b9ffc50c83e67749d5b0c;
    stim[31] = 202'h1ce2145a3db8476cfe283fe85495e3e2d898482c3352a1555bb;
    stim[32] = 202'h0d0d3efe206b6ab4e6d9d7ba8c9d7b217b577ba88c6f123b4e0;
    stim[33] = 202'h0be3680ad8148fdb4976a22401139cdf5335d994694a5abefb9;
    stim[34] = 202'h18e79ca3e26a8ab0c2f530f6b523221cd097fa88b4db5905fe2;
    stim[35] = 202'h092571f1e1942156ffdcdde5347d674ba8a6af7ea667831ff72;
    stim[36] = 202'h0c0fd896e29289bf3dd85ee80f738a388719a2cc363853c3369;
    stim[37] = 202'h16147d06c987b760c40bbb2e5feb3cc9cfdcb58c1cf1f8c15e9;
    stim[38] = 202'h1df0055b887f48aea8e074446c8f884c8d4194149c00d6923f3;
    stim[39] = 202'h17ac977fabb165b3858b04474f7214eef392c30f81441dbf4e5;
    stim[40] = 202'h13c8d09a0e683059a47d41a6fd43d9279ff125ff76a571f4bb1;
    stim[41] = 202'h1e4368d3ff5dc5b8f232b6d4923dabdefefae69f4a1ade7e394;
    stim[42] = 202'h04cd9e6a3d34ab37a11d02cf9a58fccb76bf33193a71e433314;
    stim[43] = 202'h002fd846be2b8840c949db260a4e9763a1490fa8a68722370ea;
    stim[44] = 202'h04685da5218b4efc3ead477e32fa7dd3a90e406d46f634972d0;
    stim[45] = 202'h1af06f60a59026f6bd5a72647988bf74a8f328d66072df5ec85;
    stim[46] = 202'h00534151c491b9d47a87de290d0d9263dfa41f26f1184f916b6;
    stim[47] = 202'h1c72fb586fa98ba131d63357635ff3a4f8f2f10c20ff618db1e;
    stim[48] = 202'h0df4a03ad0e64d79bf234143bdf4ca3f089323a7936dafe9746;
    stim[49] = 202'h1f84c075cea9d6c98ce4e4b97b0cb1d97f1a239bbdaf93d2b4f;
    stim[50] = 202'h07c4294ad92292a3cb360a4f370882f37f1beeda183b81ca092;
    stim[51] = 202'h042b50cef0e614bd454ee63752be1f216cd0e0c3f471c360995;
    stim[52] = 202'h02916723c2397173148550d2e42093c48ea1acbc67e510520ae;
    stim[53] = 202'h0f868176f412b57e978c2ee0316c66b47dab6fa06cf459c5835;
    stim[54] = 202'h02efc7aa63448fd6812ba4d672914590147898af63db42815d1;
    stim[55] = 202'h18910e73b7585b2bbaadac57556f27e99cf721d9bf820f4a888;
    stim[56] = 202'h1f9ab230dbcf6c180336782a1cef0803881347259fe416e2088;
    stim[57] = 202'h14ae4f34b8766d1d677e061fe788243526aed7acfacba4dc9ae;
    stim[58] = 202'h016f97762a2e5b5bcaf2475f053e1b611039fff89e09e764b29;
    stim[59] = 202'h066e092d1b9b5f81eb97068ad4ffaeb8d38ddfc434bb7261c05;
    stim[60] = 202'h1f7ad67592ce2b1b4ef8e176f49849bbe1861345c9aea558328;
    stim[61] = 202'h108d50bb4b9bb9d5ab979027b32fcf447569fc064005414f4d8;
    stim[62] = 202'h1e243b5b7b0ea0f69c282145e39150892ab252c93e9d594c0f3;
    stim[63] = 202'h03cc1e79b5ffc619dc8ecf348ad50e0659aaab3895045be7373;
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
      expv[0] = 192'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 192'hxxxxxxxx00000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 192'hxxxxxxxx00000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 192'hxxxxxxxx641ce684c8c31cc75a3d40f560e10561xxxxxxxx;
      expv[4] = 192'h60e10561a81864bec8c31cc7172c1c1660e10561xxxxxxxx;
      expv[5] = 192'hxxxxxxxxa81864bec8c31cc77fad5c3360e105617746e3ed;
      expv[6] = 192'h7fad5c33a81864bec8c31cc77fad5c3360e105617746e3ed;
      expv[7] = 192'h60e10561a81864bec8c31cc717b82d1b60e105617746e3ed;
      expv[8] = 192'hc8c31cc7a81864bec8c31cc717b82d1b12b4e4b57746e3ed;
      expv[9] = 192'ha81864bea81864be40a0caaf17b82d1b12b4e4b57746e3ed;
      expv[10] = 192'hxxxxxxxxa81864be40a0caaf0bbb6e10894cd9447746e3ed;
      expv[11] = 192'hxxxxxxxx1effb4744dc04ea4685402f0894cd9447746e3ed;
      expv[12] = 192'h4dc04ea41effb4744dc04ea4685402f0894cd9447746e3ed;
      expv[13] = 192'h7746e3ed1effb4748818f38d685402f0894cd9447746e3ed;
      expv[14] = 192'h1effb4741effb4748818f38d685402f0894cd9449f4ab2aa;
      expv[15] = 192'h01b89213b89b28868818f38d685402f0894cd9449f4ab2aa;
      expv[16] = 192'h894cd944b89b28868818f38d685402f0894cd9449f4ab2aa;
      expv[17] = 192'h9f4ab2aab89b28868818f38d685402f0c356756b9f4ab2aa;
      expv[18] = 192'hxxxxxxxxb89b28868818f38dd8281423c356756b9f4ab2aa;
      expv[19] = 192'h8284fe27b89b28868818f38dd8281423c356756b9f4ab2aa;
      expv[20] = 192'hd8281423b89b28868818f38dd8281423c356756b9f4ab2aa;
      expv[21] = 192'h8818f38db89b28868818f38df83368a5c356756b9f4ab2aa;
      expv[22] = 192'hb89b2886b89b28861a510516f83368a5c356756b9f4ab2aa;
      expv[23] = 192'hf83368a538074dbf1a510516f83368a5c356756b9f4ab2aa;
      expv[24] = 192'h0b893ba938074dbf1a510516a1d5f049c356756b9f4ab2aa;
      expv[25] = 192'h38074dbf38074dbf1a510516a1d5f049c356756b9f4ab2aa;
      expv[26] = 192'h195f5c8738074dbf1a510516a1d5f0496b9066579f4ab2aa;
      expv[27] = 192'ha1d5f04938074dbf1a510516a1d5f0496b9066579f4ab2aa;
      expv[28] = 192'hcacec8a9465827a11a510516cacec8a96b9066576d487c46;
      expv[29] = 192'h465827a1465827a11a510516978f737e6b9066576d487c46;
      expv[30] = 192'h978f737ea9bf2c9a1a510516978f737e6b9066576d487c46;
      expv[31] = 192'hf3fc64a4a9bf2c9a1a51051684c9a9516b9066576d487c46;
      expv[32] = 192'h6b906657b8476cfe1a51051684c9a9516b9066572a1555bb;
      expv[33] = 192'h84c9a951b8476cfeb3af751984c9a9516b9066572a1555bb;
      expv[34] = 192'h8284fe27b8476cfeb3af7519f1b4056c6b9066572a1555bb;
      expv[35] = 192'hf1b4056cb8476cfeea61ed6af1b4056c6b906657b5905fe2;
      expv[36] = 192'h357bf533942156ffb9bbca68f59d2ea2357bf533b5905fe2;
      expv[37] = 192'h6ac0c8a5942156ffb0bdd01ece28e21c357bf533853c3369;
      expv[38] = 192'hf3fc64a4942156ffb0bdd01ece28e21c357bf533853c3369;
      expv[39] = 192'h0a3e8364942156ffc0e888d9ce28e21c357bf533853c3369;
      expv[40] = 192'h853c3369942156ffc0e888d9ce28e21c357bf533853c3369;
      expv[41] = 192'hf3fc64a4942156ffc0e888d9ce28e21c357bf533e4684d07;
      expv[42] = 192'hc0e888d9942156ffc0e888d9ce28e21c357bf533e4684d07;
      expv[43] = 192'h34ab37a134ab37a1c0e888d963f32ddaf998c9d31e433314;
      expv[44] = 192'hc0e888d934ab37a1c0e888d93a5d8e85f998c9d31e433314;
      expv[45] = 192'h8284fe278b4efc3e5a8efc65e9f74ea4f998c9d3634972d0;
      expv[46] = 192'h8b4efc3e8b4efc3e5a8efc65e9f74ea4f998c9d3634972d0;
      expv[47] = 192'h21b469ff8b4efc3e0fbc521ae9f74ea420f9378884f916b6;
      expv[48] = 192'h97886107a98ba131ac66aec67fce93e397886107f618db1e;
      expv[49] = 192'h21b469ffa98ba131ac66aec6d328fc2297886107f618db1e;
      expv[50] = 192'hac66aec6a98ba131ac66aec6d328fc2297886107f618db1e;
      expv[51] = 192'he214a56ca98ba131e214a56cd328fc2297886107f618db1e;
      expv[52] = 192'ha98ba131a98ba131e214a56cd328fc22978861071c360995;
      expv[53] = 192'h9788610748b391e1e214a56cd328fc22978861071c360995;
      expv[54] = 192'h48b391e148b391e1e214a56cd328fc22c340bb7a1c360995;
      expv[55] = 192'h7837b05277e3d531e214a56cd328fc22c340bb7a1c360995;
      expv[56] = 192'hc2603ae7585b2bba5b58aeaabc9fa673b90ecdfc1c360995;
      expv[57] = 192'hd64bbfd5585b2bba5b58aeaabc9fa673b90ecdfc1c360995;
      expv[58] = 192'h585b2bba585b2bba5b58aeaabc9fa67376bd67d61c360995;
      expv[59] = 192'he48ebe0a585b2bbae48ebe0abc9fa673cfffc4f01c360995;
      expv[60] = 192'hcd59186d585b2bba3704968dbc9fa673cfffc4f01c360995;
      expv[61] = 192'h1c360995585b2bba3704968dbc9fa673cfffc4f01c360995;
      expv[62] = 192'hbd6b3ac99bb9d5ab2f204f66bc9fa6734fe032001c360995;
      expv[63] = 192'h9bb9d5ab9bb9d5ab2f204f66bc9fa6734fe032001c360995;
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
