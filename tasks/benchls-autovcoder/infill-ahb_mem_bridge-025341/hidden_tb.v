// Hidden tests: 5000 cycles of seeded random inputs (seed 818239826); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 145;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [0:0] i_2;
  reg [1:0] i_3;
  reg [0:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_025341 dut (
    .clk(clk),
    .rst_n(i_0),
    .mem_addr(i_1),
    .mem_wr(i_2),
    .mem_byte_en(i_3),
    .mem_req(i_4),
    .mem_wr_data(i_5),
    .d_mhrdata(i_6),
    .d_mhready(i_7),
    .d_mhresp(i_8),
    .mem_rd_data(out_dut[144:113]),
    .mem_rdy(out_dut[112:112]),
    .core_mem_addr(out_dut[111:80]),
    .core_mem_addr_vld(out_dut[79:79]),
    .core_mwr_mrd(out_dut[78:78]),
    .d_mhaddr(out_dut[77:46]),
    .d_mhtrans(out_dut[45:44]),
    .d_mhwrite(out_dut[43:43]),
    .d_mhwdata(out_dut[42:11]),
    .d_mhsize(out_dut[10:8]),
    .d_mhburst(out_dut[7:5]),
    .d_mhprot(out_dut[4:1]),
    .d_mhmasterlock(out_dut[0:0])
  );
  autovcoder_025341__ref ref_i (
    .clk(clk),
    .rst_n(i_0),
    .mem_addr(i_1),
    .mem_wr(i_2),
    .mem_byte_en(i_3),
    .mem_req(i_4),
    .mem_wr_data(i_5),
    .d_mhrdata(i_6),
    .d_mhready(i_7),
    .d_mhresp(i_8),
    .mem_rd_data(out_ref[144:113]),
    .mem_rdy(out_ref[112:112]),
    .core_mem_addr(out_ref[111:80]),
    .core_mem_addr_vld(out_ref[79:79]),
    .core_mwr_mrd(out_ref[78:78]),
    .d_mhaddr(out_ref[77:46]),
    .d_mhtrans(out_ref[45:44]),
    .d_mhwrite(out_ref[43:43]),
    .d_mhwdata(out_ref[42:11]),
    .d_mhsize(out_ref[10:8]),
    .d_mhburst(out_ref[7:5]),
    .d_mhprot(out_ref[4:1]),
    .d_mhmasterlock(out_ref[0:0])
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
    seed = 818239826;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
