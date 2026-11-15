// PC Module
module origen_023116(
    input wire CP,
    input wire clk,
    input wire clr,
    input wire EP,
    output reg [3:0] PC_out
);

reg [3:0] count;

always @(posedge clk) begin
    if (clr)
        count <= 4'b0000;
    else if (CP)
        count <= count + 1;
end

always @(*) begin
    PC_out = EP ? count : 4'bz;
end

endmodule

// Testbench
