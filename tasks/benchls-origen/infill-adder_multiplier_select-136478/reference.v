module origen_136478(
    input [3:0] A,
    input [3:0] B,
    input Select,
    output [31:0] Result
);

    wire [3:0] adder_result;
    wire [31:0] multiplier_result;
    wire [31:0] adder_extended;

    // 4-bit Ripple Carry Adder
    ripple_carry_adder rca (
        .A(A),
        .B(B),
        .Sum(adder_result),
        .Cout()
    );

    // 16-bit Booth's Algorithm Multiplier
    booths_multiplier bm (
        .A({{12{A[3]}}, A}),
        .B({{12{B[3]}}, B}),
        .Product(multiplier_result)
    );

    // Extend adder result to 32 bits
    assign adder_extended = {{28{adder_result[3]}}, adder_result};

    // Maximum finder
    max_finder mf (
        .A(adder_extended),
        .B(multiplier_result),
        .Max(Result)
    );

    // Mux to select between adder and multiplier results
    assign Result = Select ? multiplier_result : adder_extended;

endmodule

module ripple_carry_adder(
    input [3:0] A,
    input [3:0] B,
    output [3:0] Sum,
    output Cout
);
    wire [4:0] C;
    assign C[0] = 1'b0;

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : fa_loop
            full_adder fa (
                .A(A[i]),
                .B(B[i]),
                .Cin(C[i]),
                .Sum(Sum[i]),
                .Cout(C[i+1])
            );
        end
    endgenerate

    assign Cout = C[4];
endmodule

module full_adder(
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);
    assign Sum = A ^ B ^ Cin;
    assign Cout = (A & B) | (Cin & (A ^ B));
endmodule

module booths_multiplier(
    input signed [15:0] A,
    input signed [15:0] B,
    output reg signed [31:0] Product
);
    reg signed [31:0] A_ext, S_ext, P;
    integer i;

    always @(*) begin
        A_ext = {{16{A[15]}}, A};
        S_ext = -A_ext;
        P = {{16{B[15]}}, B};

        for (i = 0; i < 16; i = i + 1) begin
            case (P[1:0])
                2'b01: P = P + A_ext;
                2'b10: P = P + S_ext;
                default: P = P;
            endcase
            P = P >>> 1;
        end

        Product = P;
    end
endmodule

module max_finder(
    input signed [31:0] A,
    input signed [31:0] B,
    output reg [31:0] Max
);
    always @(*) begin
        if ($signed(A) > $signed(B))
            Max = A;
        else
            Max = B;
    end
endmodule