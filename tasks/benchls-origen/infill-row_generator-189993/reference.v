module origen_189993(
    input clk,
    input resetn,
    input inc_row,
    output reg [2:0] difficulty,
    output reg new_direction,
    output reg [6:0] new_y_position,
    output reg [7:0] new_x_position
);

    // Registers
    reg [4:0] r;

    // Constants
    parameter Y_ROW_0 = 7'd0;
    parameter Y_ROW_1 = 7'd10;
    parameter Y_ROW_2 = 7'd20;
    parameter Y_ROW_3 = 7'd30;
    parameter Y_ROW_4 = 7'd40;
    parameter Y_ROW_5 = 7'd50;
    parameter Y_ROW_6 = 7'd60;

    parameter LOW_DIFF = 3'd0;
    parameter MID_DIFF = 3'd1;
    parameter HIGH_DIFF = 3'd2;
    parameter MAX_DIFF = 3'd3;

    parameter X_INIT = 8'd0;
    parameter X_END = 8'd200;

    parameter GO_LEFT = 1'b0;
    parameter GO_RIGHT = 1'b1;

    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            r <= 5'd0;
        end
        else if (inc_row) begin
            r <= r + 1'b1;
        end
    end

    always @(*) begin
        case (r)
            5'd0: begin
                new_y_position = Y_ROW_0;
                new_x_position = X_INIT;
                new_direction = GO_RIGHT;
                difficulty = LOW_DIFF;
            end
            5'd1: begin
                new_y_position = Y_ROW_1;
                new_x_position = X_END;
                new_direction = GO_LEFT;
                difficulty = LOW_DIFF;
            end
            5'd2: begin
                new_y_position = Y_ROW_2;
                new_x_position = X_INIT;
                new_direction = GO_RIGHT;
                difficulty = MID_DIFF;
            end
            5'd3: begin
                new_y_position = Y_ROW_3;
                new_x_position = X_END;
                new_direction = GO_LEFT;
                difficulty = MID_DIFF;
            end
            5'd4: begin
                new_y_position = Y_ROW_4;
                new_x_position = X_INIT;
                new_direction = GO_RIGHT;
                difficulty = HIGH_DIFF;
            end
            5'd5: begin
                new_y_position = Y_ROW_5;
                new_x_position = X_END;
                new_direction = GO_LEFT;
                difficulty = HIGH_DIFF;
            end
            5'd6: begin
                new_y_position = Y_ROW_6;
                new_x_position = X_INIT;
                new_direction = GO_RIGHT;
                difficulty = MAX_DIFF;
            end
            default: begin
                new_y_position = Y_ROW_0;
                new_x_position = X_INIT;
                new_direction = GO_RIGHT;
                difficulty = LOW_DIFF;
            end
        endcase
    end

endmodule