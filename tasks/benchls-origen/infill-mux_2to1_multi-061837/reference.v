// 2-to-1 Multiplexer (5-bit)
module origen_061837(
    input [4:0] a1, a2,
    input s,
    output reg [4:0] res
);
    reg [4:0] A;
    always @(*) begin
        case(s)
            1'b0: A = a1;
            1'b1: A = a2;
        endcase
        res = A;
    end
endmodule

// 2-to-1 Multiplexer (4-bit)
module Mux_2_1_4(
    input [3:0] a1, a2,
    input s,
    output reg [3:0] res
);
    reg [3:0] A;
    always @(*) begin
        case(s)
            1'b0: A = a1;
            1'b1: A = a2;
        endcase
        res = A;
    end
endmodule

// 2-to-1 Multiplexer (32-bit)
module Mux_2_1_32(
    input [31:0] a1, a2,
    input s,
    output reg [31:0] res
);
    reg [31:0] A;
    always @(*) begin
        case(s)
            1'b0: A = a1;
            1'b1: A = a2;
        endcase
        res = A;
    end
endmodule

// 2-to-1 Multiplexer (64-bit)
module Mux_2_1_64(
    input [63:0] a1, a2,
    input s,
    output reg [63:0] res
);
    reg [63:0] A;
    always @(*) begin
        case(s)
            1'b0: A = a1;
            1'b1: A = a2;
        endcase
        res = A;
    end
endmodule

// 2-to-1 Multiplexer (1-bit)
module Mux_2_1_1(
    input a1, a2,
    input s,
    output reg res
);
    reg A;
    always @(*) begin
        case(s)
            1'b0: A = a1;
            1'b1: A = a2;
        endcase
        res = A;
    end
endmodule

// 3-to-1 Multiplexer (5-bit)
module Mux_3_1_5(
    input [4:0] a1, a2, a3,
    input [1:0] s,
    output reg [4:0] res
);
    reg [4:0] A;
    always @(*) begin
        case(s)
            2'b00: A = a1;
            2'b01: A = a2;
            2'b10: A = a3;
            default: A = 5'b0;
        endcase
        res = A;
    end
endmodule

// 4-to-1 Multiplexer (5-bit)
module Mux_4_1_5(
    input [4:0] a1, a2, a3, a4,
    input [1:0] s,
    output reg [4:0] res
);
    reg [4:0] A;
    always @(*) begin
        case(s)
            2'b00: A = a1;
            2'b01: A = a2;
            2'b10: A = a3;
            2'b11: A = a4;
        endcase
        res = A;
    end
endmodule