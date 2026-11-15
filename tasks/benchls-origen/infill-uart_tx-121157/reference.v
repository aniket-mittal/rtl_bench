module origen_121157 (
    input wire clk,
    input wire rst_n,
    input wire [7:0] tx_data,
    input wire trmt,
    output reg TX,
    output reg tx_done
);

    // State definitions
    localparam IDLE = 1'b0;
    localparam SEND = 1'b1;

    // Registers
    reg state, next_state;
    reg [5:0] baudCount;
    reg [3:0] bitCount;
    reg [9:0] tx_shift;
    reg baudDone, atStopBit;

    // State machine
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= IDLE;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)
            IDLE: next_state = trmt ? SEND : IDLE;
            SEND: next_state = (atStopBit && baudDone) ? IDLE : SEND;
            default: next_state = IDLE;
        endcase
    end

    // Baud rate generator
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            baudCount <= 6'd0;
            baudDone <= 1'b0;
        end else if (state == SEND) begin
            if (baudCount == 6'd42) begin
                baudCount <= 6'd0;
                baudDone <= 1'b1;
            end else begin
                baudCount <= baudCount + 1'b1;
                baudDone <= 1'b0;
            end
        end else begin
            baudCount <= 6'd0;
            baudDone <= 1'b0;
        end
    end

    // Bit counter
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            bitCount <= 4'd0;
            atStopBit <= 1'b0;
        end else if (state == SEND && baudDone) begin
            if (bitCount == 4'd9) begin
                bitCount <= 4'd0;
                atStopBit <= 1'b1;
            end else begin
                bitCount <= bitCount + 1'b1;
                atStopBit <= (bitCount == 4'd8);
            end
        end else if (state == IDLE) begin
            bitCount <= 4'd0;
            atStopBit <= 1'b0;
        end
    end

    // Shift register
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tx_shift <= 10'b1111111111;
        end else if (state == IDLE && trmt) begin
            tx_shift <= {1'b1, tx_data, 1'b0};
        end else if (state == SEND && baudDone) begin
            tx_shift <= {1'b1, tx_shift[9:1]};
        end
    end

    // Output logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            TX <= 1'b1;
            tx_done <= 1'b0;
        end else begin
            TX <= tx_shift[0];
            tx_done <= (state == SEND && atStopBit && baudDone);
        end
    end

endmodule