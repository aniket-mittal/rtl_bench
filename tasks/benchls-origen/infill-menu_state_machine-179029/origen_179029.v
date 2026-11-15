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

    [MASKED]

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