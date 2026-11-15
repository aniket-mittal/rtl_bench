// Hidden tests: 5000 cycles of seeded random inputs (seed 1017297573); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 304;
  reg clk;
  reg [0:0] i_0;
  reg [7:0] i_1;
  reg [7:0] i_2;
  reg [5:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_03841 dut (
    .sel(i_0),
    .a(i_1),
    .b(i_2),
    .c(i_3),
    .mux_uu(out_dut[303:288]),
    .mux_us(out_dut[287:272]),
    .mux_su(out_dut[271:256]),
    .mux_ss(out_dut[255:240]),
    .eql_uu(out_dut[239:239]),
    .eql_us(out_dut[238:238]),
    .eql_su(out_dut[237:237]),
    .eql_ss(out_dut[236:236]),
    .neq_uu(out_dut[235:235]),
    .neq_us(out_dut[234:234]),
    .neq_su(out_dut[233:233]),
    .neq_ss(out_dut[232:232]),
    .sgn_u(out_dut[231:216]),
    .sgn_s(out_dut[215:200]),
    .add_uu(out_dut[199:184]),
    .add_us(out_dut[183:168]),
    .add_su(out_dut[167:152]),
    .add_ss(out_dut[151:136]),
    .sub_uu(out_dut[135:120]),
    .sub_us(out_dut[119:104]),
    .sub_su(out_dut[103:88]),
    .sub_ss(out_dut[87:72]),
    .mul_uu(out_dut[71:56]),
    .mul_us(out_dut[55:40]),
    .mul_su(out_dut[39:24]),
    .mul_ss(out_dut[23:8]),
    .ltn_uu(out_dut[7:7]),
    .ltn_us(out_dut[6:6]),
    .ltn_su(out_dut[5:5]),
    .ltn_ss(out_dut[4:4]),
    .leq_uu(out_dut[3:3]),
    .leq_us(out_dut[2:2]),
    .leq_su(out_dut[1:1]),
    .leq_ss(out_dut[0:0])
  );
  mg_03841__ref ref_i (
    .sel(i_0),
    .a(i_1),
    .b(i_2),
    .c(i_3),
    .mux_uu(out_ref[303:288]),
    .mux_us(out_ref[287:272]),
    .mux_su(out_ref[271:256]),
    .mux_ss(out_ref[255:240]),
    .eql_uu(out_ref[239:239]),
    .eql_us(out_ref[238:238]),
    .eql_su(out_ref[237:237]),
    .eql_ss(out_ref[236:236]),
    .neq_uu(out_ref[235:235]),
    .neq_us(out_ref[234:234]),
    .neq_su(out_ref[233:233]),
    .neq_ss(out_ref[232:232]),
    .sgn_u(out_ref[231:216]),
    .sgn_s(out_ref[215:200]),
    .add_uu(out_ref[199:184]),
    .add_us(out_ref[183:168]),
    .add_su(out_ref[167:152]),
    .add_ss(out_ref[151:136]),
    .sub_uu(out_ref[135:120]),
    .sub_us(out_ref[119:104]),
    .sub_su(out_ref[103:88]),
    .sub_ss(out_ref[87:72]),
    .mul_uu(out_ref[71:56]),
    .mul_us(out_ref[55:40]),
    .mul_su(out_ref[39:24]),
    .mul_ss(out_ref[23:8]),
    .ltn_uu(out_ref[7:7]),
    .ltn_us(out_ref[6:6]),
    .ltn_su(out_ref[5:5]),
    .ltn_ss(out_ref[4:4]),
    .leq_uu(out_ref[3:3]),
    .leq_us(out_ref[2:2]),
    .leq_su(out_ref[1:1]),
    .leq_ss(out_ref[0:0])
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
    seed = 1017297573;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
