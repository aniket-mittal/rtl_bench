module origen_140686 (
    input [3:0] data,
    input [1:0] shift_amount,
    input shift_left,
    input P,
    output [3:0] result
);

    wire [3:0] shifted_data;

    // Instantiate the barrel shifter
    barrel_shifter_4bit bs (
        .data(data),
        .shift_amount(shift_amount),
        .shift_left(shift_left),
        .shifted_data(shifted_data)
    );

    // Instantiate the priority mux
    mux_2to1_priority pmux (
        .A(shifted_data),
        .B(data),
        .P(P),
        .Y(result)
    );

endmodule

module barrel_shifter_4bit (
    input [3:0] data,
    input [1:0] shift_amount,
    input shift_left,
    output [3:0] shifted_data
);

    reg [3:0] temp;

    always @(*) begin
        case (shift_amount)
            2'b00: temp = data;
            2'b01: temp = shift_left ? {data[2:0], data[3]} : {data[0], data[3:1]};
            2'b10: temp = shift_left ? {data[1:0], data[3:2]} : {data[1:0], data[3:2]};
            2'b11: temp = shift_left ? {data[0], data[3:1]} : {data[2:0], data[3]};
        endcase
    end

    assign shifted_data = temp;

endmodule

module mux_2to1_priority (
    input [3:0] A,
    input [3:0] B,
    input P,
    output [3:0] Y
);

    assign Y = P ? B : A;

endmodule