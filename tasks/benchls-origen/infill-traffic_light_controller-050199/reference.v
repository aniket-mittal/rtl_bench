module origen_050199 (
    input wire clk,
    input wire reset,
    input wire Ta,
    input wire Tb,
    output reg green_a,
    output reg yellow_a,
    output reg red_a,
    output reg green_b,
    output reg yellow_b,
    output reg red_b
);

    // State encoding
    parameter S0 = 3'b000,
              S1 = 3'b001,
              S2 = 3'b010,
              S3 = 3'b011,
              S4 = 3'b100,
              S5 = 3'b101;

    reg [2:0] current_state, next_state;

    // State update block
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    // Next state and output logic block
    always @(*) begin
        // Default next state
        next_state = current_state;

        // Default output values
        green_a = 0; yellow_a = 0; red_a = 0;
        green_b = 0; yellow_b = 0; red_b = 0;

        case (current_state)
            S0: begin
                green_a = 1; red_b = 1;
                if (!Ta) next_state = S1;
            end
            S1: begin
                yellow_a = 1; red_b = 1;
                next_state = S2;
            end
            S2: begin
                red_a = 1; red_b = 1;
                next_state = S3;
            end
            S3: begin
                red_a = 1; green_b = 1;
                if (!Tb) next_state = S4;
            end
            S4: begin
                red_a = 1; yellow_b = 1;
                next_state = S5;
            end
            S5: begin
                red_a = 1; red_b = 1;
                next_state = S0;
            end
            default: next_state = S0;
        endcase
    end

endmodule

