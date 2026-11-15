module origen_028849 (
    input wire clk,
    input wire rst,
    output reg [5:0] light
);

    // State encoding
    localparam [3:0] S0 = 4'b0000,
                     S1 = 4'b0001,
                     S2 = 4'b0010,
                     S3 = 4'b0011,
                     S4 = 4'b0100,
                     S5 = 4'b0101,
                     S6 = 4'b0110;

    reg [3:0] state, next_state;

    // State register
    always @(posedge clk or negedge rst) begin
        if (!rst)
            state <= S0;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            S0: next_state = S1;
            S1: next_state = S2;
            S2: next_state = S3;
            S3: next_state = S4;
            S4: next_state = S5;
            S5: next_state = S6;
            S6: next_state = S0;
            default: next_state = S0;
        endcase
    end

    // Output logic
    always @(*) begin
        case (state)
            S0: light = 6'b111111;
            S1: light = 6'b101010;
            S2: light = 6'b100011;
            S3: light = 6'b100111;
            S4: light = 6'b100101;
            S5: light = 6'b100100;
            S6: light = 6'b000000;
            default: light = 6'b111111;
        endcase
    end

endmodule