// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 230;
  localparam OW = 177;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09917 dut (
    .aclk(clk),
    .aresetn(in_vec[229:229]),
    .s_axi_awid(in_vec[228:217]),
    .s_axi_awaddr(in_vec[216:185]),
    .s_axi_awlen(in_vec[184:177]),
    .s_axi_awsize(in_vec[176:174]),
    .s_axi_awburst(in_vec[173:172]),
    .s_axi_awlock(in_vec[171:171]),
    .s_axi_awcache(in_vec[170:167]),
    .s_axi_awprot(in_vec[166:164]),
    .s_axi_awregion(in_vec[163:160]),
    .s_axi_awqos(in_vec[159:156]),
    .s_axi_awvalid(in_vec[155:155]),
    .s_axi_wdata(in_vec[154:123]),
    .s_axi_wstrb(in_vec[122:119]),
    .s_axi_wlast(in_vec[118:118]),
    .s_axi_wvalid(in_vec[117:117]),
    .s_axi_bready(in_vec[116:116]),
    .s_axi_arid(in_vec[115:104]),
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
    stim[0] = 230'h0573a3fc477594bbfbac4f35a4de42eb952ce2ab82997d1d18e234d981;
    stim[1] = 230'h0e67a31d3b99291be18fb78bc5eb047bfdb4c5c5d027c91d110cea02a9;
    stim[2] = 230'h3454068ebb29d46df28d5e7abc2822553f253a545987437743a60f3324;
    stim[3] = 230'h367294bac642c81165357f4a6a938c5dd128a3b5336f6fb67e973ff8dc;
    stim[4] = 230'h3fcc46df343535cf04e779e6118fa51522077974c02ec32b366a46eb18;
    stim[5] = 230'h30ac22ef02f71481593d657268ce40833653e3bafdd1950c7bd3f4962e;
    stim[6] = 230'h36f9278439fc69eda122a1014c1d42183fb3f8986a468f6591565214d2;
    stim[7] = 230'h3f4a6ca25e82254872fd02f7f7963a738231f012752a47009f1a1c0bbf;
    stim[8] = 230'h2b5604f7a588573c753ce4680dcd426a1329fe31a94db50582b9258223;
    stim[9] = 230'h2dac1825b9b63d76932334a24a0ca51b19963a48ad0b7c5bc0b9b6aa3c;
    stim[10] = 230'h311d610a2c7b31b21bfa467d5d75237c0958931eab8bfb6eded5d1e088;
    stim[11] = 230'h38ba4d7bd00f32453f7150b9f0ef98087c2a82232e40c58511fe0467fc;
    stim[12] = 230'h270cc4056b40296eb896b9e9b92007f03f7839e64e55c42c3d78fa6d54;
    stim[13] = 230'h10bec82b5eca5eb89ba896c13af301643f23df6090434a95197c50dbb7;
    stim[14] = 230'h0bd545005aa9920a79e59527f05b98b05644cfb0f6bf0b53fac0e7cf9f;
    stim[15] = 230'h27ccd9b03093de1351fd1e079ca4412be475791435705c93f927bd1e00;
    stim[16] = 230'h3328f157a960c0c1fac0f58d131b8f0ca71cbf03b73605e3175666b7b9;
    stim[17] = 230'h2c4af932d7be9282208cdf0f91fd797bf928d5f99c175c5b825db0acf5;
    stim[18] = 230'h33d88a54be2019ed25762f04d7cacaac7e841fe3fe375369516c61aee0;
    stim[19] = 230'h300913a476cff0668adb08791d9952365bbe1544aa50c67010146ca776;
    stim[20] = 230'h216efab4a12271e8a004d696b92dcf0e58bfcde9f15e32e56bb2c156bd;
    stim[21] = 230'h214eb38a05575898c77c30abccfbce5b4b55396b1dee6cddf658c27b14;
    stim[22] = 230'h0d107d1c6e0734c8b648aa9a130d7343c9de305b03b562bfea39ea2127;
    stim[23] = 230'h1ecc31d15606bedbd35eed1ec27981ebe4b66eada00d1c4e68b8a7de89;
    stim[24] = 230'h2879e4f080f086effb201bbc5c17e8ade1656fcfc943ed819179cadd90;
    stim[25] = 230'h3536a7e59ea61098ff4ea55c9d0cb4bf1570bcd95283000f6e57785b28;
    stim[26] = 230'h24eba6def3261ce1d293e165c6b0533607fd5bd27ac750f1491b42dae0;
    stim[27] = 230'h21d19d0069f094eaa94b41cc2389f4e9a41609c5a198dacbd87a75bd09;
    stim[28] = 230'h26ce7405579ff1cbe4a5974c3edefe9e1b47beec23d864cbee4c184f0d;
    stim[29] = 230'h3ae0112d7ee56fcbb7762cfe965e6139065e2a017612010398b43c3bd2;
    stim[30] = 230'h2ff9a31122932273d323c811e0b51f680e32b6fd415baee2f2473ea637;
    stim[31] = 230'h251a4417984c43ee16b8e9085ad669c47e2d65a0e4377e1f7fe4217cea;
    stim[32] = 230'h2902c58ccb9025367fc6288a99e58bb6eee826d6c480f88746d0107a4b;
    stim[33] = 230'h094f363000dc54d7843db81f69ae25b65af1cf30e7dc9f8e1e9e24721d;
    stim[34] = 230'h3283a168c1d15ebc1d3a30d120f19db90019029b190d8876833d4f9d34;
    stim[35] = 230'h398bea86e7dff43a56c6e967c6fbb49f8fdd9d0a0e01e62ac1273ffcb9;
    stim[36] = 230'h39ce4202792df76d2f744a804e361cf6aed9f9e38d674da24426693815;
    stim[37] = 230'h22c09dfac24fc1b2f1b68514676bc9ab9331e86452a326cc61a56de3b5;
    stim[38] = 230'h21d561f2257a7dc5c2a6a33f1830daf18d80889a55b556a013eee99bd2;
    stim[39] = 230'h34de1ad52fb7080bacfef694477e7522f44a13a2b6e7b7a2715ec1f77f;
    stim[40] = 230'h3e8a51db7e5769ca1df7e440f70ef14d7259e99340cb27ce05a4c26e33;
    stim[41] = 230'h324a6bc7c58c7338ad1aa961f0a0412f6c2da5c57d02ded64d316c9759;
    stim[42] = 230'h28894fe23a6c5fba9d9c8e64c3ff628f52c59269a07dac47d657c417d5;
    stim[43] = 230'h2b2b0b84e9938e713ac8222dee4889f7dd94ff37d8a07e79f7a70e0ad3;
    stim[44] = 230'h3242d0e154afee1e1c8a6a50eeb3c0be1927d1ed066315a92302f8abfa;
    stim[45] = 230'h37267224fafa4f7c034e4887818af14f690ea4286d42daf8d6f8691533;
    stim[46] = 230'h296c41462f3959b99248e71d1f2784d7bf79d50dcbe3510c08a56ac8c1;
    stim[47] = 230'h327e43c38dadc608a9a6ccac726d88732ec17cceb1252484e2f8936f6c;
    stim[48] = 230'h3240b7a50efb2b32783f64bdbbb5e3eb96d348d5fd7b34ffb2dbf6ef78;
    stim[49] = 230'h3d8f2f86091623aa302c5472dcda937b9630c9f69c9c1ee4a73ad2176e;
    stim[50] = 230'h3f9e6f29fad5cee5846660590ecd47e4b6e4837274ef4f104a09d4d889;
    stim[51] = 230'h3f6561ffaeccf0e04df1d1d528ecc87571aaef09b9f8776314adf5aab6;
    stim[52] = 230'h2a91471a22702edf89e96f694a94305109edba2d0147f9dc1632be0078;
    stim[53] = 230'h26993b74c530afe877b1db8f7e50897902daf0d75145b40fb3c555ab28;
    stim[54] = 230'h394185ddce444fa67e9a93934e4a207c5282dbe27182c36b378babef49;
    stim[55] = 230'h30c5239eb0c45c84bf319d732e73f6e99570cd6ba49b8239d4d2e8240f;
    stim[56] = 230'h328678725446cf80317e432a1c0bee72f4d7a977275362998863639a45;
    stim[57] = 230'h348751c5f2dc9376f03b3ba3bb8146d099d0e2379fc101d1dc013568d0;
    stim[58] = 230'h24e6d50f2eb2944a2674e4220384b1968cab7179dd436628ad9ad61552;
    stim[59] = 230'h37453cfe3dbcfc3b420cc25c3308a8913118936441599fc66936d369fa;
    stim[60] = 230'h29d129b45568a3ca04f9e0dd9bace75c47a28f1a1dd6277f3833a594de;
    stim[61] = 230'h3a673211b898c29e6ba12266e823088e31df0ec1c566f4123a6122878c;
    stim[62] = 230'h2082fdd2781e3e68d50e7d800edf25735d26f393ea7cb4f79e1c2ffd1f;
    stim[63] = 230'h2838b818717c7100993facc23095d65f6c0e4ed4a87408f54c116866bc;
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
      expv[0] = 177'h115c99758e234d980e8ff11dd7c4f35a4de12a59c557e;
      expv[1] = 177'h1399923d90cea02a8e8c74ee66fb78bc5eb1fb698b8a6;
      expv[2] = 177'h1515412aba60f332401a3aeca7d5e7abc2847e4a74a83;
      expv[3] = 177'h059cfe2ee973ff8dc252eb190e57f4a6a939a251476b7;
      expv[4] = 177'h17f3328ae6a46eb1811b7cd0d0779e6118fc440ef2e81;
      expv[5] = 177'h042b7841bd3f4962e08bbc0bddd657268ce06ca7c774a;
      expv[6] = 177'h1dbe110c1565214d249e10e7f22a1014c1d07f67f1306;
      expv[7] = 177'h0fd29d39f1a1c0bbe9b2897a0fd02f7f79670463e0240;
      expv[8] = 177'h1ad581352b9258222813de9627ce4680dcd02653fc63a;
      expv[9] = 177'h1b6b428d8b9b6aa3c06096e6d9334a24a0cc332c7491d;
      expv[10] = 177'h0c4759be6d5d1e08858428b1e9a467d5d75412b1263df;
      expv[11] = 177'h162e94041fe0467fc135ef403b150b9f0efaf85504462;
      expv[12] = 177'h01c33bf8578fa6d5431015ad036b9e9b92007ef073cc2;
      expv[13] = 177'h142f98b217c50dbb6b20ad7b29896c13af307e47bec06;
      expv[14] = 177'h1af57c582c0e7cf9ed14016aa759527f05baac899f605;
      expv[15] = 177'h19f37895927bd1e00366c0c24dd1e079ca41c8eaf228d;
      expv[16] = 177'h14ca178675666b7b8bc55ea5870f58d131b94e397e061;
      expv[17] = 177'h1b1284bda5db0acf4be4cb5efacdf0f91fd7f251abf2d;
      expv[18] = 177'h14f6555616c61aee022952f88262f04d7ca8fd083fc68;
      expv[19] = 177'h0402111b0146ca77644e91db38b08791d992b77c2a880;
      expv[20] = 177'h105bef873b2c156bcbead2848a4d696b92d8b17f9bd3a;
      expv[21] = 177'h1853f72de58c27b142ce28155cc30abccfb896aa72d76;
      expv[22] = 177'h1b4469a1a39ea21269f471b81b8aa9a130d793bc60b73;
      expv[23] = 177'h07b368f58b8a7de888c745581deed1ec2799c96cdd5af;
      expv[24] = 177'h1a1e1456979cadd90793c203c701bbc5c17dc2cadf9f4;
      expv[25] = 177'h154dea5fe57785b2829f967a9fea55c9d0ce2ae179b23;
      expv[26] = 177'h113ac99b11b42dae069b7bcc9d3e165c6b020ffab7a48;
      expv[27] = 177'h18745a7487a75bd08e7401a7c2b41cc2389f482c138ad;
      expv[28] = 177'h19b3ef4f64c184f0c9d0155e7e5974c3edee368f7dd91;
      expv[29] = 177'h1eb8189c8b43c3bd2044b5fb9362cfe965e40cbc54021;
      expv[30] = 177'h0bfe77b42473ea636e8c448a4d3c811e0b521c656dfb5;
      expv[31] = 177'h1146fce27e4217cea1105e61318e9085ad64fc5acb41f;
      expv[32] = 177'h1240c5db6d0107a4ab16332e476288a99e59ddd04dadf;
      expv[33] = 177'h02539adb69e24721ccd8c00370db81f69ae4b5e39e60f;
      expv[34] = 177'h0ca086dcb3d4f9d34685a30741a30d120f1a003205367;
      expv[35] = 177'h0e62c24f9273ffcb8faa1b9f7d6e967c6fbf1fbb3a151;
      expv[36] = 177'h0673c67b42669381490809e4b244a804e3635db3f3c65;
      expv[37] = 177'h00b064d59a56de3b4a77eb093f68514676b92663d0c92;
      expv[38] = 177'h00751578beee99bd2587c895ec6a33f1830b1b0111348;
      expv[39] = 177'h0537f29115ec1f77e86b54bedaef694477e7e89427459;
      expv[40] = 177'h07a280a6da4c26e329476df9597e440f70eee4b3d3273;
      expv[41] = 177'h0492c897d316c97589af1f1632aa961f0a00d85b4b8af;
      expv[42] = 177'h1a225147e57c417d4d3f88e9b1c8e64c3ff4a58b24d37;
      expv[43] = 177'h1acaf4fbfa70e0ad2c2e13a64b8222dee489bb29fe6fc;
      expv[44] = 177'h1490a05f302f8abfa3438552b9a6a50eeb38324fa3da8;
      expv[45] = 177'h0dc9d0a7ef86915329c893ebe8e4887818aed21d4850c;
      expv[46] = 177'h025b0a6b8a56ac8c090518bce18e71d1f2797ef3aa1aa;
      expv[47] = 177'h0c9fe439af8936f6c10f0e36b26ccac726d85d82f99d2;
      expv[48] = 177'h1c9031f5adbf6ef782de943beff64bdbbb5d2da691abb;
      expv[49] = 177'h0f63a1bdf3ad2176e4be18245bc5472dcdab2c6193ece;
      expv[50] = 177'h07e7cbf2209d4d8889bca7eb50660590ecd16dc906e44;
      expv[51] = 177'h17d9143acadf5aab6587febb341d1d528ec8e355de139;
      expv[52] = 177'h02a41028e32be007851c6889c096f694a94613db745be;
      expv[53] = 177'h19a634bcbc555ab284edd314c71db8f7e50805b5e1afb;
      expv[54] = 177'h1650303e78babef48e17773917a93934e4a4a505b7c41;
      expv[55] = 177'h1c315374cd2e8240ec8e7ac31319d732e73f2ae19ad60;
      expv[56] = 177'h1ca18f39063639a449e1c9511be432a1c0bde9af52ef0;
      expv[57] = 177'h1d21db684013568d054717cb77b3ba3bb81133a1c46e0;
      expv[58] = 177'h0939a8cb59ad615523543cbaca4e4220384f1956e2f30;
      expv[59] = 177'h05d16c48936d369fa4f3f8f6f4cc25c3308c623126c8f;
      expv[60] = 177'h12743bae033a594de4a6d155a09e0dd9bacc8f451e353;
      expv[61] = 177'h0699bc4726122878c4c846e26612266e823063be1d839;
      expv[62] = 177'h18209ab9e1c2ffd1ebf749e07de7d800edf4ba4de727b;
      expv[63] = 177'h120e4b2fc116866bc2e061c5f1facc23095ad81c9da86;
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
