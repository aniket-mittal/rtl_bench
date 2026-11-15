module origen_120742 (
    input wire clk,
    input wire reset,
    input wire run,
    input wire clearA_loadB,
    input wire M,
    output reg clr_A,
    output reg clr_X,
    output reg ld_A,
    output reg ld_B,
    output reg shift,
    output reg ld_X,
    output reg fn
);

    // State encoding
    localparam [4:0] 
        START  = 5'b00000,
        A0     = 5'b00001,
        S0     = 5'b00010,
        A1     = 5'b00011,
        S1     = 5'b00100,
        A2     = 5'b00101,
        S2     = 5'b00110,
        A3     = 5'b00111,
        S3     = 5'b01000,
        A4     = 5'b01001,
        S4     = 5'b01010,
        A5     = 5'b01011,
        S5     = 5'b01100,
        A6     = 5'b01101,
        S6     = 5'b01110,
        SUB7   = 5'b01111,
        S7     = 5'b10000,
        FINISH = 5'b10001;

    reg [4:0] state, next_state;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= START;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            START:  next_state = run ? A0 : START;
            A0:     next_state = S0;
            S0:     next_state = A1;
            A1:     next_state = S1;
            S1:     next_state = A2;
            A2:     next_state = S2;
            S2:     next_state = A3;
            A3:     next_state = S3;
            S3:     next_state = A4;
            A4:     next_state = S4;
            S4:     next_state = A5;
            A5:     next_state = S5;
            S5:     next_state = A6;
            A6:     next_state = S6;
            S6:     next_state = SUB7;
            SUB7:   next_state = S7;
            S7:     next_state = FINISH;
            FINISH: next_state = run ? FINISH : START;
            default: next_state = START;
        endcase
    end

    // Output logic
    always @(*) begin
        // Default output values
        clr_A = 0;
        clr_X = 0;
        ld_A = 0;
        ld_B = 0;
        shift = 0;
        ld_X = 0;
        fn = 0;

        case (state)
            START: begin
                clr_A = 1;
                clr_X = 1;
                ld_B = clearA_loadB;
            end
            A0, A1, A2, A3, A4, A5, A6: begin
                ld_A = M;
                ld_X = M;
            end
            SUB7: begin
                ld_A = M;
                ld_X = M;
                fn = 1;
            end
            S0, S1, S2, S3, S4, S5, S6, S7: begin
                shift = 1;
            end
            FINISH: begin
                clr_X = 1;
            end
        endcase
    end

endmodule