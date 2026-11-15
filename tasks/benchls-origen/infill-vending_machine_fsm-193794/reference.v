module origen_193794(
    input clk,
    input reset,
    input cancle_flag,
    input [9:0] coin_val,
    input get_ind,
    input buy_flag,
    output reg op_start,
    output reg light,
    output reg light_one,
    output reg light_two,
    output reg hold_ind,
    output reg not_enough
);

    reg [1:0] state;
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S0;
            op_start <= 0;
            light <= 0;
            light_one <= 0;
            light_two <= 0;
            hold_ind <= 0;
            not_enough <= 0;
        end
        else begin
            case (state)
                S0: begin
                    op_start <= 0;
                    light <= 0;
                    light_one <= 0;
                    light_two <= 0;
                    hold_ind <= 0;
                    not_enough <= 0;
                    if (cancle_flag) begin
                        state <= S0;
                    end
                    else if (buy_flag && coin_val >= 100) begin
                        state <= S3;
                    end
                    else if (buy_flag && coin_val < 100) begin
                        state <= S2;
                    end
                    else begin
                        state <= S0;
                    end
                end
                S1: begin
                    op_start <= 1;
                    light <= 1;
                    light_one <= 0;
                    light_two <= 0;
                    hold_ind <= 1;
                    not_enough <= 1;
                    if (cancle_flag) begin
                        state <= S0;
                    end
                    else begin
                        state <= S1;
                    end
                end
                S2: begin
                    op_start <= 1;
                    light <= 1;
                    light_one <= 1;
                    light_two <= 0;
                    hold_ind <= 1;
                    not_enough <= 0;
                    if (cancle_flag) begin
                        state <= S0;
                    end
                    else if (get_ind) begin
                        state <= S0;
                    end
                    else begin
                        state <= S2;
                    end
                end
                S3: begin
                    op_start <= 1;
                    light <= 1;
                    light_one <= 1;
                    light_two <= 1;
                    hold_ind <= 1;
                    not_enough <= 0;
                    if (cancle_flag) begin
                        state <= S0;
                    end
                    else if (get_ind) begin
                        state <= S0;
                    end
                    else begin
                        state <= S3;
                    end
                end
            endcase
        end
    end

endmodule