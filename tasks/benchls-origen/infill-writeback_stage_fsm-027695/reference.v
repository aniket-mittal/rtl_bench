module origen_027695 (
    input wire CLK,
    input wire RST,
    input wire HasJumped,
    input wire HasStall,
    output reg RegBankWr,
    output reg ClrStall,
    output reg UpdateJmpPC
);

    // State encoding
    localparam [1:0] WB0 = 2'b00,
                     WB1 = 2'b01,
                     WB2 = 2'b10;

    reg [1:0] WriteBackState, NextState;

    // State register
    always @(posedge CLK or posedge RST) begin
        if (RST)
            WriteBackState <= WB0;
        else
            WriteBackState <= NextState;
    end

    // Next state logic
    always @(*) begin
        case (WriteBackState)
            WB0: NextState = WB1;
            WB1: NextState = WB0;
            WB2: NextState = WB2;
            default: NextState = WB0;
        endcase
    end

    // Output logic
    always @(*) begin
        RegBankWr = 1'b0;
        ClrStall = 1'b0;
        UpdateJmpPC = 1'b0;

        case (WriteBackState)
            WB0: begin
                RegBankWr = 1'b1;
            end
            WB1: begin
                ClrStall = HasStall;
                UpdateJmpPC = HasJumped;
            end
            WB2: begin
                // All outputs are deasserted
            end
        endcase
    end

endmodule