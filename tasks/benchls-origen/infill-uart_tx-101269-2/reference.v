module origen_101269 #(
    parameter CLK_PER_BIT = 868,
    parameter CTR_SIZE = $clog2(CLK_PER_BIT)
)(
    input wire clk,
    input wire rst,
    input wire block,
    input wire [7:0] data,
    input wire new_data,
    output reg tx,
    output wire busy
);

    localparam IDLE = 2'b00;
    localparam START_BIT = 2'b01;
    localparam DATA = 2'b10;
    localparam STOP_BIT = 2'b11;

    reg [1:0] state_q, state_d;
    reg [CTR_SIZE-1:0] ctr_q, ctr_d;
    reg [2:0] bit_ctr_q, bit_ctr_d;
    reg [7:0] data_q, data_d;
    reg tx_q, tx_d;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state_q <= IDLE;
            ctr_q <= 0;
            bit_ctr_q <= 0;
            data_q <= 0;
            tx_q <= 1'b1;
        end else begin
            state_q <= state_d;
            ctr_q <= ctr_d;
            bit_ctr_q <= bit_ctr_d;
            data_q <= data_d;
            tx_q <= tx_d;
        end
    end

    always @(*) begin
        state_d = state_q;
        ctr_d = ctr_q;
        bit_ctr_d = bit_ctr_q;
        data_d = data_q;
        tx_d = tx_q;

        case (state_q)
            IDLE: begin
                if (block) begin
                    tx_d = 1'b1;
                end else if (new_data) begin
                    state_d = START_BIT;
                    data_d = data;
                    ctr_d = 0;
                    tx_d = 1'b0;
                end
            end

            START_BIT: begin
                if (ctr_q == CLK_PER_BIT - 1) begin
                    state_d = DATA;
                    ctr_d = 0;
                    bit_ctr_d = 0;
                    tx_d = data_q[0];
                end else begin
                    ctr_d = ctr_q + 1;
                end
            end

            DATA: begin
                if (ctr_q == CLK_PER_BIT - 1) begin
                    ctr_d = 0;
                    if (bit_ctr_q == 7) begin
                        state_d = STOP_BIT;
                        tx_d = 1'b1;
                    end else begin
                        bit_ctr_d = bit_ctr_q + 1;
                        tx_d = data_q[bit_ctr_q + 1];
                    end
                end else begin
                    ctr_d = ctr_q + 1;
                end
            end

            STOP_BIT: begin
                if (ctr_q == CLK_PER_BIT - 1) begin
                    state_d = IDLE;
                    ctr_d = 0;
                end else begin
                    ctr_d = ctr_q + 1;
                end
            end
        endcase

        if (block) begin
            state_d = IDLE;
            ctr_d = 0;
            bit_ctr_d = 0;
            tx_d = 1'b1;
        end
    end

    assign busy = (state_q != IDLE) | block;
    assign tx = tx_q;

endmodule