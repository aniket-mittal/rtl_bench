module origen_118483(
    input [7:0] a,
    input [7:0] b,
    input [4:0] fun,
    input cin,
    output reg [7:0] result,
    output zero,
    output reg cout
);

    reg [8:0] temp;

    always @(*) begin
        case(fun)
            // Arithmetic operations
            5'b00000, 5'b01000: {cout, result} = a + b + cin;  // Addition with carry
            5'b00001, 5'b01001: {cout, result} = a + b;        // Addition
            5'b00010, 5'b01010: {cout, result} = a - b - cin;  // Subtraction with borrow
            5'b00011, 5'b01011: {cout, result} = a - b;        // Subtraction

            // Logical operations
            5'b00100: begin result = a & b; cout = 1'b0; end   // AND
            5'b00101: begin result = a | b; cout = 1'b0; end   // OR
            5'b00110: begin result = a ^ b; cout = 1'b0; end   // XOR
            5'b00111: begin result = ~(a & b); cout = 1'b0; end // NAND

            // Shift operations
            5'b01100: begin                                    // Left shift
                result = {a[6:0], 1'b0};
                cout = a[7];
            end
            5'b01101: begin                                    // Right shift
                result = {1'b0, a[7:1]};
                cout = a[0];
            end
            5'b01110: begin                                    // Rotate left
                result = {a[6:0], a[7]};
                cout = a[7];
            end
            5'b01111: begin                                    // Rotate right
                result = {a[0], a[7:1]};
                cout = a[0];
            end

            // Default case
            default: begin
                result = 8'b0;
                cout = 1'b0;
            end
        endcase
    end

    assign zero = (result == 8'b0);

endmodule