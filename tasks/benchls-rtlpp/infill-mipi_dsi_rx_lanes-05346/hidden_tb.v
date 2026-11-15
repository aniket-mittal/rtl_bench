// Hidden tests: 5000 cycles of seeded random inputs (seed 1671472661); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 184;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [6:0] i_12;
  reg [0:0] i_13;
  reg [6:0] i_14;
  reg [0:0] i_15;
  reg [31:0] i_16;
  reg [3:0] i_17;
  reg [0:0] i_18;
  reg [0:0] i_19;
  reg [0:0] i_20;
  reg [0:0] i_21;
  reg [0:0] i_22;
  reg [3:0] i_23;
  reg [3:0] i_24;
  reg [0:0] i_25;
  reg [0:0] i_26;
  reg [3:0] i_27;
  reg [3:0] i_28;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_05346 dut (
    .core_clk(clk),
    .core_rst(i_0),
    .cl_enable(i_1),
    .dl0_forcerxmode(i_2),
    .dl0_enable(i_3),
    .dl1_forcerxmode(i_4),
    .dl1_enable(i_5),
    .dl2_forcerxmode(i_6),
    .dl2_enable(i_7),
    .dl3_forcerxmode(i_8),
    .dl3_enable(i_9),
    .s_axi_aclk(i_10),
    .s_axi_aresetn(i_11),
    .s_axi_awaddr(i_12),
    .s_axi_awvalid(i_13),
    .s_axi_araddr(i_14),
    .s_axi_arvalid(i_15),
    .s_axi_wdata(i_16),
    .s_axi_wstrb(i_17),
    .s_axi_wvalid(i_18),
    .s_axi_rready(i_19),
    .s_axi_bready(i_20),
    .clk_hs_rxp(i_21),
    .clk_hs_rxn(i_22),
    .data_hs_rxp(i_23),
    .data_hs_rxn(i_24),
    .clk_lp_rxp(i_25),
    .clk_lp_rxn(i_26),
    .data_lp_rxp(i_27),
    .data_lp_rxn(i_28),
    .rxbyteclkhs(out_dut[183:183]),
    .system_rst_out(out_dut[182:182]),
    .init_done(out_dut[181:181]),
    .cl_rxclkactivehs(out_dut[180:180]),
    .cl_stopstate(out_dut[179:179]),
    .cl_rxulpsclknot(out_dut[178:178]),
    .cl_ulpsactivenot(out_dut[177:177]),
    .dl0_rxdatahs(out_dut[176:169]),
    .dl0_rxvalidhs(out_dut[168:168]),
    .dl0_rxactivehs(out_dut[167:167]),
    .dl0_rxsynchs(out_dut[166:166]),
    .dl0_stopstate(out_dut[165:165]),
    .dl0_ulpsactivenot(out_dut[164:164]),
    .dl0_rxclkesc(out_dut[163:163]),
    .dl0_rxlpdtesc(out_dut[162:162]),
    .dl0_rxulpsesc(out_dut[161:161]),
    .dl0_rxtriggeresc(out_dut[160:157]),
    .dl0_rxdataesc(out_dut[156:149]),
    .dl0_rxvalidesc(out_dut[148:148]),
    .dl0_errsoths(out_dut[147:147]),
    .dl0_errsotsynchs(out_dut[146:146]),
    .dl0_erresc(out_dut[145:145]),
    .dl0_errsyncesc(out_dut[144:144]),
    .dl0_errcontrol(out_dut[143:143]),
    .dl1_rxdatahs(out_dut[142:135]),
    .dl1_rxvalidhs(out_dut[134:134]),
    .dl1_rxactivehs(out_dut[133:133]),
    .dl1_rxsynchs(out_dut[132:132]),
    .dl1_stopstate(out_dut[131:131]),
    .dl1_ulpsactivenot(out_dut[130:130]),
    .dl1_rxclkesc(out_dut[129:129]),
    .dl1_rxlpdtesc(out_dut[128:128]),
    .dl1_rxulpsesc(out_dut[127:127]),
    .dl1_rxtriggeresc(out_dut[126:123]),
    .dl1_rxdataesc(out_dut[122:115]),
    .dl1_rxvalidesc(out_dut[114:114]),
    .dl1_errsoths(out_dut[113:113]),
    .dl1_errsotsynchs(out_dut[112:112]),
    .dl1_erresc(out_dut[111:111]),
    .dl1_errsyncesc(out_dut[110:110]),
    .dl1_errcontrol(out_dut[109:109]),
    .dl2_rxdatahs(out_dut[108:101]),
    .dl2_rxvalidhs(out_dut[100:100]),
    .dl2_rxactivehs(out_dut[99:99]),
    .dl2_rxsynchs(out_dut[98:98]),
    .dl2_stopstate(out_dut[97:97]),
    .dl2_ulpsactivenot(out_dut[96:96]),
    .dl2_rxclkesc(out_dut[95:95]),
    .dl2_rxlpdtesc(out_dut[94:94]),
    .dl2_rxulpsesc(out_dut[93:93]),
    .dl2_rxtriggeresc(out_dut[92:89]),
    .dl2_rxdataesc(out_dut[88:81]),
    .dl2_rxvalidesc(out_dut[80:80]),
    .dl2_errsoths(out_dut[79:79]),
    .dl2_errsotsynchs(out_dut[78:78]),
    .dl2_erresc(out_dut[77:77]),
    .dl2_errsyncesc(out_dut[76:76]),
    .dl2_errcontrol(out_dut[75:75]),
    .dl3_rxdatahs(out_dut[74:67]),
    .dl3_rxvalidhs(out_dut[66:66]),
    .dl3_rxactivehs(out_dut[65:65]),
    .dl3_rxsynchs(out_dut[64:64]),
    .dl3_stopstate(out_dut[63:63]),
    .dl3_ulpsactivenot(out_dut[62:62]),
    .dl3_rxclkesc(out_dut[61:61]),
    .dl3_rxlpdtesc(out_dut[60:60]),
    .dl3_rxulpsesc(out_dut[59:59]),
    .dl3_rxtriggeresc(out_dut[58:55]),
    .dl3_rxdataesc(out_dut[54:47]),
    .dl3_rxvalidesc(out_dut[46:46]),
    .dl3_errsoths(out_dut[45:45]),
    .dl3_errsotsynchs(out_dut[44:44]),
    .dl3_erresc(out_dut[43:43]),
    .dl3_errsyncesc(out_dut[42:42]),
    .dl3_errcontrol(out_dut[41:41]),
    .s_axi_awready(out_dut[40:40]),
    .s_axi_arready(out_dut[39:39]),
    .s_axi_wready(out_dut[38:38]),
    .s_axi_rdata(out_dut[37:6]),
    .s_axi_rresp(out_dut[5:4]),
    .s_axi_rvalid(out_dut[3:3]),
    .s_axi_bresp(out_dut[2:1]),
    .s_axi_bvalid(out_dut[0:0])
  );
  rtlpp_05346__ref ref_i (
    .core_clk(clk),
    .core_rst(i_0),
    .cl_enable(i_1),
    .dl0_forcerxmode(i_2),
    .dl0_enable(i_3),
    .dl1_forcerxmode(i_4),
    .dl1_enable(i_5),
    .dl2_forcerxmode(i_6),
    .dl2_enable(i_7),
    .dl3_forcerxmode(i_8),
    .dl3_enable(i_9),
    .s_axi_aclk(i_10),
    .s_axi_aresetn(i_11),
    .s_axi_awaddr(i_12),
    .s_axi_awvalid(i_13),
    .s_axi_araddr(i_14),
    .s_axi_arvalid(i_15),
    .s_axi_wdata(i_16),
    .s_axi_wstrb(i_17),
    .s_axi_wvalid(i_18),
    .s_axi_rready(i_19),
    .s_axi_bready(i_20),
    .clk_hs_rxp(i_21),
    .clk_hs_rxn(i_22),
    .data_hs_rxp(i_23),
    .data_hs_rxn(i_24),
    .clk_lp_rxp(i_25),
    .clk_lp_rxn(i_26),
    .data_lp_rxp(i_27),
    .data_lp_rxn(i_28),
    .rxbyteclkhs(out_ref[183:183]),
    .system_rst_out(out_ref[182:182]),
    .init_done(out_ref[181:181]),
    .cl_rxclkactivehs(out_ref[180:180]),
    .cl_stopstate(out_ref[179:179]),
    .cl_rxulpsclknot(out_ref[178:178]),
    .cl_ulpsactivenot(out_ref[177:177]),
    .dl0_rxdatahs(out_ref[176:169]),
    .dl0_rxvalidhs(out_ref[168:168]),
    .dl0_rxactivehs(out_ref[167:167]),
    .dl0_rxsynchs(out_ref[166:166]),
    .dl0_stopstate(out_ref[165:165]),
    .dl0_ulpsactivenot(out_ref[164:164]),
    .dl0_rxclkesc(out_ref[163:163]),
    .dl0_rxlpdtesc(out_ref[162:162]),
    .dl0_rxulpsesc(out_ref[161:161]),
    .dl0_rxtriggeresc(out_ref[160:157]),
    .dl0_rxdataesc(out_ref[156:149]),
    .dl0_rxvalidesc(out_ref[148:148]),
    .dl0_errsoths(out_ref[147:147]),
    .dl0_errsotsynchs(out_ref[146:146]),
    .dl0_erresc(out_ref[145:145]),
    .dl0_errsyncesc(out_ref[144:144]),
    .dl0_errcontrol(out_ref[143:143]),
    .dl1_rxdatahs(out_ref[142:135]),
    .dl1_rxvalidhs(out_ref[134:134]),
    .dl1_rxactivehs(out_ref[133:133]),
    .dl1_rxsynchs(out_ref[132:132]),
    .dl1_stopstate(out_ref[131:131]),
    .dl1_ulpsactivenot(out_ref[130:130]),
    .dl1_rxclkesc(out_ref[129:129]),
    .dl1_rxlpdtesc(out_ref[128:128]),
    .dl1_rxulpsesc(out_ref[127:127]),
    .dl1_rxtriggeresc(out_ref[126:123]),
    .dl1_rxdataesc(out_ref[122:115]),
    .dl1_rxvalidesc(out_ref[114:114]),
    .dl1_errsoths(out_ref[113:113]),
    .dl1_errsotsynchs(out_ref[112:112]),
    .dl1_erresc(out_ref[111:111]),
    .dl1_errsyncesc(out_ref[110:110]),
    .dl1_errcontrol(out_ref[109:109]),
    .dl2_rxdatahs(out_ref[108:101]),
    .dl2_rxvalidhs(out_ref[100:100]),
    .dl2_rxactivehs(out_ref[99:99]),
    .dl2_rxsynchs(out_ref[98:98]),
    .dl2_stopstate(out_ref[97:97]),
    .dl2_ulpsactivenot(out_ref[96:96]),
    .dl2_rxclkesc(out_ref[95:95]),
    .dl2_rxlpdtesc(out_ref[94:94]),
    .dl2_rxulpsesc(out_ref[93:93]),
    .dl2_rxtriggeresc(out_ref[92:89]),
    .dl2_rxdataesc(out_ref[88:81]),
    .dl2_rxvalidesc(out_ref[80:80]),
    .dl2_errsoths(out_ref[79:79]),
    .dl2_errsotsynchs(out_ref[78:78]),
    .dl2_erresc(out_ref[77:77]),
    .dl2_errsyncesc(out_ref[76:76]),
    .dl2_errcontrol(out_ref[75:75]),
    .dl3_rxdatahs(out_ref[74:67]),
    .dl3_rxvalidhs(out_ref[66:66]),
    .dl3_rxactivehs(out_ref[65:65]),
    .dl3_rxsynchs(out_ref[64:64]),
    .dl3_stopstate(out_ref[63:63]),
    .dl3_ulpsactivenot(out_ref[62:62]),
    .dl3_rxclkesc(out_ref[61:61]),
    .dl3_rxlpdtesc(out_ref[60:60]),
    .dl3_rxulpsesc(out_ref[59:59]),
    .dl3_rxtriggeresc(out_ref[58:55]),
    .dl3_rxdataesc(out_ref[54:47]),
    .dl3_rxvalidesc(out_ref[46:46]),
    .dl3_errsoths(out_ref[45:45]),
    .dl3_errsotsynchs(out_ref[44:44]),
    .dl3_erresc(out_ref[43:43]),
    .dl3_errsyncesc(out_ref[42:42]),
    .dl3_errcontrol(out_ref[41:41]),
    .s_axi_awready(out_ref[40:40]),
    .s_axi_arready(out_ref[39:39]),
    .s_axi_wready(out_ref[38:38]),
    .s_axi_rdata(out_ref[37:6]),
    .s_axi_rresp(out_ref[5:4]),
    .s_axi_rvalid(out_ref[3:3]),
    .s_axi_bresp(out_ref[2:1]),
    .s_axi_bvalid(out_ref[0:0])
  );

  task check;
    begin
      bad = 0;
      for (b = 0; b < OW; b = b + 1)
        if (out_ref[b] !== 1'bx && out_dut[b] !== out_ref[b]) bad = 1;
      if (bad) begin
        mismatches = mismatches + 1;
        if (shown < 10) begin
          $display("MISMATCH cycle %0d: expected=%h got=%h", c, out_ref, out_dut);
          shown = shown + 1;
        end
      end
    end
  endtask

  initial begin
    seed = 1671472661;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      i_20 = {$random(seed)};
      i_21 = {$random(seed)};
      i_22 = {$random(seed)};
      i_23 = {$random(seed)};
      i_24 = {$random(seed)};
      i_25 = {$random(seed)};
      i_26 = {$random(seed)};
      i_27 = {$random(seed)};
      i_28 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
