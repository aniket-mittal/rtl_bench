module autovcoder_097555 (
    req_valid,
    req_ready,
    req_addr,
    write_valid,
    read_ack,
    read_valid,
    read_data,

    slv_req_valid,
    slv_req_ready,
    slv_write_valid,
    slv_read_ack,
    slv_read_valid,
    slv_read_data
);

  parameter SLAVES = 16;
  parameter SW = $clog2(SLAVES);

  localparam DW = 32;

  input req_valid;
  input [SW-1:0] req_addr;
  output reg req_ready;

  input write_valid;

  input read_ack;
  output reg read_valid;
  output reg [DW-1:0] read_data;

  output reg [SLAVES-1:0] slv_req_valid;
  input [SLAVES-1:0] slv_req_ready;

  output reg [SLAVES-1:0] slv_write_valid;

  output reg [SLAVES-1:0] slv_read_ack;
  input [SLAVES-1:0] slv_read_valid;
  input [SLAVES*DW-1:0] slv_read_data;

  integer i;

  [MASKED]

endmodule

