module origen_187469(
    HSEL,
    HADDR,
    SSEL
);

input HSEL;
input [16:7] HADDR;
output reg [31:0] SSEL;

reg [31:0] SELI;

[MASKED]

always @(*) begin
    SSEL = SELI & {32{HSEL}};
end

endmodule