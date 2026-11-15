module autovcoder_113084 (
    clk_in,
    spi_sclk,
    spi_mosi,
    spi_miso,
    spi_n_ss,
    tx_buffer,
    rx_buffer,
    rx_ready,
    rx_ready_ack,
    nss_risen_stable_out
);
  input clk_in;

  input spi_sclk;
  input spi_mosi;
  output reg spi_miso;
  input spi_n_ss;

  input [7:0] tx_buffer;
  reg [7:0] tx_latch;
  output	reg [7:0] rx_buffer;
  output reg rx_ready;
  input rx_ready_ack;
  reg [2:0] bit_nbr;

  reg       between_bytes;

  // generate short rising/falling pulses
  reg [2:0] SCKr;
  always @(posedge clk_in) SCKr <= {SCKr[1:0], spi_sclk};
  wire sclk_risingedge = (SCKr[2:1] == 2'b01);
  wire sclk_fallingedge = (SCKr[2:1] == 2'b10);

  // generate short rising/falling pulses when nSS falls or rises
  // and remains stable at least one clock
  reg [3:0] NSSr;
  always @(posedge clk_in) NSSr <= {NSSr[2:0], spi_n_ss};
  wire nss_risen_stable = (NSSr[3:1] == 3'b011);
  output nss_risen_stable_out;
  assign nss_risen_stable_out = nss_risen_stable;

  initial begin
    bit_nbr  <= 3'b000;
    rx_buffer <= 8'b00000000;
    rx_ready    <= 1'b0;
    spi_miso <= 1'b0;
    between_bytes <= 1'b0;
  end

  always @(negedge clk_in) begin
    // keep spi_miso ready while we're between bytes
    if (between_bytes) spi_miso <= tx_latch[7];
    if (sclk_fallingedge) begin
      if (bit_nbr == 3'd0) begin
        between_bytes <= 1'b1;
      end else begin
        between_bytes <= 1'b0;
      end
      // set up data for MISO on negative clock edges
      if (spi_n_ss == 1'b0) begin
        spi_miso <= tx_latch[7-bit_nbr];
      end else begin
        spi_miso <= 1'bZ;
      end
    end
  end

  [MASKED]
endmodule

