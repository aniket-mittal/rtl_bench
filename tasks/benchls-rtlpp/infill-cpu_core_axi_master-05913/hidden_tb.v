// Hidden tests: 5000 cycles of seeded random inputs (seed 2831781737); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 219;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [31:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [1:0] i_15;
  reg [0:0] i_16;
  reg [0:0] i_17;
  reg [31:0] i_18;
  reg [1:0] i_19;
  reg [0:0] i_20;
  reg [0:0] i_21;
  reg [0:0] i_22;
  reg [7:0] i_23;
  reg [0:0] i_24;
  reg [0:0] i_25;
  reg [0:0] i_26;
  reg [0:0] i_27;
  reg [0:0] i_28;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_05913 dut (
    .Clk(clk),
    .Reset(i_0),
    .Interrupt(i_1),
    .Interrupt_Address(i_2),
    .Instr(i_3),
    .IReady(i_4),
    .IWAIT(i_5),
    .ICE(i_6),
    .IUE(i_7),
    .Data_Read(i_8),
    .DReady(i_9),
    .DWait(i_10),
    .DCE(i_11),
    .DUE(i_12),
    .M_AXI_DP_AWREADY(i_13),
    .M_AXI_DP_WREADY(i_14),
    .M_AXI_DP_BRESP(i_15),
    .M_AXI_DP_BVALID(i_16),
    .M_AXI_DP_ARREADY(i_17),
    .M_AXI_DP_RDATA(i_18),
    .M_AXI_DP_RRESP(i_19),
    .M_AXI_DP_RVALID(i_20),
    .Dbg_Clk(i_21),
    .Dbg_TDI(i_22),
    .Dbg_Reg_En(i_23),
    .Dbg_Shift(i_24),
    .Dbg_Capture(i_25),
    .Dbg_Update(i_26),
    .Debug_Rst(i_27),
    .Dbg_Disable(i_28),
    .Interrupt_Ack(out_dut[218:217]),
    .Instr_Addr(out_dut[216:185]),
    .IFetch(out_dut[184:184]),
    .I_AS(out_dut[183:183]),
    .Data_Addr(out_dut[182:151]),
    .Data_Write(out_dut[150:119]),
    .D_AS(out_dut[118:118]),
    .Read_Strobe(out_dut[117:117]),
    .Write_Strobe(out_dut[116:116]),
    .Byte_Enable(out_dut[115:112]),
    .M_AXI_DP_AWADDR(out_dut[111:80]),
    .M_AXI_DP_AWPROT(out_dut[79:77]),
    .M_AXI_DP_AWVALID(out_dut[76:76]),
    .M_AXI_DP_WDATA(out_dut[75:44]),
    .M_AXI_DP_WSTRB(out_dut[43:40]),
    .M_AXI_DP_WVALID(out_dut[39:39]),
    .M_AXI_DP_BREADY(out_dut[38:38]),
    .M_AXI_DP_ARADDR(out_dut[37:6]),
    .M_AXI_DP_ARPROT(out_dut[5:3]),
    .M_AXI_DP_ARVALID(out_dut[2:2]),
    .M_AXI_DP_RREADY(out_dut[1:1]),
    .Dbg_TDO(out_dut[0:0])
  );
  rtlpp_05913__ref ref_i (
    .Clk(clk),
    .Reset(i_0),
    .Interrupt(i_1),
    .Interrupt_Address(i_2),
    .Instr(i_3),
    .IReady(i_4),
    .IWAIT(i_5),
    .ICE(i_6),
    .IUE(i_7),
    .Data_Read(i_8),
    .DReady(i_9),
    .DWait(i_10),
    .DCE(i_11),
    .DUE(i_12),
    .M_AXI_DP_AWREADY(i_13),
    .M_AXI_DP_WREADY(i_14),
    .M_AXI_DP_BRESP(i_15),
    .M_AXI_DP_BVALID(i_16),
    .M_AXI_DP_ARREADY(i_17),
    .M_AXI_DP_RDATA(i_18),
    .M_AXI_DP_RRESP(i_19),
    .M_AXI_DP_RVALID(i_20),
    .Dbg_Clk(i_21),
    .Dbg_TDI(i_22),
    .Dbg_Reg_En(i_23),
    .Dbg_Shift(i_24),
    .Dbg_Capture(i_25),
    .Dbg_Update(i_26),
    .Debug_Rst(i_27),
    .Dbg_Disable(i_28),
    .Interrupt_Ack(out_ref[218:217]),
    .Instr_Addr(out_ref[216:185]),
    .IFetch(out_ref[184:184]),
    .I_AS(out_ref[183:183]),
    .Data_Addr(out_ref[182:151]),
    .Data_Write(out_ref[150:119]),
    .D_AS(out_ref[118:118]),
    .Read_Strobe(out_ref[117:117]),
    .Write_Strobe(out_ref[116:116]),
    .Byte_Enable(out_ref[115:112]),
    .M_AXI_DP_AWADDR(out_ref[111:80]),
    .M_AXI_DP_AWPROT(out_ref[79:77]),
    .M_AXI_DP_AWVALID(out_ref[76:76]),
    .M_AXI_DP_WDATA(out_ref[75:44]),
    .M_AXI_DP_WSTRB(out_ref[43:40]),
    .M_AXI_DP_WVALID(out_ref[39:39]),
    .M_AXI_DP_BREADY(out_ref[38:38]),
    .M_AXI_DP_ARADDR(out_ref[37:6]),
    .M_AXI_DP_ARPROT(out_ref[5:3]),
    .M_AXI_DP_ARVALID(out_ref[2:2]),
    .M_AXI_DP_RREADY(out_ref[1:1]),
    .Dbg_TDO(out_ref[0:0])
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
    seed = 2831781737;
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
