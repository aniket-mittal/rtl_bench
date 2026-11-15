module origen_052354(
    input A, B, Bin,
    output D, Bout
);
    assign D = A ^ B ^ Bin;
    assign Bout = (~A & B) | (~A & Bin) | (B & Bin);
endmodule

module sub4_Bit(
    input [3:0] A, B,
    input Bin,
    output [3:0] D,
    output Bout
);
    wire [3:1] B_int;
    
    sub1_Bit sub0(.A(A[0]), .B(B[0]), .Bin(Bin), .D(D[0]), .Bout(B_int[1]));
    sub1_Bit sub1(.A(A[1]), .B(B[1]), .Bin(B_int[1]), .D(D[1]), .Bout(B_int[2]));
    sub1_Bit sub2(.A(A[2]), .B(B[2]), .Bin(B_int[2]), .D(D[2]), .Bout(B_int[3]));
    sub1_Bit sub3(.A(A[3]), .B(B[3]), .Bin(B_int[3]), .D(D[3]), .Bout(Bout));
endmodule

module add4_Bit(
    input [3:0] A, B,
    input Cin,
    output [3:0] S,
    output Cout
);
    assign {Cout, S} = A + B + Cin;
endmodule

module or4_Bit(
    input [3:0] A, B,
    output [3:0] out
);
    assign out = A | B;
endmodule

module and4_Bit(
    input [3:0] A, B,
    output [3:0] out
);
    assign out = A & B;
endmodule

module shl4_Bit(
    input [3:0] A,
    output [3:0] out
);
    assign out = {A[2:0], 1'b0};
endmodule

module shr4_Bit(
    input [3:0] A,
    output [3:0] out
);
    assign out = {1'b0, A[3:1]};
endmodule

module rol4_Bit(
    input [3:0] A,
    output [3:0] out
);
    assign out = {A[2:0], A[3]};
endmodule

module ror4_Bit(
    input [3:0] A,
    output [3:0] out
);
    assign out = {A[0], A[3:1]};
endmodule

module alu4_Bit(
    input [3:0] A, B,
    input Cin,
    input [2:0] ctrl,
    output reg [3:0] out,
    output reg Cout
);
    wire [3:0] add_out, sub_out, or_out, and_out, shl_out, shr_out, rol_out, ror_out;
    wire add_cout, sub_cout;

    add4_Bit add_op(.A(A), .B(B), .Cin(Cin), .S(add_out), .Cout(add_cout));
    sub4_Bit sub_op(.A(A), .B(B), .Bin(Cin), .D(sub_out), .Bout(sub_cout));
    or4_Bit or_op(.A(A), .B(B), .out(or_out));
    and4_Bit and_op(.A(A), .B(B), .out(and_out));
    shl4_Bit shl_op(.A(A), .out(shl_out));
    shr4_Bit shr_op(.A(A), .out(shr_out));
    rol4_Bit rol_op(.A(A), .out(rol_out));
    ror4_Bit ror_op(.A(A), .out(ror_out));

    always @(*) begin
        #1;
        case(ctrl)
            3'b000: begin out = add_out; Cout = add_cout; end
            3'b001: begin out = sub_out; Cout = sub_cout; end
            3'b010: begin out = or_out; Cout = 1'b0; end
            3'b011: begin out = and_out; Cout = 1'b0; end
            3'b100: begin out = shl_out; Cout = 1'b0; end
            3'b101: begin out = shr_out; Cout = 1'b0; end
            3'b110: begin out = rol_out; Cout = 1'b0; end
            3'b111: begin out = ror_out; Cout = 1'b0; end
            default: begin out = 4'b0000; Cout = 1'b0; end
        endcase
    end
endmodule