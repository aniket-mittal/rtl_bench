module origen_062750(
    input wire clk,
    input wire clr,
    input wire req,
    input wire [7:0] data,
    output reg xmt,
    output reg ack
);

    // State encoding
    localparam IDLE = 4'd0, HS1 = 4'd1, HS2 = 4'd2, XMT_START = 4'd3,
               XMT_BIT7 = 4'd4, XMT_BIT6 = 4'd5, XMT_BIT5 = 4'd6, XMT_BIT4 = 4'd7,
               XMT_BIT3 = 4'd8, XMT_BIT2 = 4'd9, XMT_BIT1 = 4'd10, XMT_BITP = 4'd11,
               XMT_BITS1 = 4'd12, XMT_BITS2 = 4'd13;

    reg [3:0] state, next_state;
    reg [7:0] data_reg;
    reg [9:0] div_count;
    reg [2:0] bit_count;
    reg parity;
    reg enable;

    // Clock divider
    always @(posedge clk or negedge clr) begin
        if (!clr) div_count <= 10'd0;
        else if (div_count == 10'd579) div_count <= 10'd0;
        else div_count <= div_count + 1'b1;
    end

    assign enable = (div_count == 10'd0);

    // State register
    always @(posedge clk or negedge clr) begin
        if (!clr) state <= IDLE;
        else if (enable) state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE: next_state = req ? HS1 : IDLE;
            HS1: next_state = req ? HS1 : HS2;
            HS2: next_state = XMT_START;
            XMT_START: next_state = (bit_count == 3'd7) ? XMT_BIT7 : XMT_START;
            XMT_BIT7: next_state = (bit_count == 3'd7) ? XMT_BIT6 : XMT_BIT7;
            XMT_BIT6: next_state = (bit_count == 3'd7) ? XMT_BIT5 : XMT_BIT6;
            XMT_BIT5: next_state = (bit_count == 3'd7) ? XMT_BIT4 : XMT_BIT5;
            XMT_BIT4: next_state = (bit_count == 3'd7) ? XMT_BIT3 : XMT_BIT4;
            XMT_BIT3: next_state = (bit_count == 3'd7) ? XMT_BIT2 : XMT_BIT3;
            XMT_BIT2: next_state = (bit_count == 3'd7) ? XMT_BIT1 : XMT_BIT2;
            XMT_BIT1: next_state = (bit_count == 3'd7) ? XMT_BITP : XMT_BIT1;
            XMT_BITP: next_state = (bit_count == 3'd7) ? XMT_BITS1 : XMT_BITP;
            XMT_BITS1: next_state = (bit_count == 3'd7) ? XMT_BITS2 : XMT_BITS1;
            XMT_BITS2: next_state = (bit_count == 3'd7) ? IDLE : XMT_BITS2;
            default: next_state = IDLE;
        endcase
    end

    // Output logic
    always @(posedge clk or negedge clr) begin
        if (!clr) begin
            xmt <= 1'b1;
            ack <= 1'b0;
            data_reg <= 8'd0;
            bit_count <= 3'd0;
            parity <= 1'b0;
        end else if (enable) begin
            case (state)
                IDLE: begin
                    xmt <= 1'b1;
                    ack <= 1'b0;
                    bit_count <= 3'd0;
                    parity <= 1'b0;
                end
                HS1: begin
                    ack <= 1'b1;
                    data_reg <= data;
                end
                HS2: ack <= 1'b0;
                XMT_START: begin
                    xmt <= 1'b0;
                    bit_count <= (bit_count == 3'd7) ? 3'd0 : bit_count + 1'b1;
                end
                XMT_BIT7, XMT_BIT6, XMT_BIT5, XMT_BIT4, XMT_BIT3, XMT_BIT2, XMT_BIT1: begin
                    xmt <= data_reg[state - XMT_BIT7];
                    parity <= parity ^ data_reg[state - XMT_BIT7];
                    bit_count <= (bit_count == 3'd7) ? 3'd0 : bit_count + 1'b1;
                end
                XMT_BITP: begin
                    xmt <= parity;
                    bit_count <= (bit_count == 3'd7) ? 3'd0 : bit_count + 1'b1;
                end
                XMT_BITS1, XMT_BITS2: begin
                    xmt <= 1'b1;
                    bit_count <= (bit_count == 3'd7) ? 3'd0 : bit_count + 1'b1;
                end
            endcase
        end
    end

endmodule