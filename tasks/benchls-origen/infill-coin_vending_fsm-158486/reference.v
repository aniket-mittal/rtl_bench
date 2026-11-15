module origen_158486 (
    input clk,
    input reset_n,
    input c5,
    input c10,
    input c25,
    input item_taken,
    output reg dispense,
    output reg r5,
    output reg r10,
    output reg r20,
    output reg state0,
    output reg state1,
    output reg state2,
    output reg state3,
    output reg state4,
    output reg state5,
    output reg state6,
    output reg state7,
    output reg state8,
    output reg state9
);

    reg [3:0] state_reg, state_next;
    parameter s0 = 4'd0, s1 = 4'd1, s2 = 4'd2, s3 = 4'd3, s4 = 4'd4,
              s5 = 4'd5, s6 = 4'd6, s7 = 4'd7, s8 = 4'd8, s9 = 4'd9;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            state_reg <= s0;
        end else begin
            state_reg <= state_next;
        end
    end

    always @(*) begin
        state_next = state_reg;
        case (state_reg)
            s0: begin
                if (c5) state_next = s1;
                else if (c10) state_next = s2;
                else if (c25) state_next = s3;
            end
            s1: begin
                if (c5) state_next = s4;
                else if (c10) state_next = s2;
                else if (c25) state_next = s3;
            end
            s2: begin
                if (c5) state_next = s1;
                else if (c10) state_next = s5;
                else if (c25) state_next = s6;
            end
            s3: begin
                if (c5) state_next = s7;
                else if (c10) state_next = s6;
                else if (c25) state_next = s8;
            end
            s4: begin
                if (item_taken) state_next = s0;
                else state_next = s4;
            end
            s5: begin
                if (item_taken) state_next = s0;
                else state_next = s5;
            end
            s6: begin
                if (item_taken) state_next = s0;
                else state_next = s6;
            end
            s7: begin
                if (item_taken) state_next = s0;
                else state_next = s7;
            end
            s8: begin
                if (item_taken) state_next = s0;
                else state_next = s8;
            end
            s9: begin
                if (item_taken) state_next = s0;
                else state_next = s9;
            end
            default: state_next = s0;
        endcase
    end

    always @(*) begin
        dispense = 0;
        r5 = 0;
        r10 = 0;
        r20 = 0;
        state0 = 0;
        state1 = 0;
        state2 = 0;
        state3 = 0;
        state4 = 0;
        state5 = 0;
        state6 = 0;
        state7 = 0;
        state8 = 0;
        state9 = 0;

        case (state_reg)
            s0: state0 = 1;
            s1: state1 = 1;
            s2: state2 = 1;
            s3: state3 = 1;
            s4: state4 = 1;
            s5: begin
                state5 = 1;
                dispense = 1;
            end
            s6: begin
                state6 = 1;
                dispense = 1;
            end
            s7: begin
                state7 = 1;
                dispense = 1;
            end
            s8: begin
                state8 = 1;
                dispense = 1;
            end
            s9: begin
                state9 = 1;
                dispense = 1;
            end
        endcase

        if (state_reg == s1) r5 = 1;
        else if (state_reg == s2) r10 = 1;
        else if (state_reg == s3 || state_reg == s6 || state_reg == s8) r20 = 1;
    end

endmodule