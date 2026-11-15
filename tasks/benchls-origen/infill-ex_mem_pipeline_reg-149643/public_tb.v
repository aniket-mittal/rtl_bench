// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 133;
  localparam OW = 163;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_149643 dut (
    .clk(clk),
    .reset(in_vec[132:132]),
    .MemEn_EX_MEM(in_vec[131:131]),
    .MemWrite_EX_MEM(in_vec[130:130]),
    .MemToReg_EX_MEM(in_vec[129:129]),
    .RegWaddr_EX_MEM(in_vec[128:97]),
    .ALUResult_EX_MEM(in_vec[96:65]),
    .MemWdata_EX_MEM(in_vec[64:33]),
    .PC_EX_MEM(in_vec[32:1]),
    .MFHL_EX_MEM(in_vec[0:0]),
    .MemEn_MEM(out_vec[162:162]),
    .MemWrite_MEM(out_vec[161:161]),
    .data_sram_addr(out_vec[160:129]),
    .MemWdata_MEM(out_vec[128:97]),
    .RegWaddr_MEM_WB(out_vec[96:65]),
    .ALUResult_MEM_WB(out_vec[64:33]),
    .PC_MEM_WB(out_vec[32:1]),
    .MFHL_MEM_WB(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 133'h1501fd56162f91fec7cba533b81956e1fe;
    stim[1] = 133'h19a07c6da2f70c24a2d97d3bc763a8edbd;
    stim[2] = 133'h0a90b1ccd5a8f5470b75a2720c3e8530ca;
    stim[3] = 133'h0c64f2bdecf4da30e95ffe778de6fe7403;
    stim[4] = 133'h0106609d98696d159dfd96d9a516978b16;
    stim[5] = 133'h00392ce53cf45ab98305437ae6e3e5eace;
    stim[6] = 133'h05997e27c14a7bd8a417b1c8706bc31f4d;
    stim[7] = 133'h0c4e9fdc332a904f01a624a1eb57bfa655;
    stim[8] = 133'h0b0e4ff2fead7d262e67a31fd5116e4527;
    stim[9] = 133'h056e9baa6772b16e2d2f8e2e1e77dcbc72;
    stim[10] = 133'h0fa4eb99d61765c5ab7158817239c53331;
    stim[11] = 133'h096ef3c13a3dcfe64838a6cdffd6c7e8c1;
    stim[12] = 133'h018ed1da3a430410dfe033df5f63b0cbc0;
    stim[13] = 133'h0ee1cb4d95eeee22d16f0e83abcb48afd4;
    stim[14] = 133'h09c9717f5a083e137eb4a50c258403f488;
    stim[15] = 133'h0249ce4d4ecf7fd40fe00b101b201c8bbd;
    stim[16] = 133'h0d640df49ea32bfa8a30be6cbb2ce0ad8d;
    stim[17] = 133'h0f685f78254d8cde4b95f2506bab90492b;
    stim[18] = 133'h069ade7eef628fcb6fbe44f828bce5bcab;
    stim[19] = 133'h04b65268687547e707460ef922459661b2;
    stim[20] = 133'h059958275ff0f55587d7c7ab87d6946255;
    stim[21] = 133'h0875b09ee228bd3526241431c157eda4bd;
    stim[22] = 133'h005b2066615aa1f8743963269ac5e11032;
    stim[23] = 133'h0fd95fe4544f7310cd02a51b1aabb99386;
    stim[24] = 133'h02fe325379680502c5374b50784dea16b2;
    stim[25] = 133'h0b53987f3f47574a64aa84f91aac809e3b;
    stim[26] = 133'h0139cf3be9ec22a37ece3b100a3ea0217b;
    stim[27] = 133'h0798222abbd70d850cda467e3c4ebdf197;
    stim[28] = 133'h0938d9becd3098f535d440adaea830dc30;
    stim[29] = 133'h01efffa2375857995803525a23078801a5;
    stim[30] = 133'h0b8538a120c59d64b58600517d06c973bc;
    stim[31] = 133'h08d105d20a29d38ba70370860f5a5dda38;
    stim[32] = 133'h0ef0a2ec3039028d081581788ba8039d3b;
    stim[33] = 133'h04f7c5d39b8797f009d8005cc9cfffe098;
    stim[34] = 133'h051c905cf25529ae3b556b0e78ff5b8560;
    stim[35] = 133'h0ab1a5a88927505e60fb90a796b821ab9f;
    stim[36] = 133'h0e60a0dcd1afac8cf1ab6d552f7bb2d610;
    stim[37] = 133'h001178d1119db2cb6a433fe26afc107a71;
    stim[38] = 133'h090d401e15cd35970b6c2934fa1aa2e97d;
    stim[39] = 133'h060e17711fd9498306947491624cc0eebb;
    stim[40] = 133'h144714e99ed5f7c2ee103672609a76a9f9;
    stim[41] = 133'h02c3c87bd9137cc3eb69dbb23cd34a1a7b;
    stim[42] = 133'h08a14340e7470b8080c2eb4df214e61364;
    stim[43] = 133'h0dfeec692810c3c0cfceb9c4dd449f7400;
    stim[44] = 133'h0580fd1b79dd9c58ae3f5ca93bfbf40b95;
    stim[45] = 133'h0bf6c09e1941912c58893615caee71e886;
    stim[46] = 133'h02cefb1f1036f37591e4ccf2b6135eb61a;
    stim[47] = 133'h077161043ccd1e10cff479e440f6f7242f;
    stim[48] = 133'h0262f1ad1c22ab5fdd00290253339727a7;
    stim[49] = 133'h05456a9c7f55db2b735796caea53f60b4c;
    stim[50] = 133'h0c94c3ecff234ce4d42d6f370e2ee47974;
    stim[51] = 133'h0cd6f9dcd2dec257da73b5b70c54b7dcb8;
    stim[52] = 133'h02c9335ecf611e42df991652605f533bf5;
    stim[53] = 133'h0987ee4e96cd1bcff52ae0bec77aca40ea;
    stim[54] = 133'h19d8bd2279bf5e942a6ae160d6a4449e9d;
    stim[55] = 133'h0c2f2d7b96ca78de35d30b3fdea1b3c35b;
    stim[56] = 133'h0aa0c5e6a8afea57651a46ed62a22f3394;
    stim[57] = 133'h0b13c4823f8c14c7bdd9839fc175626b03;
    stim[58] = 133'h0472edee7e07ee18dd4c0672556e862cae;
    stim[59] = 133'h079dfd28f15c123362070b42b49b387ffe;
    stim[60] = 133'h0c4c3455624142966936f45111886cfc5d;
    stim[61] = 133'h0571423155535957b9d53f515e83ee325a;
    stim[62] = 133'h032e277af1425206366267b73e8ef460ed;
    stim[63] = 133'h0b22db829514b51a607fc2c50c438d250d;
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
      expv[0] = 163'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 163'h00000000000000000000000000000000000000000;
      expv[2] = 163'h00000000000000000000000000000000000000000;
      expv[3] = 163'h5a8f5470b75a2720c90b1ccd5a8f5470a3e8530ca;
      expv[4] = 163'h6f4da30e95ffe778c64f2bdecf4da30e9e6fe7403;
      expv[5] = 163'h0696d159dfd96d9a506609d98696d159d16978b16;
      expv[6] = 163'h0f45ab98305437ae6392ce53cf45ab982e3e5eace;
      expv[7] = 163'h34a7bd8a417b1c871997e27c14a7bd8a46bc31f4d;
      expv[8] = 163'h72a904f01a624a1ea4e9fdc332a904f0157bfa655;
      expv[9] = 163'h4ad7d262e67a31fd50e4ff2fead7d262f116e4527;
      expv[10] = 163'h372b16e2d2f8e2e1f6e9baa6772b16e2c77dcbc72;
      expv[11] = 163'h61765c5ab71588173a4eb99d61765c5aa39c53331;
      expv[12] = 163'h43dcfe64838a6cdff6ef3c13a3dcfe649d6c7e8c1;
      expv[13] = 163'h0430410dfe033df5f8ed1da3a430410df63b0cbc0;
      expv[14] = 163'h7eeee22d16f0e83aae1cb4d95eeee22d1cb48afd4;
      expv[15] = 163'h4083e137eb4a50c25c9717f5a083e137f8403f488;
      expv[16] = 163'h0cf7fd40fe00b101a49ce4d4ecf7fd40f201c8bbd;
      expv[17] = 163'h6a32bfa8a30be6cbb640df49ea32bfa8b2ce0ad8d;
      expv[18] = 163'h74d8cde4b95f2506b685f78254d8cde4bab90492b;
      expv[19] = 163'h3628fcb6fbe44f8289ade7eef628fcb6ebce5bcab;
      expv[20] = 163'h27547e707460ef922b65268687547e706459661b2;
      expv[21] = 163'h3f0f55587d7c7ab879958275ff0f55587d6946255;
      expv[22] = 163'h428bd3526241431c075b09ee228bd352757eda4bd;
      expv[23] = 163'h15aa1f8743963269a5b2066615aa1f874c5e11032;
      expv[24] = 163'h64f7310cd02a51b1bd95fe4544f7310ccabb99386;
      expv[25] = 163'h1680502c5374b5078fe325379680502c44dea16b2;
      expv[26] = 163'h547574a64aa84f91b53987f3f47574a64ac809e3b;
      expv[27] = 163'h1ec22a37ece3b100b39cf3be9ec22a37e3ea0217b;
      expv[28] = 163'h3d70d850cda467e3d98222abbd70d850c4ebdf197;
      expv[29] = 163'h53098f535d440adaf38d9becd3098f534a830dc30;
      expv[30] = 163'h15857995803525a23efffa23758579959078801a5;
      expv[31] = 163'h4c59d64b58600517d8538a120c59d64b506c973bc;
      expv[32] = 163'h429d38ba70370860ed105d20a29d38ba75a5dda38;
      expv[33] = 163'h639028d081581788af0a2ec3039028d09a8039d3b;
      expv[34] = 163'h38797f009d8005cc8f7c5d39b8797f009cfffe098;
      expv[35] = 163'h25529ae3b556b0e791c905cf25529ae3aff5b8560;
      expv[36] = 163'h527505e60fb90a796b1a5a88927505e60b821ab9f;
      expv[37] = 163'h7afac8cf1ab6d552e60a0dcd1afac8cf17bb2d610;
      expv[38] = 163'h19db2cb6a433fe26a1178d1119db2cb6afc107a71;
      expv[39] = 163'h5cd35970b6c2934fb0d401e15cd35970a1aa2e97d;
      expv[40] = 163'h3d9498306947491620e17711fd94983064cc0eebb;
      expv[41] = 163'h00000000000000000000000000000000000000000;
      expv[42] = 163'h1137cc3eb69dbb23cc3c87bd9137cc3ead34a1a7b;
      expv[43] = 163'h5470b8080c2eb4df2a14340e7470b808014e61364;
      expv[44] = 163'h610c3c0cfceb9c4ddfeec692810c3c0cf449f7400;
      expv[45] = 163'h3dd9c58ae3f5ca93b80fd1b79dd9c58affbf40b95;
      expv[46] = 163'h541912c58893615cbf6c09e1941912c58ee71e886;
      expv[47] = 163'h036f37591e4ccf2b6cefb1f1036f37590135eb61a;
      expv[48] = 163'h2cd1e10cff479e4417161043ccd1e10cef6f7242f;
      expv[49] = 163'h022ab5fdd0029025262f1ad1c22ab5fdd339727a7;
      expv[50] = 163'h355db2b735796caeb456a9c7f55db2b7253f60b4c;
      expv[51] = 163'h7234ce4d42d6f370e94c3ecff234ce4d42ee47974;
      expv[52] = 163'h6dec257da73b5b70cd6f9dcd2dec257da54b7dcb8;
      expv[53] = 163'h1611e42df99165260c9335ecf611e42de5f533bf5;
      expv[54] = 163'h4cd1bcff52ae0bec787ee4e96cd1bcff57aca40ea;
      expv[55] = 163'h00000000000000000000000000000000000000000;
      expv[56] = 163'h6ca78de35d30b3fde2f2d7b96ca78de34a1b3c35b;
      expv[57] = 163'h4afea57651a46ed62a0c5e6a8afea5764a22f3394;
      expv[58] = 163'h58c14c7bdd9839fc113c4823f8c14c7bd75626b03;
      expv[59] = 163'h207ee18dd4c06725472edee7e07ee18dd6e862cae;
      expv[60] = 163'h35c123362070b42b59dfd28f15c1233629b387ffe;
      expv[61] = 163'h64142966936f451104c34556241429669886cfc5d;
      expv[62] = 163'h3535957b9d53f515f71423155535957b883ee325a;
      expv[63] = 163'h1425206366267b73f2e277af1425206368ef460ed;
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
