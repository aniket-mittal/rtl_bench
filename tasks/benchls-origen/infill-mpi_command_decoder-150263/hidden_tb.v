// Hidden tests: 5000 cycles of seeded random inputs (seed 4074929430); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 11;
  reg clk;
  reg [0:0] i_0;
  reg [8:0] i_1;
  reg [15:0] i_2;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_150263 dut (
    .i_clk(clk),
    .i_reset(i_0),
    .i_pe_writedata(i_1),
    .i_pe_address(i_2),
    .o_mpi_init_rank(out_dut[10:10]),
    .o_mpi_init_comm_size(out_dut[9:9]),
    .o_mpi_finalize(out_dut[8:8]),
    .o_mpi_send(out_dut[7:7]),
    .o_mpi_recv(out_dut[6:6]),
    .o_mpi_comm_size(out_dut[5:5]),
    .o_mpi_rank(out_dut[4:4]),
    .o_mpi_status(out_dut[3:3]),
    .o_mpi_bad_msg(out_dut[2:2]),
    .o_mpi_bcast(out_dut[1:1]),
    .o_mpi_reduce(out_dut[0:0])
  );
  origen_150263__ref ref_i (
    .i_clk(clk),
    .i_reset(i_0),
    .i_pe_writedata(i_1),
    .i_pe_address(i_2),
    .o_mpi_init_rank(out_ref[10:10]),
    .o_mpi_init_comm_size(out_ref[9:9]),
    .o_mpi_finalize(out_ref[8:8]),
    .o_mpi_send(out_ref[7:7]),
    .o_mpi_recv(out_ref[6:6]),
    .o_mpi_comm_size(out_ref[5:5]),
    .o_mpi_rank(out_ref[4:4]),
    .o_mpi_status(out_ref[3:3]),
    .o_mpi_bad_msg(out_ref[2:2]),
    .o_mpi_bcast(out_ref[1:1]),
    .o_mpi_reduce(out_ref[0:0])
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
    seed = 4074929430;
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
