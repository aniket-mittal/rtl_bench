module origen_150263 #(
  parameter NODE_ADDR = 0,
  parameter AWIDTH = 16,
  parameter IWIDTH = 9
) (
  input i_clk,
  input i_reset,
  input [IWIDTH-1:0] i_pe_writedata,
  input [AWIDTH-1:0] i_pe_address,
  output reg o_mpi_init_rank,
  output reg o_mpi_init_comm_size,
  output reg o_mpi_finalize,
  output reg o_mpi_send,
  output reg o_mpi_recv,
  output reg o_mpi_comm_size,
  output reg o_mpi_rank,
  output reg o_mpi_status,
  output reg o_mpi_bad_msg,
  output reg o_mpi_bcast,
  output reg o_mpi_reduce
);

[MASKED]

endmodule