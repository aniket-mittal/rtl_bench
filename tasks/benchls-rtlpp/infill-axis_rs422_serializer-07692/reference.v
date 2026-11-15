module rtlpp_07692 (
    input [31:0] S_AXIS_tdata,
    input [3:0] S_AXIS_tkeep,
    input S_AXIS_tlast,
    output S_AXIS_tready,
    input [3:0] S_AXIS_tstrb,
    input S_AXIS_tvalid,
    input aclk,
    input aresetn,
    output rs422_clk,
    output rs422_cs,
    output rs422_data
);

wire [31:0] S_AXIS_1_TDATA;
wire [3:0] S_AXIS_1_TKEEP;
wire S_AXIS_1_TLAST;
wire S_AXIS_1_TREADY;
wire [3:0] S_AXIS_1_TSTRB;
wire S_AXIS_1_TVALID;
wire aclk_1;
wire aresetn_1;
wire [7:0] axis_dwidth_converter_0_M_AXIS_TDATA;
wire axis_dwidth_converter_0_M_AXIS_TLAST;
wire axis_dwidth_converter_0_M_AXIS_TREADY;
wire axis_dwidth_converter_0_M_AXIS_TVALID;
wire axistreamtors422_0_rs422_clk;
wire axistreamtors422_0_rs422_cs;
wire axistreamtors422_0_rs422_data;

assign S_AXIS_1_TDATA = S_AXIS_tdata[31:0];
assign S_AXIS_1_TKEEP = S_AXIS_tkeep[3:0];
assign S_AXIS_1_TLAST = S_AXIS_tlast;
assign S_AXIS_1_TSTRB = S_AXIS_tstrb[3:0];
assign S_AXIS_1_TVALID = S_AXIS_tvalid;
assign S_AXIS_tready = S_AXIS_1_TREADY;
assign aclk_1 = aclk;
assign aresetn_1 = aresetn;
assign rs422_clk = axistreamtors422_0_rs422_clk;
assign rs422_cs = axistreamtors422_0_rs422_cs;
assign rs422_data = axistreamtors422_0_rs422_data;

// Embedded logic for axis_dwidth_converter_0
reg [31:0] axis_data_reg;
reg [3:0] axis_keep_reg;
reg axis_last_reg;
reg axis_valid_reg;
assign S_AXIS_1_TREADY = !axis_valid_reg;

always @(posedge aclk_1 or negedge aresetn_1) begin
    if (!aresetn_1) begin
        axis_valid_reg <= 0;
    end else if (S_AXIS_1_TREADY && S_AXIS_1_TVALID) begin
        axis_data_reg <= S_AXIS_1_TDATA;
        axis_keep_reg <= S_AXIS_1_TKEEP;
        axis_last_reg <= S_AXIS_1_TLAST;
        axis_valid_reg <= 1;
    end else if (axis_dwidth_converter_0_M_AXIS_TREADY) begin
        axis_valid_reg <= 0;
    end
end

assign axis_dwidth_converter_0_M_AXIS_TDATA = axis_data_reg[7:0];
assign axis_dwidth_converter_0_M_AXIS_TLAST = axis_last_reg;
assign axis_dwidth_converter_0_M_AXIS_TVALID = axis_valid_reg;
assign axis_dwidth_converter_0_M_AXIS_TREADY = 1; // Always ready for simplicity

// Embedded logic for axistreamtors422_0
reg rs422_clk_reg;
reg rs422_cs_reg;
reg rs422_data_reg;

always @(posedge aclk_1 or negedge aresetn_1) begin
    if (!aresetn_1) begin
        rs422_clk_reg <= 0;
        rs422_cs_reg <= 0;
        rs422_data_reg <= 0;
    end else if (axis_dwidth_converter_0_M_AXIS_TVALID) begin
        rs422_clk_reg <= ~rs422_clk_reg;
        rs422_cs_reg <= 1;
        rs422_data_reg <= axis_dwidth_converter_0_M_AXIS_TDATA[0];
    end else begin
        rs422_cs_reg <= 0;
    end
end

assign axistreamtors422_0_rs422_clk = rs422_clk_reg;
assign axistreamtors422_0_rs422_cs = rs422_cs_reg;
assign axistreamtors422_0_rs422_data = rs422_data_reg;

endmodule