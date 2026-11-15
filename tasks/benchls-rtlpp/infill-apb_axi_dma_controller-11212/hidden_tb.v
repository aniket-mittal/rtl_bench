// Hidden tests: 5000 cycles of seeded random inputs (seed 227191180); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 274;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [30:0] i_2;
  reg [30:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [12:0] i_7;
  reg [0:0] i_8;
  reg [31:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [3:0] i_12;
  reg [1:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [3:0] i_16;
  reg [63:0] i_17;
  reg [1:0] i_18;
  reg [0:0] i_19;
  reg [0:0] i_20;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_11212 dut (
    .clk(clk),
    .reset(i_0),
    .scan_en(i_1),
    .periph_tx_req(i_2),
    .periph_rx_req(i_3),
    .pclken(i_4),
    .psel(i_5),
    .penable(i_6),
    .paddr(i_7),
    .pwrite(i_8),
    .pwdata(i_9),
    .AWREADY0(i_10),
    .WREADY0(i_11),
    .BID0(i_12),
    .BRESP0(i_13),
    .BVALID0(i_14),
    .ARREADY0(i_15),
    .RID0(i_16),
    .RDATA0(i_17),
    .RRESP0(i_18),
    .RLAST0(i_19),
    .RVALID0(i_20),
    .idle(out_dut[273:273]),
    .INT(out_dut[272:272]),
    .periph_tx_clr(out_dut[271:241]),
    .periph_rx_clr(out_dut[240:210]),
    .prdata(out_dut[209:178]),
    .pslverr(out_dut[177:177]),
    .pready(out_dut[176:176]),
    .AWID0(out_dut[175:172]),
    .AWADDR0(out_dut[171:140]),
    .AWLEN0(out_dut[139:132]),
    .AWSIZE0(out_dut[131:129]),
    .AWVALID0(out_dut[128:128]),
    .WID0(out_dut[127:124]),
    .WDATA0(out_dut[123:60]),
    .WSTRB0(out_dut[59:52]),
    .WLAST0(out_dut[51:51]),
    .WVALID0(out_dut[50:50]),
    .BREADY0(out_dut[49:49]),
    .ARID0(out_dut[48:45]),
    .ARADDR0(out_dut[44:13]),
    .ARLEN0(out_dut[12:5]),
    .ARSIZE0(out_dut[4:2]),
    .ARVALID0(out_dut[1:1]),
    .RREADY0(out_dut[0:0])
  );
  rtlpp_11212__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .scan_en(i_1),
    .periph_tx_req(i_2),
    .periph_rx_req(i_3),
    .pclken(i_4),
    .psel(i_5),
    .penable(i_6),
    .paddr(i_7),
    .pwrite(i_8),
    .pwdata(i_9),
    .AWREADY0(i_10),
    .WREADY0(i_11),
    .BID0(i_12),
    .BRESP0(i_13),
    .BVALID0(i_14),
    .ARREADY0(i_15),
    .RID0(i_16),
    .RDATA0(i_17),
    .RRESP0(i_18),
    .RLAST0(i_19),
    .RVALID0(i_20),
    .idle(out_ref[273:273]),
    .INT(out_ref[272:272]),
    .periph_tx_clr(out_ref[271:241]),
    .periph_rx_clr(out_ref[240:210]),
    .prdata(out_ref[209:178]),
    .pslverr(out_ref[177:177]),
    .pready(out_ref[176:176]),
    .AWID0(out_ref[175:172]),
    .AWADDR0(out_ref[171:140]),
    .AWLEN0(out_ref[139:132]),
    .AWSIZE0(out_ref[131:129]),
    .AWVALID0(out_ref[128:128]),
    .WID0(out_ref[127:124]),
    .WDATA0(out_ref[123:60]),
    .WSTRB0(out_ref[59:52]),
    .WLAST0(out_ref[51:51]),
    .WVALID0(out_ref[50:50]),
    .BREADY0(out_ref[49:49]),
    .ARID0(out_ref[48:45]),
    .ARADDR0(out_ref[44:13]),
    .ARLEN0(out_ref[12:5]),
    .ARSIZE0(out_ref[4:2]),
    .ARVALID0(out_ref[1:1]),
    .RREADY0(out_ref[0:0])
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
    seed = 227191180;
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
      i_17 = {$random(seed), $random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      i_20 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
