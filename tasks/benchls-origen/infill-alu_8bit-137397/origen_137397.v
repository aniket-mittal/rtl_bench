module origen_137397(
    input [7:0] a,
    input [7:0] b,
    input [1:0] op,
    output reg [7:0] result
);

[MASKED]

endmodule

module testbench;
    reg [7:0] a, b;
    reg [1:0] op;
    wire [7:0] result;

    calculator uut (
        .a(a),
        .b(b),
        .op(op),
        .result(result)
    );

    integer i;
    reg [7:0] expected_result;

    initial begin
        for (i = 0; i < 100; i = i + 1) begin
            a = $random;
            b = $random;
            op = $random;

            #10;

            case(op)
                2'b00: expected_result = a + b;
                2'b01: expected_result = a - b;
                2'b10: expected_result = a * b;
                2'b11: expected_result = (b != 0) ? a / b : 8'hFF;
            endcase

            if (result !== expected_result) begin
                $display("Error: a=%d, b=%d, op=%b, result=%d, expected=%d", a, b, op, result, expected_result);
            end else begin
                $display("Success: a=%d, b=%d, op=%b, result=%d", a, b, op, result);
            end
        end

        ;
    end
endmodule