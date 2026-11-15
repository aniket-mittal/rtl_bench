// D Flip-Flop Module
module origen_045490 (
    input wire Clk,
    input wire D,
    input wire reset,
    input wire enable,
    output reg Q
);

always @(posedge Clk or posedge reset) begin
    if (reset)
        Q <= 1'b0;
    else if (enable)
        Q <= D;
end

endmodule

// Testbench
