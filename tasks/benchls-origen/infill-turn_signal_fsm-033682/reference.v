module origen_033682(
    input wire clock,
    input wire reset,
    input wire left,
    input wire right,
    input wire hazard,
    input wire brake,
    output reg [5:0] out
);

    reg [5:0] cs;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            cs <= 6'b000000;
        end else begin
            case ({hazard, brake, left, right, cs})
                // Hazard light
                {1'b1, 4'bxxxx, 6'bxxxxxx}: cs <= 6'b111111;
                
                // Brake light with no turn signal
                {2'b01, 2'b00, 6'bxxxxxx}: cs <= 6'b111111;
                
                // Left turn with brake
                {2'b01, 2'b10, 6'b000000}: cs <= 6'b001111;
                {2'b01, 2'b10, 6'b001111}: cs <= 6'b011111;
                {2'b01, 2'b10, 6'b011111}: cs <= 6'b111111;
                {2'b01, 2'b10, 6'b111111}: cs <= 6'b000111;
                
                // Right turn with brake
                {2'b01, 2'b01, 6'b000000}: cs <= 6'b111100;
                {2'b01, 2'b01, 6'b111100}: cs <= 6'b111110;
                {2'b01, 2'b01, 6'b111110}: cs <= 6'b111111;
                {2'b01, 2'b01, 6'b111111}: cs <= 6'b111000;
                
                // Left turn
                {3'b001, 1'bx, 6'b000000}: cs <= 6'b001000;
                {3'b001, 1'bx, 6'b001000}: cs <= 6'b011000;
                {3'b001, 1'bx, 6'b011000}: cs <= 6'b111000;
                {3'b001, 1'bx, 6'b111000}: cs <= 6'b000000;
                
                // Right turn
                {3'b000, 1'b1, 6'b000000}: cs <= 6'b000100;
                {3'b000, 1'b1, 6'b000100}: cs <= 6'b000110;
                {3'b000, 1'b1, 6'b000110}: cs <= 6'b000111;
                {3'b000, 1'b1, 6'b000111}: cs <= 6'b000000;
                
                // No change if no input
                default: cs <= cs;
            endcase
        end
    end

    always @(*) begin
        out = cs;
    end

endmodule