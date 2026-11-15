// Hidden tests: 5000 cycles of seeded random inputs (seed 4272414480); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 208;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [11:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [15:0] i_8;
  reg [15:0] i_9;
  reg [15:0] i_10;
  reg [15:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [15:0] i_16;
  reg [2:0] i_17;
  reg [0:0] i_18;
  reg [31:0] i_19;
  reg [3:0] i_20;
  reg [0:0] i_21;
  reg [0:0] i_22;
  reg [15:0] i_23;
  reg [2:0] i_24;
  reg [0:0] i_25;
  reg [0:0] i_26;
  reg [0:0] i_27;
  reg [31:0] i_28;
  reg [31:0] i_29;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_06424 dut (
    .clk(clk),
    .rx_clk_in(i_0),
    .rx_frame_in(i_1),
    .rx_data_in(i_2),
    .dac_sync_in(i_3),
    .tdd_sync(i_4),
    .gps_pps(i_5),
    .delay_clk(i_6),
    .adc_dovf(i_7),
    .dac_data_i0(i_8),
    .dac_data_q0(i_9),
    .dac_data_i1(i_10),
    .dac_data_q1(i_11),
    .dac_dunf(i_12),
    .s_axi_aclk(i_13),
    .s_axi_aresetn(i_14),
    .s_axi_awvalid(i_15),
    .s_axi_awaddr(i_16),
    .s_axi_awprot(i_17),
    .s_axi_wvalid(i_18),
    .s_axi_wdata(i_19),
    .s_axi_wstrb(i_20),
    .s_axi_bready(i_21),
    .s_axi_arvalid(i_22),
    .s_axi_araddr(i_23),
    .s_axi_arprot(i_24),
    .s_axi_rready(i_25),
    .up_enable(i_26),
    .up_txnrx(i_27),
    .up_dac_gpio_in(i_28),
    .up_adc_gpio_in(i_29),
    .tx_clk_out(out_dut[207:207]),
    .tx_frame_out(out_dut[206:206]),
    .tx_data_out(out_dut[205:194]),
    .enable(out_dut[193:193]),
    .txnrx(out_dut[192:192]),
    .dac_sync_out(out_dut[191:191]),
    .tdd_sync_cntr(out_dut[190:190]),
    .gps_pps_irq(out_dut[189:189]),
    .l_clk(out_dut[188:188]),
    .rst(out_dut[187:187]),
    .adc_enable_i0(out_dut[186:186]),
    .adc_valid_i0(out_dut[185:185]),
    .adc_data_i0(out_dut[184:169]),
    .adc_enable_q0(out_dut[168:168]),
    .adc_valid_q0(out_dut[167:167]),
    .adc_data_q0(out_dut[166:151]),
    .adc_enable_i1(out_dut[150:150]),
    .adc_valid_i1(out_dut[149:149]),
    .adc_data_i1(out_dut[148:133]),
    .adc_enable_q1(out_dut[132:132]),
    .adc_valid_q1(out_dut[131:131]),
    .adc_data_q1(out_dut[130:115]),
    .adc_r1_mode(out_dut[114:114]),
    .dac_enable_i0(out_dut[113:113]),
    .dac_valid_i0(out_dut[112:112]),
    .dac_enable_q0(out_dut[111:111]),
    .dac_valid_q0(out_dut[110:110]),
    .dac_enable_i1(out_dut[109:109]),
    .dac_valid_i1(out_dut[108:108]),
    .dac_enable_q1(out_dut[107:107]),
    .dac_valid_q1(out_dut[106:106]),
    .dac_r1_mode(out_dut[105:105]),
    .s_axi_awready(out_dut[104:104]),
    .s_axi_wready(out_dut[103:103]),
    .s_axi_bvalid(out_dut[102:102]),
    .s_axi_bresp(out_dut[101:100]),
    .s_axi_arready(out_dut[99:99]),
    .s_axi_rvalid(out_dut[98:98]),
    .s_axi_rdata(out_dut[97:66]),
    .s_axi_rresp(out_dut[65:64]),
    .up_dac_gpio_out(out_dut[63:32]),
    .up_adc_gpio_out(out_dut[31:0])
  );
  rtlpp_06424__ref ref_i (
    .clk(clk),
    .rx_clk_in(i_0),
    .rx_frame_in(i_1),
    .rx_data_in(i_2),
    .dac_sync_in(i_3),
    .tdd_sync(i_4),
    .gps_pps(i_5),
    .delay_clk(i_6),
    .adc_dovf(i_7),
    .dac_data_i0(i_8),
    .dac_data_q0(i_9),
    .dac_data_i1(i_10),
    .dac_data_q1(i_11),
    .dac_dunf(i_12),
    .s_axi_aclk(i_13),
    .s_axi_aresetn(i_14),
    .s_axi_awvalid(i_15),
    .s_axi_awaddr(i_16),
    .s_axi_awprot(i_17),
    .s_axi_wvalid(i_18),
    .s_axi_wdata(i_19),
    .s_axi_wstrb(i_20),
    .s_axi_bready(i_21),
    .s_axi_arvalid(i_22),
    .s_axi_araddr(i_23),
    .s_axi_arprot(i_24),
    .s_axi_rready(i_25),
    .up_enable(i_26),
    .up_txnrx(i_27),
    .up_dac_gpio_in(i_28),
    .up_adc_gpio_in(i_29),
    .tx_clk_out(out_ref[207:207]),
    .tx_frame_out(out_ref[206:206]),
    .tx_data_out(out_ref[205:194]),
    .enable(out_ref[193:193]),
    .txnrx(out_ref[192:192]),
    .dac_sync_out(out_ref[191:191]),
    .tdd_sync_cntr(out_ref[190:190]),
    .gps_pps_irq(out_ref[189:189]),
    .l_clk(out_ref[188:188]),
    .rst(out_ref[187:187]),
    .adc_enable_i0(out_ref[186:186]),
    .adc_valid_i0(out_ref[185:185]),
    .adc_data_i0(out_ref[184:169]),
    .adc_enable_q0(out_ref[168:168]),
    .adc_valid_q0(out_ref[167:167]),
    .adc_data_q0(out_ref[166:151]),
    .adc_enable_i1(out_ref[150:150]),
    .adc_valid_i1(out_ref[149:149]),
    .adc_data_i1(out_ref[148:133]),
    .adc_enable_q1(out_ref[132:132]),
    .adc_valid_q1(out_ref[131:131]),
    .adc_data_q1(out_ref[130:115]),
    .adc_r1_mode(out_ref[114:114]),
    .dac_enable_i0(out_ref[113:113]),
    .dac_valid_i0(out_ref[112:112]),
    .dac_enable_q0(out_ref[111:111]),
    .dac_valid_q0(out_ref[110:110]),
    .dac_enable_i1(out_ref[109:109]),
    .dac_valid_i1(out_ref[108:108]),
    .dac_enable_q1(out_ref[107:107]),
    .dac_valid_q1(out_ref[106:106]),
    .dac_r1_mode(out_ref[105:105]),
    .s_axi_awready(out_ref[104:104]),
    .s_axi_wready(out_ref[103:103]),
    .s_axi_bvalid(out_ref[102:102]),
    .s_axi_bresp(out_ref[101:100]),
    .s_axi_arready(out_ref[99:99]),
    .s_axi_rvalid(out_ref[98:98]),
    .s_axi_rdata(out_ref[97:66]),
    .s_axi_rresp(out_ref[65:64]),
    .up_dac_gpio_out(out_ref[63:32]),
    .up_adc_gpio_out(out_ref[31:0])
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
    seed = 4272414480;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
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
      i_14 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
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
      i_29 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
