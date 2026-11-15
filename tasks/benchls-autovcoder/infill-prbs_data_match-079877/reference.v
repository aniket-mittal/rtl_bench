module autovcoder_079877 #(
    parameter TCQ           = 100,
    parameter nCK_PER_CLK   = 4,
    parameter DQS_CNT_WIDTH = 3,
    parameter DQ_WIDTH      = 64
) (  /*AUTOARG*/
    // Outputs
    match,
    // Inputs
    clk,
    rst,
    complex_oclkdelay_calib_start,
    phy_rddata,
    prbs_o,
    oclkdelay_calib_cnt,
    prbs_ignore_first_byte,
    prbs_ignore_last_bytes,
    phy_rddata_en_1
);

  localparam [7:0] OCAL_DQ_MASK = 8'b0000_0000;

  input clk;
  input rst;

  input complex_oclkdelay_calib_start;
  input [2*nCK_PER_CLK*DQ_WIDTH-1:0] phy_rddata;
  input [2*nCK_PER_CLK*DQ_WIDTH-1:0] prbs_o;
  input [DQS_CNT_WIDTH:0] oclkdelay_calib_cnt;

  reg [DQ_WIDTH-1:0] word, word_shifted;

  reg [63:0] data_bytes_ns, data_bytes_r, data_bytes_r1, data_bytes_r2, prbs_bytes_ns, prbs_bytes_r;
  always @(posedge clk) data_bytes_r <= #TCQ data_bytes_ns;
  always @(posedge clk) data_bytes_r1 <= #TCQ data_bytes_r;
  always @(posedge clk) data_bytes_r2 <= #TCQ data_bytes_r1;
  always @(posedge clk) prbs_bytes_r <= #TCQ prbs_bytes_ns;

  input prbs_ignore_first_byte, prbs_ignore_last_bytes;
  reg prbs_ignore_first_byte_r, prbs_ignore_last_bytes_r;
  always @(posedge clk) prbs_ignore_first_byte_r <= #TCQ prbs_ignore_first_byte;
  always @(posedge clk) prbs_ignore_last_bytes_r <= #TCQ prbs_ignore_last_bytes;

  input phy_rddata_en_1;
  reg  [ 7:0] last_byte_r;
  wire [63:0] data_bytes = complex_oclkdelay_calib_start ? data_bytes_r2 : data_bytes_r;

  wire [ 7:0] last_byte_ns;
  generate
    if (nCK_PER_CLK == 4) begin
      assign last_byte_ns = phy_rddata_en_1 ? data_bytes[63:56] : last_byte_r;
    end else begin
      assign last_byte_ns = phy_rddata_en_1 ? data_bytes[31:24] : last_byte_r;
    end
  endgenerate
  always @(posedge clk) last_byte_r <= #TCQ last_byte_ns;

  reg second_half_ns, second_half_r;
  always @(posedge clk) second_half_r <= #TCQ second_half_ns;
  always @(*) begin
    second_half_ns = second_half_r;
    if (rst) second_half_ns = 1'b0;
    else second_half_ns = phy_rddata_en_1 ^ second_half_r;
  end

  reg [7:0] comp0, comp180, prbs0, prbs180;

  integer ii;
  always @(*) begin
    comp0 = 8'hff;
    comp180 = 8'hff;
    prbs0 = 8'hff;
    prbs180 = 8'hff;
    data_bytes_ns = 64'b0;
    prbs_bytes_ns = 64'b0;
    for (ii = 0; ii < 2 * nCK_PER_CLK; ii = ii + 1) begin
      word = phy_rddata[ii*DQ_WIDTH+:DQ_WIDTH];
      word_shifted = word >> oclkdelay_calib_cnt * 8;
      data_bytes_ns[ii*8+:8] = word_shifted[7:0];

      word = prbs_o[ii*DQ_WIDTH+:DQ_WIDTH];
      word_shifted = word >> oclkdelay_calib_cnt * 8;
      prbs_bytes_ns[ii*8+:8] = word_shifted[7:0];

      comp0[ii] = data_bytes[ii*8+:8] == (ii % 2 ? 8'hff : 8'h00);
      comp180[ii] = data_bytes[ii*8+:8] == (ii % 2 ? 8'h00 : 8'hff);

      prbs0[ii] = data_bytes[ii*8+:8] == prbs_bytes_r[ii*8+:8];
    end  // for (ii=0; ii<2*nCK_PER_CLK; ii=ii+1)
    prbs180[0] = last_byte_r == prbs_bytes_r[7:0];
    for (ii = 1; ii < 2 * nCK_PER_CLK; ii = ii + 1)
    prbs180[ii] = data_bytes[(ii-1)*8+:8] == prbs_bytes_r[ii*8+:8];
    if (nCK_PER_CLK == 4) begin
      if (prbs_ignore_last_bytes_r) begin
        prbs0[7:6] = 2'b11;
        prbs180[7] = 1'b1;
      end
      if (prbs_ignore_first_byte_r) prbs180[0] = 1'b1;
    end else begin
      if (second_half_r) begin
        if (prbs_ignore_last_bytes_r) begin
          prbs0[3:2] = 2'b11;
          prbs180[3] = 1'b1;
        end
      end else if (prbs_ignore_first_byte_r) prbs180[0] = 1'b1;
    end  // else: !if(nCK_PER_CLK == 4)
  end  // always @ (*)

  wire [7:0] comp0_masked = comp0 | OCAL_DQ_MASK;
  wire [7:0] comp180_masked = comp180 | OCAL_DQ_MASK;
  wire [7:0] prbs0_masked = prbs0 | OCAL_DQ_MASK;
  wire [7:0] prbs180_masked = prbs180 | OCAL_DQ_MASK;

  output [1:0] match;
  assign match = complex_oclkdelay_calib_start ? {&prbs180_masked, &prbs0_masked} : {&comp180_masked , &comp0_masked};


endmodule

