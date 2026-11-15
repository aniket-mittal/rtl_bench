module origen_167560(
    input d,
    input done_counting,
    input ack,
    input [9:0] state,
    output reg B0_next,
    output reg B1_next,
    output reg B2_next,
    output reg B3_next,
    output reg S_next,
    output reg S1_next,
    output reg C_next,
    output reg W_next,
    output reg Count_next,
    output reg Wait_next,
    output reg done,
    output reg counting,
    output reg shift_ena
);

always @(*) begin
    B0_next = 1'b0;
    B1_next = 1'b0;
    B2_next = 1'b0;
    B3_next = 1'b0;
    S_next = 1'b0;
    S1_next = 1'b0;
    C_next = 1'b0;
    W_next = 1'b0;
    Count_next = 1'b0;
    Wait_next = 1'b0;
    done = 1'b0;
    counting = 1'b0;
    shift_ena = 1'b0;

    case (state)
        10'b0000000001: begin // S
            if (d) begin
                S1_next = 1'b1;
            end else begin
                S_next = 1'b1;
            end
        end
        10'b0000000010: begin // S1
            S1_next = 1'b1;
        end
        10'b0000000100: begin // S11
            S1_next = 1'b1;
        end
        10'b0000001000: begin // S110
            B0_next = 1'b1;
            shift_ena = 1'b1;
        end
        10'b0000010000: begin // B0
            B1_next = 1'b1;
            shift_ena = 1'b1;
        end
        10'b0000100000: begin // B1
            B2_next = 1'b1;
            shift_ena = 1'b1;
        end
        10'b0001000000: begin // B2
            B3_next = 1'b1;
            shift_ena = 1'b1;
        end
        10'b0010000000: begin // B3
            C_next = 1'b1;
            counting = 1'b1;
        end
        10'b0100000000: begin // C
            if (done_counting) begin
                W_next = 1'b1;
            end else begin
                Count_next = 1'b1;
            end
        end
        10'b1000000000: begin // W
            if (ack) begin
                S_next = 1'b1;
            end else begin
                Wait_next = 1'b1;
                done = 1'b1;
            end
        end
        default: begin
            // Do nothing
        end
    endcase
end

endmodule