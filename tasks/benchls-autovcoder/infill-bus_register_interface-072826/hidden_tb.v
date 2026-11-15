// Hidden tests: 5000 cycles of seeded random inputs (seed 500839149); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 15;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [1:0] i_4;
  reg [7:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_072826 dut (
    .clock(clk),
    .reset(i_0),
    .chip_select_n(i_1),
    .read_enable_n(i_2),
    .write_enable_n(i_3),
    .address(i_4),
    .data_bus_in(i_5),
    .internal_data_bus(out_dut[14:7]),
    .write_port_a(out_dut[6:6]),
    .write_port_b(out_dut[5:5]),
    .write_port_c(out_dut[4:4]),
    .write_control(out_dut[3:3]),
    .read_port_a(out_dut[2:2]),
    .read_port_b(out_dut[1:1]),
    .read_port_c(out_dut[0:0])
  );
  autovcoder_072826__ref ref_i (
    .clock(clk),
    .reset(i_0),
    .chip_select_n(i_1),
    .read_enable_n(i_2),
    .write_enable_n(i_3),
    .address(i_4),
    .data_bus_in(i_5),
    .internal_data_bus(out_ref[14:7]),
    .write_port_a(out_ref[6:6]),
    .write_port_b(out_ref[5:5]),
    .write_port_c(out_ref[4:4]),
    .write_control(out_ref[3:3]),
    .read_port_a(out_ref[2:2]),
    .read_port_b(out_ref[1:1]),
    .read_port_c(out_ref[0:0])
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
    seed = 500839149;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
