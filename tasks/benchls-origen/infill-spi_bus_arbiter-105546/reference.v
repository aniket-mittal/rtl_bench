module origen_105546 (
    input wire clk,
    input wire rst,
    output reg SCK,
    output reg DISPLAY_CS,
    output reg SDCARD_CS,
    output reg RS_DC,
    output reg DATA,
    input wire display_request,
    input wire display_done,
    output reg display_acknowledge,
    input wire sdcard_request,
    input wire sdcard_done,
    output reg sdcard_acknowledge
);

    // State encoding
    localparam IDLE = 2'b00;
    localparam REQUESTED = 2'b01;
    localparam GRANTED = 2'b10;

    reg [1:0] state, next_state;
    reg arb_bit;
    reg display_current, sdcard_current;
    reg clk_stgd, clk_pulse;
    reg [6:0] cycles_settled;
    reg clk_settled;

    // State machine
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            arb_bit <= 0;
            display_current <= 1;
            sdcard_current <= 0;
            clk_stgd <= 0;
            clk_pulse <= 0;
            cycles_settled <= 0;
            clk_settled <= 0;
        end else begin
            state <= next_state;
            
            // Arbitration bit toggle
            if (state == GRANTED && (display_done || sdcard_done))
                arb_bit <= ~arb_bit;

            // Clock settling
            clk_stgd <= SCK;
            clk_pulse <= SCK & ~clk_stgd;
            
            if (clk_pulse) begin
                if (cycles_settled == 7'd99)
                    clk_settled <= 1;
                else
                    cycles_settled <= cycles_settled + 1;
            end

            if (state == IDLE) begin
                cycles_settled <= 0;
                clk_settled <= 0;
            end
        end
    end

    // Next state logic
    always @(*) begin
        next_state = state;
        case (state)
            IDLE:
                if (display_request || sdcard_request)
                    next_state = REQUESTED;
            REQUESTED:
                next_state = GRANTED;
            GRANTED:
                if (display_done || sdcard_done)
                    next_state = IDLE;
        endcase
    end

    // Output logic
    always @(*) begin
        // Default values
        display_acknowledge = 0;
        sdcard_acknowledge = 0;
        DISPLAY_CS = 1;
        SDCARD_CS = 1;

        case (state)
            IDLE: begin
                display_current = 1;
                sdcard_current = 0;
            end
            REQUESTED: begin
                if (display_request && sdcard_request) begin
                    display_current = arb_bit;
                    sdcard_current = ~arb_bit;
                end else begin
                    display_current = display_request;
                    sdcard_current = sdcard_request;
                end
            end
            GRANTED: begin
                if (display_current) begin
                    display_acknowledge = 1;
                    DISPLAY_CS = 0;
                end else begin
                    sdcard_acknowledge = 1;
                    SDCARD_CS = 0;
                end
            end
        endcase
    end

    // SPI output multiplexing
    always @(*) begin
        if (display_current) begin
            SCK = clk_settled ? clk : 0;
            RS_DC = display_acknowledge;
            DATA = display_acknowledge;
        end else begin
            SCK = clk_settled ? clk : 0;
            RS_DC = sdcard_acknowledge;
            DATA = sdcard_acknowledge;
        end
    end

endmodule