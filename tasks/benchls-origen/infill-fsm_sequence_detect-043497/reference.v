`timescale 1ns/100ps

module origen_043497(
    input wire clock,
    input wire reset,
    input wire x,
    output reg z
);

    // State encoding
    localparam A = 2'b00;
    localparam B = 2'b01;
    localparam C = 2'b10;
    localparam D = 2'b11;

    // State registers
    reg [1:0] curr, nxt;

    // Combinational logic for next state and output
    always @(*) begin
        case(curr)
            A: begin
                nxt = x ? B : A;
                z = 1'b0;
            end
            B: begin
                nxt = x ? B : C;
                z = 1'b0;
            end
            C: begin
                nxt = x ? B : D;
                z = 1'b0;
            end
            D: begin
                nxt = x ? B : A;
                z = x ? 1'b1 : 1'b0;
            end
            default: begin
                nxt = A;
                z = 1'b0;
            end
        endcase
    end

    // Sequential logic for state update
    always @(posedge clock or posedge reset) begin
        if (reset)
            curr <= A;
        else
            curr <= nxt;
    end

endmodule