module origen_109496(
    input [4:0] q,
    input clock,
    input seconds2,
    output reg [1:0] memoryselect_clip_1,
    output reg timer,
    output reg seriena,
    output reg creset,
    output reg deseriena
);

    // State encoding
    parameter S0 = 5'b00001;
    parameter S1 = 5'b00010;
    parameter S2 = 5'b00100;
    parameter S3 = 5'b01000;
    parameter S4 = 5'b10000;

    reg [4:0] state, next_state;

    // State transition logic
    always @(posedge clock) begin
        state <= next_state;
    end

    always @(*) begin
        case(state)
            S0: begin
                if (q[3] & q[1])
                    next_state = S1;
                else if (q[3] & q[2])
                    next_state = S2;
                else if (q[1] & q[0])
                    next_state = S3;
                else if (q[2] & q[0])
                    next_state = S4;
                else
                    next_state = S0;
            end
            S1, S2, S3, S4: begin
                if (seconds2)
                    next_state = S0;
                else
                    next_state = state;
            end
            default: next_state = S0;
        endcase
    end

    // Output logic
    always @(*) begin
        case(state)
            S0: begin
                memoryselect_clip_1 = 2'b00;
                timer = 1'b0;
                seriena = 1'b0;
                creset = 1'b1;
                deseriena = 1'b0;
            end
            S1: begin
                memoryselect_clip_1 = 2'b01;
                timer = 1'b1;
                seriena = 1'b0;
                creset = 1'b0;
                deseriena = 1'b1;
            end
            S2: begin
                memoryselect_clip_1 = 2'b11;
                timer = 1'b1;
                seriena = 1'b0;
                creset = 1'b0;
                deseriena = 1'b1;
            end
            S3: begin
                memoryselect_clip_1 = 2'b00;
                timer = 1'b1;
                seriena = 1'b1;
                creset = 1'b0;
                deseriena = 1'b0;
            end
            S4: begin
                memoryselect_clip_1 = 2'b10;
                timer = 1'b1;
                seriena = 1'b1;
                creset = 1'b0;
                deseriena = 1'b0;
            end
            default: begin
                memoryselect_clip_1 = 2'b00;
                timer = 1'b0;
                seriena = 1'b0;
                creset = 1'b1;
                deseriena = 1'b0;
            end
        endcase
    end

endmodule