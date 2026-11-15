module origen_016158 #(
    parameter COUNT_WIDTH = 32,
    parameter GLOW_RED = 48,
    parameter GLOW_YELLOW_1 = 12,
    parameter GLOW_GREEN = 48,
    parameter GLOW_YELLOW_2 = 12
) (
    input wire i_clk,
    input wire i_rst_n,
    output reg o_red,
    output reg o_yellow,
    output reg o_green
);

    // State encoding
    localparam [3:0] RED = 4'b0001,
                     YELLOW_2 = 4'b0010,
                     GREEN = 4'b0100,
                     YELLOW_1 = 4'b1000;

    reg [3:0] state, next_state;
    reg [COUNT_WIDTH-1:0] count;
    reg count_rst_n;
    reg next_red, next_yellow, next_green;

    // State and output registers
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            state <= RED;
            o_red <= 1'b1;
            o_yellow <= 1'b0;
            o_green <= 1'b0;
        end else begin
            state <= next_state;
            o_red <= next_red;
            o_yellow <= next_yellow;
            o_green <= next_green;
        end
    end

    // Counter
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            count <= {COUNT_WIDTH{1'b0}};
        end else if (!count_rst_n) begin
            count <= {COUNT_WIDTH{1'b0}};
        end else begin
            count <= count + 1'b1;
        end
    end

    // Next state and output logic
    always @(*) begin
        next_state = state;
        next_red = o_red;
        next_yellow = o_yellow;
        next_green = o_green;
        count_rst_n = 1'b1;

        case (state)
            RED: begin
                if (count == GLOW_RED - 1) begin
                    next_state = YELLOW_2;
                    next_red = 1'b0;
                    next_yellow = 1'b1;
                    count_rst_n = 1'b0;
                end
            end
            YELLOW_2: begin
                if (count == GLOW_YELLOW_2 - 1) begin
                    next_state = GREEN;
                    next_yellow = 1'b0;
                    next_green = 1'b1;
                    count_rst_n = 1'b0;
                end
            end
            GREEN: begin
                if (count == GLOW_GREEN - 1) begin
                    next_state = YELLOW_1;
                    next_green = 1'b0;
                    next_yellow = 1'b1;
                    count_rst_n = 1'b0;
                end
            end
            YELLOW_1: begin
                if (count == GLOW_YELLOW_1 - 1) begin
                    next_state = RED;
                    next_yellow = 1'b0;
                    next_red = 1'b1;
                    count_rst_n = 1'b0;
                end
            end
            default: begin
                next_state = RED;
                next_red = 1'b1;
                next_yellow = 1'b0;
                next_green = 1'b0;
                count_rst_n = 1'b0;
            end
        endcase
    end

endmodule