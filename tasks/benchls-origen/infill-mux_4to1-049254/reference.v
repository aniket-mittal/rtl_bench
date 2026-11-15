// 4-to-1 Behavioral Multiplexer
module origen_049254(
    input in0, in1, in2, in3,
    input address0, address1,
    output reg out
);
    always @(*) begin
        case ({address1, address0})
            2'b00: out = in0;
            2'b01: out = in1;
            2'b10: out = in2;
            2'b11: out = in3;
        endcase
    end
endmodule

// Custom gates with delays
module AND(input a, b, output y);
    assign #1 y = a & b;
endmodule

module OR(input a, b, output y);
    assign #1 y = a | b;
endmodule

module NOT(input a, output y);
    assign #1 y = ~a;
endmodule

// 4-to-1 Structural Multiplexer
module structuralMultiplexer(
    input in0, in1, in2, in3,
    input address0, address1,
    output out
);
    wire not_address0, not_address1;
    wire w1, w2, w3, w4;

    NOT not1(address0, not_address0);
    NOT not2(address1, not_address1);

    AND and1(in0, not_address1, w1);
    AND and2(w1, not_address0, w2);
    AND and3(in1, not_address1, w3);
    AND and4(w3, address0, w4);

    wire w5, w6, w7, w8;
    AND and5(in2, address1, w5);
    AND and6(w5, not_address0, w6);
    AND and7(in3, address1, w7);
    AND and8(w7, address0, w8);

    wire w9, w10;
    OR or1(w2, w4, w9);
    OR or2(w6, w8, w10);
    OR or3(w9, w10, out);
endmodule

// 2-to-1 Multiplexer
module twoBitMultiplexer(
    input in0, in1,
    input choice,
    output out
);
    assign out = choice ? in1 : in0;
endmodule

// 4-to-1 Multiplexer using 2-to-1 Multiplexers
module fourBitMultiplexer(
    input in0, in1, in2, in3,
    input address0, address1,
    output out
);
    wire w1, w2;

    twoBitMultiplexer mux1(in0, in1, address0, w1);
    twoBitMultiplexer mux2(in2, in3, address0, w2);
    twoBitMultiplexer mux3(w1, w2, address1, out);
endmodule

// 32-bit 7-to-1 ALU Multiplexer
module ALUmultiplexer(
    input [31:0] addsub, resXOR, resSLT, resAND, resNAND, resOR, resNOR,
    input [2:0] muxindex,
    output [31:0] out
);
    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : mux_gen
            wire [1:0] temp;
            fourBitMultiplexer mux1(
                addsub[i], resXOR[i], resSLT[i], resAND[i],
                muxindex[0], muxindex[1],
                temp[0]
            );
            fourBitMultiplexer mux2(
                resNAND[i], resOR[i], resNOR[i], 1'b0,
                muxindex[0], muxindex[1],
                temp[1]
            );
            twoBitMultiplexer mux3(
                temp[0], temp[1],
                muxindex[2],
                out[i]
            );
        end
    endgenerate
endmodule