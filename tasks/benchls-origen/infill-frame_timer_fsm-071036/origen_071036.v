module origen_071036 (
    input wire clk_16x,
    input wire in,
    input wire startb,
    input wire rst,
    output reg signalOut,
    output reg [3:0] out
);

    reg [3:0] ps, ns;
    integer count;

    // State definitions
    parameter WAITING = 4'b0100;
    parameter START   = 4'b0000;
    parameter MIDDLE  = 4'b0111;
    parameter ENDING  = 4'b1111;

    // Next state logic
    always @(*) begin
        case (ps)
            WAITING: ns = startb ? START : WAITING;
            START:   ns = MIDDLE;
            MIDDLE:  ns = (count == 14) ? ENDING : MIDDLE;
            ENDING:  ns = WAITING;
            default: ns = WAITING;
        endcase
    end

    // State register and counter
    [MASKED]

    // Output logic
    always @(*) begin
        signalOut = (count == 7);
        out = ps;
    end

endmodule