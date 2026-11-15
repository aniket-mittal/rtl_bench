module origen_133025(
    input [31:0] data_in,
    input [4:0] shift_amount,
    input direction,
    output [7:0] upper_byte,
    output [7:0] lower_byte,
    output [31:0] reversed_bytes,
    output [15:0] sum_output
);

    wire [31:0] shifted_data;
    wire [15:0] upper_half, lower_half;

    // Instantiate 32-bit barrel shifter
    barrel_shifter_32bit shifter (
        .data_in(data_in),
        .shift_amount(shift_amount),
        .direction(direction),
        .data_out(shifted_data)
    );

    // Instantiate 16-bit splitter
    splitter_16bit splitter (
        .data_in(shifted_data[15:0]),
        .upper_half(upper_half),
        .lower_half(lower_half)
    );

    // Assign upper and lower bytes
    assign upper_byte = upper_half[15:8];
    assign lower_byte = lower_half[7:0];

    // Reverse byte order
    assign reversed_bytes = {shifted_data[7:0], shifted_data[15:8], shifted_data[23:16], shifted_data[31:24]};

    // Sum of upper and lower bytes
    assign sum_output = upper_byte + lower_byte;

endmodule

module barrel_shifter_32bit(
    input [31:0] data_in,
    input [4:0] shift_amount,
    input direction,
    output [31:0] data_out
);

    assign data_out = direction ? (data_in >> shift_amount) : (data_in << shift_amount);

endmodule

module splitter_16bit(
    input [15:0] data_in,
    output [15:0] upper_half,
    output [15:0] lower_half
);

    assign upper_half = {data_in[15:8], 8'b0};
    assign lower_half = {8'b0, data_in[7:0]};

endmodule