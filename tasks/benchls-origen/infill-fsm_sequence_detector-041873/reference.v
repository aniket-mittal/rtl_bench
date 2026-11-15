module origen_041873 (
    input wire clk,
    input wire reset_b,
    input wire in_x,
    input wire in_y,
    output reg out_z
);

    // State encoding
    localparam S0 = 2'b00,
               S1 = 2'b01,
               S2 = 2'b10,
               S3 = 2'b11;

    // State register
    reg [1:0] state, next_state;

    // State register logic
    always @(posedge clk or negedge reset_b) begin
        if (!reset_b)
            state <= S0;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            S0: begin
                if (!in_x)
                    next_state = S0;
                else if (in_y)
                    next_state = S1;
                else
                    next_state = S3;
            end
            S1: next_state = in_x ? S2 : S0;
            S2: next_state = in_x ? S3 : S0;
            S3: next_state = in_x ? S3 : S0;
            default: next_state = S0;
        endcase
    end

    // Output logic
    always @(*) begin
        case (state)
            S0, S1: out_z = 1'b0;
            S2, S3: out_z = 1'b1;
            default: out_z = 1'b0;
        endcase
    end

endmodule