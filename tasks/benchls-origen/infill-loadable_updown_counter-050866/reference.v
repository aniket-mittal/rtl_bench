module origen_050866 (
    input wire CLOCK,
    input wire Reset,
    input wire [1:0] S,
    input wire [9:0] P,
    input wire [9:0] BeginCount,
    input wire [9:0] EndCount,
    output reg [9:0] Q,
    output reg TerminalCount
);

    reg [9:0] NextQ;

    always @(posedge CLOCK or posedge Reset) begin
        if (Reset)
            Q <= BeginCount;
        else
            Q <= NextQ;
    end

    always @(*) begin
        case (S)
            2'b00: begin // Hold
                NextQ = Q;
                TerminalCount = 1'b0;
            end
            2'b01: begin // Count Up
                if (Q == EndCount) begin
                    NextQ = 10'd0;
                    TerminalCount = 1'b1;
                end else begin
                    NextQ = Q + 1'b1;
                    TerminalCount = 1'b0;
                end
            end
            2'b10: begin // Count Down
                if (Q == BeginCount) begin
                    NextQ = EndCount;
                    TerminalCount = 1'b1;
                end else begin
                    NextQ = Q - 1'b1;
                    TerminalCount = 1'b0;
                end
            end
            2'b11: begin // Parallel Load
                NextQ = P;
                TerminalCount = 1'b0;
            end
        endcase
    end

endmodule