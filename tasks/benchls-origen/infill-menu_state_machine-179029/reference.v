module origen_179029 (
    input CLK,
    input RESET,
    input BTNL,
    input BTNC,
    input BTNR,
    input [1:0] MSM_State,
    output reg [2:0] STATE_OUT
);

    reg [3:0] Curr_state, Next_state;
    parameter S0 = 4'b0000, S1 = 4'b0001, S2 = 4'b0010, S3 = 4'b0011, S4 = 4'b0100,
              S5 = 4'b0101, S6 = 4'b0110, S7 = 4'b0111, S8 = 4'b1000, S9 = 4'b1001;

    always @(posedge CLK or posedge RESET) begin
        if (RESET)
            Curr_state <= S0;
        else
            Curr_state <= Next_state;
    end

    always @(*) begin
        case (Curr_state)
            S0: begin
                if (MSM_State == 2'b01)
                    Next_state = S1;
                else
                    Next_state = S0;
            end
            S1: begin
                if (BTNL)
                    Next_state = S2;
                else if (BTNC)
                    Next_state = S3;
                else if (BTNR)
                    Next_state = S4;
                else
                    Next_state = S1;
            end
            S2: begin
                if (MSM_State == 2'b10)
                    Next_state = S5;
                else
                    Next_state = S2;
            end
            S3: begin
                if (MSM_State == 2'b11)
                    Next_state = S6;
                else
                    Next_state = S3;
            end
            S4: begin
                if (BTNL)
                    Next_state = S7;
                else if (BTNC)
                    Next_state = S8;
                else if (BTNR)
                    Next_state = S9;
                else
                    Next_state = S4;
            end
            S5: begin
                Next_state = S0;
            end
            S6: begin
                Next_state = S0;
            end
            S7: begin
                Next_state = S0;
            end
            S8: begin
                Next_state = S0;
            end
            S9: begin
                Next_state = S0;
            end
            default: begin
                Next_state = S0;
            end
        endcase
    end

    always @(*) begin
        case (Curr_state)
            S0: STATE_OUT = 3'b000;
            S1: STATE_OUT = 3'b001;
            S2: STATE_OUT = 3'b010;
            S3: STATE_OUT = 3'b011;
            S4: STATE_OUT = 3'b100;
            S5: STATE_OUT = 3'b101;
            S6: STATE_OUT = 3'b110;
            S7: STATE_OUT = 3'b111;
            S8: STATE_OUT = 3'b000;
            S9: STATE_OUT = 3'b001;
            default: STATE_OUT = 3'b000;
        endcase
    end

endmodule