module origen_091491(
    input [15:0] x,
    input [15:0] y,
    output reg [15:0] quotient,
    output reg [15:0] remainder
);

reg [15:0] q, m, temp;
integer i;

always @(*) begin
    #1;
    temp = 16'd0;
    q = x;
    m = y;

    for (i = 0; i < 16; i = i + 1) begin
        {temp, q} = {temp, q} << 1;
        if (temp >= m) begin
            q[0] = 1'b1;
            temp = temp - m;
        end
    end

    quotient = q;
    remainder = temp;
end

endmodule

// Testbench
