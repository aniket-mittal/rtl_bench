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

  always @(posedge S_AXIS_ACLK) begin
    if (!S_AXIS_ARESETN) begin
      state <= IDLE;
      S_AXIS_TREADY <= 1'b0;
      DOUT_TO_BUF <= {C_S_AXIS_TDATA_WIDTH{1'b0}};
      DOUT_VALID <= 1'b0;
      w_en <= 1'b0;
      w_en_delay <= 1'b0;
    end else begin
      case (state)
        IDLE: begin
          S_AXIS_TREADY <= 1'b1;
          if (S_AXIS_TVALID) begin
            state <= WRITE_FIFO;
            S_AXIS_TREADY <= 1'b0;
          end
        end
        WRITE_FIFO: begin
          DOUT_TO_BUF <= S_AXIS_TDATA;
          w_en <= S_AXIS_TVALID & DOUT_ACCEP;
          w_en_delay <= w_en;
          DOUT_VALID <= w_en_delay;
          if (S_AXIS_TLAST) begin
            state <= IDLE;
            S_AXIS_TREADY <= 1'b1;
          end
        end
      endcase
    end
  end

endmodule