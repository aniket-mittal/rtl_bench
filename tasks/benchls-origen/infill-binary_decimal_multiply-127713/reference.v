module origen_127713(
    input [7:0] input_number,
    output [7:0] output_number
);

    wire [2:0] input_msb;
    wire [4:0] input_lsb;
    wire [3:0] decimal_msb;
    wire [7:0] decimal_product;

    assign input_msb = input_number[7:5];
    assign input_lsb = input_number[4:0];

    // Instantiate 3-bit binary to decimal converter
    binary_to_decimal b2d (
        .binary_in(input_msb),
        .decimal_out(decimal_msb)
    );

    // Calculate product in decimal
    assign decimal_product = (decimal_msb * 32 + input_lsb) * 3;

    // Instantiate decimal to 8-bit binary converter
    decimal_to_binary d2b (
        .decimal_in(decimal_product),
        .binary_out(output_number)
    );

endmodule

// 3-bit binary to decimal converter module (assumed implementation)
module binary_to_decimal(
    input [2:0] binary_in,
    output reg [3:0] decimal_out
);
    always @(*) begin
        case(binary_in)
            3'b000: decimal_out = 4'd0;
            3'b001: decimal_out = 4'd1;
            3'b010: decimal_out = 4'd2;
            3'b011: decimal_out = 4'd3;
            3'b100: decimal_out = 4'd4;
            3'b101: decimal_out = 4'd5;
            3'b110: decimal_out = 4'd6;
            3'b111: decimal_out = 4'd7;
        endcase
    end
endmodule

// Decimal to 8-bit binary converter module (assumed implementation)
module decimal_to_binary(
    input [7:0] decimal_in,
    output reg [7:0] binary_out
);
    always @(*) begin
        binary_out = decimal_in;
    end
endmodule