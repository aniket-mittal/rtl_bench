module origen_101579 (
    input wire clk,
    input wire reset_n,
    input wire findFinished,
    input wire DVIedge,
    output reg storeEnvelope,
    output reg startFinder,
    output reg DVO
);

    // State encoding
    localparam IDLE = 3'b000;
    localparam S1   = 3'b001;
    localparam S2   = 3'b010;
    localparam S3   = 3'b011;
    localparam S4   = 3'b100;
    localparam S5   = 3'b101;

    reg [2:0] state, next_state;

    // State register
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE: next_state = DVIedge ? S1 : IDLE;
            S1:   next_state = S2;
            S2:   next_state = S3;
            S3:   next_state = S4;
            S4:   next_state = findFinished ? S5 : S4;
            S5:   next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

    // Output logic
    always @(*) begin
        // Default output values
        storeEnvelope = 1'b0;
        startFinder = 1'b0;
        DVO = 1'b1;

        case (state)
            S1: storeEnvelope = 1'b1;
            S2, S3: startFinder = 1'b1;
            S1, S2, S3, S4: DVO = 1'b0;
        endcase
    end

endmodule