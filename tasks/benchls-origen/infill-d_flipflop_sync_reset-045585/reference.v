// D Flip-Flop Module
module origen_045585 (
    input wire clk,
    input wire in,
    input wire rst,
    output reg q,
    output wire q1
);

always @(posedge clk or posedge rst) begin
    if (rst)
        q <= 1'b0;
    else
        q <= in;
end

assign q1 = ~q;

endmodule

// Testbench Module
