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

always @(posedge i_clk or posedge i_reset) begin
  if (i_reset) begin
    o_mpi_init_rank <= 0;
    o_mpi_init_comm_size <= 0;
    o_mpi_finalize <= 0;
    o_mpi_send <= 0;
    o_mpi_recv <= 0;
    o_mpi_comm_size <= 0;
    o_mpi_rank <= 0;
    o_mpi_status <= 0;
    o_mpi_bad_msg <= 0;
    o_mpi_bcast <= 0;
    o_mpi_reduce <= 0;
  end else begin
    o_mpi_init_rank <= (i_pe_address == 16'h0004 && i_pe_writedata == 9'h000);
    o_mpi_init_comm_size <= (i_pe_address == 16'h0008 && i_pe_writedata == 9'h000);
    o_mpi_finalize <= (i_pe_writedata == 9'h005);
    o_mpi_send <= (i_pe_writedata == 9'h003);
    o_mpi_recv <= (i_pe_writedata == 9'h004);
    o_mpi_comm_size <= (i_pe_address == 16'h000C);
    o_mpi_rank <= (i_pe_address == 16'h0010);
    o_mpi_status <= (i_pe_address == 16'h0014);
    o_mpi_bad_msg <= (i_pe_writedata > 9'h101);
    o_mpi_bcast <= (i_pe_writedata == 16'h0100);
    o_mpi_reduce <= (i_pe_writedata == 16'h0101);
  end
end

endmodule