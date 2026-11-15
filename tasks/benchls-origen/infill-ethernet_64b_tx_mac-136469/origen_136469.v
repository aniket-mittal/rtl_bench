module origen_136469 #(
    parameter DATA_WIDTH = 64,
    parameter KEEP_WIDTH = DATA_WIDTH/8,
    parameter HDR_WIDTH = 16,
    parameter ENABLE_PADDING = 1,
    parameter ENABLE_DIC = 1,
    parameter MIN_FRAME_LENGTH = 64,
    parameter ENABLE_PTP = 1,
    parameter PTP_PERIOD_NS = 4,
    parameter PTP_PERIOD_FNS = 0,
    parameter PTP_TS_ENABLE = 1,
    parameter PTP_TS_WIDTH = 96,
    parameter USER_TAG_WIDTH = 16,
    parameter ENABLE_REVERSE = 0,
    parameter ENABLE_SCRAMBLER = 1,
    parameter ENABLE_PRBS31 = 0
) (
    input wire clk,
    input wire rst_n,

    // Transmit interface
    input wire [DATA_WIDTH-1:0] tx_data,
    input wire [KEEP_WIDTH-1:0] tx_keep,
    input wire tx_valid,
    input wire tx_sop,
    input wire tx_eop,
    output wire tx_ready,

    // SerDes interface
    output wire [63:0] serdes_tx_data,
    output wire [7:0] serdes_tx_header,

    // PTP interface
    input wire [PTP_TS_WIDTH-1:0] ptp_ts,
    output reg [PTP_TS_WIDTH-1:0] tx_ptp_ts,
    output reg tx_ptp_ts_valid,

    // Status and control
    output wire tx_start,
    output wire tx_underflow_error,
    input wire [7:0] ifg_delay,
    input wire prbs31_enable,

    // User-defined tag
    input wire [USER_TAG_WIDTH-1:0] user_tag
);

    // Internal registers and wires
    reg [63:0] tx_buffer;
    reg [7:0] tx_header;
    reg [15:0] frame_length;
    reg [7:0] ifg_counter;
    reg tx_active;
    reg ptp_ts_captured;

    // State machine
    localparam IDLE = 2'd0, TRANSMIT = 2'd1, IFG = 2'd2;
    reg [1:0] state, next_state;

    // PRBS31 generator
    reg [30:0] prbs31_state;
    wire prbs31_out = prbs31_state[30] ^ prbs31_state[27];

    // Scrambler
    reg [57:0] scrambler_state;
    wire scrambler_out = scrambler_state[57] ^ scrambler_state[38];

    [MASKED]

    // Next state logic
    always @(*) begin
        next_state = state;
        case (state)
            IDLE: if (tx_valid && tx_sop) next_state = TRANSMIT;
            TRANSMIT: if (tx_eop) next_state = IFG;
            IFG: if (ifg_counter == 0) next_state = IDLE;
        endcase
    end

    // Output assignments
    assign tx_ready = (state == IDLE) || (state == TRANSMIT && !tx_eop);
    assign tx_start = (state == IDLE) && tx_valid && tx_sop;
    assign tx_underflow_error = tx_active && !tx_valid;

    // SerDes interface
    wire [63:0] reversed_tx_data;
    wire [7:0] reversed_tx_header;

    generate
        if (ENABLE_REVERSE) begin
            genvar i;
            for (i = 0; i < 8; i = i + 1) begin : reverse_data
                assign reversed_tx_data[i*8+7:i*8] = tx_buffer[(7-i)*8+7:(7-i)*8];
            end
            for (i = 0; i < 8; i = i + 1) begin : reverse_header
                assign reversed_tx_header[i] = tx_header[7-i];
            end
        end else begin
            assign reversed_tx_data = tx_buffer;
            assign reversed_tx_header = tx_header;
        end
    endgenerate

    // Apply PRBS31 or scrambler
    wire [63:0] final_tx_data;
    generate
        if (ENABLE_PRBS31) begin
            assign final_tx_data = prbs31_enable ? (reversed_tx_data ^ {64{prbs31_out}}) : reversed_tx_data;
        end else if (ENABLE_SCRAMBLER) begin
            assign final_tx_data = reversed_tx_data ^ {64{scrambler_out}};
        end else begin
            assign final_tx_data = reversed_tx_data;
        end
    endgenerate

    assign serdes_tx_data = final_tx_data;
    assign serdes_tx_header = reversed_tx_header;

endmodule