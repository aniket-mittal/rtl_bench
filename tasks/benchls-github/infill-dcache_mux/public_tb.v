// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 177;
  localparam OW = 215;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dcache_mux dut (
    .clk_i(clk),
    .rst_i(in_vec[176:176]),
    .mem_addr_i(in_vec[175:144]),
    .mem_data_wr_i(in_vec[143:112]),
    .mem_rd_i(in_vec[111:111]),
    .mem_wr_i(in_vec[110:107]),
    .mem_cacheable_i(in_vec[106:106]),
    .mem_req_tag_i(in_vec[105:95]),
    .mem_invalidate_i(in_vec[94:94]),
    .mem_writeback_i(in_vec[93:93]),
    .mem_flush_i(in_vec[92:92]),
    .mem_cached_data_rd_i(in_vec[91:60]),
    .mem_cached_accept_i(in_vec[59:59]),
    .mem_cached_ack_i(in_vec[58:58]),
    .mem_cached_error_i(in_vec[57:57]),
    .mem_cached_resp_tag_i(in_vec[56:46]),
    .mem_uncached_data_rd_i(in_vec[45:14]),
    .mem_uncached_accept_i(in_vec[13:13]),
    .mem_uncached_ack_i(in_vec[12:12]),
    .mem_uncached_error_i(in_vec[11:11]),
    .mem_uncached_resp_tag_i(in_vec[10:0]),
    .mem_data_rd_o(out_vec[214:183]),
    .mem_accept_o(out_vec[182:182]),
    .mem_ack_o(out_vec[181:181]),
    .mem_error_o(out_vec[180:180]),
    .mem_resp_tag_o(out_vec[179:169]),
    .mem_cached_addr_o(out_vec[168:137]),
    .mem_cached_data_wr_o(out_vec[136:105]),
    .mem_cached_rd_o(out_vec[104:104]),
    .mem_cached_wr_o(out_vec[103:100]),
    .mem_cached_cacheable_o(out_vec[99:99]),
    .mem_cached_req_tag_o(out_vec[98:88]),
    .mem_cached_invalidate_o(out_vec[87:87]),
    .mem_cached_writeback_o(out_vec[86:86]),
    .mem_cached_flush_o(out_vec[85:85]),
    .mem_uncached_addr_o(out_vec[84:53]),
    .mem_uncached_data_wr_o(out_vec[52:21]),
    .mem_uncached_rd_o(out_vec[20:20]),
    .mem_uncached_wr_o(out_vec[19:16]),
    .mem_uncached_cacheable_o(out_vec[15:15]),
    .mem_uncached_req_tag_o(out_vec[14:4]),
    .mem_uncached_invalidate_o(out_vec[3:3]),
    .mem_uncached_writeback_o(out_vec[2:2]),
    .mem_uncached_flush_o(out_vec[1:1]),
    .cache_active_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 177'h14674d4a9db969fe973726f82a37d3bf6d4cb35da1107;
    stim[1] = 177'h1d6f3182eead02b9c183ab55a7635b20fa2f75baf8347;
    stim[2] = 177'h0aa8fafae3411a945b625a47ca4ad4f204b436fc6a28e;
    stim[3] = 177'h0cf4429ba302515e1c1b76c9880b1cc0fb2d420b2e0a1;
    stim[4] = 177'h0c82a84b2c8b0b03f849ff5c12c49bbe64fda96f5cec8;
    stim[5] = 177'h1dccc42ffa234230ea45fcd9251fa390f77d0b4626fe2;
    stim[6] = 177'h0b6f0db93c07720f0253e70117cc7db259517761b4c9d;
    stim[7] = 177'h0d9a3033df471f7f823a1619f9d5a4db245dca2c6fcae;
    stim[8] = 177'h0a9db33534f33724f07cc58efe7d956cce8abea43acee;
    stim[9] = 177'h002316583a7a419bdd29a18b4466af87bf48106fc3f28;
    stim[10] = 177'h0cca08444e2c43ed3b28f2a63b1065401c165dc33733c;
    stim[11] = 177'h00edbfb603318196c34368f892b919fbfabe3a73290e7;
    stim[12] = 177'h07debc20d6696a4d668e2ed2387823188020fd0b424be;
    stim[13] = 177'h0f44bac10ec8b7f64481e73367935b0199f01b90e8dc5;
    stim[14] = 177'h02a0e903f9a6d843d6c1ce500c0a8e93427dbc3d7aa86;
    stim[15] = 177'h0f42800181cbbce2b535035cbff7b1b7015b62e19f9c8;
    stim[16] = 177'h06c18d622f55f757842edb5de3d476057498a2d989174;
    stim[17] = 177'h0df5b1987bf748fa8e46f94d7f488ad5c2d0a0a3de9d9;
    stim[18] = 177'h099ef285beca91e09742836e458ee87e370be1a83a75f;
    stim[19] = 177'h076c436dee29c4469b76b093affaff953eb127e3aade3;
    stim[20] = 177'h072b535e271e7aefa4c848b1c2a66f5c9fc3a0abd59e1;
    stim[21] = 177'h04dad36e99ed148d81d4b98b2d92c78e2449904780124;
    stim[22] = 177'h05640d31a9c3627af100af82495c0ffa9e690379c477c;
    stim[23] = 177'h0c6b7fb38bf9398a3974eedc89a08c7d87bc91eb28687;
    stim[24] = 177'h0249b05849f812e542de104c0c5c24a4aa3d3cc216a0c;
    stim[25] = 177'h05f466199954d4ee0ac637179fba5b4c976a1cbeefa25;
    stim[26] = 177'h0a7504d8e553e809f4d706e4336d8533fb664e9a8c7a4;
    stim[27] = 177'h0c64fd1ae367053a788be92c7c1c358ef7f2d08667041;
    stim[28] = 177'h026586d280e1fd1bd74dee3434787ed6a0686c84be553;
    stim[29] = 177'h00fc2cc0d417c2f15b1a1dab59d5772ee4d97e2cdf406;
    stim[30] = 177'h04ac63454caac8d7f33717252e546195d619cca924200;
    stim[31] = 177'h0b56045f66056fb5b410cd6d0f396b2f3bc50219b706d;
    stim[32] = 177'h009464e1d4bd2e4fbecf8012d22cd0180593c2351cba6;
    stim[33] = 177'h0a99dbe4a7d6c3136a70a361f0f6889849a26f20f99cb;
    stim[34] = 177'h09fd87482fb840633a58f31c1f0bc342373ae5fa69804;
    stim[35] = 177'h0b6b613a6558cca434a8528b248fd034474e3d96281d7;
    stim[36] = 177'h0bdd0839135b40c4609ee9ca179cb82318d9f03376c33;
    stim[37] = 177'h08396876a7886189bcb060670aa9edf44ca5fa8999781;
    stim[38] = 177'h04c82c5ec82ac3247b2a9ffdf3986b5b003bf485464c2;
    stim[39] = 177'h028955aefb8d2d2eecb62fe0330ad80c76b4423604e73;
    stim[40] = 177'h0dcaa577ed9d4d1b2619a8f3ddf59a01eabbae42255f9;
    stim[41] = 177'h0af9403ae9ccc64f0e3144e494e459d411b62d328f98a;
    stim[42] = 177'h0361b7bd922f5a567ae9ace53b1ba3e0c8f78b3fc7f7e;
    stim[43] = 177'h0759c21f550a1738a7693a51e15ca475cfc102c816531;
    stim[44] = 177'h0e234b8b5c9d290d9ed30aa63d7e6dd7d14abb89ef2d3;
    stim[45] = 177'h06e592856512b4a3eff5d2fefe7060c633e4e030b0937;
    stim[46] = 177'h0fd9ca459a3abdfa2bb2d80edc7c644318f92d55f9b37;
    stim[47] = 177'h079972415526a700b6aa75b2f4309aaace7855b8334a5;
    stim[48] = 177'h0ef2448c4680c05504ddd7c8b0cad7d1240a518077c54;
    stim[49] = 177'h098f2caae164beaf150656bbfb42b824ce11710b9b5d6;
    stim[50] = 177'h037659b276ddcebde48b174571c32756b7b577a15adc1;
    stim[51] = 177'h05b11ffd602baef8b3d031e7e4c986495715225d9012c;
    stim[52] = 177'h075a7168e4008ea136143dfd10f5e0bb28a866c7d0002;
    stim[53] = 177'h0044da53cca6e4e8862a93184d99f96effb1c13de3663;
    stim[54] = 177'h0782c8e07a4b0f1177a1e26c27e9a936dfc64d72396ef;
    stim[55] = 177'h148fc4594bc78e02650a0c30a4bf64e33ad06f95f927a;
    stim[56] = 177'h03ec5c4520eebb14368cee9ad9a822d7532dcf054a160;
    stim[57] = 177'h053893db196e223b340d6ec07daed9655eaa89dda43a5;
    stim[58] = 177'h030d20066c3677d1fc24aac95687b46152bf7ae8b5672;
    stim[59] = 177'h08426d0ee27d8e888f0424c3aea2e08d994b1cb30d063;
    stim[60] = 177'h06ff6ec76b110c32a6efc7725d355698d6026376c3d0f;
    stim[61] = 177'h0b1b1863d843413115827367415746cbecc4699e42639;
    stim[62] = 177'h056424dd5f6e059acc289027800129933737f6b2e83df;
    stim[63] = 177'h015ed898a84ef68dd469dfdf49e00d9cd264a615d0f49;
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
      expv[0] = 215'h29966bb4220e8ce9a953b72d3fd206e408ce9a953b72d3fd2e6e4c;
      expv[1] = 215'h45eeb75f068fade6305dd5a0573800751ade6305dd5a0573830756;
      expv[2] = 215'h1686df8d451d551f5f5c6823528b6c4b5551f5f5c6823528a0c4b1;
      expv[3] = 215'h64c4058e207d9e885374604a2bc2036e19e885374604a2bc2036e1;
      expv[4] = 215'h2e09624ddf33905509659161607f093ff905509659161607e093f1;
      expv[5] = 215'h6fa168c4dfc5b99885ff4468461d48bf9b99885ff4468461c08bf1;
      expv[6] = 215'h2a2eec36d93b6de1b72780ee41e04a7cf6de1b72780ee41e00a7c1;
      expv[7] = 215'h0cfcead22d93b346067be8e3eff007421b346067be8e3eff007421;
      expv[8] = 215'h477f3ecab66753b666a69e66e49e0f98b53b666a69e66e49e0f981;
      expv[9] = 215'h45a2335783de0462cb074f48337a053400462cb074f48337a05341;
      expv[10] = 215'h531d8832a00f99410889c5887da6051e199410889c5887da6051e1;
      expv[11] = 215'h7c495c8cfdfc1db7f6c0663032d8686d01db7f6c0663032d8086d1;
      expv[12] = 215'h691c3c118c40fbd7841acd2d49ac01c50fbd7841acd2d49ac01c51;
      expv[13] = 215'h19b3c9ad80cde8975821d916fec8003c1e8975821d916fec8003c1;
      expv[14] = 215'h2806054749a0541d207f34db087ad839c541d207f34db087a08391;
      expv[15] = 215'h2e5ffbd89b81e850003039779c5606a01e850003039779c5606a01;
      expv[16] = 215'h2ef1ea3b02bad831ac45eabeeaf005db0d831ac45eabeeaf005db1;
      expv[17] = 215'h26bfa4456ae1beb6330f7ee91f51c8df3beb6330f7ee91f5008df1;
      expv[18] = 215'h3722c7743f1b33de50b7d9523c12e850733de50b7d9523c1208501;
      expv[19] = 215'h49d7fd7fca9eed886dbdc53888d36ed60ed886dbdc53888d20ed61;
      expv[20] = 215'h58e15337ae4ee56a6bc4e3cf5df499090e56a6bc4e3cf5df409091;
      expv[21] = 215'h4596c963c7129b5a6dd33da291b03a9729b5a6dd33da291b00a971;
      expv[22] = 215'h4124ae07bd4eac81a635386c4f5e00150ac81a635386c4f5e00151;
      expv[23] = 215'h6e44d0463ec38d6ff6717f2731472e9dd8d6ff6717f2731460e9d1;
      expv[24] = 215'h26062e12525449360b093f025ca85bc2049360b093f025ca80bc21;
      expv[25] = 215'h0bcfdd2da64abe8cc3332a9a9dc158c6ebe8cc3332a9a9dc008c61;
      expv[26] = 215'h7219b6c299fd4ea09b1caa7d013e9ae0d4ea09b1caa7d013e0ae01;
      expv[27] = 215'h163e0e1a877b8c9fa35c6ce0a74e017d18c9fa35c6ce0a74e017d1;
      expv[28] = 215'h1a1a3c3f6b504cb0da501c3fa37ae9bdc4cb0da501c3fa37a09bd1;
      expv[29] = 215'h55aceabb97721f85981a82f85e2a034301f85981a82f85e2a03431;
      expv[30] = 215'h12972a308aea958c68a995591afe06e20958c68a995591afe06e21;
      expv[31] = 215'h36879cb5979d6ac08becc0adf6b6021916ac08becc0adf6b602191;
      expv[32] = 215'h096916680c02128c9c3a97a5c9f7d9f00128c9c3a97a5c9f609f01;
      expv[33] = 215'h30f87b444c25533b7c94fad8626d4e147533b7c94fad8626c0e141;
      expv[34] = 215'h0e0f85e1a11b3fb0e905f7080c674b1e73fb0e905f7080c660b1e1;
      expv[35] = 215'h459247e81a236d6c274cab199486050a16d6c274cab199486050a1;
      expv[36] = 215'h650bce5c118d7ba107226b68188c03dd17ba107226b68188c03dd1;
      expv[37] = 215'h338554f6ba27072d0ed4f10c3136060c1072d0ed4f10c3136060c1;
      expv[38] = 215'h7ef9cc35ad8099058bd90558648e0553099058bd90558648e05531;
      expv[39] = 215'h7019856c063a512ab5df71a5a5dc06c50512ab5df71a5a5dc06c51;
      expv[40] = 215'h79eefacd00f5b954aefdb3a9a36403351b954aefdb3a9a36403351;
      expv[41] = 215'h724a722caa095f28075d3998c9e0062815f28075d3998c9e006281;
      expv[42] = 215'h729d8dd1f0646c36f7b245eb4acf5d3586c36f7b245eb4ace0d351;
      expv[43] = 215'h28f0ae523ae6eb3843eaa142e714ed274eb3843eaa142e7140d271;
      expv[44] = 215'h531ebf36ebe9c469716b93a521b3da615c469716b93a521b20a611;
      expv[45] = 215'h7f7f38306318dcb250aca256947dfeba4dcb250aca256947c0eba1;
      expv[46] = 215'h076e3e32218dfb3948b34757bf44065b1fb3948b34757bf44065b1;
      expv[47] = 215'h597a184d1566f32e482aa4d4e016054e0f32e482aa4d4e016054e1;
      expv[48] = 215'h6458656be893de489188d0180aa09bbafde489188d0180aa00bba1;
      expv[49] = 215'h5dfda15c126731e5955c2c97d5e200ca131e5955c2c97d5e200ca1;
      expv[50] = 215'h22b8e193ab5a6ecb364edbb9d7bc016206ecb364edbb9d7bc01621;
      expv[51] = 215'h73f264c324aab623ffac0575df167a062b623ffac0575df160a061;
      expv[52] = 215'h7e887af01d94eb4e2d1c8011d42602870eb4e2d1c8011d42602871;
      expv[53] = 215'h0c26ccfcb77e089b4a7994dc9d1005520089b4a7994dc9d1005521;
      expv[54] = 215'h3613f4d49b6ef0591c0f4961e22e043c0f0591c0f4961e22e043c1;
      expv[55] = 215'h5a0df2bf24f491f88b2978f1c04c0141091f88b2978f1c04ca1418;
      expv[56] = 215'h65b9e0a942c07d8b88a41dd76286019d07d8b88a41dd76286d19dc;
      expv[57] = 215'h55513bb4874aa7127b632dc4476601ad0a7127b632dc4476681adc;
      expv[58] = 215'h57ef5d16ace461a400cd86cefa3e0495061a400cd86cefa3f84954;
      expv[59] = 215'h29639661a0c7084da1dc4fb1d11000841084da1dc4fb1d111e0848;
      expv[60] = 215'h404c6ed83a1edfedd8ed622186540df80dfedd8ed622186540df80;
      expv[61] = 215'h188d33c84c7363630c7b08682622004e163630c7b08682622b04e6;
      expv[62] = 215'h66fed65d07beac849babedc0b35805120ac849babedc0b35985120;
      expv[63] = 215'h4c94c2ba1e922bdb131509ded1ba0d3b02bdb131509ded1ba0d3b0;
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
