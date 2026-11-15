// Hidden tests: 5000 cycles of seeded random inputs (seed 1052892079); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 136;
  reg clk;
  reg [31:0] i_0;
  reg [31:0] i_1;
  reg [3:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [31:0] i_5;
  reg [0:0] i_6;
  reg [31:0] i_7;
  reg [0:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  servile_arbiter dut (
    .i_wb_cpu_dbus_adr(i_0),
    .i_wb_cpu_dbus_dat(i_1),
    .i_wb_cpu_dbus_sel(i_2),
    .i_wb_cpu_dbus_we(i_3),
    .i_wb_cpu_dbus_stb(i_4),
    .i_wb_cpu_ibus_adr(i_5),
    .i_wb_cpu_ibus_stb(i_6),
    .i_wb_mem_rdt(i_7),
    .i_wb_mem_ack(i_8),
    .o_wb_cpu_dbus_rdt(out_dut[135:104]),
    .o_wb_cpu_dbus_ack(out_dut[103:103]),
    .o_wb_cpu_ibus_rdt(out_dut[102:71]),
    .o_wb_cpu_ibus_ack(out_dut[70:70]),
    .o_wb_mem_adr(out_dut[69:38]),
    .o_wb_mem_dat(out_dut[37:6]),
    .o_wb_mem_sel(out_dut[5:2]),
    .o_wb_mem_we(out_dut[1:1]),
    .o_wb_mem_stb(out_dut[0:0])
  );
  servile_arbiter__ref ref_i (
    .i_wb_cpu_dbus_adr(i_0),
    .i_wb_cpu_dbus_dat(i_1),
    .i_wb_cpu_dbus_sel(i_2),
    .i_wb_cpu_dbus_we(i_3),
    .i_wb_cpu_dbus_stb(i_4),
    .i_wb_cpu_ibus_adr(i_5),
    .i_wb_cpu_ibus_stb(i_6),
    .i_wb_mem_rdt(i_7),
    .i_wb_mem_ack(i_8),
    .o_wb_cpu_dbus_rdt(out_ref[135:104]),
    .o_wb_cpu_dbus_ack(out_ref[103:103]),
    .o_wb_cpu_ibus_rdt(out_ref[102:71]),
    .o_wb_cpu_ibus_ack(out_ref[70:70]),
    .o_wb_mem_adr(out_ref[69:38]),
    .o_wb_mem_dat(out_ref[37:6]),
    .o_wb_mem_sel(out_ref[5:2]),
    .o_wb_mem_we(out_ref[1:1]),
    .o_wb_mem_stb(out_ref[0:0])
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
    seed = 1052892079;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
