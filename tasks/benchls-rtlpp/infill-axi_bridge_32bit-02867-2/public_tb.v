// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 206;
  localparam OW = 153;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02867 dut (
    .aclk(clk),
    .aresetn(in_vec[205:205]),
    .s_axi_awaddr(in_vec[204:173]),
    .s_axi_awlen(in_vec[172:165]),
    .s_axi_awsize(in_vec[164:162]),
    .s_axi_awburst(in_vec[161:160]),
    .s_axi_awlock(in_vec[159:159]),
    .s_axi_awcache(in_vec[158:155]),
    .s_axi_awprot(in_vec[154:152]),
    .s_axi_awregion(in_vec[151:148]),
    .s_axi_awqos(in_vec[147:144]),
    .s_axi_awvalid(in_vec[143:143]),
    .s_axi_wdata(in_vec[142:111]),
    .s_axi_wstrb(in_vec[110:107]),
    .s_axi_wlast(in_vec[106:106]),
    .s_axi_wvalid(in_vec[105:105]),
    .s_axi_bready(in_vec[104:104]),
    .s_axi_araddr(in_vec[103:72]),
    .s_axi_arlen(in_vec[71:64]),
    .s_axi_arsize(in_vec[63:61]),
    .s_axi_arburst(in_vec[60:59]),
    .s_axi_arlock(in_vec[58:58]),
    .s_axi_arcache(in_vec[57:54]),
    .s_axi_arprot(in_vec[53:51]),
    .s_axi_arregion(in_vec[50:47]),
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
    .s_axi_awready(out_vec[152:152]),
    .s_axi_wready(out_vec[151:151]),
    .s_axi_bresp(out_vec[150:149]),
    .s_axi_bvalid(out_vec[148:148]),
    .s_axi_arready(out_vec[147:147]),
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
    stim[0] = 206'h04c9fbf07043ec3436b86b5b9958da1eed7b5334b45948dd3331;
    stim[1] = 206'h0a380a7f911756a658c30d7c1afd420618afb330b9a5b82c7138;
    stim[2] = 206'h2e33e8f300575d4590bf4158bf791d8359aa3542e10d66be8923;
    stim[3] = 206'h266b775712b2319b11dc594aa1e8cfc90f1599495d5a9ebf3b91;
    stim[4] = 206'h35d1b23abb68110006cff446cad1d59bfe944a0ca2420d1496f6;
    stim[5] = 206'h3d8e31ce3acc538fbb952a208331060373faa4d691f7da74dcd1;
    stim[6] = 206'h3c0bcb8f449d69e623c8d774727148c8835d7c134f4737a16fad;
    stim[7] = 206'h2afc2c51f2338a3e7cb080e1b5991139cea7f406b8dd211d245b;
    stim[8] = 206'h2fa86c2e8231a44f03869d3481cdf810931a6e2616ceb82be046;
    stim[9] = 206'h39437964061cc4391c4a90b62f16b09b8f6dd5a929cc6758a8bb;
    stim[10] = 206'h390be7cb9dfcbb8080b524252d9c6e56f7a6026b95816a7aadfe;
    stim[11] = 206'h3af32cdde0dc9195a7351f8d0eea021886910680cb073ccd0438;
    stim[12] = 206'h255862a142587c5f305d60871bbea320da755409dc3b0550dc3a;
    stim[13] = 206'h39aec16623ec4b26a1efbb0ad6321fcd0168914abe94737b794e;
    stim[14] = 206'h3175e7f87a998124061fcc9f88a1f3ff060550066aac623e9261;
    stim[15] = 206'h3a07479f1607bbc3b92b4b8591d3fe33c943d791c09c3037e8a0;
    stim[16] = 206'h3022efb9c3dca29c7eb2fee175c3e823281e4ec489ad437c28d3;
    stim[17] = 206'h3c4a6cda2f97da5be2ee195a7b5f659cbdb53df19bd446c62f0d;
    stim[18] = 206'h334ae4497a5b856828329d78ba8a5d82dd93c19924d0a0bc42dd;
    stim[19] = 206'h3455bfdb6b484515894a78cc110456d77c45676f1bef6520df48;
    stim[20] = 206'h299570337b71b5afe9f7bcbcb8ff00538b7f7d7268aeae16d1d4;
    stim[21] = 206'h2508e51f7ff1e50f427de9fbbe75d4a18bbe62b10a3533174059;
    stim[22] = 206'h29e06795b14d1089ea89481cc588f8082e137d142ca50dd4f76e;
    stim[23] = 206'h2616ba69986a11d093f47fe68e36ae75db48eb3f923c30728c2b;
    stim[24] = 206'h39c7be5730be8a2f417e52d0ae76bd0451aa5cf3307b5ea0eb5d;
    stim[25] = 206'h37547679c415940620da8a22a893ad124a3a37ac72c64d79f526;
    stim[26] = 206'h20e54087b66796c908c624a7e67629411b4ea78d9d771a0dc015;
    stim[27] = 206'h3e8746ad1c31d2241348534bd41124a8b466cc416ac50e1ce829;
    stim[28] = 206'h3dd8db7d828f9c2b0e84d18635e13a5b70d02b71c4e1e1aa9101;
    stim[29] = 206'h3c8faccfc073a931af4e2ce33efcfc65d2ad8b5608c84a305fa7;
    stim[30] = 206'h27cd43dac49094e80e71e5bbfdd9db079ab2255f04dfbe3b53c9;
    stim[31] = 206'h248da7eca8cb02872f07ba3757ea66cc4c13654af06ea7651198;
    stim[32] = 206'h28d0724144f34d632adb5b1f1b43e177645d03095dde8d940a57;
    stim[33] = 206'h253f234a22b45a72e158c7e811b501af183c2669c33d201af52f;
    stim[34] = 206'h39a3a6a6fdc7c12fd08d581e31a195e1648114fe57f7d94aefbb;
    stim[35] = 206'h31763538b669bf2c14430789520994ae116b84140f55d072af8d;
    stim[36] = 206'h361bafde1ea7e09a587fbfd83e5313e73fb09e96db44a2354eed;
    stim[37] = 206'h385fd5795d4ed95ec1e0dfdf4b2e0419d48cd6cb1f559f2cdd51;
    stim[38] = 206'h27232f8c09edae7206bcfb516e0578dadd0dc79ed95cad8d167c;
    stim[39] = 206'h2e562c023541da882428d274133035df1619c6e9b1d548a3e9b4;
    stim[40] = 206'h25390d60d935afb2ef12295033be631b1db9d75a0a6eb863abf1;
    stim[41] = 206'h349312e5ed3553b52dc4ce6e6c2736eeab59130f6232ff896af6;
    stim[42] = 206'h2bcf4d094f4e3114fb3582f3bc35162f5430dbd472eea7dc3e79;
    stim[43] = 206'h3814d0ad6dab2e3389e06962dabb9764b0898116875c7c7967aa;
    stim[44] = 206'h2fc1fb8269ba0050046809ca5d6bf8058465b45bd34939e0e05e;
    stim[45] = 206'h24d86dd8b5db2b0c79c000e041c2772fbcbec197ea9e04142f85;
    stim[46] = 206'h34dc04d32ebee455ede812fb05aa2537f317f46f3e8455df9693;
    stim[47] = 206'h3463b82d929977ae6af3fac0de8af951ebdf88cbc85335092f13;
    stim[48] = 206'h3e1c3cb6ee85748bb07fbf34f4b2c435d306efd979919dfadd20;
    stim[49] = 206'h206d45bc8c2515aee5f0902d10a0d2d67f72831f8ac486c44d06;
    stim[50] = 206'h2490b70ed5da5a0defd3031a5df1da2fbb2cb0cb34016e98be30;
    stim[51] = 206'h2f4bec0eae14445a5ba18fc4c1a76e8dc86259307b3f9684c3f0;
    stim[52] = 206'h3f836bfa3df20b647e49ef94202858812816a394b8063afceb2e;
    stim[53] = 206'h329f1ff870e71097c0c34bd76958ef31493b2e52b9e1d5d9f041;
    stim[54] = 206'h3715cfcc3f8488ec0e2310186e37caa632f1d134da0965feeba9;
    stim[55] = 206'h3ef081cd9280e8ba2310d7f8e6d02dc053e017395dc1efb3c249;
    stim[56] = 206'h2b380c74274ed364506118599169070082ec0b2d9ec15b36b1a7;
    stim[57] = 206'h2f565efea99e336c6911c01c383505a24cd68514f62ca1fb8d06;
    stim[58] = 206'h21932be15f7b2ce4e40c719c9187762f6b90f5080ad11cba2e5f;
    stim[59] = 206'h29ddf281204e6ec12fa6a5f0985cf4671ac16ee0b40f5db066c8;
    stim[60] = 206'h39fd0b87a98449a02ca686c95f2526ef5705ba74a5172ce9bd4c;
    stim[61] = 206'h3b59b063f8f1cdbcf18db74baf088dc27a888cdd7ba1dec96d3e;
    stim[62] = 206'h3315cef41f9a0b9d87c31952b2b558bf39adc642142112dcf7dd;
    stim[63] = 206'h383553d710195e1079c01dcfd130825185a264a9eb3277c737d5;
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
      expv[0] = 153'h05948dd33319327efc1c36b86b5b9ab1b43ddba;
      expv[1] = 153'h1a5b82c713828e029fe658c30d7c1dfa840c318;
      expv[2] = 153'h10d66be8923b8cfa3cc590bf4158bef23b06b20;
      expv[3] = 153'h15a9ebf3b9199addd5c111dc594aa3d19f921e6;
      expv[4] = 153'h0420d1496f65746c8ea906cff446cda3ab37fc5;
      expv[5] = 153'h1f7da74dcd1f638c738bbb952a2086620c06e68;
      expv[6] = 153'h14737a16fadf02f2e3d123c8d77474e2919106b;
      expv[7] = 153'h0dd211d245babf0b147a7cb080e1b33222739c0;
      expv[8] = 153'h0ceb82be0463ea1b0ba403869d34839bf021273;
      expv[9] = 153'h1cc6758a8bbe50de59041c4a90b62e2d61371f4;
      expv[10] = 153'h1816a7aadfe642f9f2e380b524252b38dcadef6;
      expv[11] = 153'h1073ccd04386bccb3779a7351f8d0dd404310c1;
      expv[12] = 153'h03b0550dc3a15618a854305d60871f7d4641b46;
      expv[13] = 153'h094737b794e66bb0598ba1efbb0ad4643f9a027;
      expv[14] = 153'h0ac623e9261c5d79fe19061fcc9f8943e7fe0c1;
      expv[15] = 153'h09c3037e8a0681d1e7c3b92b4b8593a7fc67928;
      expv[16] = 153'h1ad437c28d3c08bbee727eb2fee17387d046500;
      expv[17] = 153'h1d446c62f0df129b368ae2ee195a7ebecb397b9;
      expv[18] = 153'h0d0a0bc42ddcd2b9125d28329d78bd14bb05bae;
      expv[19] = 153'h1ef6520df485156ff6dd894a78cc1208adaef95;
      expv[20] = 153'h0aeae16d1d42655c0cdde9f7bcbcb9fe00a7178;
      expv[21] = 153'h035331740599423947dd427de9fbbceba943179;
      expv[22] = 153'h0a50dd4f76e27819e568ea89481cc311f0105ca;
      expv[23] = 153'h03c30728c2b985ae9a6193f47fe68c6d5cebb7d;
      expv[24] = 153'h07b5ea0eb5de71ef95ca417e52d0aced7a08a38;
      expv[25] = 153'h0c64d79f5265d51d9e7420da8a22a9275a24955;
      expv[26] = 153'h1771a0dc0158395021ee08c624a7e4ec5282366;
      expv[27] = 153'h0c50e1ce829fa1d1ab421348534bd0224951681;
      expv[28] = 153'h0e1e1aa9101f7636df640e84d18633c274b6e1a;
      expv[29] = 153'h0c84a305fa7f23eb33f1af4e2ce33df9f8cba48;
      expv[30] = 153'h0dfbe3b53c99f350f6b40e71e5bbfbb3b60f34e;
      expv[31] = 153'h06ea765119812369fb2a2f07ba3757d4cd98984;
      expv[32] = 153'h1de8d940a57a341c90552adb5b1f1e87c2eec86;
      expv[33] = 153'h13d201af52f94fc8d28ae158c7e8136a035e315;
      expv[34] = 153'h1f7d94aefbbe68e9a9b9d08d581e33432bc2c9f;
      expv[35] = 153'h155d072af8dc5d8d4e2f144307895413295c22b;
      expv[36] = 153'h144a2354eedd86ebf780587fbfd83ca627ce7e9;
      expv[37] = 153'h1559f2cdd51e17f55e51c1e0dfdf4e5c0833a87;
      expv[38] = 153'h15cad8d167c1c8cbe30606bcfb516c0af1b5bac;
      expv[39] = 153'h1d548a3e9b43958b008a2428d27416606bbe2d4;
      expv[40] = 153'h06eb863abf194e435837ef122950377cc6363ad;
      expv[41] = 153'h032ff896af6524c4b97b2dc4ce6e684e6ddd565;
      expv[42] = 153'h0eea7dc3e79af3d34251fb3582f3b86a2c5ea89;
      expv[43] = 153'h15c7c7967aa605342b5e89e06962dd772ec960b;
      expv[44] = 153'h14939e0e05e3f07ee098046809ca5ad7f00b08d;
      expv[45] = 153'h09e04142f859361b762b79c000e04384ee5f789;
      expv[46] = 153'h08455df9693d370134ccede812fb03544a6fe77;
      expv[47] = 153'h05335092f13d18ee0b676af3fac0dd15f2a3d64;
      expv[48] = 153'h1919dfadd207870f2dbcb07fbf34f165886ba6c;
      expv[49] = 153'h0c486c44d0601b516f25e5f0902d1141a5acfed;
      expv[50] = 153'h0016e98be301242dc3b2efd3031a5be3b45f766;
      expv[51] = 153'h13f9684c3f03d2fb03ac5ba18fc4c34edd1b919;
      expv[52] = 153'h0063afceb2e7e0dafe8b7e49ef942050b102508;
      expv[53] = 153'h1e1d5d9f041ca7c7fe18c0c34bd76ab1de62928;
      expv[54] = 153'h00965feeba9dc573f3080e2310186c6f954c659;
      expv[55] = 153'h1c1efb3c249fbc2073602310d7f8e5a05b80a7e;
      expv[56] = 153'h0c15b36b1a7ace031d0b5061185992d20e01057;
      expv[57] = 153'h02ca1fb8d063d597bfab6911c01c386a0b4498b;
      expv[58] = 153'h0d11cba2e5f864caf854e40c719c930eec5ed65;
      expv[59] = 153'h00f5db066c82777ca04e2fa6a5f098b9e8ce352;
      expv[60] = 153'h1172ce9bd4c67f42e1e92ca686c95e4a4ddeafa;
      expv[61] = 153'h1a1dec96d3e6d66c18fdf18db74bae111b84f4d;
      expv[62] = 153'h02112dcf7ddcc573bd0387c31952b56ab17e722;
      expv[63] = 153'h13277c737d5e0d54f5c679c01dcfd26104a30b5;
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
