module origen_064878 (
    input wire CLK,
    input wire RESET,
    input wire OB_EN,
    input wire B_E,
    input wire OB_RESET,
    input wire M_OB_EN,
    output reg EN_OB,
    output wire COLLISION
);

    // Parameters
    parameter WAIT = 1'b0;
    parameter RESTORE = 1'b1;
    parameter ON = 1'b1;
    parameter OFF = 1'b0;

    // Internal signals
    reg CS, NS;

    // Collision detection
    assign COLLISION = B_E & OB_EN;

    // Sequential logic
    always @(posedge CLK or posedge RESET) begin
        if (RESET)
            CS <= WAIT;
        else
            CS <= NS;
    end

    // Combinational logic
    always @(*) begin
        case (CS)
            WAIT: begin
                EN_OB = M_OB_EN;
                if (COLLISION)
                    NS = RESTORE;
                else
                    NS = WAIT;
            end
            RESTORE: begin
                EN_OB = OFF;
                if (OB_RESET)
                    NS = WAIT;
                else
                    NS = RESTORE;
            end
            default: begin
                EN_OB = OFF;
                NS = WAIT;
            end
        endcase
    end

endmodule