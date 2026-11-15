module origen_040611 (
    input wire clk_fsm,
    input wire sending_clk_sync,
    input wire [7:0] data_fifo_xcvr,
    input wire [7:0] data_fifo_uart,
    input wire fifo_empty_xcvr,
    input wire fifo_empty_uart,
    input wire [7:0] padding_char,
    output reg fifo_read_xcvr,
    output reg fifo_read_uart,
    output reg [7:0] data_8b10,
    output reg is_control_char,
    output reg is_padding_char,
    output reg enable_data_out,
    output reg busy
);

    // State encoding
    localparam [3:0]
        IDLE = 4'd0,
        PRIO_CHOOSER = 4'd1,
        READ_XCVR = 4'd2,
        READ_UART = 4'd3,
        OUT_XCVR = 4'd4,
        OUT_UART = 4'd5,
        OUT_PADDING = 4'd6,
        WAIT_XCVR = 4'd7,
        WAIT_UART = 4'd8,
        WAIT_PADDING = 4'd9,
        WAIT_SYNC_XCVR = 4'd10,
        WAIT_SYNC_UART = 4'd11;

    reg [3:0] current_state, next_state;
    reg [7:0] data_reg;
    reg raw_is_control_char, raw_is_padding_char;

    // State register
    always @(posedge clk_fsm) begin
        current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        next_state = current_state;
        case (current_state)
            IDLE: next_state = PRIO_CHOOSER;
            PRIO_CHOOSER:
                if (!fifo_empty_xcvr) next_state = READ_XCVR;
                else if (!fifo_empty_uart) next_state = READ_UART;
                else next_state = OUT_PADDING;
            READ_XCVR: next_state = OUT_XCVR;
            READ_UART: next_state = OUT_UART;
            OUT_XCVR: next_state = WAIT_XCVR;
            OUT_UART: next_state = WAIT_UART;
            OUT_PADDING: next_state = WAIT_PADDING;
            WAIT_XCVR: if (sending_clk_sync) next_state = WAIT_SYNC_XCVR;
            WAIT_UART: if (sending_clk_sync) next_state = WAIT_SYNC_UART;
            WAIT_PADDING: if (sending_clk_sync) next_state = PRIO_CHOOSER;
            WAIT_SYNC_XCVR: if (!sending_clk_sync) next_state = PRIO_CHOOSER;
            WAIT_SYNC_UART: if (!sending_clk_sync) next_state = PRIO_CHOOSER;
            default: next_state = IDLE;
        endcase
    end

    // Output logic
    always @(posedge clk_fsm) begin
        fifo_read_xcvr <= 0;
        fifo_read_uart <= 0;
        enable_data_out <= 0;
        busy <= (current_state != IDLE);

        case (current_state)
            READ_XCVR: begin
                fifo_read_xcvr <= 1;
                data_reg <= data_fifo_xcvr;
                raw_is_control_char <= 0;
                raw_is_padding_char <= 0;
            end
            READ_UART: begin
                fifo_read_uart <= 1;
                data_reg <= data_fifo_uart;
                raw_is_control_char <= 0;
                raw_is_padding_char <= 0;
            end
            OUT_XCVR, OUT_UART: begin
                data_8b10 <= data_reg;
                is_control_char <= raw_is_control_char;
                is_padding_char <= raw_is_padding_char;
                enable_data_out <= 1;
            end
            OUT_PADDING: begin
                data_8b10 <= padding_char;
                is_control_char <= 0;
                is_padding_char <= 1;
                enable_data_out <= 1;
            end
        endcase
    end

endmodule