// Hidden tests: 5000 cycles of seeded random inputs (seed 4047843051); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 20;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [3:0] i_6;
  reg [3:0] i_7;
  reg [2:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [3:0] i_11;
  reg [3:0] i_12;
  reg [3:0] i_13;
  reg [3:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_133413 dut (
    .s_axi_aclk(clk),
    .s_axi_aresetn(i_0),
    .is_read(i_1),
    .is_write_reg(i_2),
    .start2(i_3),
    .ip2bus_rdack_i_D1(i_4),
    .ip2bus_wrack_i_D1(i_5),
    .gpio2_io_t(i_6),
    .Dual_gpio2_Data_In_reg(i_7),
    .bus2ip_addr_i_reg(i_8),
    .bus2ip_rnw_i_reg(i_9),
    .rst_reg(i_10),
    .GPIO2_DBus_i(i_11),
    .GPIO_DBus_i(i_12),
    .gpio_io_t(i_13),
    .Dual_gpio_Data_In_reg(i_14),
    .gpio_xferAck_Reg(i_15),
    .GPIO_xferAck_i(i_16),
    .MEM_DECODE_GEN_0_cs_out_i_reg_0(out_dut[19:19]),
    .s_axi_arready(out_dut[18:18]),
    .s_axi_wready(out_dut[17:17]),
    .Read_Reg2_In(out_dut[16:13]),
    .E(out_dut[12:12]),
    .Dual_gpio2_Data_Out_reg(out_dut[11:11]),
    .D(out_dut[10:7]),
    .Read_Reg_In(out_dut[6:3]),
    .Dual_gpio_OE_reg(out_dut[2:2]),
    .Dual_gpio_Data_Out_reg(out_dut[1:1]),
    .Read_Reg_Rst(out_dut[0:0])
  );
  origen_133413__ref ref_i (
    .s_axi_aclk(clk),
    .s_axi_aresetn(i_0),
    .is_read(i_1),
    .is_write_reg(i_2),
    .start2(i_3),
    .ip2bus_rdack_i_D1(i_4),
    .ip2bus_wrack_i_D1(i_5),
    .gpio2_io_t(i_6),
    .Dual_gpio2_Data_In_reg(i_7),
    .bus2ip_addr_i_reg(i_8),
    .bus2ip_rnw_i_reg(i_9),
    .rst_reg(i_10),
    .GPIO2_DBus_i(i_11),
    .GPIO_DBus_i(i_12),
    .gpio_io_t(i_13),
    .Dual_gpio_Data_In_reg(i_14),
    .gpio_xferAck_Reg(i_15),
    .GPIO_xferAck_i(i_16),
    .MEM_DECODE_GEN_0_cs_out_i_reg_0(out_ref[19:19]),
    .s_axi_arready(out_ref[18:18]),
    .s_axi_wready(out_ref[17:17]),
    .Read_Reg2_In(out_ref[16:13]),
    .E(out_ref[12:12]),
    .Dual_gpio2_Data_Out_reg(out_ref[11:11]),
    .D(out_ref[10:7]),
    .Read_Reg_In(out_ref[6:3]),
    .Dual_gpio_OE_reg(out_ref[2:2]),
    .Dual_gpio_Data_Out_reg(out_ref[1:1]),
    .Read_Reg_Rst(out_ref[0:0])
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
    seed = 4047843051;
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
      i_10 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
