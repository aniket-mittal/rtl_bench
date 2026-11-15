module origen_105434 (
    input wire i_clk,
    input wire i_rst_n,
    input wire i_start,
    input wire i_stop,
    output wire [3:0] o_random_out_0,
    output wire [3:0] o_random_out_1,
    output wire [3:0] o_random_out_2,
    output wire [3:0] o_random_out_3
);

    // Parameters
    localparam M = 40000;
    localparam A = 41;
    localparam B = 13;

    // State definition
    localparam IDLE = 2'b00;
    localparam PROC = 2'b01;
    localparam WAIT = 2'b10;

    // Signals
    reg [1:0] state, next_state;
    reg [15:0] o_random_out, next_random_out;
    reg [15:0] delay, next_delay;
    reg [15:0] upper, next_upper;
    reg [3:0] cnt, next_cnt;
    reg [15:0] history [2:0];
    reg [15:0] next_history [2:0];

    // Output assignments
    assign o_random_out_0 = o_random_out[3:0];
    assign o_random_out_1 = history[0][3:0];
    assign o_random_out_2 = history[1][3:0];
    assign o_random_out_3 = history[2][3:0];

    // Combinational logic
    always @(*) begin
        next_state = state;
        next_random_out = o_random_out;
        next_delay = delay;
        next_upper = upper;
        next_cnt = cnt;
        next_history[0] = history[0];
        next_history[1] = history[1];
        next_history[2] = history[2];

        case (state)
            IDLE: begin
                if (i_start) begin
                    next_state = PROC;
                    next_cnt = 0;
                    next_upper = 16'd1000;
                end
            end

            PROC: begin
                next_random_out = (A * o_random_out + B) % M;
                next_history[2] = history[1];
                next_history[1] = history[0];
                next_history[0] = o_random_out;
                next_cnt = cnt + 1;
                next_state = WAIT;
                next_delay = 0;
            end

            WAIT: begin
                if (delay == upper) begin
                    if (cnt == 12 || i_stop) begin
                        next_state = IDLE;
                    end else begin
                        next_state = PROC;
                        next_upper = (upper < 16'd10000) ? upper + 16'd1000 : upper;
                    end
                end else begin
                    next_delay = delay + 1;
                end
            end
        endcase
    end

    // Sequential logic
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            state <= IDLE;
            o_random_out <= 16'd1;
            delay <= 16'd0;
            upper <= 16'd1000;
            cnt <= 4'd0;
            history[0] <= 16'd0;
            history[1] <= 16'd0;
            history[2] <= 16'd0;
        end else begin
            state <= next_state;
            o_random_out <= next_random_out;
            delay <= next_delay;
            upper <= next_upper;
            cnt <= next_cnt;
            history[0] <= next_history[0];
            history[1] <= next_history[1];
            history[2] <= next_history[2];
        end
    end

endmodule