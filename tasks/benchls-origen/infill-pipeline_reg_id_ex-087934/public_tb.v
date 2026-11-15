// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 170;
  localparam OW = 168;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_087934 dut (
    .clk(clk),
    .reset(in_vec[169:169]),
    .IR_D(in_vec[168:137]),
    .MFCMPD1(in_vec[136:105]),
    .MFCMPD2(in_vec[104:73]),
    .Ext_num(in_vec[72:41]),
    .A3(in_vec[40:36]),
    .Res(in_vec[35:34]),
    .Stall(in_vec[33:33]),
    .PC8_D(in_vec[32:1]),
    .j_zero(in_vec[0:0]),
    .IR_E(out_vec[167:136]),
    .RS_E(out_vec[135:104]),
    .RT_E(out_vec[103:72]),
    .Ext_num_E(out_vec[71:40]),
    .A3_E(out_vec[39:35]),
    .Res_E(out_vec[34:33]),
    .PC8_E(out_vec[32:1]),
    .j_zero_E(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 170'h23ec5e8b26d455f9f768a9e026f5599bfe5d4823b31;
    stim[1] = 170'h203432f9a9251bdf6f5535af2d338e484c6905a0744;
    stim[2] = 170'h0440924f96015e91549ac52922bcd9943a3e9d09db0;
    stim[3] = 170'h37a5522610f12a801afd513e43e50f8dc288bd772ae;
    stim[4] = 170'h0bca7afa1be92d8a8b7144d6492e6e81b7ac2dc5c3c;
    stim[5] = 170'h1c225463cd5861c0ba4080d4b3b2f5870ef06038cd0;
    stim[6] = 170'h0152e9e2a6d4cd5494b1ba6fc290f13b96c5b8197eb;
    stim[7] = 170'h151466c1626882d15482066170d850cb19c5c397b4d;
    stim[8] = 170'h0401a08e390d6a1c684d9513ff852ba758e0295895a;
    stim[9] = 170'h160ebfd302c3992acaab7c04002333b435b1d0b14fa;
    stim[10] = 170'h10097731852b3693e00835d03e32ddb0197dcfb410a;
    stim[11] = 170'h0e22c5f436079ddb1ed0d0c0a9ddc82eb45ca3d91db;
    stim[12] = 170'h1654a21292f0ffa000cb807681f8c8d1804ed921de9;
    stim[13] = 170'h11b2e581d18bd652560fa9722328e1c1cea4a9e943b;
    stim[14] = 170'h17cc7cc601cdec2248158abf90d1db9abe37945744b;
    stim[15] = 170'h1f6dcf30e308574f50653b7483de4d633720e37c9d1;
    stim[16] = 170'h05b17a2c6136bc52a90c264e91ddb90a4b26b7023cb;
    stim[17] = 170'h12dcc176bf96f1c5925cd24dee92cb689cfddc1e5d3;
    stim[18] = 170'h0e33fc484552f6805f50c0702b1a497505e961516b5;
    stim[19] = 170'h1b1fa06e815188dcc167fdc320406a39e3a3e8668e5;
    stim[20] = 170'h0ffa8a2bc3f795f7e97f4c137c52252f563600926da;
    stim[21] = 170'h04f8129103d5d943e202af72093801c38f3d736b5df;
    stim[22] = 170'h39f05f4d714b47cfeeb756e274e861162522c993c9b;
    stim[23] = 170'h18458f223ea05d590bf48340ae889ca58264fe142a4;
    stim[24] = 170'h062638c7fcab4bd6f2a69756c9644f1cdface6c9cb8;
    stim[25] = 170'h16ff1a9f6cbf7e1f3532fa93dfd379b30166633b241;
    stim[26] = 170'h06e6544eb73d38d376783e06728f0459295193f2473;
    stim[27] = 170'h1a8237e8de156b2397c0fc49011be332f8c3d11c148;
    stim[28] = 170'h16476c8cf0e40c42ab39c0b8bc08dab47a171a56561;
    stim[29] = 170'h1ab973add2008de72134fef97dda8661427962f2085;
    stim[30] = 170'h066ca611629757c50808042ca1926db058b611c6325;
    stim[31] = 170'h10c3eed2837c5c8dee80010d04e9e8afd479d15e085;
    stim[32] = 170'h0d2f4ccb9e631e9894365407ca17a8539b6145a2181;
    stim[33] = 170'h0b3ee131d8e2d8ce2ddaa3486c5e693e728d7569e8e;
    stim[34] = 170'h0ad3505613390db6f213217787032d0e1c9d0555223;
    stim[35] = 170'h0abf64bce543149125a5c1db8f013c08e200d0714ed;
    stim[36] = 170'h1b35fa2b9bee26a38d33b2659fb9ebd7d6f0eb0e032;
    stim[37] = 170'h15d4bd62a79de90dfd564a88b8855597ac06e2e8e2e;
    stim[38] = 170'h0d2de0be9cd0462ceb38722fc501710c4d6ab0abfbc;
    stim[39] = 170'h0cace3b37b22022b1b2773fe1a10068e954b016fc0c;
    stim[40] = 170'h089c9f04cbbda1170518a97f18b8a8a5532550ed004;
    stim[41] = 170'h0970036c3bd7b19acd397eae9a20ee3705053bb83d8;
    stim[42] = 170'h04de8a232ab8dd56dd8f5c22985123f548c075ae730;
    stim[43] = 170'h104e8d8549ee1ec275b47c54e93f2c97d1faadbea1a;
    stim[44] = 170'h040c0090a3c6be9e9121038a376d125798becb4af46;
    stim[45] = 170'h074580bb49dde52f8c6a81119f4e9bb8ae9a8fc58d1;
    stim[46] = 170'h1a9f47fbbc8d261d1089e6a51d9c07e37e459428a4f;
    stim[47] = 170'h1ad36609fdbabdb1eb547901f219cf0343f75b3e645;
    stim[48] = 170'h05ddc954948d585054a9559d9377e4f3752ca8cc58e;
    stim[49] = 170'h04f9064aaf9a285b8e0c15bdb892c66df07d5c347fc;
    stim[50] = 170'h1fc2e87881441e236ab893e1a26b871ed4f2975ad85;
    stim[51] = 170'h159bf6aa937666927361cf51adc398ce6d31d3eb34f;
    stim[52] = 170'h04b61abeb6f522c45e7c68a4279baf9697c5c47b589;
    stim[53] = 170'h00c6db45a36e2adef0593b13f7a22ba4bfae44f0493;
    stim[54] = 170'h01f86b5eeaf99ca67174dc7140132e08635c722a81d;
    stim[55] = 170'h01a942f7b0680e4ff80fa9781073e1054385b1dc4f7;
    stim[56] = 170'h1943c18a6f41c78cf739683b0f8d101be4d59a2ed0f;
    stim[57] = 170'h030ea7487d76019940e0b25e4c1648474573cf8cb62;
    stim[58] = 170'h0433823779883607a8909eaa44a43061ca9bbeb5b4a;
    stim[59] = 170'h13e7e4fbf863a5172ccd61bc23b221955378b0746ac;
    stim[60] = 170'h1d7715146f9f1189806630ddb39b4ce5aa83bd7941d;
    stim[61] = 170'h05d362e228257c94e26a537851752d4561c5af19d76;
    stim[62] = 170'h1e55e6e5f52188b1c86686c6bbb95e5e96f06236571;
    stim[63] = 170'h0f9e59431dd9c1c2d7bfc0e92f797b394c327ef9d37;
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
      expv[0] = 168'h000000000000000000000000000000000000000000;
      expv[1] = 168'h000000000000000000000000000000000000000000;
      expv[2] = 168'h000000000000000000000000000000000000000000;
      expv[3] = 168'h000000000000000000000000000000000000000000;
      expv[4] = 168'h000000000000000000000000000000000000000000;
      expv[5] = 168'h000000000000000000000000000000000000000000;
      expv[6] = 168'h000000000000000000000000000000000000000000;
      expv[7] = 168'h0a974f1536a66aa4a58dd37e148789dcb65b8197eb;
      expv[8] = 168'ha8a3360b1344168aa410330b86c28658ce5c397b4d;
      expv[9] = 168'h000000001344168aa410330b86c28658c85c397b4d;
      expv[10] = 168'h000000001344168aa410330b86c28658c85c397b4d;
      expv[11] = 168'h000000001344168aa410330b86c28658c85c397b4d;
      expv[12] = 168'h71162fa1b03ceed8f68686054eee4175a3ca3d91db;
      expv[13] = 168'hb2a510949787fd00065c03b40fc6468c02ed921de9;
      expv[14] = 168'h000000009787fd00065c03b40fc6468c00ed921de9;
      expv[15] = 168'h000000009787fd00065c03b40fc6468c00ed921de9;
      expv[16] = 168'h000000009787fd00065c03b40fc6468c00ed921de9;
      expv[17] = 168'h000000009787fd00065c03b40fc6468c00ed921de9;
      expv[18] = 168'h000000009787fd00065c03b40fc6468c00ed921de9;
      expv[19] = 168'h000000009787fd00065c03b40fc6468c00ed921de9;
      expv[20] = 168'h000000009787fd00065c03b40fc6468c00ed921de9;
      expv[21] = 168'h000000009787fd00065c03b40fc6468c00ed921de9;
      expv[22] = 168'h000000000000000000000000000000000000000000;
      expv[23] = 168'h000000000000000000000000000000000000000000;
      expv[24] = 168'h000000000000000000000000000000000000000000;
      expv[25] = 168'h000000000000000000000000000000000000000000;
      expv[26] = 168'h000000000000000000000000000000000000000000;
      expv[27] = 168'h3732a275b9e9c69bb3c1f033947822c94b193f2473;
      expv[28] = 168'hd411bf46f0ab591cbe07e24808df1997c63d11c148;
      expv[29] = 168'hb23b64678720621559ce05c5e046d5a3d171a56561;
      expv[30] = 168'h000000008720621559ce05c5e046d5a3d171a56561;
      expv[31] = 168'h000000008720621559ce05c5e046d5a3d171a56561;
      expv[32] = 168'h000000008720621559ce05c5e046d5a3d171a56561;
      expv[33] = 168'h000000008720621559ce05c5e046d5a3d171a56561;
      expv[34] = 168'h59f7098ec716c6716ed51a4362f349f394d7569e8e;
      expv[35] = 168'h569a82b099c86db790990bbc38196870e5d0555223;
      expv[36] = 168'h55fb25e72a18a4892d2e0edc7809e047100d0714ed;
      expv[37] = 168'h000000002a18a4892d2e0edc7809e047100d0714ed;
      expv[38] = 168'haea5eb153cef486feab25445c42aacbd606e2e8e2e;
      expv[39] = 168'h000000003cef486feab25445c42aacbd606e2e8e2e;
      expv[40] = 168'h65671d9bd9101158d93b9ff0d0803474aab016fc0c;
      expv[41] = 168'h00000000d9101158d93b9ff0d0803474a8b016fc0c;
      expv[42] = 168'h4b801b61debd8cd669cbf574d10771b82853bb83d8;
      expv[43] = 168'h26f4511955c6eab6ec7ae114c2891faa46075ae730;
      expv[44] = 168'h0000000055c6eab6ec7ae114c2891faa40075ae730;
      expv[45] = 168'h0000000055c6eab6ec7ae114c2891faa40075ae730;
      expv[46] = 168'h3a2c05da4eef297c6354088cfa74ddc575a8fc58d1;
      expv[47] = 168'hd4fa3fdde46930e8844f3528ece03f1bf259428a4f;
      expv[48] = 168'h00000000e46930e8844f3528ece03f1bf059428a4f;
      expv[49] = 168'h00000000e46930e8844f3528ece03f1bf059428a4f;
      expv[50] = 168'h00000000e46930e8844f3528ece03f1bf059428a4f;
      expv[51] = 168'h00000000e46930e8844f3528ece03f1bf059428a4f;
      expv[52] = 168'h00000000e46930e8844f3528ece03f1bf059428a4f;
      expv[53] = 168'h25b0d5f5b7a91622f3e345213cdd7cb4be5c47b589;
      expv[54] = 168'h00000000b7a91622f3e345213cdd7cb4b85c47b589;
      expv[55] = 168'h0fc35af757cce5338ba6e38a009970431bc722a81d;
      expv[56] = 168'h0d4a17bd8340727fc07d4bc0839f082a1c5b1dc4f7;
      expv[57] = 168'hca1e0c537a0e3c67b9cb41d87c6880df2759a2ed0f;
      expv[58] = 168'h000000007a0e3c67b9cb41d87c6880df2159a2ed0f;
      expv[59] = 168'h219c11bbcc41b03d4484f5522521830e55bbeb5b4a;
      expv[60] = 168'h00000000cc41b03d4484f5522521830e51bbeb5b4a;
      expv[61] = 168'hebb8a8a37cf88c4c033186ed9cda672d543bd7941d;
      expv[62] = 168'h2e9b1711412be4a713529bc28ba96a2b0e5af19d76;
      expv[63] = 168'h00000000412be4a713529bc28ba96a2b085af19d76;
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
