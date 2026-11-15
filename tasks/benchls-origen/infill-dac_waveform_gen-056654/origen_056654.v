module origen_056654 #(
    parameter AXIS_TDATA_WIDTH = 16,
    parameter AXIS_TDATA_PHASE_WIDTH = 16,
    parameter DAC_WIDTH = 14,
    parameter CFG_DATA_WIDTH = 64
) (
    input wire clk,
    input wire aresetn,
    input wire [AXIS_TDATA_WIDTH-1:0] s_axis_tdata,
    input wire s_axis_tvalid,
    input wire [AXIS_TDATA_PHASE_WIDTH-1:0] s_axis_tdata_phase,
    input wire s_axis_tvalid_phase,
    input wire [CFG_DATA_WIDTH-1:0] cfg_data,
    output wire m_axis_tvalid,
    output wire [DAC_WIDTH-1:0] m_axis_tdata
);

    reg [DAC_WIDTH-1:0] dac_out;
    reg [DAC_WIDTH-1:0] dac_out_temp_0;
    reg [DAC_WIDTH-1:0] phase;
    reg [3:0] signal_type;

    [MASKED]

    assign m_axis_tvalid = 1'b1;
    assign m_axis_tdata = dac_out;

endmodule