module origen_136848(
    input [15:0] A,
    input [15:0] B,
    input Cin,
    input [3:0] data,
    input [1:0] shift,
    output [3:0] final_output
);

    wire [15:0] sum;
    wire Cout;
    wire [3:0] shifted_data;

    // Ripple Carry Adder
    ripple_carry_adder rca(
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(sum),
        .Cout(Cout)
    );

    // Barrel Shifter
    barrel_shifter bs(
        .data(data),
        .shift(shift),
        .result(shifted_data)
    );

    // Functional Module
    functional_module fm(
        .adder_msb(sum[15]),
        .shifted_data(shifted_data),
        .result(final_output)
    );

endmodule

module ripple_carry_adder(
    input [15:0] A,
    input [15:0] B,
    input Cin,
    output [15:0] S,
    output Cout
);
    wire [16:0] C;
    assign C[0] = Cin;

    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : fa_loop
            full_adder fa(
                .A(A[i]),
                .B(B[i]),
                .Cin(C[i]),
                .S(S[i]),
                .Cout(C[i+1])
            );
        end
    endgenerate

    assign Cout = C[16];
endmodule

module full_adder(
    input A,
    input B,
    input Cin,
    output S,
    output Cout
);
    assign S = A ^ B ^ Cin;
    assign Cout = (A & B) | (Cin & (A ^ B));
endmodule

module barrel_shifter(
    input [3:0] data,
    input [1:0] shift,
    output reg [3:0] result
);
    always @(*) begin
        case(shift)
            2'b00: result = data;
            2'b01: result = {data[0], data[3:1]};
            2'b10: result = {data[1:0], data[3:2]};
            2'b11: result = {data[2:0], data[3]};
        endcase
    end
endmodule

module functional_module(
    input adder_msb,
    input [3:0] shifted_data,
    output reg [3:0] result
);
    always @(*) begin
        if (adder_msb) begin
            result = ~shifted_data + 1'b1; // 2's complement
        end else begin
            result = shifted_data + {3'b000, adder_msb};
        end
    end
endmodule