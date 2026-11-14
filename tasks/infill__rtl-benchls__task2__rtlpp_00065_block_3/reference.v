module rtlpp_00065 (
    ap_clk,
    ap_rst_n,
    in0_V_TVALID,
    in0_V_TREADY,
    in0_V_TDATA,
    weights_V_TVALID,
    weights_V_TREADY,
    weights_V_TDATA,
    out_V_TVALID,
    out_V_TREADY,
    out_V_TDATA
);

input wire ap_clk;
input wire ap_rst_n;
input wire in0_V_TVALID;
output reg in0_V_TREADY;
input wire [31:0] in0_V_TDATA;
input wire weights_V_TVALID;
output reg weights_V_TREADY;
input wire [287:0] weights_V_TDATA;
output reg out_V_TVALID;
input wire out_V_TREADY;
output reg [15:0] out_V_TDATA;

// Internal Registers
reg [31:0] data_in_reg;
reg [287:0] weights_reg;
reg [15:0] result_reg;

// Input and Weight Ready Signals
always @(posedge ap_clk or negedge ap_rst_n) begin
    if (!ap_rst_n) begin
        in0_V_TREADY <= 1'b0;
        weights_V_TREADY <= 1'b0;
    end else begin
        in0_V_TREADY <= 1'b1;
        weights_V_TREADY <= 1'b1;
    end
end

// Data and Weight Capture
always @(posedge ap_clk or negedge ap_rst_n) begin
    if (!ap_rst_n) begin
        data_in_reg <= 32'b0;
        weights_reg <= 288'b0;
    end else if (in0_V_TVALID && in0_V_TREADY) begin
        data_in_reg <= in0_V_TDATA;
    end else if (weights_V_TVALID && weights_V_TREADY) begin
        weights_reg <= weights_V_TDATA;
    end
end

// Simple Output Logic (Example: result = data_in * weight[0])
always @(posedge ap_clk or negedge ap_rst_n) begin
    if (!ap_rst_n) begin
        result_reg <= 16'b0;
    end else begin
        result_reg <= data_in_reg * weights_reg[15:0]; // Simple example computation
    end
end

// Output
always @(posedge ap_clk or negedge ap_rst_n) begin
    if (!ap_rst_n) begin
        out_V_TVALID <= 1'b0;
        out_V_TDATA <= 16'b0;
    end else if (out_V_TREADY) begin
        out_V_TVALID <= 1'b1;
        out_V_TDATA <= result_reg;
    end
end

endmodule