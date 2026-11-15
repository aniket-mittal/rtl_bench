module origen_182715 (
    input pclk,
    input rst,
    input button,
    input transfer,
    input [10:0] mouse_xpos,
    input [10:0] mouse_ypos,
    input [10:0] column_in,
    input [10:0] row_in,
    output [10:0] x_out,
    output [10:0] y_out
);

parameter FREQ_DIV = 10'd1000;
parameter SQUARE_SIZE = 10'd50;
parameter BALL_SIZE = 10'd40;
parameter START_DRAW = (SQUARE_SIZE - BALL_SIZE) / 2;
parameter LEFT = 10'd50;
parameter UP = 10'd50;

reg [2:0] state;
reg [9:0] x_pos, y_pos;
reg [9:0] clk_div;

localparam IDLE = 3'b000;
localparam MOVE_COL = 3'b001;
localparam MOVE_RO = 3'b010;
localparam END = 3'b011;

always @(posedge pclk or posedge rst) begin
    if (rst) begin
        state <= IDLE;
        x_pos <= LEFT + START_DRAW;
        y_pos <= UP + START_DRAW;
        clk_div <= 0;
    end
    else begin
        case (state)
            IDLE: begin
                if (button) begin
                    state <= MOVE_COL;
                end
                else begin
                    x_pos <= mouse_xpos - BALL_SIZE / 2;
                    y_pos <= mouse_ypos - BALL_SIZE / 2;
                end
            end
            MOVE_COL: begin
                clk_div <= clk_div + 1;
                if (clk_div == FREQ_DIV) begin
                    clk_div <= 0;
                    if (x_pos != LEFT + column_in * SQUARE_SIZE + START_DRAW) begin
                        if (x_pos < LEFT + column_in * SQUARE_SIZE + START_DRAW) begin
                            x_pos <= x_pos + 1;
                        end
                        else begin
                            x_pos <= x_pos - 1;
                        end
                    end
                    else begin
                        state <= MOVE_RO;
                    end
                end
            end
            MOVE_RO: begin
                clk_div <= clk_div + 1;
                if (clk_div == FREQ_DIV) begin
                    clk_div <= 0;
                    if (y_pos != UP + row_in * SQUARE_SIZE + START_DRAW) begin
                        if (y_pos < UP + row_in * SQUARE_SIZE + START_DRAW) begin
                            y_pos <= y_pos + 1;
                        end
                        else begin
                            y_pos <= y_pos - 1;
                        end
                    end
                    else begin
                        state <= END;
                    end
                end
            end
            END: begin
                if (transfer) begin
                    state <= IDLE;
                end
            end
        endcase
    end
end

assign x_out = x_pos;
assign y_out = y_pos;

endmodule