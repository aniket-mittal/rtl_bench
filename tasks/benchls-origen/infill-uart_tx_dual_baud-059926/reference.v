module origen_059926 #(
    parameter CLK_PER_BIT_SLOW = 868,
    parameter CLK_PER_BIT_FAST = 434
)(
    input wire clk,
    input wire rst,
    input wire requested_speed,
    input wire block,
    input wire [7:0] data,
    input wire new_data,
    output reg current_speed,
    output reg tx,
    output wire busy
);

    localparam IDLE = 2'b00;
    localparam START_BIT = 2'b01;
    localparam DATA = 2'b10;
    localparam STOP_BIT = 2'b11;

    reg [1:0] state_q, state_d;
    reg [9:0] ctr_q, ctr_d;
    reg [2:0] bit_ctr_q, bit_ctr_d;
    reg [7:0] data_q, data_d;
    reg tx_d;

    wire ctr_done;
    wire [9:0] clk_per_bit;

    assign busy = (state_q != IDLE);
    assign clk_per_bit = current_speed ? CLK_PER_BIT_FAST : CLK_PER_BIT_SLOW;
    assign ctr_done = (ctr_q == clk_per_bit - 1);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state_q <= IDLE;
            ctr_q <= 0;
            bit_ctr_q <= 0;
            data_q <= 0;
            tx <= 1;
            current_speed <= 0;
        end else begin
            state_q <= state_d;
            ctr_q <= ctr_d;
            bit_ctr_q <= bit_ctr_d;
            data_q <= data_d;
            tx <= tx_d;
            if (state_q == IDLE) current_speed <= requested_speed;
        end
    end

    always @(*) begin
        state_d = state_q;
        ctr_d = ctr_q;
        bit_ctr_d = bit_ctr_q;
        data_d = data_q;
        tx_d = tx;

        case (state_q)
            IDLE: begin
                tx_d = 1;
                if (new_data && !block) begin
                    state_d = START_BIT;
                    data_d = data;
                    ctr_d = 0;
                end
            end

            START_BIT: begin
                tx_d = 0;
                if (ctr_done) begin
                    state_d = DATA;
                    ctr_d = 0;
                    bit_ctr_d = 0;
                end else begin
                    ctr_d = ctr_q + 1;
                end
            end

            DATA: begin
                tx_d = data_q[bit_ctr_q];
                if (ctr_done) begin
                    ctr_d = 0;
                    if (bit_ctr_q == 7) begin
                        state_d = STOP_BIT;
                    end else begin
                        bit_ctr_d = bit_ctr_q + 1;
                    end
                end else begin
                    ctr_d = ctr_q + 1;
                end
            end

            STOP_BIT: begin
                tx_d = 1;
                if (ctr_done) begin
                    state_d = IDLE;
                    ctr_d = 0;
                end else begin
                    ctr_d = ctr_q + 1;
                end
            end

            default: state_d = IDLE;
        endcase
    end

endmodule