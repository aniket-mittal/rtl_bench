module origen_088642 (
    input wire a, b, clk, reset,
    output reg s
);

    // State encoding
    localparam s0 = 1'b0;  // No carry
    localparam s1 = 1'b1;  // Carry

    reg PS, NS;  // Present State and Next State

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            PS <= s0;
        else
            PS <= NS;
    end

    // Next state and output logic
    always @(*) begin
        case (PS)
            s0: begin
                if (a & b) begin
                    NS = s1;
                    s = 1'b0;
                end else if (a | b) begin
                    NS = s0;
                    s = 1'b1;
                end else begin
                    NS = s0;
                    s = 1'b0;
                end
            end

            s1: begin
                if (a & b) begin
                    NS = s1;
                    s = 1'b1;
                end else if (a | b) begin
                    NS = s1;
                    s = 1'b0;
                end else begin
                    NS = s0;
                    s = 1'b1;
                end
            end

            default: begin
                NS = s0;
                s = 1'b0;
            end
        endcase
    end

endmodule