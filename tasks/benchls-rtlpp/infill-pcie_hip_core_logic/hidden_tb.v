// Hidden tests: 5000 cycles of seeded random inputs (seed 330594397); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 134;
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
  reg [39:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  pcie_hip_core_logic dut (
    .clk(clk),
    .free_100MHz(i_0),
    .local_rstn(i_1),
    .pcie_rstn(i_2),
    .pipe_mode(i_3),
    .pld_clk(i_4),
    .refclk(i_5),
    .rx_in0(i_6),
    .rx_in1(i_7),
    .rx_in2(i_8),
    .rx_in3(i_9),
    .test_in(i_10),
    .gen2_speed(out_dut[133:133]),
    .lane_width_code(out_dut[132:129]),
    .phy_sel_code(out_dut[128:125]),
    .phystatus_ext(out_dut[124:124]),
    .powerdown_ext(out_dut[123:122]),
    .ref_clk_sel_code(out_dut[121:118]),
    .rxdata0_ext(out_dut[117:110]),
    .rxdata1_ext(out_dut[109:102]),
    .rxdata2_ext(out_dut[101:94]),
    .rxdata3_ext(out_dut[93:86]),
    .rxdatak0_ext(out_dut[85:85]),
    .rxdatak1_ext(out_dut[84:84]),
    .rxdatak2_ext(out_dut[83:83]),
    .rxdatak3_ext(out_dut[82:82]),
    .rxelecidle0_ext(out_dut[81:81]),
    .rxelecidle1_ext(out_dut[80:80]),
    .rxelecidle2_ext(out_dut[79:79]),
    .rxelecidle3_ext(out_dut[78:78]),
    .rxpolarity0_ext(out_dut[77:77]),
    .rxpolarity1_ext(out_dut[76:76]),
    .rxpolarity2_ext(out_dut[75:75]),
    .rxpolarity3_ext(out_dut[74:74]),
    .rxstatus0_ext(out_dut[73:71]),
    .rxstatus1_ext(out_dut[70:68]),
    .rxstatus2_ext(out_dut[67:65]),
    .rxstatus3_ext(out_dut[64:62]),
    .rxvalid0_ext(out_dut[61:61]),
    .rxvalid1_ext(out_dut[60:60]),
    .rxvalid2_ext(out_dut[59:59]),
    .rxvalid3_ext(out_dut[58:58]),
    .test_out_icm(out_dut[57:49]),
    .tx_out0(out_dut[48:48]),
    .tx_out1(out_dut[47:47]),
    .tx_out2(out_dut[46:46]),
    .tx_out3(out_dut[45:45]),
    .txcompl0_ext(out_dut[44:44]),
    .txcompl1_ext(out_dut[43:43]),
    .txcompl2_ext(out_dut[42:42]),
    .txcompl3_ext(out_dut[41:41]),
    .txdata0_ext(out_dut[40:33]),
    .txdata1_ext(out_dut[32:25]),
    .txdata2_ext(out_dut[24:17]),
    .txdata3_ext(out_dut[16:9]),
    .txdatak0_ext(out_dut[8:8]),
    .txdatak1_ext(out_dut[7:7]),
    .txdatak2_ext(out_dut[6:6]),
    .txdatak3_ext(out_dut[5:5]),
    .txdetectrx_ext(out_dut[4:4]),
    .txelecidle0_ext(out_dut[3:3]),
    .txelecidle1_ext(out_dut[2:2]),
    .txelecidle2_ext(out_dut[1:1]),
    .txelecidle3_ext(out_dut[0:0])
  );
  pcie_hip_core_logic__ref ref_i (
    .clk(clk),
    .free_100MHz(i_0),
    .local_rstn(i_1),
    .pcie_rstn(i_2),
    .pipe_mode(i_3),
    .pld_clk(i_4),
    .refclk(i_5),
    .rx_in0(i_6),
    .rx_in1(i_7),
    .rx_in2(i_8),
    .rx_in3(i_9),
    .test_in(i_10),
    .gen2_speed(out_ref[133:133]),
    .lane_width_code(out_ref[132:129]),
    .phy_sel_code(out_ref[128:125]),
    .phystatus_ext(out_ref[124:124]),
    .powerdown_ext(out_ref[123:122]),
    .ref_clk_sel_code(out_ref[121:118]),
    .rxdata0_ext(out_ref[117:110]),
    .rxdata1_ext(out_ref[109:102]),
    .rxdata2_ext(out_ref[101:94]),
    .rxdata3_ext(out_ref[93:86]),
    .rxdatak0_ext(out_ref[85:85]),
    .rxdatak1_ext(out_ref[84:84]),
    .rxdatak2_ext(out_ref[83:83]),
    .rxdatak3_ext(out_ref[82:82]),
    .rxelecidle0_ext(out_ref[81:81]),
    .rxelecidle1_ext(out_ref[80:80]),
    .rxelecidle2_ext(out_ref[79:79]),
    .rxelecidle3_ext(out_ref[78:78]),
    .rxpolarity0_ext(out_ref[77:77]),
    .rxpolarity1_ext(out_ref[76:76]),
    .rxpolarity2_ext(out_ref[75:75]),
    .rxpolarity3_ext(out_ref[74:74]),
    .rxstatus0_ext(out_ref[73:71]),
    .rxstatus1_ext(out_ref[70:68]),
    .rxstatus2_ext(out_ref[67:65]),
    .rxstatus3_ext(out_ref[64:62]),
    .rxvalid0_ext(out_ref[61:61]),
    .rxvalid1_ext(out_ref[60:60]),
    .rxvalid2_ext(out_ref[59:59]),
    .rxvalid3_ext(out_ref[58:58]),
    .test_out_icm(out_ref[57:49]),
    .tx_out0(out_ref[48:48]),
    .tx_out1(out_ref[47:47]),
    .tx_out2(out_ref[46:46]),
    .tx_out3(out_ref[45:45]),
    .txcompl0_ext(out_ref[44:44]),
    .txcompl1_ext(out_ref[43:43]),
    .txcompl2_ext(out_ref[42:42]),
    .txcompl3_ext(out_ref[41:41]),
    .txdata0_ext(out_ref[40:33]),
    .txdata1_ext(out_ref[32:25]),
    .txdata2_ext(out_ref[24:17]),
    .txdata3_ext(out_ref[16:9]),
    .txdatak0_ext(out_ref[8:8]),
    .txdatak1_ext(out_ref[7:7]),
    .txdatak2_ext(out_ref[6:6]),
    .txdatak3_ext(out_ref[5:5]),
    .txdetectrx_ext(out_ref[4:4]),
    .txelecidle0_ext(out_ref[3:3]),
    .txelecidle1_ext(out_ref[2:2]),
    .txelecidle2_ext(out_ref[1:1]),
    .txelecidle3_ext(out_ref[0:0])
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
    seed = 330594397;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed), $random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
