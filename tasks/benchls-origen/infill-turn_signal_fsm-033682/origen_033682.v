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

    [MASKED]

    always @(*) begin
        out = cs;
    end

endmodule