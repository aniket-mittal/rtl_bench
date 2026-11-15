// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 228;
  localparam OW = 226;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_091785 dut (
    .clock(clk),
    .reset(in_vec[227:227]),
    .busywait(in_vec[226:226]),
    .des_register(in_vec[225:221]),
    .Funct3(in_vec[220:218]),
    .rs1(in_vec[217:213]),
    .rs2(in_vec[212:208]),
    .mux_5_sel(in_vec[207:207]),
    .writeEnable(in_vec[206:206]),
    .mux_3_sel(in_vec[205:205]),
    .memWrite(in_vec[204:204]),
    .memRead(in_vec[203:203]),
    .ALUop(in_vec[202:198]),
    .mux_4_sel(in_vec[197:196]),
    .branch(in_vec[195:195]),
    .jump(in_vec[194:194]),
    .mux_1_sel(in_vec[193:193]),
    .PC(in_vec[192:161]),
    .nextPC(in_vec[160:129]),
    .data1(in_vec[128:97]),
    .data2(in_vec[96:65]),
    .mux_2_out(in_vec[64:33]),
    .Insthit(in_vec[32:32]),
    .B_address(in_vec[31:0]),
    .des_register_out(out_vec[225:221]),
    .Funct3_out(out_vec[220:218]),
    .rs1_out(out_vec[217:213]),
    .rs2_out(out_vec[212:208]),
    .mux_5_sel_out(out_vec[207:207]),
    .writeEnable_out(out_vec[206:206]),
    .mux_3_sel_out(out_vec[205:205]),
    .memWrite_out(out_vec[204:204]),
    .memRead_out(out_vec[203:203]),
    .ALUop_out(out_vec[202:198]),
    .mux_4_sel_out(out_vec[197:196]),
    .branch_out(out_vec[195:195]),
    .jump_out(out_vec[194:194]),
    .mux_1_sel_out(out_vec[193:193]),
    .PC_out(out_vec[192:161]),
    .nextPC_out(out_vec[160:129]),
    .data1_out(out_vec[128:97]),
    .data2_out(out_vec[96:65]),
    .mux_2_out_out(out_vec[64:33]),
    .Insthit_out(out_vec[32:32]),
    .B_address_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 228'he836137b2a13489beeaa459519b5246f47293e913632bdd8bd230e518;
    stim[1] = 228'hfffc980762a4f7a9e66226a6ca7f8d8e27cc4cf4795d6f16214c0dc23;
    stim[2] = 228'h736358ef812b9114135c978546119ecd74dd623f257d0b74cc3b89c18;
    stim[3] = 228'h4c03f389761675525acefd47c53ad6b5b0bbdf672b33dbd50d1cb7201;
    stim[4] = 228'h0d0a2233c2275a503993ead8165e76275adaaf4b9f06a9c330c7b7ba6;
    stim[5] = 228'h31dfde62bd9221221331dd0459705a52acd49803f4fb5fe483c0339e5;
    stim[6] = 228'h4ea0cfa6e6f43471f5b9cf0667085335386b0ffd53f211f56225fd9ba;
    stim[7] = 228'h26c387f1ec3537ff3654118dc2070c4352531ab987edf2350ad5c58ec;
    stim[8] = 228'h2040e6c2af52406884021d0d36efd614f4e2686cb2179cf174bb932f5;
    stim[9] = 228'h5f2ebcac297f0404e6112c05b4dda913fc135c6e15ce32988e6609c36;
    stim[10] = 228'h64d1d0364201c30f7f7e53aecc9b0eb9c72cccaf8006d1d938e2d1306;
    stim[11] = 228'h6ec34920912b8c94b521fd5faf450fb9ef163c78c4b3bfe97203c3b66;
    stim[12] = 228'h52bbf6108e01db3683f0a2e1ad89244b287fa5a4a54b3a9cb27462e79;
    stim[13] = 228'h22a559a79d4658bc9608ead335e02f6c7d5c5c039df5d16ac5a555c8a;
    stim[14] = 228'h21602357122def2b505957ba7488670640b76457ef2759582a70c413d;
    stim[15] = 228'h5ef00ce1bb5bc81d60cadcd93fdedd0f3c6754c4ef46b7756cb4e5454;
    stim[16] = 228'h69b260ebd579359b6e56c42faf461ffd51af88d1ff266818819950ded;
    stim[17] = 228'h4685aac03c4bd54476dd9503f773fe978aee454191699f7c4d3cdc4ad;
    stim[18] = 228'h66cc97745b7ba8da850cabfd85fb243dc3cd7f4b30d30ed45f544bba3;
    stim[19] = 228'h2b4c979f63c70b5484d2383b1867bd7050d9ab2d29cdfb69e207bcdf0;
    stim[20] = 228'h33e9fb19e1d0a57494c21571c0b1dc72d5680152bed08220d8d3dfe6e;
    stim[21] = 228'h06449662d63bc9fe080a7e21246807df0efccdde8ff5988281cc2bf24;
    stim[22] = 228'h05e0bc3cb56069c2ef72d85cb1ff8af0021a6b77b471cb608a6f19050;
    stim[23] = 228'h2b1affcf966fa33734e83ce4e70cd4fcd6336efe00258cf8440287fe6;
    stim[24] = 228'h7cf7b42859f23dab0acb808341380d5443fffb1362626c0c831180053;
    stim[25] = 228'h2dd0f21359d7458f2b0865aa65d3862ff7a8e94a438e7c8ef1935902b;
    stim[26] = 228'h016edd29caf20d63a0cab1936e855dcfb86bbc124222aad66d5daf163;
    stim[27] = 228'h30285a2cf4e92b5bb67153da4011e64c634eef301fc1bca059e2a7e42;
    stim[28] = 228'h74bd0870b03dd1d11a6f28c8437fa272a614170836fa457e8194c4013;
    stim[29] = 228'h2d8ec1f76c8dae9343f782c141159472c4cb4a5c25996bc22d6c93f38;
    stim[30] = 228'h4acd7128f14dd0ded2ef6abc56472a5c2c907f663e74f99dc8b85fcff;
    stim[31] = 228'h598784a4c9b89e30f51bc771ba5724889d11d20af21222f0368d180a1;
    stim[32] = 228'h02da9f98e733499583bd093de26be43879b15b7a5954104d4015ca52f;
    stim[33] = 228'h03bbbf0d8dee9a62872564772af43ac3850eb3de2f24f721726d29dc4;
    stim[34] = 228'h01e85f2de8aa90b9df8c5d76b3c5cf1b96ba97ad82863c3c8027d1fff;
    stim[35] = 228'h665e7466e53121d24fcc0371cd26fdf6a79a9b9d9ad1da5afe7fddcb1;
    stim[36] = 228'h1b000132cf0261bf586d825876c64f9860ce8ba7921626cb0b33a15d9;
    stim[37] = 228'h006c6bed0d7ca3fda0e900fcd604d3cbe6a8540af4b8dd913482f0569;
    stim[38] = 228'h7c9dd467f9b99843f26c5ba37170afa0581bd76231b97da4c86b0c4f8;
    stim[39] = 228'h4e6f7cd258a6d0867c71472c28b9f5dbbf30046beca716bd3a9893951;
    stim[40] = 228'h6fadbce8f03a29c9af097b14aa4e4bce7f20b6eaeea6d62832df163d4;
    stim[41] = 228'h07db6e0bf2dd8408f1d751cbf6bbe4cb26da9efc84ac5dbe62021beac;
    stim[42] = 228'h79851470eac9c2115d425b2f2a4aad86d3188e5718bd4afce13d93089;
    stim[43] = 228'h7934e5d95209bf8bd26acc9edcfe01ed5d53b13d35a8838c9955c8d1b;
    stim[44] = 228'h303cdc4bbd0b82bcda28f368c2e0bb3af8c2d1203f9a717cf2037d9e9;
    stim[45] = 228'h76a01c14f6ab29d9cad7b871e34a864e6f49daf3c4ac3096b8ad55b59;
    stim[46] = 228'h715ffb68f45f22935e357091a9145cd11ce4133b887dabef0916f6b67;
    stim[47] = 228'h7412d3213cb5882d9c04e17fe8a621e95f7e8eaef72fcc10e0b6d9f1f;
    stim[48] = 228'h38ffe1fef5aeb4c50f6d81a6fc3e017310b26497deaef9c6eaeb10436;
    stim[49] = 228'h059aee5a62f962c79e4e350619558bbbf54a846a3008717dfaeb51f7b;
    stim[50] = 228'h6f2a0967e0966bdfe94c20e6be9bdb7b326cffa6158163732f2db052c;
    stim[51] = 228'h2142f8c7b5ad0a167d71e62c7881fd3c7372b4de11c1cc9c0288aaab6;
    stim[52] = 228'h1af106019059f4221b80a73b7f6dbbf3a25b801067fe3c912c46ba3f9;
    stim[53] = 228'h1d472879e7bc82bd219e88b4e0a267346bf2be11cca20fbda0f9df346;
    stim[54] = 228'h70f8a9456fdc5b4fed9c5386b20f51db2a9f8091445b3a318c4d0898b;
    stim[55] = 228'h228dc8fbf14a80b902e3d77786664440d50b2d8204176ef9815737c04;
    stim[56] = 228'h3986a76bc23fbbdcb31f4995444710c75da38e83f276f4218724829e0;
    stim[57] = 228'h454db12140622d56e3537594973fd85ad94ced1ec8319715cf31eb788;
    stim[58] = 228'h0b7578e285f8790e8ed7520bc08388d27e1476cefea199ca447396916;
    stim[59] = 228'h76a073415aa65c84c2b22c8c284db079eab04f0f61cc2f6a69adb5760;
    stim[60] = 228'h3c3c12fb4d2f2c0cf2101bc3abda1b2244e447496fc295b5570dd7508;
    stim[61] = 228'h23c18b5bfac969f3991763bbe0bfc9669095081a4e85228ae63ca2130;
    stim[62] = 228'h7b136ffa3ac44a91b07378dd8e6a810a36ffd9585817f8053aa99e1d2;
    stim[63] = 228'h5751b93c2f0098005b86249769b8d1cc02826c6ce76e4104c8e404d7a;
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
      expv[0] = 226'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 226'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 226'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 226'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 226'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 226'h0d0a2233c2275a503993ead8165e76275adaaf4b9f06a9c330c7b7ba6;
      expv[6] = 226'h31dfde62bd9221221331dd0459705a52acd49803f4fb5fe483c0339e5;
      expv[7] = 226'h31dfde62bd9221221331dd0459705a52acd49803f4fb5fe483c0339e5;
      expv[8] = 226'h26c387f1ec3537ff3654118dc2070c4352531ab987edf2350ad5c58ec;
      expv[9] = 226'h2040e6c2af52406884021d0d36efd614f4e2686cb2179cf174bb932f5;
      expv[10] = 226'h2040e6c2af52406884021d0d36efd614f4e2686cb2179cf174bb932f5;
      expv[11] = 226'h2040e6c2af52406884021d0d36efd614f4e2686cb2179cf174bb932f5;
      expv[12] = 226'h2040e6c2af52406884021d0d36efd614f4e2686cb2179cf174bb932f5;
      expv[13] = 226'h2040e6c2af52406884021d0d36efd614f4e2686cb2179cf174bb932f5;
      expv[14] = 226'h22a559a79d4658bc9608ead335e02f6c7d5c5c039df5d16ac5a555c8a;
      expv[15] = 226'h21602357122def2b505957ba7488670640b76457ef2759582a70c413d;
      expv[16] = 226'h21602357122def2b505957ba7488670640b76457ef2759582a70c413d;
      expv[17] = 226'h21602357122def2b505957ba7488670640b76457ef2759582a70c413d;
      expv[18] = 226'h21602357122def2b505957ba7488670640b76457ef2759582a70c413d;
      expv[19] = 226'h21602357122def2b505957ba7488670640b76457ef2759582a70c413d;
      expv[20] = 226'h2b4c979f63c70b5484d2383b1867bd7050d9ab2d29cdfb69e207bcdf0;
      expv[21] = 226'h33e9fb19e1d0a57494c21571c0b1dc72d5680152bed08220d8d3dfe6e;
      expv[22] = 226'h06449662d63bc9fe080a7e21246807df0efccdde8ff5988281cc2bf24;
      expv[23] = 226'h05e0bc3cb56069c2ef72d85cb1ff8af0021a6b77b471cb608a6f19050;
      expv[24] = 226'h2b1affcf966fa33734e83ce4e70cd4fcd6336efe00258cf8440287fe6;
      expv[25] = 226'h2b1affcf966fa33734e83ce4e70cd4fcd6336efe00258cf8440287fe6;
      expv[26] = 226'h2dd0f21359d7458f2b0865aa65d3862ff7a8e94a438e7c8ef1935902b;
      expv[27] = 226'h016edd29caf20d63a0cab1936e855dcfb86bbc124222aad66d5daf163;
      expv[28] = 226'h30285a2cf4e92b5bb67153da4011e64c634eef301fc1bca059e2a7e42;
      expv[29] = 226'h30285a2cf4e92b5bb67153da4011e64c634eef301fc1bca059e2a7e42;
      expv[30] = 226'h2d8ec1f76c8dae9343f782c141159472c4cb4a5c25996bc22d6c93f38;
      expv[31] = 226'h2d8ec1f76c8dae9343f782c141159472c4cb4a5c25996bc22d6c93f38;
      expv[32] = 226'h2d8ec1f76c8dae9343f782c141159472c4cb4a5c25996bc22d6c93f38;
      expv[33] = 226'h02da9f98e733499583bd093de26be43879b15b7a5954104d4015ca52f;
      expv[34] = 226'h03bbbf0d8dee9a62872564772af43ac3850eb3de2f24f721726d29dc4;
      expv[35] = 226'h01e85f2de8aa90b9df8c5d76b3c5cf1b96ba97ad82863c3c8027d1fff;
      expv[36] = 226'h01e85f2de8aa90b9df8c5d76b3c5cf1b96ba97ad82863c3c8027d1fff;
      expv[37] = 226'h1b000132cf0261bf586d825876c64f9860ce8ba7921626cb0b33a15d9;
      expv[38] = 226'h006c6bed0d7ca3fda0e900fcd604d3cbe6a8540af4b8dd913482f0569;
      expv[39] = 226'h006c6bed0d7ca3fda0e900fcd604d3cbe6a8540af4b8dd913482f0569;
      expv[40] = 226'h006c6bed0d7ca3fda0e900fcd604d3cbe6a8540af4b8dd913482f0569;
      expv[41] = 226'h006c6bed0d7ca3fda0e900fcd604d3cbe6a8540af4b8dd913482f0569;
      expv[42] = 226'h07db6e0bf2dd8408f1d751cbf6bbe4cb26da9efc84ac5dbe62021beac;
      expv[43] = 226'h07db6e0bf2dd8408f1d751cbf6bbe4cb26da9efc84ac5dbe62021beac;
      expv[44] = 226'h07db6e0bf2dd8408f1d751cbf6bbe4cb26da9efc84ac5dbe62021beac;
      expv[45] = 226'h303cdc4bbd0b82bcda28f368c2e0bb3af8c2d1203f9a717cf2037d9e9;
      expv[46] = 226'h303cdc4bbd0b82bcda28f368c2e0bb3af8c2d1203f9a717cf2037d9e9;
      expv[47] = 226'h303cdc4bbd0b82bcda28f368c2e0bb3af8c2d1203f9a717cf2037d9e9;
      expv[48] = 226'h303cdc4bbd0b82bcda28f368c2e0bb3af8c2d1203f9a717cf2037d9e9;
      expv[49] = 226'h38ffe1fef5aeb4c50f6d81a6fc3e017310b26497deaef9c6eaeb10436;
      expv[50] = 226'h059aee5a62f962c79e4e350619558bbbf54a846a3008717dfaeb51f7b;
      expv[51] = 226'h059aee5a62f962c79e4e350619558bbbf54a846a3008717dfaeb51f7b;
      expv[52] = 226'h2142f8c7b5ad0a167d71e62c7881fd3c7372b4de11c1cc9c0288aaab6;
      expv[53] = 226'h1af106019059f4221b80a73b7f6dbbf3a25b801067fe3c912c46ba3f9;
      expv[54] = 226'h1d472879e7bc82bd219e88b4e0a267346bf2be11cca20fbda0f9df346;
      expv[55] = 226'h1d472879e7bc82bd219e88b4e0a267346bf2be11cca20fbda0f9df346;
      expv[56] = 226'h228dc8fbf14a80b902e3d77786664440d50b2d8204176ef9815737c04;
      expv[57] = 226'h3986a76bc23fbbdcb31f4995444710c75da38e83f276f4218724829e0;
      expv[58] = 226'h3986a76bc23fbbdcb31f4995444710c75da38e83f276f4218724829e0;
      expv[59] = 226'h0b7578e285f8790e8ed7520bc08388d27e1476cefea199ca447396916;
      expv[60] = 226'h0b7578e285f8790e8ed7520bc08388d27e1476cefea199ca447396916;
      expv[61] = 226'h3c3c12fb4d2f2c0cf2101bc3abda1b2244e447496fc295b5570dd7508;
      expv[62] = 226'h23c18b5bfac969f3991763bbe0bfc9669095081a4e85228ae63ca2130;
      expv[63] = 226'h23c18b5bfac969f3991763bbe0bfc9669095081a4e85228ae63ca2130;
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
