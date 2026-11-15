// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 87;
  localparam OW = 184;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05346 dut (
    .core_clk(clk),
    .core_rst(in_vec[86:86]),
    .cl_enable(in_vec[85:85]),
    .dl0_forcerxmode(in_vec[84:84]),
    .dl0_enable(in_vec[83:83]),
    .dl1_forcerxmode(in_vec[82:82]),
    .dl1_enable(in_vec[81:81]),
    .dl2_forcerxmode(in_vec[80:80]),
    .dl2_enable(in_vec[79:79]),
    .dl3_forcerxmode(in_vec[78:78]),
    .dl3_enable(in_vec[77:77]),
    .s_axi_aclk(in_vec[76:76]),
    .s_axi_aresetn(in_vec[75:75]),
    .s_axi_awaddr(in_vec[74:68]),
    .s_axi_awvalid(in_vec[67:67]),
    .s_axi_araddr(in_vec[66:60]),
    .s_axi_arvalid(in_vec[59:59]),
    .s_axi_wdata(in_vec[58:27]),
    .s_axi_wstrb(in_vec[26:23]),
    .s_axi_wvalid(in_vec[22:22]),
    .s_axi_rready(in_vec[21:21]),
    .s_axi_bready(in_vec[20:20]),
    .clk_hs_rxp(in_vec[19:19]),
    .clk_hs_rxn(in_vec[18:18]),
    .data_hs_rxp(in_vec[17:14]),
    .data_hs_rxn(in_vec[13:10]),
    .clk_lp_rxp(in_vec[9:9]),
    .clk_lp_rxn(in_vec[8:8]),
    .data_lp_rxp(in_vec[7:4]),
    .data_lp_rxn(in_vec[3:0]),
    .rxbyteclkhs(out_vec[183:183]),
    .system_rst_out(out_vec[182:182]),
    .init_done(out_vec[181:181]),
    .cl_rxclkactivehs(out_vec[180:180]),
    .cl_stopstate(out_vec[179:179]),
    .cl_rxulpsclknot(out_vec[178:178]),
    .cl_ulpsactivenot(out_vec[177:177]),
    .dl0_rxdatahs(out_vec[176:169]),
    .dl0_rxvalidhs(out_vec[168:168]),
    .dl0_rxactivehs(out_vec[167:167]),
    .dl0_rxsynchs(out_vec[166:166]),
    .dl0_stopstate(out_vec[165:165]),
    .dl0_ulpsactivenot(out_vec[164:164]),
    .dl0_rxclkesc(out_vec[163:163]),
    .dl0_rxlpdtesc(out_vec[162:162]),
    .dl0_rxulpsesc(out_vec[161:161]),
    .dl0_rxtriggeresc(out_vec[160:157]),
    .dl0_rxdataesc(out_vec[156:149]),
    .dl0_rxvalidesc(out_vec[148:148]),
    .dl0_errsoths(out_vec[147:147]),
    .dl0_errsotsynchs(out_vec[146:146]),
    .dl0_erresc(out_vec[145:145]),
    .dl0_errsyncesc(out_vec[144:144]),
    .dl0_errcontrol(out_vec[143:143]),
    .dl1_rxdatahs(out_vec[142:135]),
    .dl1_rxvalidhs(out_vec[134:134]),
    .dl1_rxactivehs(out_vec[133:133]),
    .dl1_rxsynchs(out_vec[132:132]),
    .dl1_stopstate(out_vec[131:131]),
    .dl1_ulpsactivenot(out_vec[130:130]),
    .dl1_rxclkesc(out_vec[129:129]),
    .dl1_rxlpdtesc(out_vec[128:128]),
    .dl1_rxulpsesc(out_vec[127:127]),
    .dl1_rxtriggeresc(out_vec[126:123]),
    .dl1_rxdataesc(out_vec[122:115]),
    .dl1_rxvalidesc(out_vec[114:114]),
    .dl1_errsoths(out_vec[113:113]),
    .dl1_errsotsynchs(out_vec[112:112]),
    .dl1_erresc(out_vec[111:111]),
    .dl1_errsyncesc(out_vec[110:110]),
    .dl1_errcontrol(out_vec[109:109]),
    .dl2_rxdatahs(out_vec[108:101]),
    .dl2_rxvalidhs(out_vec[100:100]),
    .dl2_rxactivehs(out_vec[99:99]),
    .dl2_rxsynchs(out_vec[98:98]),
    .dl2_stopstate(out_vec[97:97]),
    .dl2_ulpsactivenot(out_vec[96:96]),
    .dl2_rxclkesc(out_vec[95:95]),
    .dl2_rxlpdtesc(out_vec[94:94]),
    .dl2_rxulpsesc(out_vec[93:93]),
    .dl2_rxtriggeresc(out_vec[92:89]),
    .dl2_rxdataesc(out_vec[88:81]),
    .dl2_rxvalidesc(out_vec[80:80]),
    .dl2_errsoths(out_vec[79:79]),
    .dl2_errsotsynchs(out_vec[78:78]),
    .dl2_erresc(out_vec[77:77]),
    .dl2_errsyncesc(out_vec[76:76]),
    .dl2_errcontrol(out_vec[75:75]),
    .dl3_rxdatahs(out_vec[74:67]),
    .dl3_rxvalidhs(out_vec[66:66]),
    .dl3_rxactivehs(out_vec[65:65]),
    .dl3_rxsynchs(out_vec[64:64]),
    .dl3_stopstate(out_vec[63:63]),
    .dl3_ulpsactivenot(out_vec[62:62]),
    .dl3_rxclkesc(out_vec[61:61]),
    .dl3_rxlpdtesc(out_vec[60:60]),
    .dl3_rxulpsesc(out_vec[59:59]),
    .dl3_rxtriggeresc(out_vec[58:55]),
    .dl3_rxdataesc(out_vec[54:47]),
    .dl3_rxvalidesc(out_vec[46:46]),
    .dl3_errsoths(out_vec[45:45]),
    .dl3_errsotsynchs(out_vec[44:44]),
    .dl3_erresc(out_vec[43:43]),
    .dl3_errsyncesc(out_vec[42:42]),
    .dl3_errcontrol(out_vec[41:41]),
    .s_axi_awready(out_vec[40:40]),
    .s_axi_arready(out_vec[39:39]),
    .s_axi_wready(out_vec[38:38]),
    .s_axi_rdata(out_vec[37:6]),
    .s_axi_rresp(out_vec[5:4]),
    .s_axi_rvalid(out_vec[3:3]),
    .s_axi_bresp(out_vec[2:1]),
    .s_axi_bvalid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 87'h7a525121b0841834437755;
    stim[1] = 87'h4548c638072f45b8cf07b1;
    stim[2] = 87'h04eb648896d96f18889ecd;
    stim[3] = 87'h3ccd8f1b30fc55bacf598f;
    stim[4] = 87'h1cee2abe2be51d57da9f1d;
    stim[5] = 87'h026064e3fc8c7d6cc8a882;
    stim[6] = 87'h34a52a8f506adfa9422c9b;
    stim[7] = 87'h17222c3e525298ab6f0f6c;
    stim[8] = 87'h39b4c3d819977b99474134;
    stim[9] = 87'h39e9fea61ed9e09babae99;
    stim[10] = 87'h3bc351271cce907ec45cfd;
    stim[11] = 87'h1a74665145fc99c8b97e76;
    stim[12] = 87'h11dfe65543812238414270;
    stim[13] = 87'h2fc26048abf2be7d659052;
    stim[14] = 87'h27be2e9e8c2b44c6e8c015;
    stim[15] = 87'h092d443142b47f70cf5976;
    stim[16] = 87'h330416c427a63adf23368e;
    stim[17] = 87'h0014bb2aeea34b8cf90339;
    stim[18] = 87'h33ec49964c1164e561575a;
    stim[19] = 87'h2ee002161cd2f1cd7c0030;
    stim[20] = 87'h2c47ad27c41804329d5ecf;
    stim[21] = 87'h08073d6016d6b22f91e015;
    stim[22] = 87'h319d13aa58a1c0300b24d9;
    stim[23] = 87'h1aa4a60b1d377cb6170768;
    stim[24] = 87'h1d8ffdb69e10bce39aae0c;
    stim[25] = 87'h38cd582fdb2a419a735d53;
    stim[26] = 87'h31d252d013a6b21d363276;
    stim[27] = 87'h3fa6b2c19ef699a9a8791c;
    stim[28] = 87'h262bf07fa9dd02d72532ab;
    stim[29] = 87'h34342099326127aae245f8;
    stim[30] = 87'h0fcf5cb23fcffdf0101831;
    stim[31] = 87'h217b323c75e7f90c0bf84e;
    stim[32] = 87'h2ded7f1ebfe9f46ae36291;
    stim[33] = 87'h3943be38818be2ede74be2;
    stim[34] = 87'h28c4fc084b5a2ac0af541a;
    stim[35] = 87'h20c741354fc5848e07bd43;
    stim[36] = 87'h1bcf56b85307c425f7d781;
    stim[37] = 87'h3bf65175a6f8f60f930365;
    stim[38] = 87'h3a85089eaa2f028948b215;
    stim[39] = 87'h1a613d4661eeccd23f97c2;
    stim[40] = 87'h007e5cc7bbc5eda0db232c;
    stim[41] = 87'h180949837a8a30ba0afed5;
    stim[42] = 87'h12fe8b278f531bc2145a8f;
    stim[43] = 87'h37333a28735cc79aba8421;
    stim[44] = 87'h20983c838a9aafcea2418e;
    stim[45] = 87'h118e9b1aad925a84f08e01;
    stim[46] = 87'h3d4e5be2c4e64f82755658;
    stim[47] = 87'h0d1da06303931f22a09cdf;
    stim[48] = 87'h225f31195a3489f948fd3e;
    stim[49] = 87'h108356af6674198c56ff51;
    stim[50] = 87'h045bdb01c7efd7fa614ed2;
    stim[51] = 87'h26985515ae2f8ef7e2f163;
    stim[52] = 87'h14fe6d015e952f4a8f31d4;
    stim[53] = 87'h143da66ecd9c9225a1b8d3;
    stim[54] = 87'h20a3d680c614093d430bc1;
    stim[55] = 87'h1f3f337b171ebd976e2462;
    stim[56] = 87'h01a910d0b4a5009db969ab;
    stim[57] = 87'h2d25e3ad0cff6a779fffd6;
    stim[58] = 87'h325af76c521123736c5550;
    stim[59] = 87'h1916bdb1894a059997dc43;
    stim[60] = 87'h1bed48f1fc12df26fd822a;
    stim[61] = 87'h028560ac6ef9b04ada4ec1;
    stim[62] = 87'h3d400eae3f63f147eda293;
    stim[63] = 87'h056c74a5ceece6bbae7208;
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
      expv[0] = 184'hxx01xxxxxxx0xxxxxxx01xxxxxxx0xxxxxxxxxxxxxxxxx;
      expv[1] = 184'hxx01xxxxxxx0xxxxxxx01xxxxxxx0xxxxxxxxxxxxxxxxx;
      expv[2] = 184'hxx01xxxxxxx0xxxxxxx01xxxxxxx0xxxxxxxxxxxxxxxxx;
      expv[3] = 184'hxx03xxxxxxx0xxxxxxx03xxxxxxx0xxxxxxxxxxxxxxxxx;
      expv[4] = 184'hxx05xxxxxxx1xxxxxxx05xxxxxxx1xxxxxxxxxxxxxxxxx;
      expv[5] = 184'hxx07xxxxxxx1xxxxxxx07xxxxxxx1xxxxxxxxxxxxxxxxx;
      expv[6] = 184'hxx09xxxxxxx2xxxxxxx09xxxxxxx2xxxxxxxxxxxxxxxxx;
      expv[7] = 184'hxx0bxxxxxxx2xxxxxxx0bxxxxxxx2xxxxxxxxxxxxxxxxx;
      expv[8] = 184'hxx0dxxxxxxx3xxxxxxx0dxxxxxxx3xxxxxxxxxxxxxxxxx;
      expv[9] = 184'hxx0fxxxxxxx3xxxxxxx0fxxxxxxx3xxxxxxxxxxxxxxxxx;
      expv[10] = 184'hxx11xxxxxxx4xxxxxxx11xxxxxxx4xxxxxxxxxxxxxxxxx;
      expv[11] = 184'hxx13xxxxxxx4xxxxxxx13xxxxxxx4xxxxxxxxxxxxxxxxx;
      expv[12] = 184'hxx15xxxxxxx5xxxxxxx15xxxxxxx5xxxxxxxxxxxxxxxxx;
      expv[13] = 184'hxx17xxxxxxx5xxxxxxx17xxxxxxx5xxxxxxxxxxxxxxxxx;
      expv[14] = 184'hxx19xxxxxxx6xxxxxxx19xxxxxxx6xxxxxxxxxxxxxxxxx;
      expv[15] = 184'hxx1bxxxxxxx6xxxxxxx1bxxxxxxx6xxxxxxxxxxxxxxxxx;
      expv[16] = 184'hxx1dxxxxxxx7xxxxxxx1dxxxxxxx7xxxxxxxxxxxxxxxxx;
      expv[17] = 184'hxx1fxxxxxxx7xxxxxxx1fxxxxxxx7xxxxxxxxxxxxxxxxx;
      expv[18] = 184'hxx21xxxxxxx8xxxxxxx21xxxxxxx8xxxxxxxxxxxxxxxxx;
      expv[19] = 184'hxx23xxxxxxx8xxxxxxx23xxxxxxx8xxxxxxxxxxxxxxxxx;
      expv[20] = 184'hxx25xxxxxxx9xxxxxxx25xxxxxxx9xxxxxxxxxxxxxxxxx;
      expv[21] = 184'hxx27xxxxxxx9xxxxxxx27xxxxxxx9xxxxxxxxxxxxxxxxx;
      expv[22] = 184'hxx29xxxxxxxaxxxxxxx29xxxxxxxaxxxxxxxxxxxxxxxxx;
      expv[23] = 184'hxx2bxxxxxxxaxxxxxxx2bxxxxxxxaxxxxxxxxxxxxxxxxx;
      expv[24] = 184'hxx2dxxxxxxxbxxxxxxx2dxxxxxxxbxxxxxxxxxxxxxxxxx;
      expv[25] = 184'hxx2fxxxxxxxbxxxxxxx2fxxxxxxxbxxxxxxxxxxxxxxxxx;
      expv[26] = 184'hxx31xxxxxxxcxxxxxxx31xxxxxxxcxxxxxxxxxxxxxxxxx;
      expv[27] = 184'hxx33xxxxxxxcxxxxxxx33xxxxxxxcxxxxxxxxxxxxxxxxx;
      expv[28] = 184'hxx35xxxxxxxdxxxxxxx35xxxxxxxdxxxxxxxxxxxxxxxxx;
      expv[29] = 184'hxx37xxxxxxxdxxxxxxx37xxxxxxxdxxxxxxxxxxxxxxxxx;
      expv[30] = 184'hxx39xxxxxxxexxxxxxx39xxxxxxxexxxxxxxxxxxxxxxxx;
      expv[31] = 184'hxx3bxxxxxxxexxxxxxx3bxxxxxxxexxxxxxxxxxxxxxxxx;
      expv[32] = 184'hxx3dxxxxxxxfxxxxxxx3dxxxxxxxfxxxxxxxxxxxxxxxxx;
      expv[33] = 184'hxx3fxxxxxxxfxxxxxxx3fxxxxxxxfxxxxxxxxxxxxxxxxx;
      expv[34] = 184'hxx41xxxxxxx0xxxxxxx41xxxxxxx0xxxxxxxxxxxxxxxxx;
      expv[35] = 184'hxx43xxxxxxx0xxxxxxx43xxxxxxx0xxxxxxxxxxxxxxxxx;
      expv[36] = 184'hxx45xxxxxxx1xxxxxxx45xxxxxxx1xxxxxxxxxxxxxxxxx;
      expv[37] = 184'hxx47xxxxxxx1xxxxxxx47xxxxxxx1xxxxxxxxxxxxxxxxx;
      expv[38] = 184'hxx49xxxxxxx2xxxxxxx49xxxxxxx2xxxxxxxxxxxxxxxxx;
      expv[39] = 184'hxx4bxxxxxxx2xxxxxxx4bxxxxxxx2xxxxxxxxxxxxxxxxx;
      expv[40] = 184'hxx4dxxxxxxx3xxxxxxx4dxxxxxxx3xxxxxxxxxxxxxxxxx;
      expv[41] = 184'hxx4fxxxxxxx3xxxxxxx4fxxxxxxx3xxxxxxxxxxxxxxxxx;
      expv[42] = 184'hxx51xxxxxxx4xxxxxxx51xxxxxxx4xxxxxxxxxxxxxxxxx;
      expv[43] = 184'hxx53xxxxxxx4xxxxxxx53xxxxxxx4xxxxxxxxxxxxxxxxx;
      expv[44] = 184'hxx55xxxxxxx5xxxxxxx55xxxxxxx5xxxxxxxxxxxxxxxxx;
      expv[45] = 184'hxx57xxxxxxx5xxxxxxx57xxxxxxx5xxxxxxxxxxxxxxxxx;
      expv[46] = 184'hxx59xxxxxxx6xxxxxxx59xxxxxxx6xxxxxxxxxxxxxxxxx;
      expv[47] = 184'hxx5bxxxxxxx6xxxxxxx5bxxxxxxx6xxxxxxxxxxxxxxxxx;
      expv[48] = 184'hxx5dxxxxxxx7xxxxxxx5dxxxxxxx7xxxxxxxxxxxxxxxxx;
      expv[49] = 184'hxx5fxxxxxxx7xxxxxxx5fxxxxxxx7xxxxxxxxxxxxxxxxx;
      expv[50] = 184'hxx61xxxxxxx8xxxxxxx61xxxxxxx8xxxxxxxxxxxxxxxxx;
      expv[51] = 184'hxx63xxxxxxx8xxxxxxx63xxxxxxx8xxxxxxxxxxxxxxxxx;
      expv[52] = 184'hxx65xxxxxxx9xxxxxxx65xxxxxxx9xxxxxxxxxxxxxxxxx;
      expv[53] = 184'hxx67xxxxxxx9xxxxxxx67xxxxxxx9xxxxxxxxxxxxxxxxx;
      expv[54] = 184'hxx69xxxxxxxaxxxxxxx69xxxxxxxaxxxxxxxxxxxxxxxxx;
      expv[55] = 184'hxx6bxxxxxxxaxxxxxxx6bxxxxxxxaxxxxxxxxxxxxxxxxx;
      expv[56] = 184'hxx6dxxxxxxxbxxxxxxx6dxxxxxxxbxxxxxxxxxxxxxxxxx;
      expv[57] = 184'hxx6fxxxxxxxbxxxxxxx6fxxxxxxxbxxxxxxxxxxxxxxxxx;
      expv[58] = 184'hxx71xxxxxxxcxxxxxxx71xxxxxxxcxxxxxxxxxxxxxxxxx;
      expv[59] = 184'hxx73xxxxxxxcxxxxxxx73xxxxxxxcxxxxxxxxxxxxxxxxx;
      expv[60] = 184'hxx75xxxxxxxdxxxxxxx75xxxxxxxdxxxxxxxxxxxxxxxxx;
      expv[61] = 184'hxx77xxxxxxxdxxxxxxx77xxxxxxxdxxxxxxxxxxxxxxxxx;
      expv[62] = 184'hxx79xxxxxxxexxxxxxx79xxxxxxxexxxxxxxxxxxxxxxxx;
      expv[63] = 184'hxx7bxxxxxxxexxxxxxx7bxxxxxxxexxxxxxxxxxxxxxxxx;
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
