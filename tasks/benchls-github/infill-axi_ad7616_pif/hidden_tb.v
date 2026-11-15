// Hidden tests: 5000 cycles of seeded random inputs (seed 744880679); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 294;
  reg clk;
  reg [15:0] i_0;
  reg [0:0] i_1;
  reg [4:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [15:0] i_6;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  axi_ad7616_pif dut (
    .clk(clk),
    .db_i(i_0),
    .end_of_conv(i_1),
    .burst_length(i_2),
    .rstn(i_3),
    .rd_req(i_4),
    .wr_req(i_5),
    .wr_data(i_6),
    .cs_n(out_dut[293:293]),
    .db_o(out_dut[292:277]),
    .db_t(out_dut[276:276]),
    .rd_n(out_dut[275:275]),
    .wr_n(out_dut[274:274]),
    .adc_data_0(out_dut[273:258]),
    .adc_data_1(out_dut[257:242]),
    .adc_data_2(out_dut[241:226]),
    .adc_data_3(out_dut[225:210]),
    .adc_data_4(out_dut[209:194]),
    .adc_data_5(out_dut[193:178]),
    .adc_data_6(out_dut[177:162]),
    .adc_data_7(out_dut[161:146]),
    .adc_data_8(out_dut[145:130]),
    .adc_data_9(out_dut[129:114]),
    .adc_data_10(out_dut[113:98]),
    .adc_data_11(out_dut[97:82]),
    .adc_data_12(out_dut[81:66]),
    .adc_data_13(out_dut[65:50]),
    .adc_data_14(out_dut[49:34]),
    .adc_data_15(out_dut[33:18]),
    .adc_valid(out_dut[17:17]),
    .rd_data(out_dut[16:1]),
    .rd_valid(out_dut[0:0])
  );
  axi_ad7616_pif__ref ref_i (
    .clk(clk),
    .db_i(i_0),
    .end_of_conv(i_1),
    .burst_length(i_2),
    .rstn(i_3),
    .rd_req(i_4),
    .wr_req(i_5),
    .wr_data(i_6),
    .cs_n(out_ref[293:293]),
    .db_o(out_ref[292:277]),
    .db_t(out_ref[276:276]),
    .rd_n(out_ref[275:275]),
    .wr_n(out_ref[274:274]),
    .adc_data_0(out_ref[273:258]),
    .adc_data_1(out_ref[257:242]),
    .adc_data_2(out_ref[241:226]),
    .adc_data_3(out_ref[225:210]),
    .adc_data_4(out_ref[209:194]),
    .adc_data_5(out_ref[193:178]),
    .adc_data_6(out_ref[177:162]),
    .adc_data_7(out_ref[161:146]),
    .adc_data_8(out_ref[145:130]),
    .adc_data_9(out_ref[129:114]),
    .adc_data_10(out_ref[113:98]),
    .adc_data_11(out_ref[97:82]),
    .adc_data_12(out_ref[81:66]),
    .adc_data_13(out_ref[65:50]),
    .adc_data_14(out_ref[49:34]),
    .adc_data_15(out_ref[33:18]),
    .adc_valid(out_ref[17:17]),
    .rd_data(out_ref[16:1]),
    .rd_valid(out_ref[0:0])
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
    seed = 744880679;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
