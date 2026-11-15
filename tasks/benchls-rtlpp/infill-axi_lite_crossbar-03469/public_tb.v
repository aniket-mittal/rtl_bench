// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 194;
  localparam OW = 263;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03469 dut (
    .aclk(clk),
    .aresetn(in_vec[193:193]),
    .s_axi_awaddr(in_vec[192:161]),
    .s_axi_awprot(in_vec[160:158]),
    .s_axi_awvalid(in_vec[157:157]),
    .s_axi_wdata(in_vec[156:125]),
    .s_axi_wstrb(in_vec[124:121]),
    .s_axi_wvalid(in_vec[120:120]),
    .s_axi_bready(in_vec[119:119]),
    .s_axi_araddr(in_vec[118:87]),
    .s_axi_arprot(in_vec[86:84]),
    .s_axi_arvalid(in_vec[83:83]),
    .s_axi_rready(in_vec[82:82]),
    .m_axi_awready(in_vec[81:80]),
    .m_axi_wready(in_vec[79:78]),
    .m_axi_bresp(in_vec[77:74]),
    .m_axi_bvalid(in_vec[73:72]),
    .m_axi_arready(in_vec[71:70]),
    .m_axi_rdata(in_vec[69:6]),
    .m_axi_rresp(in_vec[5:2]),
    .m_axi_rvalid(in_vec[1:0]),
    .s_axi_awready(out_vec[262:262]),
    .s_axi_wready(out_vec[261:261]),
    .s_axi_bresp(out_vec[260:259]),
    .s_axi_bvalid(out_vec[258:258]),
    .s_axi_arready(out_vec[257:257]),
    .s_axi_rdata(out_vec[256:225]),
    .s_axi_rresp(out_vec[224:223]),
    .s_axi_rvalid(out_vec[222:222]),
    .m_axi_awaddr(out_vec[221:158]),
    .m_axi_awprot(out_vec[157:152]),
    .m_axi_awvalid(out_vec[151:150]),
    .m_axi_wdata(out_vec[149:86]),
    .m_axi_wstrb(out_vec[85:78]),
    .m_axi_wvalid(out_vec[77:76]),
    .m_axi_bready(out_vec[75:74]),
    .m_axi_araddr(out_vec[73:10]),
    .m_axi_arprot(out_vec[9:4]),
    .m_axi_arvalid(out_vec[3:2]),
    .m_axi_rready(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 194'h140de1b2fa751c952be3115d595462675048aada56d4e03fb;
    stim[1] = 194'h0db46e493fdfcaf961da55d0f4b7771a63c9436de3a5e8159;
    stim[2] = 194'h2b3ff290ca01b0d1ffa62e30da922a8c38756b55b2fbef0c6;
    stim[3] = 194'h3feaad584d6802d7de3d950eb674cb4e9a41ac4af8527c715;
    stim[4] = 194'h2c6a0c55a98486540dc76e009f7fbf70b81c53656462d64a3;
    stim[5] = 194'h33eb1644d7d89d853f4a89d0a6de2d2493d1099592d30f7e4;
    stim[6] = 194'h363ad6255b681cdba047713171548748ae7add89ed09b0deb;
    stim[7] = 194'h3a61deefcc0c6891b2910f3f67caa6fd488fb907171979168;
    stim[8] = 194'h2e3c163fd13bba92dc818e72b600dcc6c421ec1fc165c367d;
    stim[9] = 194'h29eaf9ad4ae96bd49aa2cc0d7c1fd37073ceedaa663f74f86;
    stim[10] = 194'h222cd9aebc9c1be741a950f4416a9255b9b47ab600a22b7dc;
    stim[11] = 194'h3f9bd4799933bfe677035b500e65ef3c460186ed846dd3775;
    stim[12] = 194'h2e44288d7e32650b80dd7630c7a3d4ca8391b859753611f68;
    stim[13] = 194'h304dcef0eaa1b4e3d9b15590f9cc394971f87870baadbe679;
    stim[14] = 194'h2c411686de9588df010767d57eb4c554051583664dabdff31;
    stim[15] = 194'h36b7f81ab256f68377065e1dba54156c1c94dfa533a66394f;
    stim[16] = 194'h2c70d44204821500cf9501544a4efdf26dd5bf7828fd7034b;
    stim[17] = 194'h3f45bd2d6d2d63803ebb9dcb95b3b934349bb091cff447a7e;
    stim[18] = 194'h22324b77be48ca026fd1d89eaedd68f05d2afc6c2d37237e1;
    stim[19] = 194'h37a97af0ff3f33e76b3e8c34cc4d0f7942dd4b8b0873b0f69;
    stim[20] = 194'h24ec1e3edef1e4cb2f33b197279c6bc9d22fa1884db620eb4;
    stim[21] = 194'h3d49fd3eee48d9a7cc5f82dad3d913b4ef2944353ed4db282;
    stim[22] = 194'h38b8977712c5cf955f3aad0a557a28e775fc2a7ccb84b52b3;
    stim[23] = 194'h2b715f42efaccdf375eaf0bf49b40bcd88dd3aa84e57d0776;
    stim[24] = 194'h29899a086da732b14a83218f35edf03eadcc80d3ce73cdc64;
    stim[25] = 194'h2d0d8af3164eedd421da0c392fdd378c4ff14a0364d841758;
    stim[26] = 194'h24f374a74def0ac1c299e21c61400326d5cf57fe284ad8e65;
    stim[27] = 194'h39ef8933878a9055fdea65947f3145579bf6181169b46c420;
    stim[28] = 194'h3af8b1fbbdef56014b59d70a98965e85126ffc0358c1222db;
    stim[29] = 194'h2d60e2e173b777b13479a081480f4326cb97bf12a19783f70;
    stim[30] = 194'h38ddf26cf5d3a54f1ab9dc67f5c32c479776d17eea418d4a4;
    stim[31] = 194'h322ae557f91b52ea16138540002c260278ea9c3554da5c13c;
    stim[32] = 194'h2d29b1e8f32a8de1fe0467abee0d09a529daeba25269acb65;
    stim[33] = 194'h3f86d16ceb69f7fa06c1e1d6a81939d1982e6c88b55c8fd25;
    stim[34] = 194'h2c4a68e94dcb64d1a0a09e394c391ef0e6c6473a3c7be90e8;
    stim[35] = 194'h31e9827294bf2aec4c153bf246116f1d5888fe5fa548827e4;
    stim[36] = 194'h3dfadcd4e282db5020be453be7fbeead90037dbf69a048f59;
    stim[37] = 194'h21ea65a394251f793acff80538e0367246fd27a5939905c13;
    stim[38] = 194'h3db8ffe9e5a259dadfb7e66d444870252d81bfd067605652b;
    stim[39] = 194'h3ffa90aed44dd924f700e532c2f1cf39762dc84807ee0ad58;
    stim[40] = 194'h290f30e9048494b6c17460d70111a67641071425989267359;
    stim[41] = 194'h25ac9e089a7f280f08f04355b9bffec010269b6037b3cd666;
    stim[42] = 194'h273105a64e1de4043f8c3ab67cdc227ff035ea5b996123ce7;
    stim[43] = 194'h2e5322d0f19194ae40e4493863f4c3754b9ece839c76cbf47;
    stim[44] = 194'h3802eff1f4b3c3a7b7b7dc4faa6b929338e789b7f69722665;
    stim[45] = 194'h2161230281e1e9862ee93e2bf8788982bf3a1cf4f78ee7634;
    stim[46] = 194'h21b0a435a6ff890f5f8389f37fc7d65ea764a0115d4dbb5e9;
    stim[47] = 194'h33417e05f8d1fcc90540134e3bc743e3179988d6339db4315;
    stim[48] = 194'h39c675ef803b5ae622bf9064695199d4578e51a4cff238e64;
    stim[49] = 194'h3f88b128e09cd463b994deafcc6b6bf52593abe9b4528c03f;
    stim[50] = 194'h2a2f3e906d1b76c982511cce44a792ccf0558882f7c3dd852;
    stim[51] = 194'h20717afd9860bb00d36fed0bd03003869147aff5cfd97555b;
    stim[52] = 194'h39960f50c677008daf1c406f0d959aa62adf3bddebf2000d9;
    stim[53] = 194'h36b8b6e6cd761a9da0dfa6ea88bfcf0162f5317ae70adedab;
    stim[54] = 194'h33898a3093d77ffd600e3a6ce9b94a68da473e79bcf216dbc;
    stim[55] = 194'h207ae7acd4cac68a2f42b316bf3447d0087fff4e3bdc5b66c;
    stim[56] = 194'h2f25d99386b592d5a2d3fa274858a8bbee43446213f6481f2;
    stim[57] = 194'h2247cf8a73cddb2b23129391a2a6792b17fe66cc5d9f5aed7;
    stim[58] = 194'h3e36c6eebece6ccf28c14e8b9752b325745400e812491aa9c;
    stim[59] = 194'h2c1a696fbba69fa5a4e82c5eec4482fb8c7dce72bf4bacbdd;
    stim[60] = 194'h239bcc6a0d4b060d6a8d436c802e9837326dcf72067f402c1;
    stim[61] = 194'h2c2aa6b294dc5609140beb8457399dbfed2419f42e6a3e42d;
    stim[62] = 194'h3cf9694edca88264b301ff0a4ba0dc3050c10fcad75b8806a;
    stim[63] = 194'h2a9649e459e378575fad3994d343b18def0cc54c0978c3826;
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
      expv[0] = 263'h000000000000000000000000000000000000000000000000000000000000000000;
      expv[1] = 263'h000000000000000000000000000000000000000000000000000000000000000000;
      expv[2] = 263'h000000000000000000000000000000000000000000000000000000000000000000;
      expv[3] = 263'h12d97df786967fe521967fe52192c0361a3fc0361a3ff74317186d4b17186d4920;
      expv[4] = 263'h0b7c293e38bfd55ab0bfd55ab09b2d005afbed005afbc47eca875b3aca875b3a4f;
      expv[5] = 263'h6cb2316b2458d418ab58d418ab523090ca81b090ca81bb83b7004fbfb7004fbffc;
      expv[6] = 263'h20c96987bea7d62c89a7d62c89adfb13b0a7fb13b0a7ea8d44e8536d44e8536f60;
      expv[7] = 263'h08f684d86f6c75ac4aac75ac4ab6ed039b742d039b740883b898b8abb898b8aa4c;
      expv[8] = 263'h1f8b8cbc8b34c3bddfb4c3bddf9b018d1236418d12365130879fb3e4879fb3e52c;
      expv[9] = 263'h39e0b2e1b39c782c7f9c782c7fa42777525ba777525b9100c7395b00c7395b000f;
      expv[10] = 263'h0d331fba7c93d5f35a93d5f35a92dd2d7a935d2d7a9355416606be0d6606be0fff;
      expv[11] = 263'h09005115bf8459b35d4459b35d7f13837ce813837ce8374ca87a20b4a87a20b52c;
      expv[12] = 263'h26c236e9babf37a8f33f37a8f3362677fccee677fccee201ada80731ada80732df;
      expv[13] = 263'h18ba9b08fb1c88511adc88511affc64ca170064ca17019bebb1863d2bb1863d1bf;
      expv[14] = 263'h485d56df33209b9de1e09b9de1d2d4369c7b14369c7b3770aac87ce4aac87ce640;
      expv[15] = 263'h0926d5eff818822d0d98822d0dbfd2b11be012b11be02203b3eabf5bb3eabf5a4f;
      expv[16] = 263'h0a99d331cbed6ff0356d6ff03564caded06ecaded06ee2032f0edd2b2f0edd2a40;
      expv[17] = 263'h7c147eb81b58e1a88418e1a884091042a019d042a019f33280aa252680aa25276f;
      expv[18] = 263'h44e7fa23d3be8b7a5afe8b7a5adb25ac7007e5ac7007d57dcee5cad9cee5cad9bc;
      expv[19] = 263'h1c169b91be046496ef446496ef7fc919404dc919404dfbb0ec4f576cec4f576ed3;
      expv[20] = 263'h2d8439d87b2f52f5e1ef52f5e1ffe7e67ced67e67ced667f461a6627461a6626d0;
      expv[21] = 263'h1826db107489d83c7d89d83c7dbfde3c9965de3c9965e671d8cb93cdd8cb93ce43;
      expv[22] = 263'h149f6a6d943a93fa7dfa93fa7ddbc91b34f9891b34f988bfc16d69efc16d69ec90;
      expv[23] = 263'h1865c25a9471712eee31712eee24d8b9f2abd8b9f2abe67d56852abd56852abd20;
      expv[24] = 263'h1a272be83a96e2be85d6e2be85dbf599be6eb599be6ebfcd785fa4d9785fa4da40;
      expv[25] = 263'h47e739e6e293133410d3133410db34e6562974e65629510190c79af590c79af6df;
      expv[26] = 263'h53b26c20bb1a1b15e61a1b15e62dc9ddba8409ddba843bbd061c97ed061c97eed0;
      expv[27] = 263'h0114256c7289e6e94e89e6e94e9b3de158387de15838513cf10e30a0f10e30a000;
      expv[28] = 263'h08b4da362033df126733df126709f1520abfb1520abfbfcd32ca3f9932ca3f9893;
      expv[29] = 263'h31ac60911775f163f775f163f77f3deac0297deac0296abceb854c48eb854c4b63;
      expv[30] = 263'h0150cbc1fa1ac1c5c2dac1c5c2e4f6eef626b6eef6268cfcd040a404d040a407f3;
      expv[31] = 263'h297520c6a4b1bbe4d9f1bbe4d9ed3a74a9e37a74a9e3557cee33fae0ee33fae1b0;
      expv[32] = 263'h00aa6d2e09a455caafe455caaff6236a5d42e36a5d42c031c2a00015c2a0001640;
      expv[33] = 263'h112934d65a9a5363d1da5363d1e4e551bc3fe551bc3fc00233d5f70633d5f706d0;
      expv[34] = 263'h585aae47e8bf0da2d9ff0da2d9d2ed3eff40ed3eff40d980f0eb540cf0eb540c90;
      expv[35] = 263'h3d1e3df4871894d1d29894d1d29b396c9a34396c9a3415404f1ca61c4f1ca61c90;
      expv[36] = 263'h23d2a4413ea3d304e523d304e52d17e55d8997e55d8980329df9230a9df9230893;
      expv[37] = 263'h33b4d0247b3bf5b9a9fbf5b9a9c0d05b6a04105b6a04157f229df3ff229df3fdbf;
      expv[38] = 263'h4cc9cc82e043d4cb4703d4cb472d04a3ef2744a3ef27598ffc029c73fc029c7000;
      expv[39] = 263'h4033b02b297b71ffd3fb71ffd3c9344b3b5bf44b3b5bf773f336a227f336a22403;
      expv[40] = 263'h2403f7056b3ff5215dbff5215dad09bb249ec9bb249ee20072996178729961789f;
      expv[41] = 263'h0ccc49339b121e61d2121e61d209109296d8109296d82ef2306b808a306b80889c;
      expv[42] = 263'h781bd9e6b28b593c110b593c1136cfe501e10fe501e11df021aadcdc21aadcdfff;
      expv[43] = 263'h0fccb091e6ce620b4c8e620b4c9bc3bc8087c3bc8087f30e1d5b3e6e1d5b3e6e40;
      expv[44] = 263'h0dce3b65fadca645a1dca645a1e4323295c8323295c81dc2249c31fa249c31fa4f;
      expv[45] = 263'h11fb4b9132b005dfe3f005dfe3ed167874f6d67874f6f773ee27d537ee27d535bc;
      expv[46] = 263'h107bc773b082c2460502c24605003c3d30c5fc3d30c5ddcc9f15fc3c9f15fc3c0c;
      expv[47] = 263'h0aaea6ddaf0361486b4361486b49dff121ebdff121ebf301c4f9bfe1c4f9bfe3ff;
      expv[48] = 263'h1919ceda18a682fc0be682fc0bf61a3f99209a3f9920aa8009a71de009a71de3f3;
      expv[49] = 263'h1867f91c72b38cebdf338cebdf00076b5cc4476b5cc4557fc83234abc83234a89c;
      expv[50] = 263'h1cda294601ff116251ff116251c0139a8c77139a8c7733326f57e6366f57e635b3;
      expv[51] = 263'h1b7be1eec2145e7d20d45e7d20db236ed930636ed93048b08e6722508e672253fc;
      expv[52] = 263'h10e7ecbaab40e2f5fb00e2f5fb360c17601a4c17601a6ecff685e81bf685e81800;
      expv[53] = 263'h10f5f90007332c1ea1b32c1ea189cee011b5cee011b5e23e203786ca203786cadc;
      expv[54] = 263'h2173856f6d6d716dcdad716dcd9b2ec353b42ec353b419bfd375445fd375445fff;
      expv[55] = 263'h08de790b6da71314612713146124faefffac3aefffac000f1d3674df1d3674dc93;
      expv[56] = 263'h191dee2db380f5cf5980f5cf59ad1958d145d958d145ea81598b5f99598b5f9a43;
      expv[57] = 263'h1509fb240e1e4bb3271e4bb32709d6b25ab456b25ab459b1fd13a42dfd13a42c0c;
      expv[58] = 263'h402ecfad76c48f9f14c48f9f14e4f9bb656479bb6564623149c8d15149c8d15363;
      expv[59] = 263'h4009248d55bc6d8ddd7c6d8ddd7fd9cd99e519cd99e51980a745cba8a745cba92c;
      expv[60] = 263'h1d5fa5d65f9834d2df5834d2df76f4d3f4b4b4d3f4b49dcc162f7620162f76224c;
      expv[61] = 263'h05033fa016073798d4073798d41b2960c1ad6960c1ad510ea1b64016a1b640176c;
      expv[62] = 263'h3617351f2198554d6518554d652d1b8ac1229b8ac122800df5c22b9df5c22b9c9c;
      expv[63] = 263'h256badc40339f2d29db9f2d29dbf15104c9655104c966200ff8525d0ff8525d00f;
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
