module origen_182343(
    input clock,
    input reset,
    input [7:0] bytetosend,
    input send,
    output reg tx_led,
    output reg sent,
    output tx
);

parameter baud_rate = 115200;

reg [3:0] state;
parameter IDLE = 4'd0, START_BIT = 4'd1, BIT_ONE = 4'd2, BIT_TWO = 4'd3,
          BIT_THREE = 4'd4, BIT_FOUR = 4'd5, BIT_FIVE = 4'd6, BIT_SIX = 4'd7,
          BIT_SEVEN = 4'd8, BIT_EIGHT = 4'd9, STOP_BIT = 4'd10, STOP_BIT2 = 4'd11;

reg [15:0] fsm_clk_count;
wire fsm_clk;

reg [9:0] tx_reg;

always @(posedge clock or posedge reset) begin
    if (reset) begin
        state <= IDLE;
        fsm_clk_count <= 16'd0;
        tx_led <= 1'b0;
        sent <= 1'b1;
        tx_reg <= 10'b1111111111;
    end
    else begin
        case (state)
            IDLE: begin
                if (send) begin
                    tx_reg <= {1'b1, bytetosend, 1'b0};
                    state <= START_BIT;
                    sent <= 1'b0;
                end
                else begin
                    sent <= 1'b1;
                end
                tx_led <= 1'b0;
            end
            START_BIT: begin
                if (fsm_clk) begin
                    tx_reg <= {tx_reg[8:0], 1'b1};
                    state <= BIT_ONE;
                    fsm_clk_count <= 16'd0;
                end
            end
            BIT_ONE: begin
                if (fsm_clk) begin
                    tx_reg <= {tx_reg[8:0], tx_reg[9]};
                    state <= BIT_TWO;
                    fsm_clk_count <= 16'd0;
                end
            end
            BIT_TWO: begin
                if (fsm_clk) begin
                    tx_reg <= {tx_reg[8:0], tx_reg[9]};
                    state <= BIT_THREE;
                    fsm_clk_count <= 16'd0;
                end
            end
            BIT_THREE: begin
                if (fsm_clk) begin
                    tx_reg <= {tx_reg[8:0], tx_reg[9]};
                    state <= BIT_FOUR;
                    fsm_clk_count <= 16'd0;
                end
            end
            BIT_FOUR: begin
                if (fsm_clk) begin
                    tx_reg <= {tx_reg[8:0], tx_reg[9]};
                    state <= BIT_FIVE;
                    fsm_clk_count <= 16'd0;
                end
            end
            BIT_FIVE: begin
                if (fsm_clk) begin
                    tx_reg <= {tx_reg[8:0], tx_reg[9]};
                    state <= BIT_SIX;
                    fsm_clk_count <= 16'd0;
                end
            end
            BIT_SIX: begin
                if (fsm_clk) begin
                    tx_reg <= {tx_reg[8:0], tx_reg[9]};
                    state <= BIT_SEVEN;
                    fsm_clk_count <= 16'd0;
                end
            end
            BIT_SEVEN: begin
                if (fsm_clk) begin
                    tx_reg <= {tx_reg[8:0], tx_reg[9]};
                    state <= BIT_EIGHT;
                    fsm_clk_count <= 16'd0;
                end
            end
            BIT_EIGHT: begin
                if (fsm_clk) begin
                    tx_reg <= {tx_reg[8:0], tx_reg[9]};
                    state <= STOP_BIT;
                    fsm_clk_count <= 16'd0;
                end
            end
            STOP_BIT: begin
                if (fsm_clk) begin
                    tx_reg <= {tx_reg[8:0], tx_reg[9]};
                    state <= STOP_BIT2;
                    fsm_clk_count <= 16'd0;
                end
            end
            STOP_BIT2: begin
                if (fsm_clk) begin
                    tx_reg <= {tx_reg[8:0], tx_reg[9]};
                    state <= IDLE;
                    tx_led <= 1'b1;
                end
            end
        endcase

        if (fsm_clk_count == (clock / (2 * baud_rate) - 1)) begin
            fsm_clk_count <= 16'd0;
        end
        else begin
            fsm_clk_count <= fsm_clk_count + 16'd1;
        end
    end
end

assign fsm_clk = (fsm_clk_count == (clock / (2 * baud_rate) - 1));
assign tx = tx_reg[0];

`ifdef SIMULATION
    always @(posedge fsm_clk) begin
        if (state == START_BIT) begin
            ;
        end
    end
`endif

endmodule