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

    always @(posedge clk or negedge aresetn) begin
        if (!aresetn) begin
            dac_out <= {DAC_WIDTH{1'b0}};
            dac_out_temp_0 <= {DAC_WIDTH{1'b0}};
            phase <= {DAC_WIDTH{1'b0}};
            signal_type <= 4'b0000;
        end else begin
            signal_type <= cfg_data[3:0];
            phase <= s_axis_tdata_phase[AXIS_TDATA_PHASE_WIDTH-1 -: DAC_WIDTH];

            case (signal_type)
                4'b0000: dac_out <= s_axis_tdata[AXIS_TDATA_WIDTH-1 -: DAC_WIDTH];
                4'b0001: dac_out <= ~phase;
                4'b0010: begin
                    dac_out_temp_0 <= {phase[DAC_WIDTH-2:0], 1'b0};
                    if (phase[DAC_WIDTH-1]) begin
                        dac_out <= ~dac_out_temp_0;
                    end else begin
                        dac_out <= dac_out_temp_0;
                    end
                end
                4'b0011: dac_out <= phase;
                default: dac_out <= dac_out;
            endcase
        end
    end

    assign m_axis_tvalid = 1'b1;
    assign m_axis_tdata = dac_out;

endmodule