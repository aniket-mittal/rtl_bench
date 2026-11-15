module origen_114771 (
    input wire clk,
    input wire n_rst,
    input wire input_data,
    input wire reset_crc,
    output wire [4:0] inverted_crc
);

    // State definition
    localparam IDLE = 1'b0;
    localparam CRC = 1'b1;

    // Internal signals
    reg STATE, NXT_STATE;
    reg [4:0] crc, next_crc;

    // State transition logic
    always @(*) begin
        case (STATE)
            IDLE: NXT_STATE = reset_crc ? IDLE : CRC;
            CRC: NXT_STATE = reset_crc ? IDLE : CRC;
            default: NXT_STATE = IDLE;
        endcase
    end

    // CRC calculation logic
    always @(*) begin
        case (STATE)
            IDLE: next_crc = 5'b11111;
            CRC: begin
                next_crc[0] = crc[4] ^ input_data;
                next_crc[1] = crc[0];
                next_crc[2] = crc[1] ^ crc[4] ^ input_data;
                next_crc[3] = crc[2];
                next_crc[4] = crc[3];
            end
            default: next_crc = 5'b11111;
        endcase
    end

    // Register logic
    always @(posedge clk or negedge n_rst) begin
        if (~n_rst) begin
            STATE <= IDLE;
            crc <= 5'b11111;
        end else begin
            STATE <= NXT_STATE;
            crc <= next_crc;
        end
    end

    // Output assignment
    assign inverted_crc = ~crc;

endmodule