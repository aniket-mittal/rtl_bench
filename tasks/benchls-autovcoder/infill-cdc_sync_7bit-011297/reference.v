module autovcoder_011297 (
    iclk_i,
    iclk_reset_i,
    oclk_i,
    iclk_data_i,
    iclk_data_o,
    oclk_data_o
);

  input [6:0] iclk_data_i;
  output [6:0] iclk_data_o;
  output [6:0] oclk_data_o;
  input iclk_i;
  input iclk_reset_i;
  input oclk_i;
  wire [6:0] iclk_data_o, oclk_data_o, bsg_SYNC_1_r;
  reg
      iclk_data_o_6_sv2v_reg,
      iclk_data_o_5_sv2v_reg,
      iclk_data_o_4_sv2v_reg,
      iclk_data_o_3_sv2v_reg,
      iclk_data_o_2_sv2v_reg,
      iclk_data_o_1_sv2v_reg,
      iclk_data_o_0_sv2v_reg,
      bsg_SYNC_1_r_6_sv2v_reg,
      bsg_SYNC_1_r_5_sv2v_reg,
      bsg_SYNC_1_r_4_sv2v_reg,
      bsg_SYNC_1_r_3_sv2v_reg,
      bsg_SYNC_1_r_2_sv2v_reg,
      bsg_SYNC_1_r_1_sv2v_reg,
      bsg_SYNC_1_r_0_sv2v_reg,
      oclk_data_o_6_sv2v_reg,
      oclk_data_o_5_sv2v_reg,
      oclk_data_o_4_sv2v_reg,
      oclk_data_o_3_sv2v_reg,
      oclk_data_o_2_sv2v_reg,
      oclk_data_o_1_sv2v_reg,
      oclk_data_o_0_sv2v_reg;
  assign iclk_data_o[6]  = iclk_data_o_6_sv2v_reg;
  assign iclk_data_o[5]  = iclk_data_o_5_sv2v_reg;
  assign iclk_data_o[4]  = iclk_data_o_4_sv2v_reg;
  assign iclk_data_o[3]  = iclk_data_o_3_sv2v_reg;
  assign iclk_data_o[2]  = iclk_data_o_2_sv2v_reg;
  assign iclk_data_o[1]  = iclk_data_o_1_sv2v_reg;
  assign iclk_data_o[0]  = iclk_data_o_0_sv2v_reg;
  assign bsg_SYNC_1_r[6] = bsg_SYNC_1_r_6_sv2v_reg;
  assign bsg_SYNC_1_r[5] = bsg_SYNC_1_r_5_sv2v_reg;
  assign bsg_SYNC_1_r[4] = bsg_SYNC_1_r_4_sv2v_reg;
  assign bsg_SYNC_1_r[3] = bsg_SYNC_1_r_3_sv2v_reg;
  assign bsg_SYNC_1_r[2] = bsg_SYNC_1_r_2_sv2v_reg;
  assign bsg_SYNC_1_r[1] = bsg_SYNC_1_r_1_sv2v_reg;
  assign bsg_SYNC_1_r[0] = bsg_SYNC_1_r_0_sv2v_reg;
  assign oclk_data_o[6]  = oclk_data_o_6_sv2v_reg;
  assign oclk_data_o[5]  = oclk_data_o_5_sv2v_reg;
  assign oclk_data_o[4]  = oclk_data_o_4_sv2v_reg;
  assign oclk_data_o[3]  = oclk_data_o_3_sv2v_reg;
  assign oclk_data_o[2]  = oclk_data_o_2_sv2v_reg;
  assign oclk_data_o[1]  = oclk_data_o_1_sv2v_reg;
  assign oclk_data_o[0]  = oclk_data_o_0_sv2v_reg;

  always @(posedge iclk_i) begin
    if (iclk_reset_i) begin
      iclk_data_o_6_sv2v_reg <= 1'b0;
      iclk_data_o_5_sv2v_reg <= 1'b0;
      iclk_data_o_4_sv2v_reg <= 1'b0;
      iclk_data_o_3_sv2v_reg <= 1'b0;
      iclk_data_o_2_sv2v_reg <= 1'b0;
      iclk_data_o_1_sv2v_reg <= 1'b0;
      iclk_data_o_0_sv2v_reg <= 1'b0;
    end else if (1'b1) begin
      iclk_data_o_6_sv2v_reg <= iclk_data_i[6];
      iclk_data_o_5_sv2v_reg <= iclk_data_i[5];
      iclk_data_o_4_sv2v_reg <= iclk_data_i[4];
      iclk_data_o_3_sv2v_reg <= iclk_data_i[3];
      iclk_data_o_2_sv2v_reg <= iclk_data_i[2];
      iclk_data_o_1_sv2v_reg <= iclk_data_i[1];
      iclk_data_o_0_sv2v_reg <= iclk_data_i[0];
    end
  end


  always @(posedge oclk_i) begin
    if (1'b1) begin
      bsg_SYNC_1_r_6_sv2v_reg <= iclk_data_o[6];
      bsg_SYNC_1_r_5_sv2v_reg <= iclk_data_o[5];
      bsg_SYNC_1_r_4_sv2v_reg <= iclk_data_o[4];
      bsg_SYNC_1_r_3_sv2v_reg <= iclk_data_o[3];
      bsg_SYNC_1_r_2_sv2v_reg <= iclk_data_o[2];
      bsg_SYNC_1_r_1_sv2v_reg <= iclk_data_o[1];
      bsg_SYNC_1_r_0_sv2v_reg <= iclk_data_o[0];
      oclk_data_o_6_sv2v_reg  <= bsg_SYNC_1_r[6];
      oclk_data_o_5_sv2v_reg  <= bsg_SYNC_1_r[5];
      oclk_data_o_4_sv2v_reg  <= bsg_SYNC_1_r[4];
      oclk_data_o_3_sv2v_reg  <= bsg_SYNC_1_r[3];
      oclk_data_o_2_sv2v_reg  <= bsg_SYNC_1_r[2];
      oclk_data_o_1_sv2v_reg  <= bsg_SYNC_1_r[1];
      oclk_data_o_0_sv2v_reg  <= bsg_SYNC_1_r[0];
    end
  end


endmodule

