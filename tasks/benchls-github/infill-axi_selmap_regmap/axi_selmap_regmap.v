module axi_selmap_regmap #(
  parameter            DATA_WIDTH = 8,
  parameter            CORE_MAGIC = 32'h73656C6D // selm
) (
  input                        device_ready,
  input                        done,
  output                       reset,

  output      [DATA_WIDTH-1:0] data,
  output                       data_written,
  output                       csi_b,
  output                       program_b,

  // processor interface
  input                        up_rstn,
  input                        up_clk,
  input                        up_wreq,
  input       [13:0]           up_waddr,
  input       [31:0]           up_wdata,
  output reg                   up_wack,
  input                        up_rreq,
  input       [13:0]           up_raddr,
  output reg  [31:0]           up_rdata,
  output reg                   up_rack
);

  // internal registers

  reg     [31:0]           up_scratch = 'd0;
  reg                      up_reset = 1'b1;
  reg     [DATA_WIDTH-1:0] up_data;
  reg                      up_data_written;
  reg                      up_csi_b;
  reg                      up_program_b;
  reg    [31:0]            up_byte_counter;

  always @(posedge up_clk) begin
    if (!up_rstn || !up_reset) begin
      up_scratch <= 'd0;
      up_reset <= 1'b1;
      up_data <= 'd0;
      up_data_written <= 1'b0;
      up_csi_b <= 1'b1;
      up_program_b <= 1'b1;
      up_byte_counter <= 'd0;
    end else begin
      up_wack <= up_wreq;
      up_data_written <= 1'b0;
      if ((up_wreq == 1'b1) && (up_waddr == 14'h1)) begin
        up_scratch <= up_wdata;
      end
      if ((up_wreq == 1'b1) && (up_waddr == 14'h2)) begin
        up_reset <= up_wdata[0];
      end
      if ((up_wreq == 1'b1) && (up_waddr == 14'h3)) begin
        up_program_b <= up_wdata[0];
      end
      if ((up_wreq == 1'b1) && (up_waddr == 14'h5)) begin
        up_csi_b <= up_wdata[0];
      end
      if ((up_wreq == 1'b1) && (up_waddr == 14'h6)) begin
        if (!up_data_written) begin
          up_data <= up_wdata[DATA_WIDTH-1:0];
          up_data_written <= 1'b1;
          up_byte_counter <= up_byte_counter + 1'd1;
        end
      end
    end
  end

  [MASKED]

  assign reset = up_reset;

  assign data = up_data;
  assign data_written = up_data_written;
  assign csi_b = up_csi_b;
  assign program_b = up_program_b;

endmodule