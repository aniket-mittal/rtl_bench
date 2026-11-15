// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 228;
  localparam OW = 177;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08438 dut (
    .aclk(clk),
    .aresetn(in_vec[227:227]),
    .s_axi_awid(in_vec[226:215]),
    .s_axi_awaddr(in_vec[214:183]),
    .s_axi_awlen(in_vec[182:179]),
    .s_axi_awsize(in_vec[178:176]),
    .s_axi_awburst(in_vec[175:174]),
    .s_axi_awlock(in_vec[173:172]),
    .s_axi_awcache(in_vec[171:168]),
    .s_axi_awprot(in_vec[167:165]),
    .s_axi_awqos(in_vec[164:161]),
    .s_axi_awvalid(in_vec[160:160]),
    .s_axi_wid(in_vec[159:148]),
    .s_axi_wdata(in_vec[147:116]),
    .s_axi_wstrb(in_vec[115:112]),
    .s_axi_wlast(in_vec[111:111]),
    .s_axi_wvalid(in_vec[110:110]),
    .s_axi_bready(in_vec[109:109]),
    .s_axi_arid(in_vec[108:97]),
    .s_axi_araddr(in_vec[96:65]),
    .s_axi_arlen(in_vec[64:61]),
    .s_axi_arsize(in_vec[60:58]),
    .s_axi_arburst(in_vec[57:56]),
    .s_axi_arlock(in_vec[55:54]),
    .s_axi_arcache(in_vec[53:50]),
    .s_axi_arprot(in_vec[49:47]),
    .s_axi_arqos(in_vec[46:43]),
    .s_axi_arvalid(in_vec[42:42]),
    .s_axi_rready(in_vec[41:41]),
    .m_axi_awready(in_vec[40:40]),
    .m_axi_wready(in_vec[39:39]),
    .m_axi_bresp(in_vec[38:37]),
    .m_axi_bvalid(in_vec[36:36]),
    .m_axi_arready(in_vec[35:35]),
    .m_axi_rdata(in_vec[34:3]),
    .m_axi_rresp(in_vec[2:1]),
    .m_axi_rvalid(in_vec[0:0]),
    .s_axi_awready(out_vec[176:176]),
    .s_axi_wready(out_vec[175:175]),
    .s_axi_bid(out_vec[174:163]),
    .s_axi_bresp(out_vec[162:161]),
    .s_axi_bvalid(out_vec[160:160]),
    .s_axi_arready(out_vec[159:159]),
    .s_axi_rid(out_vec[158:147]),
    .s_axi_rdata(out_vec[146:115]),
    .s_axi_rresp(out_vec[114:113]),
    .s_axi_rlast(out_vec[112:112]),
    .s_axi_rvalid(out_vec[111:111]),
    .m_axi_awaddr(out_vec[110:79]),
    .m_axi_awprot(out_vec[78:76]),
    .m_axi_awvalid(out_vec[75:75]),
    .m_axi_wdata(out_vec[74:43]),
    .m_axi_wstrb(out_vec[42:39]),
    .m_axi_wvalid(out_vec[38:38]),
    .m_axi_bready(out_vec[37:37]),
    .m_axi_araddr(out_vec[36:5]),
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
    stim[0] = 228'h5da1f0e556b3eb1d914fa5fd495461390af5a3fac3f02811f12cf0e56;
    stim[1] = 228'h53b49df5d40111fdd031c8ea5f6853e6a73f9331ee66aa40cc83d3f09;
    stim[2] = 228'h9f03b3909ecb438ec31af0f14f32846e4f2d9a5bf140b40362af05c40;
    stim[3] = 228'hf4ed128568d498a1b491cc98ca46a33c7fc0b578ef3c1e98cbaba31ab;
    stim[4] = 228'hd1ed9e1214c8cdaafccd92c7898e6a69081d9741e5bb1ea072e55bf63;
    stim[5] = 228'hd15bfa077bcf69b9cf499eb75cb44073624ad94622f70a8706fe1ba3c;
    stim[6] = 228'hf79d86a972a7edb1d8de9356c874c5ccfeacd2b0e0c8ec21419887417;
    stim[7] = 228'h8981f4bca6f2a5266c8f231877c16ba5a7da326661e2bd019bb6db79a;
    stim[8] = 228'he9b8b560b46cf4d6bf2fcce0a03d563560f089c1072dc35232ce464b1;
    stim[9] = 228'hd1a868a3f7f52d3961d6cee3b760c741c7e270212442004dcdedcce0d;
    stim[10] = 228'hbefa5f2e773143fc3bc003e1b0575c751946b4ab36d7c901375bcfffb;
    stim[11] = 228'hf630d8a4d2dbbbbd6ccacdf84a80327b28bf7ffbea9966f6fdeab2f23;
    stim[12] = 228'h9dba22c6096f8fe79ea5bcae2e92c9daf66df34993d0e4ce2f44a3c28;
    stim[13] = 228'ha54beb87b2f440dac8b0fbfff2a79198fbb12654136fd2d63f900c922;
    stim[14] = 228'hdf7890735b214b7eeb54f3b9d4c67e256cae3414f4d8209ce08401d12;
    stim[15] = 228'hca01f29f11c05a429387aa85ca9090d4d706afda6934ea39b7ef36910;
    stim[16] = 228'hcd3ede149a18fe5ebfba5e085e30ce70f18a67cab73ce8690c1bb1ddb;
    stim[17] = 228'hb5bb5009c0e484f2423363c84b890f482c20e9be0a22adcd70bb1472a;
    stim[18] = 228'hea432c7d978868d8610d1320e4798692e192a73713150a4172d62c240;
    stim[19] = 228'hd820563c0acaac320dad490c94b8a14e87e657905859152f3f7d38547;
    stim[20] = 228'h82a6727eb978350e838e8d82154fe56e70f594e45273ff2047a3138be;
    stim[21] = 228'h8f11e8e44f8d6cd2d2f1f7dd8423907874cda27e2d5c73c5f2363d64c;
    stim[22] = 228'ha675a51e170ffedf611afc4a384e4cb2e4eeed47563564a0b19b3ab4d;
    stim[23] = 228'h8cc775b06f83cf285b37360ec5132e9f75e60c64de452909003f5cdad;
    stim[24] = 228'h99b03ff7c59ae1c33ba648691b18a001a9c5537d4b3ceaed12936e0dd;
    stim[25] = 228'h83bcf1c8cbebcc788085e466ccfe1948e049a7772fa730942dc4f1682;
    stim[26] = 228'he61ce3828855333a5baef118c5e24cb20354c8620171dcadb805289fa;
    stim[27] = 228'h8da4c06abaa50f94c507f1fd45dfa90edd15afe1acc2039dde4ab6ab4;
    stim[28] = 228'haa6f36430db791c4cd2ba1af7189eec91f44b2810dc365c2b7699feac;
    stim[29] = 228'hffff3df3b22173971ccccb820d3acba1a4a50b6f98d2d32c375299a08;
    stim[30] = 228'he5e542a358c563de0a40a8ed2ac346308638f8f9949c41787e529f8aa;
    stim[31] = 228'hcda361e2cedce8a6eacc2a0d3428fa137f13aee3e91818fd943e63d55;
    stim[32] = 228'h90cad8658f7db60e69851902d464826efd3810982577496da2126ea12;
    stim[33] = 228'hdd2daa09b3385e097e0d526e5025e7a7ff8c4ea6aa9c81178794fa372;
    stim[34] = 228'hc71bb938e60a77dbd034d0a72e731d2f94fa4c7c6e37c171eca7f7d49;
    stim[35] = 228'hd77d831b0c1121115ca3b717e1587277734f4b3451aff1241447a6c67;
    stim[36] = 228'hdfb22ccfc90e3116f85f247d1742ad62d720125bb81981b3f608b28dd;
    stim[37] = 228'h80924dca53a27289f301f86d930bcd25705015899228ca372a6e93bc4;
    stim[38] = 228'he94874dc324a625a84508ec7a9705290d73b0fa85f01db18f4ed8cd4b;
    stim[39] = 228'hb68ad3740b7cb306c5315dff0041fab23dc7bb0160b1cf2ca6c29ed36;
    stim[40] = 228'h9e4529529320c655a9a50846017093935655c70e38afa6411d9bf7c9a;
    stim[41] = 228'haec8540ad69f679fb95fc16e95f81933e1cc87b18d0d536f5bc9d34ca;
    stim[42] = 228'hf35a21449638aa333ec5e3acc990e73b9ed8008a93900caf1a6b7ea69;
    stim[43] = 228'ha550195eb13ee22ebf1b68ba0d2690b99a210ebdb8abafc053ec28658;
    stim[44] = 228'h8691e503a66d7d20fad11f3d16ce0b22c6f490b65b697476c49634e22;
    stim[45] = 228'hc6aae06b79b273cb07141bd9744b7f9a6bf201dd3d909b739810ae933;
    stim[46] = 228'hd65359da540ffb1abaec9c1495cffa2a9761194255803397503fa0682;
    stim[47] = 228'hcdbab13348c0747e814db7653831c56bac58dbdf6f7c189015fd4695d;
    stim[48] = 228'he0357538fe8784ec2cfecba9aada074fa6047517cc306c4b6f772c54c;
    stim[49] = 228'hd049e8b8afa8a8018e5dd7b97f7967fd23d239234399a74027042c0a2;
    stim[50] = 228'hceaec0208fe1cc3ee52ae59efdf0f93944790fdeb2a0bcf4ff1a2b928;
    stim[51] = 228'hebe52bbe52177e5953b4a1a9628cbf0532d3db75ac02fc09b131e0724;
    stim[52] = 228'hc0f2420bb83f8df3240d7e2c6cb2f0466cfd769387e3d7a3b18b5b036;
    stim[53] = 228'ha3a58f29b035f45bdbd78d2c6467ecd2ba93ee3f78485521ba0d8bfae;
    stim[54] = 228'h97f370e99b9f9c60ea30329bd04d7fd7404600c16d022163178adb783;
    stim[55] = 228'h8a4fffd2b48432a5918806090aa8f91d1e28532a3a87899fbf2dd5d32;
    stim[56] = 228'haec660f139dd13c6f6f2dac500231f7ae630463b3179dbacac34e7164;
    stim[57] = 228'he732338d7a084cf3cd3c6e96ea420b39bbf0780babe3cd60695ac39fb;
    stim[58] = 228'h9b4c27263366917e16fb92b5593f3ec442399e9bbee282f370e6b456c;
    stim[59] = 228'hf09fef8cf164155860d7b7ac41c9eac0c0ff2adfb53bf9b504d97fb1c;
    stim[60] = 228'h82ea8ef1f1b3cc312ea4aed4c875157bdc66d5f0f156752d2eed5d3b4;
    stim[61] = 228'he53ab7c723951c63e4fa30602332e6c11b5bb316d726085b1918ae628;
    stim[62] = 228'h8531cb866df5bb6832548d63c7301c3b031d64b0fe0efe0220b94f87b;
    stim[63] = 228'hd12686d06deab9136e8c1d019b72734e5b28805c17591dc9061ac8c77;
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
      expv[0] = 177'h15da1ce4712cf0e571f0e556b6d2fea4aa30af5a3fad4;
      expv[1] = 177'h053b0f9acc83d3f09c9df5d406e4752fb42a73f9331f6;
      expv[2] = 177'h01f031b962af05c413b3909ecf7878a79944f2d9a5bf8;
      expv[3] = 177'h1f4e8cf1cbaba31abd128568d0e64c652353fc0b578ec;
      expv[4] = 177'h051e81a472e55bf63d9e1214cdc963c4c73281d9741ed;
      expv[5] = 177'h0515f1cd86fe1ba3d3fa077bcc4f5bae5a2024ad94624;
      expv[6] = 177'h07799733c19887417d86a972a0c9ab643a65eacd2b0f5;
      expv[7] = 177'h00981e969bb6db79b1f4bca6f3118c3be0b27da32667c;
      expv[8] = 177'h169ba0d5b2ce464b18b560b46be670501eae0f089c102;
      expv[9] = 177'h0d1add074dedcce0d868a3f7f46771dbb0667e2702122;
      expv[10] = 177'h03ef91d4375bcfffba5f2e773681f0d82bad946b4ab24;
      expv[11] = 177'h176369ecfdeab2f238d8a4d2de66fc25401a8bf7ffbf3;
      expv[12] = 177'h09dbe76baf44a3c29222c6096bde5717496166df34992;
      expv[13] = 177'h1254e663bf900c9233eb87b2f57dfff953c9bb126540a;
      expv[14] = 177'h1df7c895e08401d13090735b2779dcea633ecae3414f0;
      expv[15] = 177'h1ca01b5337ef369111f29f11c1d542e54849706afda75;
      expv[16] = 177'h0cd391c38c1bb1ddbede149a1faf042f186718a67cab7;
      expv[17] = 177'h0b5bd520f0bb1472b35009c0e131e425c486c20e9be16;
      expv[18] = 177'h06a4124bf2d62c24132c7d978c0990723cc6192a73706;
      expv[19] = 177'h0d82753a3f7d385478563c0ac924864a5c507e6579049;
      expv[20] = 177'h002a05b9c7a3138bf6727eb97f46c10aa7f50f594e45d;
      expv[21] = 177'h00f159e1f2363d64d1e8e44f89fbeec211c94cda27e3a;
      expv[22] = 177'h02670acbb19b3ab4dda51e170f7e251c27244eeed4751;
      expv[23] = 177'h08cc127d803f5cdadf75b06f849b076289975e60c64d4;
      expv[24] = 177'h099b500692936e0dd83ff7c599a4348d8c509c5537d57;
      expv[25] = 177'h103bc523adc4f16834f1c8cbec7233667f08049a77738;
      expv[26] = 177'h0e61dac83805289fb4e3828855f88c62f124354c8620d;
      expv[27] = 177'h18da5c3b5e4ab6ab54c06abaa278fea2efd1d15afe1a0;
      expv[28] = 177'h02a6ab2437699fead736430db250d7b8c4f7f44b28112;
      expv[29] = 177'h0fffc686b75299a0973df3b223e5c1069d624a50b6f89;
      expv[30] = 177'h1e5e00c27e529f8ab542a358c754769561a6638f8f983;
      expv[31] = 177'h1cda584d943e63d55b61e2cedb15069a147bf13aee3ef;
      expv[32] = 177'h090cd9bba2126ea132d8658f7f0c816a3243d38109827;
      expv[33] = 177'h15d2fe9f8794fa3735aa09b33ca9372812f7f8c4ea6a0;
      expv[34] = 177'h14719cbe6ca7f7d49bb938e60de85397398d4fa4c7c63;
      expv[35] = 177'h0577c1dd9447a6c67d831b0c10db8bf0ac3b34f4b3459;
      expv[36] = 177'h15fb3d8b7608b28dda2ccfc90b923e8ba155720125ba1;
      expv[37] = 177'h10097495aa6e93bc524dca53a4fc36c985e5050158985;
      expv[38] = 177'h1e948a4374ed8cd4b874dc324d4763d4b82b73b0fa84c;
      expv[39] = 177'h0b68cac8a6c29ed372d3740b7b2eff8020fbdc7bb0165;
      expv[40] = 177'h01e4164d1d9bf7c9b529529322042300b84b655c70e32;
      expv[41] = 177'h0aecf4cfdbc9d34cb0540ad69fe0b74afc081cc87b18b;
      expv[42] = 177'h0f35f4ee1a6b7ea69a21449639f1d664c877ed8008a85;
      expv[43] = 177'h025502e653ec286590195eb13fb45d069349a210ebdb6;
      expv[44] = 177'h10696c8b449634e231e503a6688f9e8b67026f490b65b;
      expv[45] = 177'h146abe699810ae933ae06b79b50decba25bebf201dd2f;
      expv[46] = 177'h156570aa503fa0683359da540dce0a4ae7fb761194258;
      expv[47] = 177'h14db85ae95fd4695dab13348c75bb29c18e4c58dbdf6c;
      expv[48] = 177'h0e03353eef772c54d57538fe8665d4d56d066047517d6;
      expv[49] = 177'h050487f4a7042c0a31e8b8afa86bdcbfbcb63d2392352;
      expv[50] = 177'h14eacce57f1a2b9296c0208fe772cf7ef8784790fdebf;
      expv[51] = 177'h0ebe1c14b131e072552bbe5214d0d4b1465f2d3db75bc;
      expv[52] = 177'h040f3919b18b5b0372420bb8393f16365978cfd769389;
      expv[53] = 177'h023a1b4aba0d8bfaf58f29b035c6963233f5a93ee3f69;
      expv[54] = 177'h017f375d178adb783b70e99b98194de826be04600c173;
      expv[55] = 177'h18a4fc743f2dd5d337ffd2b4828304855479e28532a24;
      expv[56] = 177'h0aec4debac34e7165660f139dbed6280118e630463b2d;
      expv[57] = 177'h067304e6e95ac39fba338d7a09374b752103bf0780ba7;
      expv[58] = 177'h11b4b31170e6b456d427263367c95aac9f9e2399e9ba3;
      expv[59] = 177'h1709d30304d97fb1d7ef8cf1645bd620e4f20ff2adfbd;
      expv[60] = 177'h082ed5ef2eed5d3b528ef1f1b0576a643a8dc66d5f0f9;
      expv[61] = 177'h1e53b3041918ae6292b7c723911830119977b5bb316c6;
      expv[62] = 177'h005320ec20b94f87b9cb866df4c6b1e3980c31d64b0fc;
      expv[63] = 177'h0d121539061ac8c77e86d06de90e80cdb93bb28805c0e;
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
