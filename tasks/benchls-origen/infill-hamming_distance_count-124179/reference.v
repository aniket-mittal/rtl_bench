module origen_124179(
    input [7:0] a,
    input [7:0] b,
    output [7:0] count
);

    reg [7:0] xor_result;
    wire [7:0] shift_out;
    wire compare_out;
    
    // XOR operation
    always @(*) begin
        xor_result = a ^ b;
    end
    
    // Shift register
    shift_register shift_reg (
        .data_in(xor_result),
        .shift_out(shift_out)
    );
    
    // Comparator
    comparator comp (
        .in(shift_out[0]),
        .out(compare_out)
    );
    
    // Count ones
    count_ones counter (
        .in(compare_out),
        .count(count)
    );

endmodule

module shift_register(
    input [7:0] data_in,
    output reg [7:0] shift_out
);
    always @(*) begin
        shift_out = data_in;
    end
endmodule

module comparator(
    input in,
    output out
);
    assign out = (in == 1'b1);
endmodule

module count_ones(
    input in,
    output reg [7:0] count
);
    always @(*) begin
        count = {7'b0000000, in};
    end
endmodule