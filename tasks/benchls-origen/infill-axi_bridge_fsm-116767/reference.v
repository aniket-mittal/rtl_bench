module origen_116767 (
    input wire clk_i,
    input wire rst_ni,
    input wire data_req_i,
    output reg data_gnt_o,
    output reg data_rvalid_o,
    input wire data_we_i,
    output reg CE,
    output reg WE,
    output reg aw_valid_o,
    input wire aw_ready_i,
    output reg w_valid_o,
    input wire w_ready_i,
    input wire b_valid_i,
    output reg b_ready_o,
    output reg ar_valid_o,
    input wire ar_ready_i,
    input wire r_valid_i,
    output reg r_ready_o
);

    // FSM states
    localparam IDLE = 3'd0;
    localparam READ_WAIT = 3'd1;
    localparam WRITE_DATA = 3'd2;
    localparam WRITE_ADDR = 3'd3;
    localparam WRITE_WAIT = 3'd4;

    reg [2:0] state, next_state;

    always @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    always @(*) begin
        next_state = state;
        data_gnt_o = 1'b0;
        data_rvalid_o = 1'b0;
        CE = 1'b0;
        WE = 1'b0;
        aw_valid_o = 1'b0;
        w_valid_o = 1'b0;
        b_ready_o = 1'b0;
        ar_valid_o = 1'b0;
        r_ready_o = 1'b0;

        case (state)
            IDLE: begin
                if (data_req_i) begin
                    CE = 1'b1;
                    if (data_we_i) begin
                        WE = 1'b1;
                        aw_valid_o = 1'b1;
                        w_valid_o = 1'b1;
                        if (aw_ready_i && w_ready_i) begin
                            data_gnt_o = 1'b1;
                            next_state = WRITE_WAIT;
                        end else if (w_ready_i) begin
                            data_gnt_o = 1'b1;
                            next_state = WRITE_ADDR;
                        end else if (aw_ready_i) begin
                            data_gnt_o = 1'b1;
                            next_state = WRITE_DATA;
                        end
                    end else begin
                        ar_valid_o = 1'b1;
                        if (ar_ready_i) begin
                            data_gnt_o = 1'b1;
                            next_state = READ_WAIT;
                        end
                    end
                end
            end

            READ_WAIT: begin
                CE = 1'b1;
                r_ready_o = 1'b1;
                if (r_valid_i) begin
                    data_rvalid_o = 1'b1;
                    next_state = IDLE;
                end
            end

            WRITE_DATA: begin
                CE = 1'b1;
                WE = 1'b1;
                w_valid_o = 1'b1;
                if (w_ready_i) begin
                    next_state = WRITE_WAIT;
                end
            end

            WRITE_ADDR: begin
                CE = 1'b1;
                WE = 1'b1;
                aw_valid_o = 1'b1;
                if (aw_ready_i) begin
                    next_state = WRITE_WAIT;
                end
            end

            WRITE_WAIT: begin
                CE = 1'b1;
                WE = 1'b1;
                b_ready_o = 1'b1;
                if (b_valid_i) begin
                    data_rvalid_o = 1'b1;
                    next_state = IDLE;
                end
            end

            default: next_state = IDLE;
        endcase
    end

endmodule