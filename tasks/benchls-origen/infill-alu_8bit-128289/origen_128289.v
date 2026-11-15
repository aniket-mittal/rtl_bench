module origen_128289(
    input [7:0] a,
    input [7:0] b,
    input [2:0] op,
    output reg [7:0] result
);

[MASKED]

endmodule

// Testbench
module calculator_tb;
    reg [7:0] a, b;
    reg [2:0] op;
    wire [7:0] result;

    calculator uut (
        .a(a),
        .b(b),
        .op(op),
        .result(result)
    );

    initial begin
        // Test addition
        a = 8'd10; b = 8'd5; op = 3'b000;
        #10 $display("Addition: %d + %d = %d", a, b, result);

        // Test subtraction
        a = 8'd15; b = 8'd7; op = 3'b001;
        #10 $display("Subtraction: %d - %d = %d", a, b, result);

        // Test multiplication
        a = 8'd6; b = 8'd4; op = 3'b010;
        #10 $display("Multiplication: %d * %d = %d", a, b, result);

        // Test division
        a = 8'd20; b = 8'd5; op = 3'b011;
        #10 $display("Division: %d / %d = %d", a, b, result);

        // Test division by zero
        a = 8'd10; b = 8'd0; op = 3'b011;
        #10 $display("Division by zero: %d / %d = %d", a, b, result);

        // Test invalid operation
        a = 8'd8; b = 8'd2; op = 3'b100;
        #10 $display("Invalid operation: op = %b, result = %d", op, result);

        ;
    end
endmodule