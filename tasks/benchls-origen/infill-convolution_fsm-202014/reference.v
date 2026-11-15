module origen_202014(
    input clk,
    input done_conv,
    input start,
    output reg shift_right,
    output reg start_conv,
    output reg [14:0] address,
    output reg done,
    output reg [3:0] state_reg,
    output reg [3:0] state_next
);

    reg signed [14:0] i, j, i_temp, j_temp;

    parameter IDLE = 4'b0000;
    parameter RP1 = 4'b0001;
    parameter RP2 = 4'b0010;
    parameter RP3 = 4'b0011;
    parameter RP4 = 4'b0100;
    parameter RP5 = 4'b0101;
    parameter RP6 = 4'b0110;
    parameter RP7 = 4'b0111;
    parameter RP8 = 4'b1000;
    parameter RP9 = 4'b1001;
    parameter CONV = 4'b1010;
    parameter INCREASE_J = 4'b1011;
    parameter INCREASE_I = 4'b1100;

    initial begin
        state_reg = IDLE;
        i = 0;
        j = 0;
        start_conv = 0;
        address = 0;
        shift_right = 0;
        done = 0;
    end

    always @(posedge clk) begin
        state_reg <= state_next;

        case (state_reg)
            IDLE: begin
                if (start) begin
                    state_next = RP1;
                    i_temp = 0;
                    j_temp = 0;
                end else begin
                    state_next = IDLE;
                end
            end

            RP1: begin
                i_temp = 0;
                j_temp = 0;
                shift_right = 1;
                state_next = RP2;
            end

            RP2: begin
                i_temp = 0;
                j_temp = 1;
                shift_right = 1;
                state_next = RP3;
            end

            RP3: begin
                i_temp = 0;
                j_temp = 2;
                shift_right = 1;
                state_next = RP4;
            end

            RP4: begin
                i_temp = 1;
                j_temp = 0;
                shift_right = 1;
                state_next = RP5;
            end

            RP5: begin
                i_temp = 1;
                j_temp = 1;
                shift_right = 1;
                state_next = RP6;
            end

            RP6: begin
                i_temp = 1;
                j_temp = 2;
                shift_right = 1;
                state_next = RP7;
            end

            RP7: begin
                i_temp = 2;
                j_temp = 0;
                shift_right = 1;
                state_next = RP8;
            end

            RP8: begin
                i_temp = 2;
                j_temp = 1;
                shift_right = 1;
                state_next = RP9;
            end

            RP9: begin
                i_temp = 2;
                j_temp = 2;
                shift_right = 1;
                state_next = CONV;
            end

            CONV: begin
                start_conv = 1;
                if (done_conv) begin
                    start_conv = 0;
                    state_next = INCREASE_J;
                end else begin
                    state_next = CONV;
                end
            end

            INCREASE_J: begin
                j = j + 1;
                if (j == 127) begin
                    j = 0;
                    state_next = INCREASE_I;
                end else begin
                    state_next = RP1;
                end
            end

            INCREASE_I: begin
                i = i + 1;
                if (i == 127) begin
                    i = 0;
                    done = 1;
                    state_next = IDLE;
                end else begin
                    state_next = RP1;
                end
            end

            default: begin
                state_next = IDLE;
            end
        endcase

        i = i_temp;
        j = j_temp;
        address = (130 * (i + 1)) + (j + 1);
    end
endmodule