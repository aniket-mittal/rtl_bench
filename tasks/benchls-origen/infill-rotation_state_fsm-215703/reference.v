module origen_215703(
    input clk,
    input reset,
    input [1:0] control,
    output reg warnbit,
    output reg [3:0] curr_state
);

parameter state_0 = 4'b0000, state_1 = 4'b0001, state_2 = 4'b0010, state_3 = 4'b0011,
          state_4 = 4'b0100, state_5 = 4'b0101, state_6 = 4'b0110, state_7 = 4'b0111;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        curr_state <= state_0;
        warnbit <= 1'b0;
    end
    else begin
        case (control)
            2'b00: curr_state <= curr_state; // same_state_ctrl
            2'b01: begin // counter_clk_wise_ctrl
                case (curr_state)
                    state_0: curr_state <= state_7;
                    state_7: curr_state <= state_6;
                    state_6: curr_state <= state_5;
                    state_5: curr_state <= state_4;
                    state_4: curr_state <= state_3;
                    state_3: curr_state <= state_2;
                    state_2: curr_state <= state_1;
                    state_1: curr_state <= state_0;
                endcase
            end
            2'b10: begin // clk_wise_ctrl
                case (curr_state)
                    state_0: curr_state <= state_1;
                    state_1: curr_state <= state_2;
                    state_2: curr_state <= state_3;
                    state_3: curr_state <= state_4;
                    state_4: curr_state <= state_5;
                    state_5: curr_state <= state_6;
                    state_6: curr_state <= state_7;
                    state_7: curr_state <= state_0;
                endcase
            end
            2'b11: begin // warn_state_ctrl
                warnbit <= 1'b1;
                curr_state <= curr_state;
            end
        endcase
    end
end

endmodule