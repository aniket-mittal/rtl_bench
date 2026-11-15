// Hidden tests: 5000 cycles of seeded random inputs (seed 3548284479); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 108;
  reg clk;
  reg [6:0] i_0;
  reg [2:0] i_1;
  reg [4:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [31:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_110873 dut (
    .opcode(i_0),
    .funct3(i_1),
    .rd(i_2),
    .mem_addr(i_3),
    .rs2_data(i_4),
    .mem_valid(i_5),
    .data_rvalid(i_6),
    .data_rdata_in(i_7),
    .data_req_o(out_dut[107:107]),
    .data_we_o(out_dut[106:106]),
    .data_be_o(out_dut[105:102]),
    .data_addr_o(out_dut[101:70]),
    .data_wdata_o(out_dut[69:38]),
    .mem_data_out(out_dut[37:6]),
    .rd_out_lsu(out_dut[5:1]),
    .rd_write(out_dut[0:0])
  );
  origen_110873__ref ref_i (
    .opcode(i_0),
    .funct3(i_1),
    .rd(i_2),
    .mem_addr(i_3),
    .rs2_data(i_4),
    .mem_valid(i_5),
    .data_rvalid(i_6),
    .data_rdata_in(i_7),
    .data_req_o(out_ref[107:107]),
    .data_we_o(out_ref[106:106]),
    .data_be_o(out_ref[105:102]),
    .data_addr_o(out_ref[101:70]),
    .data_wdata_o(out_ref[69:38]),
    .mem_data_out(out_ref[37:6]),
    .rd_out_lsu(out_ref[5:1]),
    .rd_write(out_ref[0:0])
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
    seed = 3548284479;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
