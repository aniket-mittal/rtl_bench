module origen_074105 (
    input wire clk,
    input wire rst,
    input wire ld,
    input wire [7:0] in,
    output reg [7:0] out
);

always @(posedge clk or posedge rst) begin
    if (rst)
        out <= 8'b0;
    else if (ld)
        out <= in;
end

endmodule

