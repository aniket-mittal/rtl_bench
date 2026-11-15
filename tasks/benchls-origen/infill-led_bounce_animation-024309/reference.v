module origen_024309 (
    input wire clk,
    input wire reset,
    input wire flick,
    output reg [15:0] LED
);

    // State definitions
    localparam IDLE = 2'b00;
    localparam GO_UP = 2'b01;
    localparam GO_DOWN = 2'b10;

    // Registers
    reg [1:0] state, next_state;
    reg [2:0] current_index, next_index;
    reg [15:0] next_LED;
    reg flick_trigger;

    // LED patterns
    wire [15:0] max_array [0:7];
    wire [15:0] min_array [0:7];

    assign max_array[0] = 16'b1111111111111111;
    assign max_array[1] = 16'b0111111111111110;
    assign max_array[2] = 16'b0011111111111100;
    assign max_array[3] = 16'b0001111111111000;
    assign max_array[4] = 16'b0000111111110000;
    assign max_array[5] = 16'b0000011111100000;
    assign max_array[6] = 16'b0000001111000000;
    assign max_array[7] = 16'b0000000110000000;

    assign min_array[0] = 16'b0000000000000000;
    assign min_array[1] = 16'b1000000000000001;
    assign min_array[2] = 16'b1100000000000011;
    assign min_array[3] = 16'b1110000000000111;
    assign min_array[4] = 16'b1111000000001111;
    assign min_array[5] = 16'b1111100000011111;
    assign min_array[6] = 16'b1111110000111111;
    assign min_array[7] = 16'b1111111001111111;

    // State and index update
    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            state <= IDLE;
            current_index <= 3'b000;
            LED <= 16'b0;
            flick_trigger <= 1'b0;
        end else begin
            state <= next_state;
            current_index <= next_index;
            LED <= next_LED;
            flick_trigger <= flick;
        end
    end

    // Next state and output logic
    always @(*) begin
        next_state = state;
        next_index = current_index;
        next_LED = LED;

        case (state)
            IDLE: begin
                if (flick_trigger || !reset) begin
                    next_state = GO_UP;
                    next_index = 3'b000;
                    next_LED = min_array[0];
                end
            end

            GO_UP: begin
                if (LED == max_array[current_index]) begin
                    next_state = GO_DOWN;
                    next_index = current_index + 1;
                    next_LED = {LED[14:0], 1'b0};
                end else begin
                    next_LED = {LED[14:0], 1'b1};
                end
            end

            GO_DOWN: begin
                if (LED == min_array[current_index]) begin
                    if (current_index == 3'b111) begin
                        next_state = IDLE;
                        next_index = 3'b000;
                    end else begin
                        next_state = GO_UP;
                        next_index = current_index;
                    end
                    next_LED = {1'b1, LED[15:1]};
                end else begin
                    next_LED = {1'b0, LED[15:1]};
                end
            end

            default: begin
                next_state = IDLE;
                next_index = 3'b000;
                next_LED = 16'b0;
            end
        endcase

        if (flick_trigger) begin
            next_state = GO_UP;
            next_index = 3'b000;
            next_LED = min_array[0];
        end
    end

endmodule