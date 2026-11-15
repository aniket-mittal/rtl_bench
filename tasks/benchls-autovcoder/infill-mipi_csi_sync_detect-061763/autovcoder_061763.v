module autovcoder_061763 #(
    parameter MIPI_GEAR = 8
) (
    reset_i,
    clk_i,
    data_valid_i,
    data_lane0_i,
    detected_frame_sync_o
);

  localparam [7:0] SYNC_BYTE = 8'hB8;
  localparam [7:0] MIPI_CSI_START = 8'h00;
  localparam [7:0] MIPI_CSI_STOP = 8'h01;

  input reset_i;
  input clk_i;
  input data_valid_i;
  input [(MIPI_GEAR - 1'h1):0] data_lane0_i;
  output reg detected_frame_sync_o;

  reg [(MIPI_GEAR - 1'h1):0] last_data_lane0_i;
  reg [1:0] packed_processed;
  wire [((MIPI_GEAR*2) - 1'h1):0] pipe;

  assign pipe = {data_lane0_i, last_data_lane0_i};
  //packet format <SYNC_BYTE> <DataID> <WCount 8bit> <WCount8bit> <ECC8bit>
  [MASKED]


endmodule

