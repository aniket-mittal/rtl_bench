// D Flip-Flop Module
module origen_100437 (
    input Clock,
    input Reset,
    input d,
    output reg q
);

always @(posedge Clock or posedge Reset) begin
    if (Reset)
        q <= 1'b0;
    else
        q <= d;
end

endmodule

// Testbench Module
