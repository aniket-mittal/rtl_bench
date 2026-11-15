// Hidden tests: 5000 cycles of seeded random inputs (seed 1894647155); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 82;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_104002 dut (
    .clk(clk),
    .mem_read(i_0),
    .mem_write(i_1),
    .hit(i_2),
    .pmem_resp(i_3),
    .hit_out(out_dut[81:81]),
    .dirty1_out(out_dut[80:80]),
    .dirty2_out(out_dut[79:79]),
    .valid1_out(out_dut[78:78]),
    .valid2_out(out_dut[77:77]),
    .pmem_read(out_dut[76:76]),
    .pmem_write(out_dut[75:75]),
    .set_sel(out_dut[74:73]),
    .tag_sel(out_dut[72:71]),
    .dirty1_in(out_dut[70:70]),
    .dirty2_in(out_dut[69:69]),
    .valid1_in(out_dut[68:68]),
    .valid2_in(out_dut[67:67]),
    .lru_in(out_dut[66:66]),
    .lru_out(out_dut[65:65]),
    .hits(out_dut[64:33]),
    .miss(out_dut[32:1]),
    .pmem_address_sel(out_dut[0:0])
  );
  origen_104002__ref ref_i (
    .clk(clk),
    .mem_read(i_0),
    .mem_write(i_1),
    .hit(i_2),
    .pmem_resp(i_3),
    .hit_out(out_ref[81:81]),
    .dirty1_out(out_ref[80:80]),
    .dirty2_out(out_ref[79:79]),
    .valid1_out(out_ref[78:78]),
    .valid2_out(out_ref[77:77]),
    .pmem_read(out_ref[76:76]),
    .pmem_write(out_ref[75:75]),
    .set_sel(out_ref[74:73]),
    .tag_sel(out_ref[72:71]),
    .dirty1_in(out_ref[70:70]),
    .dirty2_in(out_ref[69:69]),
    .valid1_in(out_ref[68:68]),
    .valid2_in(out_ref[67:67]),
    .lru_in(out_ref[66:66]),
    .lru_out(out_ref[65:65]),
    .hits(out_ref[64:33]),
    .miss(out_ref[32:1]),
    .pmem_address_sel(out_ref[0:0])
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
    seed = 1894647155;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
