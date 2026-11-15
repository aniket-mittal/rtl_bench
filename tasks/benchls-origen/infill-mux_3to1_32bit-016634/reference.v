module origen_016634 (
    input [31:0] A, B, C,
    input [1:0] sel,
    output reg [31:0] out
);
    always @(*) begin
        case (sel)
            2'b00: out = A;
            2'b01: out = B;
            2'b10, 2'b11: out = C;
        endcase
    end
endmodule

module mux_2_5bit (
    input [4:0] A, B,
    input sel,
    output [4:0] out
);
    assign out = sel ? B : A;
endmodule

module mux2to1 (
    input in1, in2, sel,
    output out
);
    wire sel_not, and1, and2;
    
    not (sel_not, sel);
    and (and1, in1, sel_not);
    and (and2, in2, sel);
    or (out, and1, and2);
endmodule

module mux2_32bit (
    input [31:0] b32in1, b32in2,
    input b32sel,
    output [31:0] b32out
);
    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : mux_gen
            mux2to1 mux_inst (
                .in1(b32in1[i]),
                .in2(b32in2[i]),
                .sel(b32sel),
                .out(b32out[i])
            );
        end
    endgenerate
endmodule