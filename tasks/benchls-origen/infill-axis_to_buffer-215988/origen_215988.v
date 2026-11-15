module origen_215988 #(
  parameter integer C_S_AXIS_TDATA_WIDTH = 32
)(
  input wire                          S_AXIS_ACLK,
  input wire                          S_AXIS_ARESETN,
  output reg                          S_AXIS_TREADY,
  input wire [C_S_AXIS_TDATA_WIDTH-1:0] S_AXIS_TDATA,
  input wire [(C_S_AXIS_TDATA_WIDTH/8)-1:0] S_AXIS_TSTRB,
  input wire                          S_AXIS_TLAST,
  input wire                          S_AXIS_TVALID,
  output reg [C_S_AXIS_TDATA_WIDTH-1:0] DOUT_TO_BUF,
  output reg                          DOUT_VALID,
  input wire                          DOUT_ACCEP
);

  localparam [1:0] IDLE = 2'b00, WRITE_FIFO = 2'b01;

  reg [1:0] state;
  reg w_en;
  reg w_en_delay;

  [MASKED]

endmodule