module rtlpp_02533 (
  input wire sys_clk,
  input wire sys_rst_n,
  input wire accu_en,
  output wire accu_finished,
  input wire s_axis_aresetn,
  input wire s_axis_aclk,
  input wire s_axis_tvalid,
  output wire s_axis_tready,
  input wire [63:0] s_axis_tdata,
  input wire [7:0] s_axis_tkeep,
  input wire s_axis_tlast,
  input wire m_axis_aresetn,
  input wire m_axis_aclk,
  output wire m_axis_tvalid,
  input wire m_axis_tready,
  output wire [63:0] m_axis_tdata,
  output wire [7:0] m_axis_tkeep,
  output wire m_axis_tlast
);

// Internal signals
reg [63:0] accumulator;
reg [7:0] tkeep_reg;
reg tlast_reg;
reg tvalid_reg;
reg accu_finished_reg;

// Accumulate input data when enabled
always @(posedge sys_clk or negedge sys_rst_n) begin
  if (!sys_rst_n) begin
    accumulator <= 64'b0;
    accu_finished_reg <= 1'b0;
    tkeep_reg <= 8'b0;
    tlast_reg <= 1'b0;
    tvalid_reg <= 1'b0;
  end else if (accu_en && s_axis_tvalid && s_axis_tready) begin
    accumulator <= accumulator + s_axis_tdata;
    tkeep_reg <= s_axis_tkeep;
    tlast_reg <= s_axis_tlast;
    tvalid_reg <= 1'b1;
    if (s_axis_tlast) begin
      accu_finished_reg <= 1'b1;
    end
  end
end

// s_axis_tready signal functionality
assign s_axis_tready = !accu_finished_reg;

// Output signals
assign m_axis_tdata = accumulator;
assign m_axis_tkeep = tkeep_reg;
assign m_axis_tlast = tlast_reg;
assign m_axis_tvalid = tvalid_reg;
assign accu_finished = accu_finished_reg;

endmodule