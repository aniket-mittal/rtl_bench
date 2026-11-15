module origen_059285(
    input [3:0] x,
    output [7:0] y
);
    assign y = {x[0], x[3], x[2], x[1], x[2], x[1], x[0], x[3]};
endmodule

module xor_module(
    input [7:0] a,
    input [7:0] b,
    output [7:0] y
);
    assign y = a ^ b;
endmodule

module substitution0(
    input [3:0] x,
    output reg [1:0] y
);
    always @(*) begin
        case(x)
            4'b0000: y = 2'b00;
            4'b0001: y = 2'b01;
            4'b0010: y = 2'b10;
            4'b0011: y = 2'b11;
            4'b0100: y = 2'b11;
            4'b0101: y = 2'b10;
            4'b0110: y = 2'b01;
            4'b0111: y = 2'b00;
            4'b1000: y = 2'b01;
            4'b1001: y = 2'b00;
            4'b1010: y = 2'b11;
            4'b1011: y = 2'b10;
            4'b1100: y = 2'b10;
            4'b1101: y = 2'b11;
            4'b1110: y = 2'b00;
            4'b1111: y = 2'b01;
        endcase
    end
endmodule

module substitution1(
    input [3:0] x,
    output reg [1:0] y
);
    always @(*) begin
        case(x)
            4'b0000: y = 2'b11;
            4'b0001: y = 2'b00;
            4'b0010: y = 2'b01;
            4'b0011: y = 2'b10;
            4'b0100: y = 2'b01;
            4'b0101: y = 2'b10;
            4'b0110: y = 2'b11;
            4'b0111: y = 2'b00;
            4'b1000: y = 2'b00;
            4'b1001: y = 2'b11;
            4'b1010: y = 2'b10;
            4'b1011: y = 2'b01;
            4'b1100: y = 2'b10;
            4'b1101: y = 2'b01;
            4'b1110: y = 2'b00;
            4'b1111: y = 2'b11;
        endcase
    end
endmodule

module permutation(
    input [3:0] x,
    output [3:0] y
);
    assign y = {x[1], x[3], x[2], x[0]};
endmodule

module f_function(
    input [3:0] x,
    input [7:0] key,
    output [3:0] y
);
    wire [7:0] expanded, xored;
    wire [1:0] sub0_out, sub1_out;
    wire [3:0] combined;

    expansion exp(.x(x), .y(expanded));
    xor_module xor_mod(.a(expanded), .b(key), .y(xored));
    substitution0 s0(.x(xored[7:4]), .y(sub0_out));
    substitution1 s1(.x(xored[3:0]), .y(sub1_out));
    assign combined = {sub0_out, sub1_out};
    permutation perm(.x(combined), .y(y));
endmodule

module top_module(
    input [3:0] left_half,
    input [3:0] right_half,
    input [7:0] key,
    output [3:0] new_right,
    output [3:0] new_left
);
    wire [3:0] f_out;

    f_function f(.x(right_half), .key(key), .y(f_out));
    assign new_right = left_half ^ f_out;
    assign new_left = right_half;
endmodule