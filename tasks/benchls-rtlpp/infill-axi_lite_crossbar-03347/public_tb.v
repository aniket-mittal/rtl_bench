// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 296;
  localparam OW = 209;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03347 dut (
    .aclk(clk),
    .aresetn(in_vec[295:295]),
    .s_axi_awaddr(in_vec[294:215]),
    .s_axi_awprot(in_vec[214:209]),
    .s_axi_awvalid(in_vec[208:207]),
    .s_axi_wdata(in_vec[206:143]),
    .s_axi_wstrb(in_vec[142:135]),
    .s_axi_wvalid(in_vec[134:133]),
    .s_axi_bready(in_vec[132:131]),
    .s_axi_araddr(in_vec[130:51]),
    .s_axi_arprot(in_vec[50:45]),
    .s_axi_arvalid(in_vec[44:43]),
    .s_axi_rready(in_vec[42:41]),
    .m_axi_awready(in_vec[40:40]),
    .m_axi_wready(in_vec[39:39]),
    .m_axi_bresp(in_vec[38:37]),
    .m_axi_bvalid(in_vec[36:36]),
    .m_axi_arready(in_vec[35:35]),
    .m_axi_rdata(in_vec[34:3]),
    .m_axi_rresp(in_vec[2:1]),
    .m_axi_rvalid(in_vec[0:0]),
    .s_axi_awready(out_vec[208:207]),
    .s_axi_wready(out_vec[206:205]),
    .s_axi_bresp(out_vec[204:201]),
    .s_axi_bvalid(out_vec[200:199]),
    .s_axi_arready(out_vec[198:197]),
    .s_axi_rdata(out_vec[196:133]),
    .s_axi_rresp(out_vec[132:129]),
    .s_axi_rvalid(out_vec[128:127]),
    .m_axi_awaddr(out_vec[126:87]),
    .m_axi_awprot(out_vec[86:84]),
    .m_axi_awvalid(out_vec[83:83]),
    .m_axi_wdata(out_vec[82:51]),
    .m_axi_wstrb(out_vec[50:47]),
    .m_axi_wvalid(out_vec[46:46]),
    .m_axi_bready(out_vec[45:45]),
    .m_axi_araddr(out_vec[44:5]),
    .m_axi_arprot(out_vec[4:2]),
    .m_axi_arvalid(out_vec[1:1]),
    .m_axi_rready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 296'h388bf8d89d0318aae0f28a3357e31ccf90c069b0b1cb82bd79548ae91a01d8b167da3539d0;
    stim[1] = 296'h7c3e99888f6b014af6397b560f6905c6a99ff9edac606e33f32a707cc974abc6118b049059;
    stim[2] = 296'hcbb481bd5281ce8b81ed00143c988e06354a87fd6165ddb17d6f8244bbc4e80ff317ac2f38;
    stim[3] = 296'he2624b3efe038c1a1c55d74dd912bbfa11dfda62dd8b46dffa5cbada8711a80c73d087ec65;
    stim[4] = 296'h81cae38701e64c6188d874e9b3cd15f450d6c8ed25c91eca9f80211de1e8ff0fad88cd7198;
    stim[5] = 296'he5cdb714033684d1ca576b858333a9438d1ba71ab7456a534d5062d68c7f2e7e89ec77c01b;
    stim[6] = 296'h997c5fe7d96c7ce1929896aa04878b7a8f60524e98403ca58788b8e5089d4591209ce38886;
    stim[7] = 296'h9a9b543a44a9583a9e7a17b8a3647d5c63510226ae838cf36ea0fc2d7c82e753b5474cd32d;
    stim[8] = 296'hd11ce3615335cb037686648a7b2700ca31566f7b1255caabe12062daa002748d5ad2df6dbc;
    stim[9] = 296'ha37d9902aafbba6ae62815e434ea2cb69343964dbd219cb9ca7d82a623acef4201579c2bde;
    stim[10] = 296'hdb2d97bb36adb1777e7b401e54c5aca8cfa198c823d19ab9e3a7bc06125945f795fb54c306;
    stim[11] = 296'h86e7613881ad1c47cad086541ab5f4739d76b35d3c58617e29970436b0c8edee91d6f786ec;
    stim[12] = 296'hfe32ba542382b9da5e5ddfd45edf6a0dc0bf58ea5d902461c0b444c0cd604241427ed95567;
    stim[13] = 296'h991918ac332089f781d55c470edbd4709e71f9b30b30c63e02d77ca614f762a7e4fca2ba74;
    stim[14] = 296'hd7b37e5f9bbf9148f2795782cb16c6c0ebfb406d45adb06b49ebdbfe762815e9aacc91772b;
    stim[15] = 296'hcbf7b6184b7a137d6848f19f31cae826edabca2525e5255dc502aff417945e607727c10552;
    stim[16] = 296'hd155b321e014e97b1e2ff5c1ea0eb06b30a25ec41f9585c74e79e77c7990ee556a6af81727;
    stim[17] = 296'h61489d6480c83d0b31888e753de420fa6b5f9096d67fd60615e13111f03adc17e9494cb5f5;
    stim[18] = 296'h9c06ebbd139c1109cce273b189b5339942860eba469d7b3d3850c63891688fce27d67c28a3;
    stim[19] = 296'hf601309505df9025996ad0f0e9bbac6f2c4ab990e48e78f2513107b7917577de462aa7b85a;
    stim[20] = 296'ha681f60ffd2a3721161b5f5594559649ec9c09e4f7363518448deeb503fbc44dfe549bdc64;
    stim[21] = 296'ha0d54b81533c591500ca2095d79bca17776423c6915682d14e6a7d09287022184d3163873d;
    stim[22] = 296'he702beab38a08ddc39eff94f8fb1015d40703cde3802e215445889e25bc6a2c5f60ade75d7;
    stim[23] = 296'ha8db33a531fdb07c89565471f0e0b1344b802faf54009eac6afd141117e085484bf22fa613;
    stim[24] = 296'hfefca552fb87f2a9f969aeab2dd20a13327b667a9f7ae274c440e0d98ce4f3fb39b0af15cd;
    stim[25] = 296'hc1272a18dcdfaabf9ea012b747f370b1c9c7f2af9b8c7c436a96296bf126e48145fb39a6bd;
    stim[26] = 296'he5502cc7281a59f02e8a10e75486d3734211b1f6effd65a96f511befdf76f0511a89e7622b;
    stim[27] = 296'he1da0de5fc22391705253d35beb68854cd53591bd3f166a116b24d7c66672c580bdfafbfb1;
    stim[28] = 296'hd107b3c600143860a0d7ff63733afb611ac555fa95ef105835647e1df99765deda34b36dc4;
    stim[29] = 296'haf64a57dda5d7fbf22edbd69c13854245cd69aa09dbbe94ebbb36b5d31f6e3fd8ce92b2b33;
    stim[30] = 296'had7dc4953c3d6f8e4ddddbfe31da7f3ea2777a0fcb4299d45e4e0b9f9362d6aaacca120d04;
    stim[31] = 296'hb3d1087411e80e237d3d8402fc477dcb58406babc32a5c8486d77d00a7a1e413cbee38817f;
    stim[32] = 296'haf348fe85e2d35176621aa01f32754f7ff88a0adb4385ca3e14cf1c1df3e8ea44a68743383;
    stim[33] = 296'h83864403f25ab63d6818d3b5dfc21224806a973c0ae297218a82f7a6fca0d1dd60ea952b04;
    stim[34] = 296'h338b3c4c8dd6a8f4d3738eb17886478f9c218379a994334243bc97aaaf945c1c7c943c78b9;
    stim[35] = 296'hf77f9d707b17f542353447ac238e1ca243ef264ae88d672b84556862139e0aff9de462176a;
    stim[36] = 296'he2e12eab8f1ecd803ae48c8b6486a05b1b3fbeaf62417543c37b64162c028219b444eb755d;
    stim[37] = 296'hbc0a5455954ecf4a2e9aefa42a4d3dc30158878a7c3e0280ca9fd8f15581fe70d9ad63ff87;
    stim[38] = 296'h823d400965c9a6b6955652153bd738d10668946d5172a9c95ef6efca7aa792a79ba6ed728f;
    stim[39] = 296'hdf5c3218d99fcae5106bae5f62360cb6e0788b0212c49eac6594166abb235ccd4602699ef9;
    stim[40] = 296'h9e9352a886fa897ec01d4d6267615bc6474aa99481d23b32e5a58d5b3726c272e764389c06;
    stim[41] = 296'hbd0e2005079719fd0234c63e9abdf34dba20fbfd219024896a327caa465c84c3697153f355;
    stim[42] = 296'hbe7cb626ffe7ecf2f61fca00cabb791091848abf60e05b17043e0334529a7f524b9eb1f51c;
    stim[43] = 296'haf0ebea82715ffd4dc259bb19ba283507a36a07297eff2ad97fc921360f5d5a26fb8e13148;
    stim[44] = 296'h9e0dbb5eab94722c15186c6a5ab50ae17b4daeca00df8aab40e50d2c221675e1bc802dbb89;
    stim[45] = 296'h97bf05fb65a06d239d3c8ec34095d93e174a2ae54cea4ad678b399c47ded2a5ad55cc45712;
    stim[46] = 296'he57772c28d38722a7674d77156881ff3fb71f421571d2c2733f2f4276cc9e958fbbb64385f;
    stim[47] = 296'h921936b305ff0efc15ef88d69ed0652cbe20390fe859a6542375a9f783741fcb571526a11f;
    stim[48] = 296'hfdffe49c8d17985a6fd533488dcc468db32fea8e93080d22c1fca63834cb7dc0c9faf1bb14;
    stim[49] = 296'hdf70ac1589071228a01a4e514f423201b6d2a5958388100baa849846bcc5ff6a19f078a9a9;
    stim[50] = 296'h8d86fc940a697ab487b5008cd26efc91e60c011d693d3aaaa1cb3ccfcb6c30f7da87598abb;
    stim[51] = 296'h99f91243a933ea33d9b2b7308d93bb13add7cc1b745e958f1d43794c08197e86b76d6eba1f;
    stim[52] = 296'hfc0667e0ba79caf5c94de33b048c7d692254a56a1dde46cf80d164f210b2694f600f2d16a1;
    stim[53] = 296'he9c009959342a8bb00e58f09ff3e06d7d46bc35aa55cb9479acc840ad72d637e3297321b0a;
    stim[54] = 296'hf7a4013fd29af089d5fe2466da9bab1b1a67b0885ecdeb0ac959bec510b14e3e5f998c6838;
    stim[55] = 296'hba14456dd4f457b6260578ee700cb3c12d131403f6108b3c31a7dc58c42fd28bd9e6a3ed98;
    stim[56] = 296'h97a7287cc673e37afeb9bb12c6fc85c22c9e6236a40dbd4e99d035d056ec554fc794b88746;
    stim[57] = 296'he0c38b1cf362315102453dd9d43b6e9bc1cb7d50343585142f8668b5ec44baec788609051b;
    stim[58] = 296'h917589b3f23bf07ebe75b74f18be76ab17665aa5bf4d66dd420b0a6ab1efb9bec2b90958c4;
    stim[59] = 296'hc358b203435fbf62c74dc1e1601fdfec075fe1625bb6d4a62a637b269b725ee3b79e45b87a;
    stim[60] = 296'he903c74d36e4d3ff454a6c3f11a23578ab99b4d7af0e153dc82ef51bd6bfb600190bc48aa6;
    stim[61] = 296'h8108dcdebc3e4b30c902b4a975b8b52040ecd68a366a6dae86bd0b98550e2577e4dfb069b0;
    stim[62] = 296'h9e84c696be1c124453727eb2491adedc1a8db2ea3e34fbe687f941d27b0159f66067d57bfa;
    stim[63] = 296'he35ea88a97cfb788329d5d078ac7901a7bc7dae76e69b3ec51d4c7b83eb05bcfc665e863fa;
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
      expv[0] = 209'h0000000000000000000000318aae0f2d4f90c0698d22ba4680774;
      expv[1] = 209'h0000000000000000000006b014af639546a99ff9de9c1f325d2b9;
      expv[2] = 209'h00000000000000000000001ce8b81ed006354a87d5e0912ef13a3;
      expv[3] = 209'h061a00000000000000000838c1a1c55b7a11dfda2b2eb6a1c46a2;
      expv[4] = 209'h141200000000000000000e64c6188d82f450d6c8d40847787a3e3;
      expv[5] = 209'h0a0a00000000000000000b684d1ca575c38d1ba72c18b5a31fcaf;
      expv[6] = 209'h1a0e00000000000000001ec7ce19298bfa8f60526a2e394227510;
      expv[7] = 209'h08040000000000000000129583a9e7a3dc6351026e3f0b5f20b89;
      expv[8] = 209'h1a0c0000000000000000135cb0376862ca31566f3018b6a8009d2;
      expv[9] = 209'h080200000000000000000fbba6ae6282b69343965f60a988eb3a9;
      expv[10] = 209'h1a08000000000000000002db1777e7b028cfa19885ef01849651d;
      expv[11] = 209'h020c000000000000000012d1c47cad0b739d76b357c10dac323bf;
      expv[12] = 209'h020a0000000000000000082b9da5e5df8dc0bf58a311303358108;
      expv[13] = 209'h1c10000000000000000002089f781d56709e71f9b3df29853dd95;
      expv[14] = 209'h0000000000000000000003f9148f2793c0ebfb4050f6ff9d8a05e;
      expv[15] = 209'h1c1200000000000000000fa137d68488a6edabca54abfd05e516c;
      expv[16] = 209'h1a080000000000000000014e97b1e2faeb30a25ec279df1e643a8;
      expv[17] = 209'h000000000000000000000483d0b3188f7a6b5f90e84c447c0eb61;
      expv[18] = 209'h0000000000000000000001c1109cce219942860ea0318e245a23b;
      expv[19] = 209'h1c1200000000000000000df9025996a8ef2c4ab98c41ede45d5db;
      expv[20] = 209'h0e1e00000000000000001aa3721161b749ec9c09cd7bad40fef0a;
      expv[21] = 209'h161a00000000000000000bc591500ca097776423e89f424a1c082;
      expv[22] = 209'h080600000000000000001a08ddc39efc5d40703ce6227896f1a98;
      expv[23] = 209'h1208000000000000000007db07c89562344b802ff1450445f820a;
      expv[24] = 209'h04120000000000000000087f2a9f969f93327b662a383663393df;
      expv[25] = 209'h080600000000000000001dfaabf9ea01b1c9c7f2fb8a5afc49b90;
      expv[26] = 209'h0800000000000000000001a59f02e8a0f34211b1ee46fbf7ddbc8;
      expv[27] = 209'h0e1c000000000000000012239170525654cd535938935f1999caa;
      expv[28] = 209'h141600000000000000001943860a0d7f611ac555a91f877e65d9b;
      expv[29] = 209'h100600000000000000001dd7fbf22ede245cd69a8adad74c7db9e;
      expv[30] = 209'h100600000000000000001bd6f8e4ddddbea2777a7b82e7e4d8b57;
      expv[31] = 209'h1c1200000000000000000e80e237d3da4b58406bb9df4029e8781;
      expv[32] = 209'h0414000000000000000012d35176621d77ff88a0dd3c7077cfa34;
      expv[33] = 209'h0208000000000000000005ab63d68189a4806a9742bde9bf2835a;
      expv[34] = 209'h00000000000000000000056a8f4d373f8f9c21831f25eaabe5162;
      expv[35] = 209'h00000000000000000000017f54235343a243ef262f5a1884e783f;
      expv[36] = 209'h1e1e000000000000000019ecd803ae4edb1b3fbef4d9058b00a02;
      expv[37] = 209'h0e1e00000000000000001cecf4a2e9afc3015887a7f63c55607ec;
      expv[38] = 209'h1e1c0000000000000000149a6b6955615106689451bbf29ea9e55;
      expv[39] = 209'h0410000000000000000001fcae5106bf36e0788b21059aaec8d7a;
      expv[40] = 209'h000200000000000000000fa897ec01d646474aa9c96356cdc9b0d;
      expv[41] = 209'h1004000000000000000011719fd0234b4dba20fbd49f2a9197219;
      expv[42] = 209'h02080000000000000000067ecf2f61fd1091848af580cd14a69e9;
      expv[43] = 209'h061c0000000000000000115ffd4dc25dd07a36a0292484d83d755;
      expv[44] = 209'h18000000000000000000014722c15186617b4daea1434b08859dc;
      expv[45] = 209'h000000000000000000000206d239d3cfbe174a2ad2e6711f7b4ab;
      expv[46] = 209'h0c1600000000000000001b8722a7674b73fb71f410bd09db327aa;
      expv[47] = 209'h141600000000000000001ff0efc15efcacbe20397f6a7de0dd07b;
      expv[48] = 209'h0e1a0000000000000000097985a6fd510db32feae9298e0d32df8;
      expv[49] = 209'h100000000000000000000071228a01a701b6d2a5d92611af317ef;
      expv[50] = 209'h000200000000000000000e97ab487b5091e60c0156cf33f2db0dd;
      expv[51] = 209'h0e1c0000000000000000133ea33d9b2b13add7cc34de5302065f1;
      expv[52] = 209'h16180000000000000000079caf5c94d9692254a522593c842c9ab;
      expv[53] = 209'h100200000000000000000c2a8bb00e5f57d46bc32d2102b5cb58f;
      expv[54] = 209'h120e000000000000000019af089d5fe21b1a67b0826fb1442c527;
      expv[55] = 209'h041600000000000000001f457b626054c12d13143df716310bf53;
      expv[56] = 209'h0e1a00000000000000000f3e37afeb9d422c9e626c0d7415bb14b;
      expv[57] = 209'h120a00000000000000000e23151024569bc1cb7d059a2d7b112fe;
      expv[58] = 209'h1a0a00000000000000000bbf07ebe75b2b17665adec29aac7bef7;
      expv[59] = 209'h120e00000000000000001dfbf62c74d8ec075fe122dec9a6dc97d;
      expv[60] = 209'h1c100000000000000000064d3ff454a678ab99b4ffbd46f5afec0;
      expv[61] = 209'h0208000000000000000003e4b30c902aa040ecd6a542e6154388d;
      expv[62] = 209'h0a0c000000000000000011c124453727dc1a8db2a650749ec057d;
      expv[63] = 209'h0a0c000000000000000014fb788329d61a7bc7daf731ee0fac17b;
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
