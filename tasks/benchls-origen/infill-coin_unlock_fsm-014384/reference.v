module origen_014384 (
    input wire rst,
    input wire clk,
    input wire timeIn,
    input wire wheel,
    output reg unlock
);

    // State encoding
    parameter S0 = 4'b0000,
              S1 = 4'b0001,
              S2 = 4'b0010,
              S3 = 4'b0011,
              S4 = 4'b0100;

    reg [3:0] state, next_state;

    // State register
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S0;
        else
            state <= next_state;
    end

    // Next state logic and output logic
    always @(*) begin
        next_state = state;
        unlock = 1'b0;

        case (state)
            S0: begin
                if (timeIn && !wheel)
                    next_state = S1;
            end
            S1: begin
                if (timeIn && !wheel) begin
                    next_state = S2;
                    unlock = 1'b1;
                end
                else if (!timeIn && wheel)
                    next_state = S0;
            end
            S2: begin
                if (timeIn)
                    next_state = S3;
            end
            S3: begin
                if (timeIn)
                    next_state = S0;
            end
            default: next_state = S0;
        endcase
    end

endmodule