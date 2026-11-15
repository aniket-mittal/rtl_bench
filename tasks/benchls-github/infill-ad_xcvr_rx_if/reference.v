module ad_xcvr_rx_if #(
  parameter OCTETS_PER_BEAT = 4,
  parameter DW = OCTETS_PER_BEAT * 8
) (

  // jesd interface

  input rx_clk,
  input [OCTETS_PER_BEAT-1:0] rx_ip_sof,
  input [DW-1:0] rx_ip_data,
  output reg rx_sof,
  output reg [DW-1:0] rx_data
);

  // rx_ip_sof:
  // The input beat may contain more than one frame per clock, a sof bit is set for
  // each frame.
  // Every bit that corresponds to a octet that is at the beginning of a frame
  // the bit is set. E.g for OCTETS_PER_BEAT = 4
  //   if F=1 all bits are set,
  //      F=2 sof=4'b0101,
  //      F=4 sof=4'b0001

  //
  // rx_ip_data:
  // The temporal ordering of the octets is from LSB to MSB,
  // this means the octet placed in the lowest 8 bits was received first,
  // the octet placed in the highest 8 bits was received last.

  // internal registers

  reg     [DW-1:0]  rx_ip_data_d = 'd0;
  reg     [OCTETS_PER_BEAT-1:0]  rx_ip_sof_hold = 'd0;
  reg     [OCTETS_PER_BEAT-1:0]  rx_ip_sof_d = 'd0;

  always @(posedge rx_clk) begin
    rx_ip_data_d <= rx_ip_data;
    rx_ip_sof_d <= rx_ip_sof;
    if (|rx_ip_sof) begin
      rx_ip_sof_hold <= rx_ip_sof;
    end
    rx_sof <= |rx_ip_sof_d;
  end

  wire [OCTETS_PER_BEAT*DW-1:0] rx_data_s;
  assign rx_data_s[0 +: DW] = rx_ip_data;
  generate
    genvar i;
    for (i = 1; i < OCTETS_PER_BEAT; i = i + 1) begin : g_rx_data_opt
      assign rx_data_s[i*DW +: DW] = {rx_ip_data[i*8-1 : 0], rx_ip_data_d[DW-1 : i*8]};
    end
  endgenerate

  integer j;
  always @(posedge rx_clk) begin
    for (j = OCTETS_PER_BEAT-1; j >= 0; j = j - 1) begin
      if (rx_ip_sof_hold[j] == 1'b1) begin
        rx_data <= rx_data_s[j*DW +: DW];
      end
    end
  end

endmodule