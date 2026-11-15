module origen_092289 (
    input wire clk8m,
    input wire rst_n,
    input wire EOC,
    input wire [7:0] DATA,
    output reg START,
    output reg OE,
    output reg [7:0] DATA_R,
    output reg clk500K
);

    // State definition
    localparam IDLE = 3'd0, START_H = 3'd1, START_L = 3'd2, CHECK_END = 3'd3, GET_DATA = 3'd4;
    reg [2:0] state, next_state;

    // Clock division
    reg [3:0] clk_cnt;
    always @(posedge clk8m or negedge rst_n) begin
        if (!rst_n) begin
            clk_cnt <= 4'd0;
            clk500K <= 1'b0;
        end else begin
            if (clk_cnt == 4'd7) begin
                clk_cnt <= 4'd0;
                clk500K <= ~clk500K;
            end else begin
                clk_cnt <= clk_cnt + 1'b1;
            end
        end
    end

    // 1-second counter
    reg [22:0] cnt1s;
    always @(posedge clk8m or negedge rst_n) begin
        if (!rst_n)
            cnt1s <= 23'd0;
        else if (cnt1s == 23'd7999999)
            cnt1s <= 23'd0;
        else
            cnt1s <= cnt1s + 1'b1;
    end

    // State machine
    always @(posedge clk500K or negedge rst_n) begin
        if (!rst_n)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE:      next_state = START_H;
            START_H:   next_state = START_L;
            START_L:   next_state = CHECK_END;
            CHECK_END: next_state = EOC ? GET_DATA : CHECK_END;
            GET_DATA:  next_state = IDLE;
            default:   next_state = IDLE;
        endcase
    end

    // Output logic
    reg [7:0] data_reg;
    always @(posedge clk500K or negedge rst_n) begin
        if (!rst_n) begin
            START <= 1'b0;
            OE <= 1'b0;
            data_reg <= 8'd0;
        end else begin
            case (state)
                IDLE: begin
                    START <= 1'b0;
                    OE <= 1'b0;
                end
                START_H: START <= 1'b1;
                START_L: START <= 1'b0;
                GET_DATA: begin
                    OE <= 1'b1;
                    data_reg <= DATA;
                end
                default: begin
                    START <= 1'b0;
                    OE <= 1'b0;
                end
            endcase
        end
    end

    // Update DATA_R every second
    always @(posedge clk8m or negedge rst_n) begin
        if (!rst_n)
            DATA_R <= 8'd0;
        else if (cnt1s == 23'd7999999)
            DATA_R <= data_reg;
    end

endmodule