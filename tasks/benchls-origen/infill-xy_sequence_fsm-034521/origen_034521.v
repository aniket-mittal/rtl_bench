module origen_034521 (
    input wire clk,
    input wire resetn,
    input wire x,
    input wire y,
    output reg f,
    output reg g
);

    // State encoding
    parameter IDLE = 4'b0000;
    parameter F0   = 4'b0001;
    parameter F1   = 4'b0010;
    parameter X0   = 4'b0011;
    parameter X1   = 4'b0100;
    parameter X2   = 4'b0101;
    parameter Y0   = 4'b0110;
    parameter Y1   = 4'b0111;
    parameter Y00  = 4'b1000;
    parameter Y01  = 4'b1001;

    reg [3:0] cstate, nstate;

    // State register
    always @(posedge clk or negedge resetn) begin
        if (!resetn)
            cstate <= IDLE;
        else
            cstate <= nstate;
    end

    // Next state logic
    [MASKED]

    // Output logic
    always @(*) begin
        f = (cstate == F0);
        g = (cstate == X2) || (cstate == Y1) || (cstate == Y0) || (cstate == Y01);
    end

endmodule