module origen_132721(
    input [3:0] A,
    input [3:0] B,
    input select,
    output reg [1:0] Y1,
    output reg Y2
);

    reg [3:0] result;
    wire [3:0] sum, difference;

    // 4-bit adder
    assign sum = A + B;

    // 4-bit subtractor
    assign difference = A - B;

    // Select between addition and subtraction
    always @(*) begin
        if (select)
            result = sum;
        else
            result = difference;
    end

    // Priority encoder
    [MASKED]

endmodule