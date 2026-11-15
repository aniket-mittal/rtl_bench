// Hidden tests: 5000 cycles of seeded random inputs (seed 3406538875); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 203;
  reg clk;
  reg [31:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [3:0] i_6;
  reg [0:0] i_7;
  reg [31:0] i_8;
  reg [0:0] i_9;
  reg [31:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_10596 dut (
    .clk_i(clk),
    .IF_addr_i(i_0),
    .IF_req_i(i_1),
    .MEM_req_i(i_2),
    .MEM_we_i(i_3),
    .MEM_addr_i(i_4),
    .MEM_data_i(i_5),
    .MEM_bwsel_i(i_6),
    .dmem_ack_i(i_7),
    .dmem_data_i(i_8),
    .imem_ack_i(i_9),
    .imem_inst_i(i_10),
    .ID_inst_o(out_dut[202:171]),
    .WB_data_o(out_dut[170:139]),
    .dmem_cyc_o(out_dut[138:138]),
    .dmem_stb_o(out_dut[137:137]),
    .dmem_waddr_o(out_dut[136:105]),
    .dmem_raddr_o(out_dut[104:73]),
    .dmem_we_o(out_dut[72:72]),
    .dmem_bwsel_o(out_dut[71:68]),
    .dmem_data_o(out_dut[67:36]),
    .imem_cyc_o(out_dut[35:35]),
    .imem_stb_o(out_dut[34:34]),
    .imem_addr_o(out_dut[33:2]),
    .dmem_rdy_o(out_dut[1:1]),
    .imem_rdy_o(out_dut[0:0])
  );
  mg_10596__ref ref_i (
    .clk_i(clk),
    .IF_addr_i(i_0),
    .IF_req_i(i_1),
    .MEM_req_i(i_2),
    .MEM_we_i(i_3),
    .MEM_addr_i(i_4),
    .MEM_data_i(i_5),
    .MEM_bwsel_i(i_6),
    .dmem_ack_i(i_7),
    .dmem_data_i(i_8),
    .imem_ack_i(i_9),
    .imem_inst_i(i_10),
    .ID_inst_o(out_ref[202:171]),
    .WB_data_o(out_ref[170:139]),
    .dmem_cyc_o(out_ref[138:138]),
    .dmem_stb_o(out_ref[137:137]),
    .dmem_waddr_o(out_ref[136:105]),
    .dmem_raddr_o(out_ref[104:73]),
    .dmem_we_o(out_ref[72:72]),
    .dmem_bwsel_o(out_ref[71:68]),
    .dmem_data_o(out_ref[67:36]),
    .imem_cyc_o(out_ref[35:35]),
    .imem_stb_o(out_ref[34:34]),
    .imem_addr_o(out_ref[33:2]),
    .dmem_rdy_o(out_ref[1:1]),
    .imem_rdy_o(out_ref[0:0])
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
    seed = 3406538875;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
