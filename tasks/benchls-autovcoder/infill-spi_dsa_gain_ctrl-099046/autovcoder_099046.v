module autovcoder_099046 #(
    parameter TABLE_NUM = 2'b01
) (
    input  wire       ctrl_sck,
    input  wire       ctrl_csb,
    input  wire       ctrl_mosi,
    output reg        ctrl_miso,
    output wire [4:0] dsa,
    output reg        dsa1_le,
    output reg        dsa2_le
);

  localparam CNT_GAIN1_DRIVE = 10,
           CNT_DSA1_LE_RISE = 11,
           CNT_DSA1_LE_FALL = 14,
           CNT_GAIN1_RELEASE = 17;
  localparam CNT_GAIN2_DRIVE = 17,
           CNT_DSA2_LE_RISE = 18,
           CNT_DSA2_LE_FALL = 21,
           CNT_GAIN2_RELEASE = 24;

  reg [4:0] ctrl_bit_cnt;
  reg [1:0] ctrl_tbl;
  reg [5:0] ctrl_index;
  reg [5:0] gain1, gain2;
  reg gain1_t;
  reg gain2_t;

  assign dsa = (!gain1_t | !gain2_t) ? ctrl_index[4:0] : 5'b11111;

  // Cycle counter for where we are in protocol and shift register for input
  // Also controls timing of DSAs' latch enable signals
  always @(posedge ctrl_sck or posedge ctrl_csb) begin
    if (ctrl_csb) begin
      ctrl_bit_cnt <= 5'd0;
      dsa1_le      <= 1'b0;
      dsa2_le      <= 1'b0;
      gain1_t      <= 1'b1;
      gain2_t      <= 1'b1;
    end else if (!ctrl_csb) begin
      if (ctrl_bit_cnt < 23) begin
        ctrl_bit_cnt <= ctrl_bit_cnt + 5'd1;
      end

      if (ctrl_bit_cnt < 8) begin
        {ctrl_tbl, ctrl_index} <= {ctrl_tbl[0], ctrl_index, ctrl_mosi};
      end

      if (ctrl_tbl == TABLE_NUM) begin
        if ((ctrl_bit_cnt == CNT_GAIN1_DRIVE) && (ctrl_mosi)) begin
          gain1   <= ctrl_index;
          gain1_t <= 1'b0;
        end else if ((gain1_t == 1'b0) && (ctrl_bit_cnt == CNT_DSA1_LE_RISE)) begin
          dsa1_le <= 1'b1;
        end else if ((gain1_t == 1'b0) && (ctrl_bit_cnt == CNT_DSA1_LE_FALL)) begin
          dsa1_le <= 1'b0;
        end else if ((gain1_t == 1'b0) && (ctrl_bit_cnt == CNT_GAIN1_RELEASE)) begin
          gain1_t <= 1'b1;
        end

        if ((ctrl_bit_cnt == CNT_GAIN2_DRIVE) && (ctrl_mosi)) begin
          gain2   <= ctrl_index;
          gain2_t <= 1'b0;
        end else if ((gain2_t == 1'b0) && (ctrl_bit_cnt == CNT_DSA2_LE_RISE)) begin
          dsa2_le <= 1'b1;
        end else if ((gain2_t == 1'b0) && (ctrl_bit_cnt == CNT_DSA2_LE_FALL)) begin
          dsa2_le <= 1'b0;
        end else if ((gain2_t == 1'b0) && (ctrl_bit_cnt == CNT_GAIN2_RELEASE)) begin
          gain2_t <= 1'b1;
        end
      end
    end
  end

  // SPI readback for ctrl bus, based on current bit count
  [MASKED]


endmodule

