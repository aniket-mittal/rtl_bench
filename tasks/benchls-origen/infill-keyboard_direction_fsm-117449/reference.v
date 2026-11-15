module origen_117449 (
    input wire Clk,
    input wire Reset,
    input wire [7:0] keycode,
    output reg [3:0] direction,
    output reg starting_pos,
    output reg start_counter,
    output reg get_word,
    output reg lfsr_enable
);

    // State encoding
    localparam RESET = 3'b000;
    localparam WAIT = 3'b001;
    localparam MOVE_UP = 3'b010;
    localparam MOVE_DOWN = 3'b011;
    localparam MOVE_LEFT = 3'b100;
    localparam MOVE_RIGHT = 3'b101;

    reg [2:0] current_state, next_state;

    // Sequential logic
    always @(posedge Clk or posedge Reset) begin
        if (Reset) begin
            current_state <= RESET;
            direction <= 4'b1010;
            starting_pos <= 1'b0;
            start_counter <= 1'b0;
        end else begin
            current_state <= next_state;
            case (current_state)
                RESET: begin
                    direction <= 4'b0000;
                    starting_pos <= 1'b1;
                    start_counter <= 1'b0;
                    get_word <= 1'b0;
                    lfsr_enable <= 1'b0;
                end
                WAIT: begin
                    direction <= 4'b0000;
                    starting_pos <= 1'b0;
                    start_counter <= 1'b1;
                    get_word <= 1'b1;
                    lfsr_enable <= 1'b1;
                end
                MOVE_UP: begin
                    direction <= 4'b0001;
                    starting_pos <= 1'b0;
                    start_counter <= 1'b1;
                    get_word <= 1'b0;
                    lfsr_enable <= 1'b0;
                end
                MOVE_DOWN: begin
                    direction <= 4'b0010;
                    starting_pos <= 1'b0;
                    start_counter <= 1'b1;
                    get_word <= 1'b0;
                    lfsr_enable <= 1'b0;
                end
                MOVE_LEFT: begin
                    direction <= 4'b0100;
                    starting_pos <= 1'b0;
                    start_counter <= 1'b1;
                    get_word <= 1'b0;
                    lfsr_enable <= 1'b0;
                end
                MOVE_RIGHT: begin
                    direction <= 4'b1000;
                    starting_pos <= 1'b0;
                    start_counter <= 1'b1;
                    get_word <= 1'b0;
                    lfsr_enable <= 1'b0;
                end
                default: begin
                    direction <= 4'b0000;
                    starting_pos <= 1'b0;
                    start_counter <= 1'b0;
                    get_word <= 1'b0;
                    lfsr_enable <= 1'b0;
                end
            endcase
        end
    end

    // Combinational logic for next state
    always @(*) begin
        case (current_state)
            RESET: next_state = WAIT;
            WAIT: begin
                case (keycode)
                    8'd82: next_state = MOVE_UP;
                    8'd81: next_state = MOVE_DOWN;
                    8'd80: next_state = MOVE_LEFT;
                    8'd79: next_state = MOVE_RIGHT;
                    default: next_state = WAIT;
                endcase
            end
            MOVE_UP, MOVE_DOWN, MOVE_LEFT, MOVE_RIGHT: next_state = WAIT;
            default: next_state = RESET;
        endcase
    end

endmodule