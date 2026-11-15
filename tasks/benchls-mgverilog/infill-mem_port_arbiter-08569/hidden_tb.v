// Hidden tests: 5000 cycles of seeded random inputs (seed 16068481); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 195;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [0:0] i_4;
  reg [31:0] i_5;
  reg [0:0] i_6;
  reg [31:0] i_7;
  reg [31:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_08569 dut (
    .clk(clk),
    .rst(i_0),
    .r_data_i(i_1),
    .c_data_i(i_2),
    .mem_r_addr_i(i_3),
    .mem_r_read_en(i_4),
    .mem_c_addr_i(i_5),
    .mem_c_read_en(i_6),
    .wb_data_i(i_7),
    .wb_addr_i(i_8),
    .wb_r_we_i(i_9),
    .wb_c_we_i(i_10),
    .r_data_o(out_dut[194:163]),
    .r_addr_o(out_dut[162:131]),
    .r_we_o(out_dut[130:130]),
    .c_data_o(out_dut[129:98]),
    .c_addr_o(out_dut[97:66]),
    .c_we_o(out_dut[65:65]),
    .mem_r_data_o(out_dut[64:33]),
    .mem_c_data_o(out_dut[32:1]),
    .r_rw_conflict_o(out_dut[0:0])
  );
  mg_08569__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .r_data_i(i_1),
    .c_data_i(i_2),
    .mem_r_addr_i(i_3),
    .mem_r_read_en(i_4),
    .mem_c_addr_i(i_5),
    .mem_c_read_en(i_6),
    .wb_data_i(i_7),
    .wb_addr_i(i_8),
    .wb_r_we_i(i_9),
    .wb_c_we_i(i_10),
    .r_data_o(out_ref[194:163]),
    .r_addr_o(out_ref[162:131]),
    .r_we_o(out_ref[130:130]),
    .c_data_o(out_ref[129:98]),
    .c_addr_o(out_ref[97:66]),
    .c_we_o(out_ref[65:65]),
    .mem_r_data_o(out_ref[64:33]),
    .mem_c_data_o(out_ref[32:1]),
    .r_rw_conflict_o(out_ref[0:0])
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
    seed = 16068481;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
