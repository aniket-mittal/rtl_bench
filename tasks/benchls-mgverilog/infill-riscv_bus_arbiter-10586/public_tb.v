// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 136;
  localparam OW = 140;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10586 dut (
    .io_mainClk(clk),
    .io_iBus_cmd_valid(in_vec[135:135]),
    .io_iBus_cmd_payload_pc(in_vec[134:103]),
    .io_dBus_cmd_valid(in_vec[102:102]),
    .io_dBus_cmd_payload_wr(in_vec[101:101]),
    .io_dBus_cmd_payload_address(in_vec[100:69]),
    .io_dBus_cmd_payload_data(in_vec[68:37]),
    .io_dBus_cmd_payload_size(in_vec[36:35]),
    .io_masterBus_cmd_ready(in_vec[34:34]),
    .io_masterBus_rsp_valid(in_vec[33:33]),
    .io_masterBus_rsp_payload_data(in_vec[32:1]),
    .resetCtrl_systemReset(in_vec[0:0]),
    .io_iBus_cmd_ready(out_vec[139:139]),
    .io_iBus_rsp_ready(out_vec[138:138]),
    .io_iBus_rsp_error(out_vec[137:137]),
    .io_iBus_rsp_inst(out_vec[136:105]),
    .io_dBus_cmd_ready(out_vec[104:104]),
    .io_dBus_rsp_ready(out_vec[103:103]),
    .io_dBus_rsp_error(out_vec[102:102]),
    .io_dBus_rsp_data(out_vec[101:70]),
    .io_masterBus_cmd_valid(out_vec[69:69]),
    .io_masterBus_cmd_payload_wr(out_vec[68:68]),
    .io_masterBus_cmd_payload_address(out_vec[67:36]),
    .io_masterBus_cmd_payload_data(out_vec[35:4]),
    .io_masterBus_cmd_payload_mask(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 136'h828a454e51d7e7825519c163edc112b80f;
    stim[1] = 136'h47a78ad5b4cbee96cb5ae203b05cfdbadf;
    stim[2] = 136'ha0f0647032bae3452d3524c016526d3d1a;
    stim[3] = 136'h6ec03ac626b9b72b2d1e3df5dd8f9dc768;
    stim[4] = 136'hc3a5e7fc937b48a403a4294b20de3c3c60;
    stim[5] = 136'h38c3d8bb02b8c364b19b92d9ff2a161b2f;
    stim[6] = 136'h647b4362b5add65a096fc974b381017d98;
    stim[7] = 136'hc96b3da41a7e6ab21100d5aa5fcd68b718;
    stim[8] = 136'hd475bbc1f1833501f6c175744ea38e5076;
    stim[9] = 136'h8152922e0f25c060cfaa6b924853acf980;
    stim[10] = 136'h10876b59166bb2ca6ec24c373e586200d3;
    stim[11] = 136'hd3e27543340d6129de929ffd86c7df276c;
    stim[12] = 136'hf002c4f989115635c98655a33ad6d05e12;
    stim[13] = 136'h40e97c8a95b6d88b26e2003fbcb3837536;
    stim[14] = 136'h1dbf872b122734784b6e2c28c340b5d6aa;
    stim[15] = 136'h35eaabc2e2670fe8d873646e49d79aea4c;
    stim[16] = 136'hdea177478938300aa00ad045b44f184cac;
    stim[17] = 136'hda81be4a574be42d17b60719bbf828efa2;
    stim[18] = 136'h666e2ea1538defec3fbd7547a33a593a24;
    stim[19] = 136'h0e692f7be92fac8ec0414172f159dd919c;
    stim[20] = 136'h0052f47b9bf8a89fe1640324cb3be1b6ea;
    stim[21] = 136'hdbba068c1fab933980eac8d0f08b8426da;
    stim[22] = 136'hf3bbdf3fe9e1278f1d4e9e7c4f22837c84;
    stim[23] = 136'h5648e3a5b50fb40ff050cc45176d1cb140;
    stim[24] = 136'h351b787dfd6b6d7c75dab06faabb976c42;
    stim[25] = 136'h1c6de9c75b00f81a12900b11c33cf14eaa;
    stim[26] = 136'hcc34527978a32439fb4dcfffa15a7a43a8;
    stim[27] = 136'h8fea82e3e2f390e800935b9dd95c2b699c;
    stim[28] = 136'h8d873baa94ed6b7c7958f2baafd9a02be6;
    stim[29] = 136'h6e886486d850782ed8b75601723c192c1e;
    stim[30] = 136'h960be9a383c6def1d4a6f69cb3fa115710;
    stim[31] = 136'ha9620ca645b33fe6be0ac2aef40ded845a;
    stim[32] = 136'h7d6a851e78825bf77ba7818dac18a8e5c2;
    stim[33] = 136'hc79cfeca71f7e69f433e0b44b9b5bab620;
    stim[34] = 136'h19bdff5f95c80f39e098e7a86d927f102b;
    stim[35] = 136'h98a501ac0c913339a05243f52944fceb39;
    stim[36] = 136'hcd465874d2656578b4379c327feddbd8ae;
    stim[37] = 136'h599801b730e521a2998f543984d2efded8;
    stim[38] = 136'h0545079b6749543c7ec8f5eb5c454fa43e;
    stim[39] = 136'h80ab9ce9817a84eafd4d6e5613cd04585a;
    stim[40] = 136'h85d3539ebfed24358adbf478cf290aa398;
    stim[41] = 136'h1a218d4905abea4bc21ed354e4793578bc;
    stim[42] = 136'h62d428c10a60ddb156cd8d0ab26cb7c22b;
    stim[43] = 136'hbcd02bbdfdaef8854dce8b99f8dac6bd2c;
    stim[44] = 136'h824d53ef5f54d6f3c4a0e5cea2067100ac;
    stim[45] = 136'h0f22f2b9bc53b092702b955fca3f6ff4f2;
    stim[46] = 136'h30b58e57b373239f0872d42fc3997d0be2;
    stim[47] = 136'heea8c71162f1d7ff6e4445e172ca10eb02;
    stim[48] = 136'ha27f18dc1104b82967de8b13c81e16fc20;
    stim[49] = 136'h751fa4e877d2e0afd535fae654ba39e734;
    stim[50] = 136'hee075ec535b0d792415190674cd662fca2;
    stim[51] = 136'h05b61256d8f6109bf33b794ca7c39502b6;
    stim[52] = 136'h92da7da1ae166eee6f9c573a70ced08628;
    stim[53] = 136'h4a1f4dddf5e3979c243d58c1a17b1c88e4;
    stim[54] = 136'ha29d7fa7e1d369eaf6612aebd597b8ff56;
    stim[55] = 136'he6c86abe6d3009baaec745e8edef436176;
    stim[56] = 136'hacea02498ebc89ac665d0f4b50a7dd7d30;
    stim[57] = 136'h9f23a03aaa07b4070f02ff512f3c9118c2;
    stim[58] = 136'h4624636634c14232b5af28992ffefec3a0;
    stim[59] = 136'h7c4cbe72e705516253c40ab2436c3558a8;
    stim[60] = 136'h0057f7ae516b6eeb890d5ed938a5578e58;
    stim[61] = 136'h47d6f914360497348ac31a19e1823b064a;
    stim[62] = 136'h87cfdf9e81ff4afe480a3d50b6663fc4e8;
    stim[63] = 136'h4c9591e542ebaa78ecc4d7bac1111b1f20;
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
      expv[0] = 140'h1c112b80f38225701e8ebf3c12a8ce0b1fc;
      expv[1] = 140'h05cfdbade0b9fb75bc8f4f15ab5ad7101dc;
      expv[2] = 140'hc526d3d1b0a4da7a3641e0c8e069a92600e;
      expv[3] = 140'h18f9dc76831f3b8ed0dd80758c68f1efaee;
      expv[4] = 140'h0de3c3c601bc7878c0874bcff91d214a591;
      expv[5] = 140'hd2a161b2f2542c365c7187b1768cdc96cfe;
      expv[6] = 140'h581017d9830202fb30c8f686c54b7e4ba5f;
      expv[7] = 140'hdcd68b71939ad16e3292d67b488806ad52f;
      expv[8] = 140'h4a38e50771471ca0ef8c19a80fb60baba28;
      expv[9] = 140'h053acf9800a759f30202a5245c7d535c92c;
      expv[10] = 140'hc586200d30b0c401a4210ed6b2761261b98;
      expv[11] = 140'hcc7df276d18fbe4edaa7c4ea86f494ffec4;
      expv[12] = 140'h4d6d05e121ada0bc26e00589f34c32ad19c;
      expv[13] = 140'h8b383753716706ea6c81d2f915371001fde;
      expv[14] = 140'h540b5d6aa2816bad543b7f0e565b7161464;
      expv[15] = 140'h1d79aea4c3af35d49b13387f46c39b2372c;
      expv[16] = 140'h84f184cad09e30995abd42ee8f0056822de;
      expv[17] = 140'h5f828efa23f051df46ba5f2168bdb038cdf;
      expv[18] = 140'h53a593a24274b2744a9c6f7f61fdebaa3d2;
      expv[19] = 140'h159dd919c2b3bb233b497d6476020a0b97c;
      expv[20] = 140'h53be1b6ea277c36dd400a5e8f70b2019268;
      expv[21] = 140'h08b8426da117084db6b7740d1807564687f;
      expv[22] = 140'h522837c8524506f90b4f093c78ea74f3e23;
      expv[23] = 140'hd6d1cb1412da396280ac91c74b828662288;
      expv[24] = 140'h4bb976c421772ed887eb5b6be3aed5837d8;
      expv[25] = 140'h53cf14eaa279e29d56d807c0d09480588e1;
      expv[26] = 140'h15a7a43a82b4f48753c51921cfda6e7ffd8;
      expv[27] = 140'h15c2b699c2b856d33b179c8740049adceef;
      expv[28] = 140'hdd9a02be73b34057ce1b0e7755cac795d58;
      expv[29] = 140'h43c192c1e07832583ec283c176c5bab00bc;
      expv[30] = 140'h5fa1157103f422ae222c17d347a537b4e5c;
      expv[31] = 140'h00ded845b01bdb08b62d99ff35f0561577e;
      expv[32] = 140'h018a8e5c203151cb85c412dfbbdd3c0c6d8;
      expv[33] = 140'h1b5bab62036b756c418fbf34fa19f05a25c;
      expv[34] = 140'h9927f102b324fe2054337bfebf04c73d438;
      expv[35] = 140'h144fceb38289f9d672314a035802921fa96;
      expv[36] = 140'h5eddbd8af3dbb7b15e932b2bc5a1bce193e;
      expv[37] = 140'h0d2efded81a5dfbdb0b330036ecc7aa1cc1;
      expv[38] = 140'h0454fa43e08a9f487d3a4aa1e3f647af5a8;
      expv[39] = 140'h1cd04585ab9a08b0b6015739d3ea6b72b08;
      expv[40] = 140'h9290aa399a521547320ba6a73d56dfa3c63;
      expv[41] = 140'h0793578bc0f26af17834431a9210f69aa74;
      expv[42] = 140'h46cb7c22a0d96f8454c5a85182b66c6855c;
      expv[43] = 140'h0dac6bd2c1b58d7a5bed77c42a6e745ccfc;
      expv[44] = 140'h4067100ac00ce2015afaa6b79e25072e754;
      expv[45] = 140'h43f6ff4f207edfe9e41e45e573815caafe8;
      expv[46] = 140'h5997d0be2332fa17c4616b1caf4396a17e1;
      expv[47] = 140'h4ca10eb0219421d607178ebffb72222f0b8;
      expv[48] = 140'h01e16fc2003c2df84244fe31b83ef4589e8;
      expv[49] = 140'h0ba39e73517473ce6bbe97057ea9afd732c;
      expv[50] = 140'h8d662fca31acc5f946dc0ebd8a0a8c833ac;
      expv[51] = 140'h5c39502b73872a056ec7b084df99dbca658;
      expv[52] = 140'h0ced0862819da10c5025b4fb437ce2b9d38;
      expv[53] = 140'h17b1c88e42f63911c9af1cbce121eac60d2;
      expv[54] = 140'h197b8ff5632f71fead0e9b4f57b309575e8;
      expv[55] = 140'h1ef4361763de86c2ed69804dd5763a2f476;
      expv[56] = 140'h0a7dd7d3014fbafa6059d4049332e87a5a8;
      expv[57] = 140'h93c9118c3a792231863e4740757817fa893;
      expv[58] = 140'hdfefec3a13fdfd87408c48c6ccad7944c96;
      expv[59] = 140'h56c3558a82d86ab153382a8b129e2055924;
      expv[60] = 140'h0a5578e5814aaf1cb28b5b775c486af6c9f;
      expv[61] = 140'h1823b064a304760c948fadf2285618d0cf1;
      expv[62] = 140'hc663fc4e90cc7f89d20f9fbf3d4051ea85c;
      expv[63] = 140'h1111b1f20222363e40175d53c76626bdd68;
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
