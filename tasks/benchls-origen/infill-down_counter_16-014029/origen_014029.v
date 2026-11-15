module origen_014029(
    input wire clk,
    input wire Reset,
    input wire CE,
    output reg [3:0] Q
);

reg [3:0] cnt;

[MASKED]

always @(*) begin
    Q = cnt;
end

endmodule