`define BIT_BANG_CLOCK

module origen_022342 (
    input wire CLOCK_5,
    input wire reset,
    input wire enable,
    input wire [7:0] data_in,
    output reg sdo,
    output reg sclk,
    output reg n_cs
);

    // State definitions
    localparam IDLE = 2'b00;
    localparam ENABLED = 2'b01;
    localparam DELAY = 2'b10;

    reg [1:0] state, next_state;
    reg [7:0] data_in_reg;
    reg [2:0] bit_counter;
    reg [18:0] delay_counter;
    reg sclk_enable;
    reg sdo_enable;

    // Main state machine
    always @(posedge CLOCK_5 or posedge reset) begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)
            IDLE: next_state = enable ? ENABLED : IDLE;
            ENABLED: next_state = (bit_counter == 3'b111) ? DELAY : ENABLED;
            DELAY: next_state = (delay_counter == 19'h30D40) ? IDLE : DELAY;
            default: next_state = IDLE;
        endcase
    end

    // SCLK state machine
    always @(posedge CLOCK_5 or posedge reset) begin
        if (reset)
            sclk_enable <= 1'b0;
        else if (state == ENABLED)
            sclk_enable <= ~sclk_enable;
        else
            sclk_enable <= 1'b0;
    end

    // SDO state machine
    always @(posedge CLOCK_5 or posedge reset) begin
        if (reset) begin
            sdo_enable <= 1'b0;
            bit_counter <= 3'b000;
            data_in_reg <= 8'h00;
        end else if (state == ENABLED) begin
            if (sclk_enable && !sclk) begin
                sdo_enable <= 1'b1;
                bit_counter <= bit_counter + 1'b1;
                data_in_reg <= {data_in_reg[6:0], 1'b0};
            end
        end else begin
            sdo_enable <= 1'b0;
            bit_counter <= 3'b000;
            data_in_reg <= 8'hA5; // Load fixed value
        end
    end

    // Delay counter
    always @(posedge CLOCK_5 or posedge reset) begin
        if (reset)
            delay_counter <= 19'h00000;
        else if (state == DELAY)
            delay_counter <= delay_counter + 1'b1;
        else
            delay_counter <= 19'h00000;
    end

    // Output logic
    always @(posedge CLOCK_5 or posedge reset) begin
        if (reset) begin
            sdo <= 1'b1;
            sclk <= 1'b0;
            n_cs <= 1'b1;
        end else begin
            sdo <= sdo_enable ? data_in_reg[7] : 1'b1;
            n_cs <= (state == IDLE) ? 1'b1 : 1'b0;

            `ifdef BIT_BANG_CLOCK
                sclk <= (state == ENABLED) ? sclk_enable : 1'b0;
            `else
                sclk <= (state == ENABLED) ? (CLOCK_5 & sclk_enable) : 1'b0;
            `endif
        end
    end

endmodule