// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 113;
  localparam OW = 112;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  jtag_io_mm_interconnect_0_cmd_mux dut (
    .clk(clk),
    .sink0_valid(in_vec[112:112]),
    .sink0_data(in_vec[111:8]),
    .sink0_channel(in_vec[7:4]),
    .sink0_startofpacket(in_vec[3:3]),
    .sink0_endofpacket(in_vec[2:2]),
    .src_ready(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .sink0_ready(out_vec[111:111]),
    .src_valid(out_vec[110:110]),
    .src_data(out_vec[109:6]),
    .src_channel(out_vec[5:2]),
    .src_startofpacket(out_vec[1:1]),
    .src_endofpacket(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 113'h17517abe18eff317c485803d24c67;
    stim[1] = 113'h02ddf3923adcb3b259960c55c18df;
    stim[2] = 113'h0c6a3637a2edfb878959389635128;
    stim[3] = 113'h188c2e6e1099a35a65cdfdce642d8;
    stim[4] = 113'h06f6d9dbbf9a8039128fa1dce7f32;
    stim[5] = 113'h00fe9dde9c529e699eaa151c27eb8;
    stim[6] = 113'h15842f697e0694eb53237fd1f89c4;
    stim[7] = 113'h1ded3bf68ce32288b643a33e0b216;
    stim[8] = 113'h12ad30e56571b03b08c5d4ae6e38c;
    stim[9] = 113'h01eaf2d1922353abf05d573559112;
    stim[10] = 113'h1bd60a739180bd194e5c7fe950d5a;
    stim[11] = 113'h1d6efacfedfd98ade2e4c366f170a;
    stim[12] = 113'h12db9bf03fb83922c853ba9de1140;
    stim[13] = 113'h0ce66dfac5b38af59d31eec8cb6a6;
    stim[14] = 113'h05ba0398a39feb40476654b3d597d;
    stim[15] = 113'h1ad2fc7aedb672694d315dffd858e;
    stim[16] = 113'h09eefd8960cfb0efcce95f0a39f96;
    stim[17] = 113'h104f94539b824b6ea327a7eacac4c;
    stim[18] = 113'h0f04bf119802bf2178ba3fd7a39f4;
    stim[19] = 113'h1f68008b705e75d09bfcce20e635e;
    stim[20] = 113'h17751e77f40bdd412608d2b6b9ea2;
    stim[21] = 113'h1f5e52027a858f1627323a0e84488;
    stim[22] = 113'h0fe447ab551aaa95025e1394821d6;
    stim[23] = 113'h18074ff9f29e4c59e0e60988f4922;
    stim[24] = 113'h0004e4457b3e2710619f23aa84f00;
    stim[25] = 113'h1325ab8d106e9e9f1d3cb5a4e1198;
    stim[26] = 113'h15f54f8dda0917f1296fc2e4bd3e2;
    stim[27] = 113'h18dc3c863bc4641d77e95cdfa1cdc;
    stim[28] = 113'h16396aea814c21b02c5a8ed672cf6;
    stim[29] = 113'h19be69e3e36865f333be6b1479eec;
    stim[30] = 113'h0430b387dc54cdfea863e130d5ed0;
    stim[31] = 113'h145b38d06dc0f076c47bce0b69ab2;
    stim[32] = 113'h11a4069d410f11f766c0130834ef2;
    stim[33] = 113'h0ce10c4c440bcdfa5e35b4d07ced2;
    stim[34] = 113'h059083dfdbb69fd0aaa693886cb60;
    stim[35] = 113'h0a3e39fd4123c576e2c6f7c4de6c0;
    stim[36] = 113'h02c30646060596e681bbd6c0e8c9e;
    stim[37] = 113'h02e1dafff7e952c6227f7dfb37b78;
    stim[38] = 113'h1639193b568654356aba4bc643114;
    stim[39] = 113'h06f8ead37f784d95a07aa712310e4;
    stim[40] = 113'h01498cef13d60791b7fd5737b8ba2;
    stim[41] = 113'h193f27d94d78187ec9f9d05fa0776;
    stim[42] = 113'h04741bc1f1071300f3d48fe386ff6;
    stim[43] = 113'h173b4e85b49ac8f0412c1074d93fc;
    stim[44] = 113'h0455dd4b358b807f13e7105aeed54;
    stim[45] = 113'h05a53d04c83ef4b087b36318eda00;
    stim[46] = 113'h1dec4e4ae6a54ed81f4b9aaab6c0a;
    stim[47] = 113'h18f0cccc576126c2643fa2aa192d0;
    stim[48] = 113'h139e557802686d51c7853caf2e90a;
    stim[49] = 113'h01b5174650e39f58cfa2a9159d74a;
    stim[50] = 113'h1f34fadf95c6de22b8fc83161e916;
    stim[51] = 113'h19d1e823a6ba82e3f4a0b27ce5fec;
    stim[52] = 113'h1f7486ad8f4943c971d4d7dee7a0c;
    stim[53] = 113'h07cd3323cc10bad272f8f37a7f5aa;
    stim[54] = 113'h053c6170fe9cf28153850a43d47fe;
    stim[55] = 113'h15cb35af727ca103a2c4969942ce6;
    stim[56] = 113'h0e4e265560b874bfd4430f901def4;
    stim[57] = 113'h1ec219f6565708facf283eb564dec;
    stim[58] = 113'h0d0ed280884af0879c6bf4b2efe5e;
    stim[59] = 113'h1c16da178dd80268a93b0f8b453d0;
    stim[60] = 113'h07bd3f0439136f748b400348358b6;
    stim[61] = 113'h1511c49c3a150f85ec6beb568bac6;
    stim[62] = 113'h07704183158557df3420492b8c73e;
    stim[63] = 113'h0ff71e87fc715d44c8ac2edd07104;
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
      expv[0] = 112'hdd45eaf863bfcc5f121600f49319;
      expv[1] = 112'h8b77ce48eb72cec9665831570637;
      expv[2] = 112'h31a8d8de8bb7ee1e2564e258d44a;
      expv[3] = 112'h6230b9b842668d699737f73990b6;
      expv[4] = 112'h9bdb676efe6a00e44a3e87739fcc;
      expv[5] = 112'h03fa777a714a79a67aa854709fae;
      expv[6] = 112'h5610bda5f81a53ad4c8dff47e271;
      expv[7] = 112'hf7b4efda338c8a22d90e8cf82c85;
      expv[8] = 112'h4ab4c39595c6c0ec231752b9b8e3;
      expv[9] = 112'h87abcb46488d4eafc1755cd56444;
      expv[10] = 112'hef5829ce4602f4653971ffa54356;
      expv[11] = 112'hf5bbeb3fb7f662b78b930d9bc5c2;
      expv[12] = 112'h4b6e6fc0fee0e48b214eea778450;
      expv[13] = 112'hb399b7eb16ce2bd674c7bb232da9;
      expv[14] = 112'h16e80e628e7fad011d9952cf565f;
      expv[15] = 112'heb4bf1ebb6d9c9a534c577ff6163;
      expv[16] = 112'ha7bbf625833ec3bf33a57c28e7e5;
      expv[17] = 112'h413e514e6e092dba8c9e9fab2b13;
      expv[18] = 112'h3c12fc46600afc85e2e8ff5e8e7d;
      expv[19] = 112'hfda0022dc179d7426ff3388398d7;
      expv[20] = 112'hddd479dfd02f750498234adae7a8;
      expv[21] = 112'h7d794809ea163c589cc8e83a1122;
      expv[22] = 112'hbf911ead546aaa5409784e520875;
      expv[23] = 112'he01d3fe7ca79316783982623d248;
      expv[24] = 112'h00139115ecf89c41867c8eaa13c0;
      expv[25] = 112'h4c96ae3441ba7a7c74f2d6938466;
      expv[26] = 112'hd7d53e3768245fc4a5bf0b92f4f8;
      expv[27] = 112'h6370f218ef119075dfa5737e8737;
      expv[28] = 112'hd8e5abaa053086c0b16a3b59cb3d;
      expv[29] = 112'h66f9a78f8da197cccef9ac51e7bb;
      expv[30] = 112'h10c2ce1f715337faa18f84c357b4;
      expv[31] = 112'hd16ce341b703c1db11ef382da6ac;
      expv[32] = 112'hc6901a75043c47dd9b004c20d3bc;
      expv[33] = 112'hb3843131102f37e978d6d341f3b4;
      expv[34] = 112'h16420f7f6eda7f42aa9a4e21b2d8;
      expv[35] = 112'h28f8e7f5048f15db8b1bdf1379b0;
      expv[36] = 112'h8b0c191818165b9a06ef5b03a327;
      expv[37] = 112'h0b876bffdfa54b1889fdf7ecdede;
      expv[38] = 112'h58e464ed5a1950d5aae92f190c45;
      expv[39] = 112'h1be3ab4dfde1365681ea9c48c439;
      expv[40] = 112'h852633bc4f581e46dff55cdee2e8;
      expv[41] = 112'he4fc9f6535e061fb27e7417e81dd;
      expv[42] = 112'h91d06f07c41c4c03cf523f8e1bfd;
      expv[43] = 112'h5ced3a16d26b23c104b041d364ff;
      expv[44] = 112'h1157752cd62e01fc4f9c416bbb55;
      expv[45] = 112'h1694f41320fbd2c21ecd8c63b680;
      expv[46] = 112'hf7b1392b9a953b607d2e6aaadb02;
      expv[47] = 112'h63c333315d849b0990fe8aa864b4;
      expv[48] = 112'hce7955e009a1b5471e14f2bcba42;
      expv[49] = 112'h86d45d19438e7d633e8aa45675d2;
      expv[50] = 112'hfcd3eb7e571b788ae3f20c587a45;
      expv[51] = 112'h6747a08e9aea0b8fd282c9f397fb;
      expv[52] = 112'h7dd21ab63d250f25c7535f7b9e83;
      expv[53] = 112'h9f34cc8f3042eb49cbe3cde9fd6a;
      expv[54] = 112'h94f185c3fa73ca054e14290f51ff;
      expv[55] = 112'hd72cd6bdc9f2840e8b125a650b39;
      expv[56] = 112'h3938995582e1d2ff510c3e4077bd;
      expv[57] = 112'h7b0867d9595c23eb3ca0fad5937b;
      expv[58] = 112'hb43b4a02212bc21e71afd2cbbf97;
      expv[59] = 112'h705b685e376009a2a4ec3e2d14f4;
      expv[60] = 112'h9ef4fc10e44dbdd22d000d20d62d;
      expv[61] = 112'hd4471270e8543e17b1afad5a2eb1;
      expv[62] = 112'h9dc1060c56155f7cd08124ae31cf;
      expv[63] = 112'h3fdc7a1ff1c5751322b0bb741c41;
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
