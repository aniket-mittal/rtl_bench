module origen_091109(
    input [63:0] dataA, dataB,
    input [4:0] fs,
    input c0,
    output [63:0] out,
    output [3:0] status
);

    wire [63:0] inA, inB;
    wire [63:0] and_result, or_result, xor_result, add_result, lsl_result, lsr_result;
    wire carry_out, overflow;

    // Input preprocessing
    assign inA = fs[1] ? ~dataA : dataA;
    assign inB = fs[0] ? ~dataB : dataB;

    // ALU operations
    assign and_result = inA & inB;
    assign or_result = inA | inB;
    assign xor_result = inA ^ inB;

    adder adder_inst(
        .a(inA),
        .b(inB),
        .cin(c0),
        .sum(add_result),
        .cout(carry_out)
    );

    shifter shifter_inst(
        .data(dataA),
        .shamt(dataB[5:0]),
        .left(fs[2]),
        .lsl_out(lsl_result),
        .lsr_out(lsr_result)
    );

    // Function selection
    mux8_1 mux_inst(
        .in0(and_result),
        .in1(or_result),
        .in2(add_result),
        .in3(xor_result),
        .in4(lsl_result),
        .in5(lsr_result),
        .in6(64'b0),
        .in7(64'b0),
        .sel(fs[4:2]),
        .out(out)
    );

    // Status flags
    assign status[0] = (out == 64'b0);  // Z flag
    assign status[1] = out[63];         // N flag
    assign status[2] = carry_out;       // C flag
    assign status[3] = (inA[63] == inB[63]) && (inA[63] != add_result[63]);  // V flag

endmodule

module adder(
    input [63:0] a, b,
    input cin,
    output [63:0] sum,
    output cout
);
    assign {cout, sum} = a + b + cin;
endmodule

module shifter(
    input [63:0] data,
    input [5:0] shamt,
    input left,
    output [63:0] lsl_out,
    output [63:0] lsr_out
);
    assign lsl_out = data << shamt;
    assign lsr_out = data >> shamt;
endmodule

module mux8_1(
    input [63:0] in0, in1, in2, in3, in4, in5, in6, in7,
    input [2:0] sel,
    output reg [63:0] out
);
    always @(*) begin
        case(sel)
            3'b000: out = in0;
            3'b001: out = in1;
            3'b010: out = in2;
            3'b011: out = in3;
            3'b100: out = in4;
            3'b101: out = in5;
            3'b110: out = in6;
            3'b111: out = in7;
        endcase
    end
endmodule