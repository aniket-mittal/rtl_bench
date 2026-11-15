// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 138;
  localparam OW = 132;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_091812 dut (
    .clk(clk),
    .control_signal(in_vec[137:128]),
    .Read_Data1(in_vec[127:96]),
    .Read_Data2(in_vec[95:64]),
    .Sign_Ext(in_vec[63:32]),
    .IF_Inst(in_vec[31:0]),
    .Reg_Write(out_vec[131:131]),
    .Mem_to_Reg(out_vec[130:130]),
    .Mem_Write(out_vec[129:129]),
    .Mem_Read(out_vec[128:128]),
    .ALU_Src(out_vec[127:127]),
    .Reg_Dst(out_vec[126:126]),
    .ALU_Op(out_vec[125:122]),
    .Read_Data1_Out(out_vec[121:90]),
    .Read_Data2_Out(out_vec[89:58]),
    .shift_amount_out(out_vec[57:53]),
    .Sign_Ext_out(out_vec[52:21]),
    .rs(out_vec[20:16]),
    .rt(out_vec[15:11]),
    .rd(out_vec[10:6]),
    .func_field(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 138'h169662a2b29ae8b8ea65a190b6be97d0c20;
    stim[1] = 138'h218424fb42db204be37864afd565e673642;
    stim[2] = 138'h032e0c2aaf88af58538db6a46ad4fd364ce;
    stim[3] = 138'h0ad323515656c7542c5f5ef855a905ded25;
    stim[4] = 138'h3d719e4918941eaf7ef502e2ca4556ff0ff;
    stim[5] = 138'h25ffa70641c2e70c64aba900d9483e72d56;
    stim[6] = 138'h3066c69c31d8b458b933898d1611f19e9cf;
    stim[7] = 138'h016281fd1a331f5c1f778ebf8c6a3213111;
    stim[8] = 138'h06a69235d346f3afbd2e226bd451c4bd745;
    stim[9] = 138'h0a10d156063414c8dbe5e33f75dc29c4b81;
    stim[10] = 138'h139cd7bbf9c52418b2aefac97512198fa2e;
    stim[11] = 138'h3c7c53fc74a937e01990af43a893b47a9d4;
    stim[12] = 138'h36f2e9367d8ba3034a86ba6c5097eb9edec;
    stim[13] = 138'h07e552927a09794f1776f710311d1f3cc15;
    stim[14] = 138'h1ea9f3aa278cb47ebdaa0e6b8c85f50c7a4;
    stim[15] = 138'h0ca857bcd1eb42c4fffd93f31e90d83c9b2;
    stim[16] = 138'h2481e749db5ae993ac40d04e03aad01edcb;
    stim[17] = 138'h29742e0196fd8182750a4ca98cbe283d52d;
    stim[18] = 138'h187b5abd62b826e212a3d704f59c5339188;
    stim[19] = 138'h28d9e38a2e69f364314afdeb2292bed0a53;
    stim[20] = 138'h3a1d39de0758dcdc5fb90f68b5d51032a2b;
    stim[21] = 138'h0db0f1ff69ecdb09fc126ebe6242c69e6af;
    stim[22] = 138'h1b18f7d3c8a3624d30856f90c62589e62b0;
    stim[23] = 138'h3b6cbea24ea15f332566f2a612b73500379;
    stim[24] = 138'h2b335767fbce2f99f4db1cbb96737cdb3c5;
    stim[25] = 138'h1dda6956b53ed124e8be807a46451d4aadf;
    stim[26] = 138'h0a8970a6ccaa11e5e5576cd79c88ddfc21d;
    stim[27] = 138'h229b2dcd6cb2c55e030db5ceb2f89d928f4;
    stim[28] = 138'h38b190c6507e75397ba548587935b9935d7;
    stim[29] = 138'h1e0f4e502d94d3feab65e49b7675dc9017e;
    stim[30] = 138'h13e41779e6f85343aec875b7673ae927137;
    stim[31] = 138'h03bc8861a971d366c90b2ab96e1be8e3deb;
    stim[32] = 138'h3868e2ed28eab822036ac76fbc578bc6376;
    stim[33] = 138'h062d17c1159055c83b1cc9a31ec4b8802dc;
    stim[34] = 138'h350450b18889912c986a7cf265f6517cb21;
    stim[35] = 138'h3ddb7d18dca99ab89e0ac4227d3b574584b;
    stim[36] = 138'h22ab95ce8fb546369b0f46465d66c299611;
    stim[37] = 138'h356f69c3b5ed6087d3d7e0f724857c082ff;
    stim[38] = 138'h2b6c059188e028738780ce818e996c3dbdb;
    stim[39] = 138'h254b5888703b4a11df19d089e9088e197ee;
    stim[40] = 138'h384ca2eb3cf29477b1a4b8d72af9af05d2f;
    stim[41] = 138'h1b713963b622cbde6336d38fa283ec11f45;
    stim[42] = 138'h2f110b4fbf1853dbee62ff62496a6e4db36;
    stim[43] = 138'h319b4483f8d8db441e7c774163bd1ba342f;
    stim[44] = 138'h1a2227f44d610599fd94ab48e68759ec920;
    stim[45] = 138'h0ebdfe7a75626f967e4a10dd52087d26c7d;
    stim[46] = 138'h13f11fcc98211e1b7d65a18e4a1e23e55bd;
    stim[47] = 138'h338eb45eb29793b77d619e01782cffc6332;
    stim[48] = 138'h27ce42a350e5a35ef34b835fab2b959389d;
    stim[49] = 138'h14c44247fb2d89a17a777d28ff4b7ac1092;
    stim[50] = 138'h14e9832126ab57b38518484caa9e8e811a8;
    stim[51] = 138'h0a6c7a4d1e59cb06b667a009770b264e24b;
    stim[52] = 138'h189bba792acb8486f1495cf53b3da5290ab;
    stim[53] = 138'h2f8359332ea511e5bb565c5b65e85b57269;
    stim[54] = 138'h0c78051947ec447f91fbbcea857f8d0f8f8;
    stim[55] = 138'h3ca83260b465f765847b22ba170580fcab7;
    stim[56] = 138'h38dadf47991fc4a584a3730575c5c689111;
    stim[57] = 138'h15303b696c09bf7498806f250afd1fd08e3;
    stim[58] = 138'h3c394d254f75a6c3e54da6187ac9e337edf;
    stim[59] = 138'h38d997cba80d36c3550aa003116ff365f1c;
    stim[60] = 138'h2a8be91b7dd81d5dafa77600d70b55a074c;
    stim[61] = 138'h19457b9d921aca0a53e051aa60fe06eb371;
    stim[62] = 138'h3a123897c056a7b1b181cc161a67075c9ec;
    stim[63] = 138'h26c33ea9bacfe9388a2151410033900746f;
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
      expv[0] = 132'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 132'h5a598a8aca6ba2e3a9a0b43216d6be860;
      expv[2] = 132'h861093ed0b6c812f8df30c95faad33982;
      expv[3] = 132'h0cb830aabe22bd614e27b6d48d5be9b0e;
      expv[4] = 132'h2b4c8d45595b1d50b169ebdf0ab42ef65;
      expv[5] = 132'hf5c6792462507abdfbc6a05c5948b7fbf;
      expv[6] = 132'h97fe9c19070b9c3192ab75201b29f3956;
      expv[7] = 132'hc19b1a70c762d162e4ce7131a2c38cf4f;
      expv[8] = 132'h058a07f468cc7d707dc8f1d7f18d90991;
      expv[9] = 132'h1a9a48d74d1bcebef4bbc44d7a8a25e85;
      expv[10] = 132'h2843455818d053236f9cbc67eebb4e241;
      expv[11] = 132'h4e735eefe7149062ca91df592ea2cc7ee;
      expv[12] = 132'hf1f14ff1d2a4df80664e15e87513a3d54;
      expv[13] = 132'hdbcba4d9f62e8c0d2a2ed74d8a135cf6c;
      expv[14] = 132'h1f954a49e825e53c5de0dee20622f9e55;
      expv[15] = 132'h7aa7cea89e32d1faf6bd41cd7191a8624;
      expv[16] = 132'h32a15ef347ad0b13ffcdb27e63d2c1e72;
      expv[17] = 132'h92079d276d6ba64eb12e1a09c07480f4b;
      expv[18] = 132'ha5d0b8065bf60609d4294995319741ead;
      expv[19] = 132'h61ed6af58ae09b884a8c7ae09eb299c88;
      expv[20] = 132'ha3678e28b9a7cd90c5135fbd6453f6853;
      expv[21] = 132'he874e7781d6373717ed121ed16ba8196b;
      expv[22] = 132'h36c3c7fda7b36c27f0744dd7cc4834f2f;
      expv[23] = 132'h6c63df4f228d8934c214adf218c44f330;
      expv[24] = 132'hedb2fa893a857ccc959ade54c257a8039;
      expv[25] = 132'haccd5d9fef38be67d35f639772cfe6d85;
      expv[26] = 132'h7769a55ad4fb4493a2d7d00f48c8ea55f;
      expv[27] = 132'h2a25c29b32a847979550ed9af390efe1d;
      expv[28] = 132'h8a6cb735b2cb15780c07b6b9d65eec974;
      expv[29] = 132'he2c6431941f9d4e5eeaea90b0f27cc997;
      expv[30] = 132'h783d3940b6534ffaad8abc936ecee483e;
      expv[31] = 132'h4f905de79be14d0ebb090eb6ece7493b7;
      expv[32] = 132'h0ef22186a5c74d9b242f65572dc3471eb;
      expv[33] = 132'he1a38bb4a3aae0880d9b58edf78a5e336;
      expv[34] = 132'h18b45f0456415720ec57993463d9c401c;
      expv[35] = 132'hd41142c6222644b261994f9e4cbe8be61;
      expv[36] = 132'hf76df46372a66ae2780358844fa6ba2cb;
      expv[37] = 132'h8aae573a3ed518da6c31e8c8cbac14c91;
      expv[38] = 132'hd5bda70ed7b5821f4f56fc1ee491e043f;
      expv[39] = 132'hadb016462380a1ce1e1e19d031d361edb;
      expv[40] = 132'h952d6221c0ed28477c7f3a113d2070cae;
      expv[41] = 132'he1328bacf3ca51dec6a8971ae55f782ef;
      expv[42] = 132'h6dc4e58ed88b2f798cfada71f451608c5;
      expv[43] = 132'hbc442d3efc614f6fb9985fec492d726f6;
      expv[44] = 132'hc66d120fe3636d1079e18ee82c76dd1af;
      expv[45] = 132'h68889fd135841667f64895691cd0cf660;
      expv[46] = 132'h3af7f9e9d589be59f923421baa41e937d;
      expv[47] = 132'h4fc47f326084786df5acb431c9431f2bd;
      expv[48] = 132'hce3ad17aca5e4eddf59833c02f05fe332;
      expv[49] = 132'h9f390a8d43968d7bcd05706bf564ac9dd;
      expv[50] = 132'h5311091fecb62685e9c4efa51fe9d6092;
      expv[51] = 132'h53a60c849aad5ece144d09099552740a8;
      expv[52] = 132'h29b1e93479672c1ad992f4012ee13270b;
      expv[53] = 132'h626ee9e4ab2e121bc5052b9ea767294ab;
      expv[54] = 132'hbe0d64ccba944796ed52cb8b6cbcdaba9;
      expv[55] = 132'h31e014651fb111fe47c7779d50ae687f8;
      expv[56] = 132'hf2a0c982d197dd9611d5645742e007e77;
      expv[57] = 132'he36b7d1e647f129612886e60aeb834491;
      expv[58] = 132'h54c0eda5b026fdd262060de4a15efe863;
      expv[59] = 132'hf0e534953dd69b0f9537b4c30f5919bdf;
      expv[60] = 132'he3665f2ea034db0d54395400622d9b2dc;
      expv[61] = 132'haa2fa46df7607576bebaeec01ae0ad00c;
      expv[62] = 132'h6515ee76486b28294f9a0a354c1e375b1;
      expv[63] = 132'he848e25f015a9ec6c60e3982c34c3ae6c;
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
