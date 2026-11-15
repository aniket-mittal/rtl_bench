// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 168;
  localparam OW = 168;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06973 dut (
    .aclk(clk),
    .aresetn(in_vec[167:167]),
    .cfg_data(in_vec[166:135]),
    .dsp_a_p(in_vec[134:102]),
    .dsp_b_p(in_vec[101:60]),
    .dsp_c_p(in_vec[59:18]),
    .s_axis_tdata(in_vec[17:2]),
    .s_axis_tvalid(in_vec[1:1]),
    .m_axis_tready(in_vec[0:0]),
    .dsp_a_a(out_vec[167:152]),
    .dsp_b_a(out_vec[151:127]),
    .dsp_b_c(out_vec[126:85]),
    .dsp_c_a(out_vec[84:60]),
    .dsp_c_c(out_vec[59:18]),
    .s_axis_tready(out_vec[17:17]),
    .m_axis_tdata(out_vec[16:1]),
    .m_axis_tvalid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 168'h6d2a6fb1a7e0b8d151370456b89e42705d2e0ce5d6;
    stim[1] = 168'h21526e2ecf5b8f82cf3497b6277618d94e221fc8fe;
    stim[2] = 168'hcb369e5c247e95981572de326c06b608efdc323ab7;
    stim[3] = 168'h84c3675ac515b08491ae31c8331da8ac8211645e28;
    stim[4] = 168'h88e15bb95a0d0bafb871142d28256f731dd9e8f9c1;
    stim[5] = 168'hc32efc985307b71123ef0156fce86bd57369686b68;
    stim[6] = 168'hfc4d60debe95c3d14ce9183a7d4e72301068a1fb6a;
    stim[7] = 168'hbf829c4769eae5a6b170a088a2e282e901c126c193;
    stim[8] = 168'ha2b667b6eb827011b6e1d285af7c9dc8bc5b4a359a;
    stim[9] = 168'ha0353112227569a2519b5d3681a1bd01892c1ec2f3;
    stim[10] = 168'hd94aa741069c5f10d5d33167a44ee539d467075c2f;
    stim[11] = 168'hda5ae342fb961d210843a8ca28389ee17e2357a223;
    stim[12] = 168'h9d8fafedf954a211281ff6bf6b987db2404bca84e4;
    stim[13] = 168'hba06e961aac35f0c6459c2c821fb5cfd15252b7d30;
    stim[14] = 168'h88c4e141490b34b7252f1cb36dc075b1376e591f55;
    stim[15] = 168'hb2c60aa2124c682cad22f640d8f9828695a60b4fb8;
    stim[16] = 168'hd8c8c6da0dccd2195d40ff6dc9c350472ce0a21325;
    stim[17] = 168'h8994409bcecf5642a36d1502ee4e315c7c2a486bb5;
    stim[18] = 168'he75cb470093f2b5c71d9a4b430578b7be52dc4884f;
    stim[19] = 168'he00c60ffb98b69118478dc2b4b161861d852149840;
    stim[20] = 168'hede8054e34b711b8574df0b2093cf1aa16bcf92581;
    stim[21] = 168'hf1f975ad132ce686daafef8928b8cc302f269c160e;
    stim[22] = 168'hcf49c595316029e66c58036a87cdf837f3fdf2f0ac;
    stim[23] = 168'hde98a7cf8867f2f51958593ad33a1479f3cda3873f;
    stim[24] = 168'hc375e9c6fddc717417c64f11b9f18aeea2f7e018b0;
    stim[25] = 168'heed2dc8ca8af47297f62a04e34c1421daab54c5234;
    stim[26] = 168'h8f492738f5a7618d14f80ee2ae6a2bb90920f8cb9d;
    stim[27] = 168'ha1dfd0b2aa7a5e303d8853ceb4a9c9b74b9b9b5c2d;
    stim[28] = 168'he8d0bf81493d79d7f32299da85ab477646f2d5674a;
    stim[29] = 168'h95f993514fe4caf6e06bec2d8bf4505065d4bc35a9;
    stim[30] = 168'h9cc9d852017e8e30fe04ccfe5c96bb7fcd382cd8a7;
    stim[31] = 168'ha8089f9c5ad29c7e705e3b8b3ff547902a2bcd5aaa;
    stim[32] = 168'h97cae33128f996861418d1521fd04d15c96099ee06;
    stim[33] = 168'ha8cc0810589ff544d1e7a263fb047a410d49486c75;
    stim[34] = 168'hb2b92ae137b9883c0d52db5daf5ad866e5941805cf;
    stim[35] = 168'h861e4a0379f4482eeb2f65bed84619a98cb7cba78e;
    stim[36] = 168'hdf489d6bec0e631864792aadec614c294b167d8c2c;
    stim[37] = 168'h852747878353667e81caea613eaf082baf07b9bc7e;
    stim[38] = 168'he3844b9a59df109cb8f56ea81981092b74148b4898;
    stim[39] = 168'h98559bec03816ac75a4a1887c51ac1b20d090bc0a3;
    stim[40] = 168'haea6103e96c214e266f2c16c39eb1c6cd6fa5c82e7;
    stim[41] = 168'he9a0ef5785f414602462fffc23b9d058e8817d0d51;
    stim[42] = 168'ha8288aa4f0df192f33847dc90021e076e32bff6ec2;
    stim[43] = 168'hd99ba197590afd75806ad538ef91fdcacdf452143f;
    stim[44] = 168'hf7e2e2bbeca7a2d5c9394bade73c71fd7d73ff65e0;
    stim[45] = 168'hda07049eff96c2e96e885be42e7ee3e54ff666af4f;
    stim[46] = 168'h80586121e2ed2dfe3c05423f025cfd60ed676e2337;
    stim[47] = 168'hd7edf47070c5eb2a60fd51c1ab476df67266bea33c;
    stim[48] = 168'hd96864870ce4cf657be9fa1000f6ed16378b18fdfc;
    stim[49] = 168'he7b80580d851f8ee1ee93ba691b5c0a5bd8968ceee;
    stim[50] = 168'h9a0949532343254af8aa3aefc3a83c5694d510275a;
    stim[51] = 168'h937b56cc29ec1992f4c15b89329c89584689f7a3a2;
    stim[52] = 168'hc7f00e1b9c8e52538510f0c14c1dde11ee764764f2;
    stim[53] = 168'he4a15e7c6ae853c82d1e73976154abb0d86d4c24fb;
    stim[54] = 168'h8f377b8934cbe7155d4efef0b38a45638cb0e117ee;
    stim[55] = 168'hadf9da6849ca20042d9bab2cbe854e3ae87c69c9cb;
    stim[56] = 168'hf119da5e7696ac187219d5f49ede5d31bb6806b568;
    stim[57] = 168'h9fcca1953e2e0850969a4b65c49ea1509894881de2;
    stim[58] = 168'h894920680a36843841e593d4e83c67fc4eff94b896;
    stim[59] = 168'habf603208d3e938e8787edea2b2106ea4a5a5784c5;
    stim[60] = 168'h93ebecb1c21218eb58a3e4562f554263514a3b6d81;
    stim[61] = 168'he7c5cc7f8d44377d68f842e14fb323efdac1d4ea82;
    stim[62] = 168'h1eb2259509103e1a93a30dc4bcf28201209abe8aaa;
    stim[63] = 168'hf0767e6132c84e71882a1ae949e8fde3450d744b33;
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
      expv[0] = 168'h3975xxxxxxx7e0b8d140xxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 168'hf23f0000004f5b8f82c00000000000000000000001;
      expv[2] = 168'h8ead000000247e9598000000000000000000027971;
      expv[3] = 168'h178a572de34515b0848015b047755cb78c9b00130c;
      expv[4] = 168'h3e701ae31cda0d0baf800d4564146b8c720cc76ee4;
      expv[5] = 168'h1ada871142d307b711000b7b98ee1c450b4a090cba;
      expv[6] = 168'h7eda3ef0153e95c3d140035eab98fbc055bf39837b;
      expv[7] = 168'hb064ce9183e9eae5a680139180833a460e9f52711d;
      expv[8] = 168'h8d66170a08eb827011801417480c5c282228b88ad9;
      expv[9] = 168'hb0bc6e1d28227569a24004ee45edb874a16bdec449;
      expv[10] = 168'hd70b19b5d3069c5f10c00de80c4466d74da06b652b;
      expv[11] = 168'he8885d33167b961d21001729cea574cc59e9138d0b;
      expv[12] = 168'ha139843a8cf954a2110004f70bf210ea328a0cbfb6;
      expv[13] = 168'hdf4c81ff6baac35f0c4003ed920a07fdafdae5a586;
      expv[14] = 168'h47d5459c2cc90b34b7001ae7e8a91670b2087f8504;
      expv[15] = 168'hd3ee52f1cb124c682c8003ad89b94bc72cdb7075b0;
      expv[16] = 168'h84c9d22f640dccd219400c1434ab48bd90363f1b68;
      expv[17] = 168'h1aedd40ff6cecf5642801a823967503fdb72722650;
      expv[18] = 168'h221336d150093f2b5c40118ae3e8db4540bb92d1c1;
      expv[19] = 168'h26101d9a4b398b6911801c5bdf2c76692d0c158030;
      expv[20] = 168'h4960478dc2b4b711b84010c30ec11e370ad2c7b7a0;
      expv[21] = 168'h058374df0b132ce686c0078d50b5d37c2c824dd6b5;
      expv[22] = 168'hbc2baafef8b16029e64006618176abfbe24a2d1654;
      expv[23] = 168'he1cfc580368867f2f5000fc1bf9b1600daa1f29f3f;
      expv[24] = 168'h062c958593fddc71740010a3cf9656164eb4cda71a;
      expv[25] = 168'h148d7c64f128af4729400c577515f193c46e7dbb4a;
      expv[26] = 168'h32e7f62a04f5a7618d000a10ed5fd8a8138d323d24;
      expv[27] = 168'hd70b4f80ee2a7a5e3000115dc8453e03b8ab9b42ca;
      expv[28] = 168'h59d2d8853cc93d79d7c00e4dba5f6214f3ad28fe05;
      expv[29] = 168'h0d6a32299dcfe4caf6c01a3bb23cc8a676a16a4d44;
      expv[30] = 168'h362906bec2817e8e30c0028283281afb0b62fe7327;
      expv[31] = 168'h56aae04ccfdad29c7e4015dbfe6f81333f9724a023;
      expv[32] = 168'h7b8105e3b8a8f99686000a3c815c178ee2cffc5f2b;
      expv[33] = 168'h1b1d418d15589ff544c00268ae4506345487f64d14;
      expv[34] = 168'h01731e7a2637b9883c0003d2086479e898fec2cae5;
      expv[35] = 168'he9e3d52db5f9f4482ec016c3372354b6d76bd5280d;
      expv[36] = 168'h630bb2f65bec0e63184010cd4c6acbd96fb6117d22;
      expv[37] = 168'h6f1f4792aa8353667e800a614a591e4aab7b18149d;
      expv[38] = 168'hd2261caea659df109c8018415d7072ba984fa92e68;
      expv[39] = 168'hf0288f56ea83816ac74008495bae3d5baa06626157;
      expv[40] = 168'h20b9a4a18816c214e240160d9066928621f14640fb;
      expv[41] = 168'h43546f2c1685f414600018e366b9bcb05b0e7bbd5e;
      expv[42] = 168'hdbb0462ffff0df192f000e82c74918bfff08ec2a93;
      expv[43] = 168'h850f3847dcd90afd75800f03b71ce11f72400b666f;
      expv[44] = 168'hd97806ad53eca7a2d5c00fee56601ab54e3be5df8a;
      expv[45] = 168'habd39394baff96c2e940038febe24e52eb79ce127b;
      expv[46] = 168'h88cde885be62ed2dfe00171f2a7ba216f90b9f8487;
      expv[47] = 168'ha8cfc05423f0c5eb2a4007eb076f01508fc095d1c0;
      expv[48] = 168'h3f7f0fd51c0ce4cf65401b6fb3983f54706ad165a0;
      expv[49] = 168'h33bbbe9fa15851f8ee001768b1befa7e84003d9ee1;
      expv[50] = 168'h09d6ee93ba2343254ac00e052de7ba4ee9a46c6825;
      expv[51] = 168'he8e88aa3aea9ec1992c001e2b4ae2a8ebbf0e95b31;
      expv[52] = 168'hd93c4c15b89c8e525380044ac23d3056e24ca4386f;
      expv[53] = 168'h093e510f0c6ae853c8000ef08f71443c30530779f1;
      expv[54] = 168'h45fbd1e73934cbe71540055d86cb479ce5d8543cdd;
      expv[55] = 168'h7272d4efef49ca200400122b1c6753bfbc2ce369a1;
      expv[56] = 168'had5ad9bab2f696ac18400a71d74b66eacb2fa1c466;
      expv[57] = 168'h0778219d5f3e2e08508012e98ddc86757d27b48655;
      expv[58] = 168'h2e2569a4b60a36843840150a84c5a692d9712481a1;
      expv[59] = 168'he1311e593d0d3e938e80033fe2707964f53a0e0c82;
      expv[60] = 168'hdb60787edec21218eb4008375251e1fb7a8aca4fae;
      expv[61] = 168'h3aa08a3e450d44377d400a131a8628f9158bd59f17;
      expv[62] = 168'ha2aa8f842e09103e1a80191f7eda3e10b853ec7ac9;
      expv[63] = 168'h12cc00000032c84e7180000000000000000003c1d9;
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
