// Hidden tests: 5000 cycles of seeded random inputs (seed 2167377129); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 258;
  reg clk;
  reg [0:0] i_0;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_186560 dut (
    .clk25(clk),
    .rst(i_0),
    .hsync(out_dut[257:257]),
    .hsync_n(out_dut[256:256]),
    .vsync(out_dut[255:255]),
    .vsync_n(out_dut[254:254]),
    .x(out_dut[253:243]),
    .x_n(out_dut[242:232]),
    .y(out_dut[231:221]),
    .y_n(out_dut[220:210]),
    .sx(out_dut[209:199]),
    .sx_n(out_dut[198:188]),
    .sy(out_dut[187:177]),
    .sy_n(out_dut[176:166]),
    .sx_counter(out_dut[165:156]),
    .sx_counter_n(out_dut[155:146]),
    .sy_counter(out_dut[145:136]),
    .sy_counter_n(out_dut[135:126]),
    .bit_num(out_dut[125:118]),
    .bit_num_n(out_dut[117:110]),
    .byte_num(out_dut[109:94]),
    .byte_num_n(out_dut[93:78]),
    .next_byte_num(out_dut[77:62]),
    .next_byte_num_n(out_dut[61:46]),
    .next_y(out_dut[45:35]),
    .next_y_n(out_dut[34:24]),
    .next_sy(out_dut[23:13]),
    .next_sy_n(out_dut[12:2]),
    .blank(out_dut[1:1]),
    .blank_n(out_dut[0:0])
  );
  origen_186560__ref ref_i (
    .clk25(clk),
    .rst(i_0),
    .hsync(out_ref[257:257]),
    .hsync_n(out_ref[256:256]),
    .vsync(out_ref[255:255]),
    .vsync_n(out_ref[254:254]),
    .x(out_ref[253:243]),
    .x_n(out_ref[242:232]),
    .y(out_ref[231:221]),
    .y_n(out_ref[220:210]),
    .sx(out_ref[209:199]),
    .sx_n(out_ref[198:188]),
    .sy(out_ref[187:177]),
    .sy_n(out_ref[176:166]),
    .sx_counter(out_ref[165:156]),
    .sx_counter_n(out_ref[155:146]),
    .sy_counter(out_ref[145:136]),
    .sy_counter_n(out_ref[135:126]),
    .bit_num(out_ref[125:118]),
    .bit_num_n(out_ref[117:110]),
    .byte_num(out_ref[109:94]),
    .byte_num_n(out_ref[93:78]),
    .next_byte_num(out_ref[77:62]),
    .next_byte_num_n(out_ref[61:46]),
    .next_y(out_ref[45:35]),
    .next_y_n(out_ref[34:24]),
    .next_sy(out_ref[23:13]),
    .next_sy_n(out_ref[12:2]),
    .blank(out_ref[1:1]),
    .blank_n(out_ref[0:0])
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
    seed = 2167377129;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
