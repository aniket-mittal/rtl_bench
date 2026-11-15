module origen_083637(
    input wire clk,
    input wire [384:0] board,
    input wire [31:0] long_counter,
    input wire [5:0] counter,
    input wire [5:0] x_y_pos,
    output reg write,
    output reg update_x_y,
    output reg [5:0] draw_value
);

    // FSM states
    localparam S_START = 2'b00;
    localparam S_DRAW_BOARD = 2'b01;
    localparam S_DRAW_PIECE = 2'b10;
    localparam S_UPDATE_X_Y = 2'b11;

    reg [1:0] current_state, next_state;

    // State register
    always @(posedge clk) begin
        current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            S_START: next_state = S_DRAW_BOARD;
            S_DRAW_BOARD: next_state = (long_counter == 32'd833333) ? S_DRAW_PIECE : S_DRAW_BOARD;
            S_DRAW_PIECE: next_state = (counter == 6'd63) ? S_UPDATE_X_Y : S_DRAW_PIECE;
            S_UPDATE_X_Y: next_state = S_DRAW_PIECE;
            default: next_state = S_START;
        endcase
    end

    // Output logic
    always @(*) begin
        write = 1'b0;
        update_x_y = 1'b0;
        draw_value = 6'd0;

        case (current_state)
            S_DRAW_BOARD: begin
                write = 1'b1;
                draw_value = 6'b011000; // 24 in decimal
            end
            S_DRAW_PIECE: begin
                write = 1'b1;
                draw_value = board[x_y_pos * 6 +: 6];
            end
            S_UPDATE_X_Y: begin
                update_x_y = 1'b1;
            end
        endcase
    end

endmodule