// Hidden tests: 5000 cycles of seeded random inputs (seed 2238645208); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 63;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [0:0] i_2;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  pcie_us_cfg dut (
    .clk(clk),
    .rst(i_0),
    .cfg_mgmt_read_data(i_1),
    .cfg_mgmt_read_write_done(i_2),
    .ext_tag_enable(out_dut[62:62]),
    .max_read_request_size(out_dut[61:59]),
    .max_payload_size(out_dut[58:56]),
    .cfg_mgmt_addr(out_dut[55:46]),
    .cfg_mgmt_function_number(out_dut[45:38]),
    .cfg_mgmt_write(out_dut[37:37]),
    .cfg_mgmt_write_data(out_dut[36:5]),
    .cfg_mgmt_byte_enable(out_dut[4:1]),
    .cfg_mgmt_read(out_dut[0:0])
  );
  pcie_us_cfg__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .cfg_mgmt_read_data(i_1),
    .cfg_mgmt_read_write_done(i_2),
    .ext_tag_enable(out_ref[62:62]),
    .max_read_request_size(out_ref[61:59]),
    .max_payload_size(out_ref[58:56]),
    .cfg_mgmt_addr(out_ref[55:46]),
    .cfg_mgmt_function_number(out_ref[45:38]),
    .cfg_mgmt_write(out_ref[37:37]),
    .cfg_mgmt_write_data(out_ref[36:5]),
    .cfg_mgmt_byte_enable(out_ref[4:1]),
    .cfg_mgmt_read(out_ref[0:0])
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
    seed = 2238645208;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
