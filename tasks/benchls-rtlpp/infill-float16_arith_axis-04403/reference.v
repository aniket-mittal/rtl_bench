module rtlpp_04403
   (M_AXIS_RESULT_0_tdata,
    M_AXIS_RESULT_0_tlast,
    M_AXIS_RESULT_0_tready,
    M_AXIS_RESULT_0_tvalid,
    S_AXIS_A_0_tdata,
    S_AXIS_A_0_tready,
    S_AXIS_A_0_tvalid,
    S_AXIS_B_0_tdata,
    S_AXIS_B_0_tready,
    S_AXIS_B_0_tvalid,
    clk,
    rst_n);

  output [15:0] M_AXIS_RESULT_0_tdata;
  output M_AXIS_RESULT_0_tlast;
  input M_AXIS_RESULT_0_tready;
  output M_AXIS_RESULT_0_tvalid;
  input [15:0] S_AXIS_A_0_tdata;
  output S_AXIS_A_0_tready;
  input S_AXIS_A_0_tvalid;
  input [15:0] S_AXIS_B_0_tdata;
  output S_AXIS_B_0_tready;
  input S_AXIS_B_0_tvalid;
  input clk;
  input rst_n;

  reg [15:0] floating_point_0_M_AXIS_RESULT_TDATA;
  reg floating_point_0_M_AXIS_RESULT_TREADY;
  reg floating_point_0_M_AXIS_RESULT_TVALID;
  reg [15:0] floating_point_1_M_AXIS_RESULT_TDATA;
  reg floating_point_1_M_AXIS_RESULT_TLAST;
  reg floating_point_1_M_AXIS_RESULT_TREADY;
  reg floating_point_1_M_AXIS_RESULT_TVALID;

  reg [15:0] a_data_reg, b_data_reg, result_data_reg;
  reg a_valid_reg, b_valid_reg, result_valid_reg;
  reg ready_reg, last_reg;

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      a_data_reg <= 16'b0;
      b_data_reg <= 16'b0;
      a_valid_reg <= 1'b0;
      b_valid_reg <= 1'b0;
      result_data_reg <= 16'b0;
      result_valid_reg <= 1'b0;
      ready_reg <= 1'b0;
      last_reg <= 1'b0;
    end else begin
      if (S_AXIS_A_0_tvalid) begin
        a_data_reg <= S_AXIS_A_0_tdata;
        a_valid_reg <= S_AXIS_A_0_tvalid;
      end

      if (S_AXIS_B_0_tvalid) begin
        b_data_reg <= S_AXIS_B_0_tdata;
        b_valid_reg <= S_AXIS_B_0_tvalid;
      end

      if (a_valid_reg && b_valid_reg) begin
        result_data_reg <= a_data_reg + b_data_reg; // Example operation
        result_valid_reg <= 1'b1;
        last_reg <= 1'b1; // Example scenario
      end

      ready_reg <= M_AXIS_RESULT_0_tready;
      floating_point_0_M_AXIS_RESULT_TDATA <= result_data_reg;
      floating_point_0_M_AXIS_RESULT_TREADY <= ready_reg;
      floating_point_0_M_AXIS_RESULT_TVALID <= result_valid_reg;
      floating_point_1_M_AXIS_RESULT_TDATA <= floating_point_0_M_AXIS_RESULT_TDATA;
      floating_point_1_M_AXIS_RESULT_TLAST <= last_reg;
      floating_point_1_M_AXIS_RESULT_TREADY <= ready_reg;
      floating_point_1_M_AXIS_RESULT_TVALID <= floating_point_0_M_AXIS_RESULT_TVALID;

      if (M_AXIS_RESULT_0_tready) begin
        result_valid_reg <= 1'b0;
      end
    end
  end

  assign M_AXIS_RESULT_0_tdata = floating_point_1_M_AXIS_RESULT_TDATA;
  assign M_AXIS_RESULT_0_tlast = floating_point_1_M_AXIS_RESULT_TLAST;
  assign M_AXIS_RESULT_0_tvalid = floating_point_1_M_AXIS_RESULT_TVALID;
  assign S_AXIS_A_0_tready = ready_reg;
  assign S_AXIS_B_0_tready = ready_reg;

endmodule