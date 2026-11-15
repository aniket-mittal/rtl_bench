module origen_144300 (
    input wire clk,
    input wire reset,
    input wire enable,
    input wire [7:0] tx_data,
    input wire rx_data_ack,
    output reg tx_data_ack,
    output reg [7:0] rx_data
);

    // State definitions
    localparam IDLE = 2'b00;
    localparam SENDING = 2'b01;
    localparam RECEIVING = 2'b10;
    localparam DONE = 2'b11;

    reg [1:0] state, next_state;
    reg [2:0] bit_counter;
    reg [7:0] shift_reg_tx, shift_reg_rx;
    reg sclk, mosi, cs;
    wire miso;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE:
                if (enable)
                    next_state = SENDING;
                else
                    next_state = IDLE;
            SENDING:
                if (bit_counter == 3'b111)
                    next_state = RECEIVING;
                else
                    next_state = SENDING;
            RECEIVING:
                if (bit_counter == 3'b111)
                    next_state = DONE;
                else
                    next_state = RECEIVING;
            DONE:
                if (rx_data_ack)
                    next_state = IDLE;
                else
                    next_state = DONE;
            default:
                next_state = IDLE;
        endcase
    end

    // Output logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            bit_counter <= 3'b000;
            shift_reg_tx <= 8'b0;
            shift_reg_rx <= 8'b0;
            sclk <= 1'b0;
            mosi <= 1'b0;
            cs <= 1'b1;
            tx_data_ack <= 1'b0;
            rx_data <= 8'b0;
        end else begin
            case (state)
                IDLE: begin
                    bit_counter <= 3'b000;
                    shift_reg_tx <= tx_data;
                    sclk <= 1'b0;
                    mosi <= 1'b0;
                    cs <= 1'b1;
                    tx_data_ack <= 1'b0;
                end
                SENDING: begin
                    cs <= 1'b0;
                    sclk <= ~sclk;
                    if (sclk) begin
                        mosi <= shift_reg_tx[7];
                        shift_reg_tx <= {shift_reg_tx[6:0], 1'b0};
                        bit_counter <= bit_counter + 1;
                    end
                end
                RECEIVING: begin
                    sclk <= ~sclk;
                    if (~sclk) begin
                        shift_reg_rx <= {shift_reg_rx[6:0], miso};
                        bit_counter <= bit_counter + 1;
                    end
                end
                DONE: begin
                    cs <= 1'b1;
                    sclk <= 1'b0;
                    tx_data_ack <= 1'b1;
                    rx_data <= shift_reg_rx;
                end
            endcase
        end
    end

endmodule