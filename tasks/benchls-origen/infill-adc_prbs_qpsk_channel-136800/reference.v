module origen_136800 #(
    parameter DATA_WIDTH = 16,
    parameter CHANNEL_ID = 4'b0001
)(
    input wire clk,
    input wire [31:0] control,
    input wire src_adc_valid,
    input wire [DATA_WIDTH-1:0] src_adc_data,
    input wire src_adc_enable,
    
    output reg [31:0] status,
    output reg dst_adc_valid,
    output reg [DATA_WIDTH-1:0] dst_adc_data,
    output reg dst_adc_enable
);

// Control register bits
localparam [3:0] CHANNEL_SEL = 4'b0011;
localparam [5:4] MODE_SEL = 2'b01;
localparam PRBS_RESET = 6;

// Mode selection
localparam MODE_PASSTHROUGH = 2'b00;
localparam MODE_PRBS = 2'b01;
localparam MODE_QPSK = 2'b10;

// Status register bits
localparam PRBS_ERROR = 0;
localparam OUT_OF_SYNC = 1;

// Internal signals
reg [3:0] selected_channel;
reg [1:0] selected_mode;
reg [DATA_WIDTH-1:0] prbs_reg;
reg [1:0] qpsk_phase;
reg prbs_error_flag;
reg out_of_sync_flag;

// PRBS generation
function [DATA_WIDTH-1:0] prbs_next;
    input [DATA_WIDTH-1:0] current;
    begin
        prbs_next = {current[DATA_WIDTH-2:0], current[DATA_WIDTH-1] ^ current[DATA_WIDTH-2]};
    end
endfunction

// QPSK demodulation
function [1:0] qpsk_demod;
    input [DATA_WIDTH-1:0] data;
    begin
        case (data[DATA_WIDTH-1:DATA_WIDTH-2])
            2'b00: qpsk_demod = 2'b00;
            2'b01: qpsk_demod = 2'b01;
            2'b10: qpsk_demod = 2'b11;
            2'b11: qpsk_demod = 2'b10;
        endcase
    end
endfunction

always @(posedge clk) begin
    // Update control signals
    selected_channel <= control[CHANNEL_SEL];
    selected_mode <= control[MODE_SEL];
    
    // Process incoming data
    if (src_adc_valid && src_adc_enable) begin
        case (selected_mode)
            MODE_PASSTHROUGH: begin
                dst_adc_data <= src_adc_data;
                dst_adc_valid <= 1'b1;
            end
            MODE_PRBS: begin
                if (control[PRBS_RESET]) begin
                    prbs_reg <= src_adc_data;
                    prbs_error_flag <= 1'b0;
                    out_of_sync_flag <= 1'b0;
                end else begin
                    prbs_reg <= prbs_next(prbs_reg);
                    if (prbs_reg != src_adc_data) begin
                        prbs_error_flag <= 1'b1;
                        out_of_sync_flag <= 1'b1;
                    end
                end
                dst_adc_data <= prbs_reg;
                dst_adc_valid <= 1'b1;
            end
            MODE_QPSK: begin
                qpsk_phase <= qpsk_demod(src_adc_data);
                dst_adc_data <= {14'b0, qpsk_phase};
                dst_adc_valid <= 1'b1;
            end
            default: begin
                dst_adc_data <= {DATA_WIDTH{1'b0}};
                dst_adc_valid <= 1'b0;
            end
        endcase
    end else begin
        dst_adc_valid <= 1'b0;
    end
    
    // Update status register
    if (selected_mode == MODE_PRBS && selected_channel == CHANNEL_ID) begin
        status[PRBS_ERROR] <= prbs_error_flag;
        status[OUT_OF_SYNC] <= out_of_sync_flag;
    end else begin
        status <= 32'b0;
    end
    
    // Update enable signal
    dst_adc_enable <= src_adc_enable;
end

endmodule