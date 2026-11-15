module origen_107840 (
    input wire clk,
    input wire reset,
    input wire ok,
    output reg keep,
    output reg shot
);

    // State encoding
    localparam [1:0] s0 = 2'b00,
                     s1 = 2'b01,
                     s2 = 2'b10;

    reg [1:0] current_state, next_state;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= s0;
        else
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            s0: next_state = ok ? s1 : s0;
            s1: next_state = ok ? s2 : s1;
            s2: next_state = s2;
            default: next_state = s0;
        endcase
    end

    // Output logic
    always @(*) begin
        case (current_state)
            s0: begin
                keep = 1'b0;
                shot = 1'b0;
            end
            s1: begin
                keep = 1'b1;
                shot = 1'b0;
            end
            s2: begin
                keep = 1'b1;
                shot = 1'b1;
            end
            default: begin
                keep = 1'b0;
                shot = 1'b0;
            end
        endcase
    end

endmodule