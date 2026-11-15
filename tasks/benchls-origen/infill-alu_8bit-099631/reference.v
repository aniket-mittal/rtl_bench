module origen_099631 (
    input [7:0] in1, in2,
    input cin, m,
    input [3:0] s,
    output reg [7:0] out,
    output aeb, cout
);

    always @(*) begin
        case ({m, s, cin})
            // Logical Mode (m == 1)
            6'b100000: out = ~in1;                    // NOT in1
            6'b100010: out = in1 & in2;               // AND
            6'b100100: out = in1 | in2;               // OR
            6'b100110: out = in1 ^ in2;               // XOR
            6'b101000: out = ~(in1 & in2);            // NAND
            6'b101010: out = ~(in1 | in2);            // NOR
            6'b101100: out = ~(in1 ^ in2);            // XNOR
            6'b101110: out = in1;                     // Buffer in1
            6'b110000: out = ~in2;                    // NOT in2
            6'b110010: out = in1 & ~in2;              // AND-NOT
            6'b110100: out = in1 | ~in2;              // OR-NOT
            6'b110110: out = in2;                     // Buffer in2
            6'b111000: out = {in1[7:4], in2[3:0]};    // Upper in1, Lower in2
            6'b111010: out = {in2[7:4], in1[3:0]};    // Upper in2, Lower in1
            6'b111100: out = in1 << 1;                // Left shift in1
            6'b111110: out = in1 >> 1;                // Right shift in1

            // Arithmetic Mode (m == 0)
            6'b000000: out = in1 + in2 + cin;         // Addition with carry
            6'b000010: out = in1 - in2 - cin;         // Subtraction with borrow
            6'b000100: out = in1 + 1;                 // Increment in1
            6'b000110: out = in1 - 1;                 // Decrement in1
            6'b001000: out = in2 + 1;                 // Increment in2
            6'b001010: out = in2 - 1;                 // Decrement in2
            6'b001100: out = in1 + in2;               // Addition
            6'b001110: out = in1 - in2;               // Subtraction
            6'b010000: out = (in1 + in2) & in1;       // Add and AND with in1
            6'b010010: out = (in1 - in2) | in2;       // Subtract and OR with in2
            6'b010100: out = (in1 + in2) ^ in1;       // Add and XOR with in1
            6'b010110: out = (in1 - in2) ^ in2;       // Subtract and XOR with in2
            6'b011000: out = in1 * in2[3:0];          // Multiply in1 by lower 4 bits of in2
            6'b011010: out = in1 / (in2[3:0] + 1);    // Divide in1 by (lower 4 bits of in2 + 1)
            6'b011100: out = {in1[3:0], in2[3:0]};    // Concatenate lower 4 bits
            6'b011110: out = (in1 + in2) << 1;        // Add and left shift

            default: out = 8'b0;                      // Default case
        endcase
    end

    assign aeb = (in1 == in2);
    assign cout = in1[7] & in2[7];

endmodule