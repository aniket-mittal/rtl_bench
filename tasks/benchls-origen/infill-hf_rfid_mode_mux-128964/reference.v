module origen_128964 (
    input wire clk,
    input wire rst_n,
    input wire [2:0] mode_select,
    input wire [7:0] adc_data,
    output wire [7:0] output_data,
    output wire output_valid,
    output wire adc_enable
);

// Mode parameters
localparam HF_READER = 3'b000;
localparam HF_SIM_TAG = 3'b001;
localparam HF_ISO14443A = 3'b010;
localparam HF_SNOOP = 3'b011;
localparam HF_GET_TRACE = 3'b100;
localparam HF_OFF = 3'b101;

// Sub-module outputs
reg [7:0] hf_reader_data;
reg hf_reader_valid;
reg [7:0] hf_sim_tag_data;
reg hf_sim_tag_valid;
reg [7:0] hf_iso14443a_data;
reg hf_iso14443a_valid;
reg [7:0] hf_snoop_data;
reg hf_snoop_valid;
reg [7:0] hf_get_trace_data;
reg hf_get_trace_valid;

// Simplified sub-module logic
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        hf_reader_data <= 8'b0;
        hf_reader_valid <= 1'b0;
        hf_sim_tag_data <= 8'b0;
        hf_sim_tag_valid <= 1'b0;
        hf_iso14443a_data <= 8'b0;
        hf_iso14443a_valid <= 1'b0;
        hf_snoop_data <= 8'b0;
        hf_snoop_valid <= 1'b0;
        hf_get_trace_data <= 8'b0;
        hf_get_trace_valid <= 1'b0;
    end else begin
        // Simplified logic for each mode
        hf_reader_data <= adc_data;
        hf_reader_valid <= 1'b1;
        hf_sim_tag_data <= adc_data + 1;
        hf_sim_tag_valid <= 1'b1;
        hf_iso14443a_data <= adc_data + 2;
        hf_iso14443a_valid <= 1'b1;
        hf_snoop_data <= adc_data + 3;
        hf_snoop_valid <= 1'b1;
        hf_get_trace_data <= adc_data + 4;
        hf_get_trace_valid <= 1'b1;
    end
end

// Mode selection logic
reg [7:0] selected_data;
reg selected_valid;

always @(*) begin
    case (mode_select)
        HF_READER: begin
            selected_data = hf_reader_data;
            selected_valid = hf_reader_valid;
        end
        HF_SIM_TAG: begin
            selected_data = hf_sim_tag_data;
            selected_valid = hf_sim_tag_valid;
        end
        HF_ISO14443A: begin
            selected_data = hf_iso14443a_data;
            selected_valid = hf_iso14443a_valid;
        end
        HF_SNOOP: begin
            selected_data = hf_snoop_data;
            selected_valid = hf_snoop_valid;
        end
        HF_GET_TRACE: begin
            selected_data = hf_get_trace_data;
            selected_valid = hf_get_trace_valid;
        end
        default: begin
            selected_data = 8'b0;
            selected_valid = 1'b0;
        end
    endcase
end

// Output assignment
assign output_data = selected_data;
assign output_valid = selected_valid;

// ADC enable logic
assign adc_enable = (mode_select != HF_OFF);

endmodule