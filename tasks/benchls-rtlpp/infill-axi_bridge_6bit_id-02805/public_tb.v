// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 218;
  localparam OW = 165;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02805 dut (
    .aclk(clk),
    .aresetn(in_vec[217:217]),
    .s_axi_awid(in_vec[216:211]),
    .s_axi_awaddr(in_vec[210:179]),
    .s_axi_awlen(in_vec[178:171]),
    .s_axi_awsize(in_vec[170:168]),
    .s_axi_awburst(in_vec[167:166]),
    .s_axi_awlock(in_vec[165:165]),
    .s_axi_awcache(in_vec[164:161]),
    .s_axi_awprot(in_vec[160:158]),
    .s_axi_awregion(in_vec[157:154]),
    .s_axi_awqos(in_vec[153:150]),
    .s_axi_awvalid(in_vec[149:149]),
    .s_axi_wdata(in_vec[148:117]),
    .s_axi_wstrb(in_vec[116:113]),
    .s_axi_wlast(in_vec[112:112]),
    .s_axi_wvalid(in_vec[111:111]),
    .s_axi_bready(in_vec[110:110]),
    .s_axi_arid(in_vec[109:104]),
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
    .s_axi_awready(out_vec[164:164]),
    .s_axi_wready(out_vec[163:163]),
    .s_axi_bid(out_vec[162:157]),
    .s_axi_bresp(out_vec[156:155]),
    .s_axi_bvalid(out_vec[154:154]),
    .s_axi_arready(out_vec[153:153]),
    .s_axi_rid(out_vec[152:147]),
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
    stim[0] = 218'h11d3bbe99f385a59ebb14a5f90275c62f95f99ccfdcb15919f0ac13;
    stim[1] = 218'h1f379b3fb8f229789ed7378e5e298720826d0c22df5b6ca2cef9f52;
    stim[2] = 218'h2aaee1d2d2fda1d0affba6697e27e59c2928595bd0b7f07495315c0;
    stim[3] = 218'h2a16d4c58e1aa66df2c687c15d76d0e306bfc444ea41b855d8fdebd;
    stim[4] = 218'h2a63e60d3af50d166b35e49ddda130ae1ef3fdd7eadd370501a0887;
    stim[5] = 218'h21cde0a481fedb1e9190b5fb2d44e8c9f38da960aedea600a4a491c;
    stim[6] = 218'h3a08ed05c6b3ed1643fd2f9c11c1723bdeda0a6bc4712ffee4b48f3;
    stim[7] = 218'h27d7505c4fb4dfac0283d2f1c2ae4ccb523ab5aa744f77acad2d7b0;
    stim[8] = 218'h20406d398beb058f05192315364a8f8c653be70e9b6f4f68ad10d08;
    stim[9] = 218'h3508ef719afd4744d5c2667334af31102a8e5d4de32a495b95042e9;
    stim[10] = 218'h3067b34de6bbea3069b4f06f27ef418df99b0ae2693bfc7ab6f6655;
    stim[11] = 218'h3be7cd8c065ff657f3b4c5460367033164c063f3dcf90ec93ca77bb;
    stim[12] = 218'h316a76d27778cc4ce0c595aae908066c5192d00dcaeb3f7dde1f940;
    stim[13] = 218'h33f35972ac1d41f2c610978c4da05c08ed90080d7f4c07ab0a6c1a2;
    stim[14] = 218'h243668d41caecea1761bedff505221d436f677b47b53cea8bcf0627;
    stim[15] = 218'h2dc9b9d4cba373295bb300223eb433cf724e644c939e2b8a765c56b;
    stim[16] = 218'h20900929c98dc865ba060145df9dec0d50b853c5935e455e452eb02;
    stim[17] = 218'h2a152b24d6ed5ac9dbba48d5a017c92f50e679bcfa1327950d7c7eb;
    stim[18] = 218'h2d3bd06cb5ebb17bb7e361ff8fcad36bddf9009e921eab9cdf63347;
    stim[19] = 218'h2e9d0c6f31e43d2682ae3edc4bec74ed6dc5dbc47135c2156796d57;
    stim[20] = 218'h3e55d9b5d63efccf25bff9c08f5ba8b4b84bca5ab55eaee6d9f367a;
    stim[21] = 218'h22d8848d20819191258748f981c114db67477a56bf1004b6e34aaa1;
    stim[22] = 218'h35ff89949362417cc2e055833e3b8d5fe8f6a339b1efc2edb451729;
    stim[23] = 218'h3947e3dcd2bf654be53b296b57707a67b34cb228c56dc131ca6e160;
    stim[24] = 218'h3244b4c304ab295868b4215817234c9e0bfa3fd03e0f66b33383441;
    stim[25] = 218'h28c1b1481266ffaf6da3eadd300a7821f27132294f84713a9768c39;
    stim[26] = 218'h2eb2b7f1a28ee20a23f1103808c8df8ec3142cbac16548606fd04ac;
    stim[27] = 218'h3e22e9d883a9bf9b142d68c7960c6008b13f993536a6ae2ec5ee292;
    stim[28] = 218'h2473ebe5657a9bbb841d42ec9eabb26a9199a38b6a7d43a226736ef;
    stim[29] = 218'h3615de67c0602eaf0a709d4291736412d7d06edd8c468afa16125f7;
    stim[30] = 218'h3c26be7d26c4e21816f13921ea500e4dc855c9a787afbaa20294c01;
    stim[31] = 218'h3475f3e995b44549a54feb398cd32a233844bf3d7d1e11a78cb12f0;
    stim[32] = 218'h3a2151c41d81274c7dfda4801705da601822ff1c5510f758d270368;
    stim[33] = 218'h3c0cca31757385f41aaaccf9876a2ee5250ebbcc61f6d9636a0c7e3;
    stim[34] = 218'h26ad8a4fb93bac14d6c5f61e22fc6357d8df694863e51181f046833;
    stim[35] = 218'h3e72d20053d4dd1e9dcec0df773d52b409a74b2266090aa390b8a62;
    stim[36] = 218'h3fb0e681fbc8b3f87ecea1f5dee339701da791202e1c709754ea4ab;
    stim[37] = 218'h319bde6e028076c8879a8d223057263ac91ae625808a853b3dd805c;
    stim[38] = 218'h3d69ea0f1e9776246bf1c0bde35ef7915ebdcfcc6a58d03a5cc44bc;
    stim[39] = 218'h38559ca23091a25cdb5c7d122305d238a347e8eb700f200fd972bdc;
    stim[40] = 218'h26a459faea88dbcf08f8ee84dd9f9155fd6e751e729dddbb02b1276;
    stim[41] = 218'h35cc59f3173ba58bb653452b7be7a76db04fca1c0caffcb895e994a;
    stim[42] = 218'h21090998d8ecf9498b217bce86e6b8c36b2e31082784bc1de86796f;
    stim[43] = 218'h3e14f160e134d12055088820552b5b34b2e58450cd296ed24e9ffef;
    stim[44] = 218'h20779bfa8c0cefcf2ac1e95d0e278fa7468523e816f778b3903865d;
    stim[45] = 218'h3db148b8f90b34fe5a6fe1a3a981d116be275305d8073153008a75d;
    stim[46] = 218'h3a61c37f55bc768fb9445841d2756e1bdf4cf6eab9e65a1db35516a;
    stim[47] = 218'h25c1f155146964132f525deea386277a20bf3d89b05671f74d3687a;
    stim[48] = 218'h2cfd103ea8446a22dfb4ee03ef85115e35b9f22af696f4cce4d7713;
    stim[49] = 218'h209c26fe197462ea4912ab65c70adb264e2a7bc03c7075f552616c9;
    stim[50] = 218'h25a6e184a688f9483cb37a34fc7d6d57693104ae8b56879aa0dfe93;
    stim[51] = 218'h2a94eab1b9f4566625d66510b59749b2f597d8b92b9451c1680da07;
    stim[52] = 218'h32d52d09d462380f6585daccbcdf3ef8434337e7f7ef7c96c0fa72b;
    stim[53] = 218'h21654aa0ad2b0a1071f6a7c28980ed980f71476f022f3ef204268f2;
    stim[54] = 218'h27d230c105d2ff646f66d0c92acc07ff651dfd58966ba6043ec4b4d;
    stim[55] = 218'h318832945f9419c7308f75e676835252228e9aa9c2a9d0eb0c9df58;
    stim[56] = 218'h2dc40ba102e1118622d2e129640f5d341158a9be43e04a8a9d75b0c;
    stim[57] = 218'h2202cd9d3f702111cb4007b559601c152072b5997fdb26be2daa7db;
    stim[58] = 218'h32a5e39c2f4953518f30c4c7ff50db12bc02ec159ce299a3e266be6;
    stim[59] = 218'h29b146bde502ecc5865227beb68713f12128be4de98c46bc379a599;
    stim[60] = 218'h3c1c6fd6094cc8cece7cc0c7425ae2177dbc87d51b6e3f1d31ef546;
    stim[61] = 218'h3e9fb80aeaaf6a4942a252b21c4373c3485d5b59af1d976266d1f7b;
    stim[62] = 218'h31d00701a220fe25d9c04bffaadf4ac0a3933693c1f89b9a21fb380;
    stim[63] = 218'h2f68b6ca25e7ca3d22cf1458bd4cd6cf5838e6c493b3150508e1470;
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
      expv[0] = 165'h000000000000000000000000000000000000000000;
      expv[1] = 165'h000000000000000000000000000000000000000000;
      expv[2] = 165'h000000000000000000000000000000000000000000;
      expv[3] = 165'h000000000000000000000000000000000000000000;
      expv[4] = 165'h000000000000000000000000000000000000000000;
      expv[5] = 165'h000000000000000000000000000000000000000000;
      expv[6] = 165'h000000000000000000000000000000000000000000;
      expv[7] = 165'h000000000000000000000000000000000000000000;
      expv[8] = 165'h000000000000000000000000000000000000000000;
      expv[9] = 165'h000000000000000000000000000000000000000000;
      expv[10] = 165'h000000000000000000000000000000000000000000;
      expv[11] = 165'h000000000000000000000000000000000000000000;
      expv[12] = 165'h000000000000000000000000000000000000000000;
      expv[13] = 165'h000000000000000000000000000000000000000000;
      expv[14] = 165'h000000000000000000000000000000000000000000;
      expv[15] = 165'h000000000000000000000000000000000000000000;
      expv[16] = 165'h000000000000000000000000000000000000000000;
      expv[17] = 165'h000000000000000000000000000000000000000000;
      expv[18] = 165'h000000000000000000000000000000000000000000;
      expv[19] = 165'h000000000000000000000000000000000000000000;
      expv[20] = 165'h000000000000000000000000000000000000000000;
      expv[21] = 165'h000000000000000000000000000000000000000000;
      expv[22] = 165'h000000000000000000000000000000000000000000;
      expv[23] = 165'h000000000000000000000000000000000000000000;
      expv[24] = 165'h000000000000000000000000000000000000000000;
      expv[25] = 165'h000000000000000000000000000000000000000000;
      expv[26] = 165'h000000000000000000000000000000000000000000;
      expv[27] = 165'h000000000000000000000000000000000000000000;
      expv[28] = 165'h000000000000000000000000000000000000000000;
      expv[29] = 165'h000000000000000000000000000000000000000000;
      expv[30] = 165'h000000000000000000000000000000000000000000;
      expv[31] = 165'h000000000000000000000000000000000000000000;
      expv[32] = 165'h000000000000000000000000000000000000000000;
      expv[33] = 165'h000000000000000000000000000000000000000000;
      expv[34] = 165'h000000000000000000000000000000000000000000;
      expv[35] = 165'h000000000000000000000000000000000000000000;
      expv[36] = 165'h000000000000000000000000000000000000000000;
      expv[37] = 165'h000000000000000000000000000000000000000000;
      expv[38] = 165'h000000000000000000000000000000000000000000;
      expv[39] = 165'h000000000000000000000000000000000000000000;
      expv[40] = 165'h000000000000000000000000000000000000000000;
      expv[41] = 165'h000000000000000000000000000000000000000000;
      expv[42] = 165'h000000000000000000000000000000000000000000;
      expv[43] = 165'h000000000000000000000000000000000000000000;
      expv[44] = 165'h000000000000000000000000000000000000000000;
      expv[45] = 165'h000000000000000000000000000000000000000000;
      expv[46] = 165'h000000000000000000000000000000000000000000;
      expv[47] = 165'h000000000000000000000000000000000000000000;
      expv[48] = 165'h000000000000000000000000000000000000000000;
      expv[49] = 165'h000000000000000000000000000000000000000000;
      expv[50] = 165'h000000000000000000000000000000000000000000;
      expv[51] = 165'h000000000000000000000000000000000000000000;
      expv[52] = 165'h000000000000000000000000000000000000000000;
      expv[53] = 165'h000000000000000000000000000000000000000000;
      expv[54] = 165'h000000000000000000000000000000000000000000;
      expv[55] = 165'h000000000000000000000000000000000000000000;
      expv[56] = 165'h000000000000000000000000000000000000000000;
      expv[57] = 165'h000000000000000000000000000000000000000000;
      expv[58] = 165'h000000000000000000000000000000000000000000;
      expv[59] = 165'h000000000000000000000000000000000000000000;
      expv[60] = 165'h000000000000000000000000000000000000000000;
      expv[61] = 165'h000000000000000000000000000000000000000000;
      expv[62] = 165'h000000000000000000000000000000000000000000;
      expv[63] = 165'h000000000000000000000000000000000000000000;
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
