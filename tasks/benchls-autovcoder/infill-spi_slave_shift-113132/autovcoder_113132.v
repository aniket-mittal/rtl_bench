module autovcoder_113132 (
    input wire i_clk,
    input wire i_reset_n,
    // SPI bus
    input wire i_spi_cs_n,
    input wire i_spi_sck,
    input wire i_spi_si,
    output wire o_spi_so,
    //
    input wire [7:0] i_wr_data,
    output wire [7:0] o_rd_data,
    output wire o_last_bit
);

  reg r_spi_cs_n, r_spi_sck, r_spi_si;

  always @(posedge i_clk) begin
    r_spi_cs_n <= i_spi_cs_n;
    r_spi_sck  <= i_spi_sck;
    r_spi_si   <= i_spi_si;
  end

  reg r_spi_sck_prev;

  always @(posedge i_clk) r_spi_sck_prev <= r_spi_sck;

  wire w_sck_rise = r_spi_sck & (!r_spi_sck_prev);
  wire w_sck_fall = (!r_spi_sck) & r_spi_sck_prev;

  reg [2:0] r_bit_cnt;
  reg [7:0] r_dr_in, r_dr_out;
  wire w_reset = (i_reset_n == 1'b0) || (r_spi_cs_n == 1'b1);
  wire w_last_bit = (r_bit_cnt == 3'b111) & w_sck_fall;

  [MASKED]

  //assign o_spi_so = r_dr_out[0];
  assign o_spi_so   = r_dr_out[7];
  assign o_rd_data  = r_dr_in;
  assign o_last_bit = w_last_bit;

endmodule

