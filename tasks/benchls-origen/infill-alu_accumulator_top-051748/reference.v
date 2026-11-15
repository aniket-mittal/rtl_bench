module origen_051748(
    input [9:0] SW,
    input [3:0] KEY,
    output [7:0] LEDR,
    output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5
);

    wire [7:0] alu_out;
    reg [7:0] reg_out;
    wire [2:0] alu_ctrl;
    
    assign alu_ctrl = ~KEY[3:1];

    // ALU
    alu alu_inst(
        .A(SW[3:0]),
        .B(reg_out),
        .ctrl(alu_ctrl),
        .out(alu_out)
    );

    // Register
    always @(posedge ~KEY[0] or posedge SW[9]) begin
        if (SW[9])
            reg_out <= 8'b0;
        else
            reg_out <= alu_out;
    end

    // Output assignments
    assign LEDR = reg_out;

    // Seven-segment displays
    seg7 hex0_inst(.in(SW[3:0]), .out(HEX0));
    seg7 hex1_inst(.in(4'b0), .out(HEX1));
    seg7 hex2_inst(.in(4'b0), .out(HEX2));
    seg7 hex3_inst(.in(4'b0), .out(HEX3));
    seg7 hex4_inst(.in(reg_out[3:0]), .out(HEX4));
    seg7 hex5_inst(.in(reg_out[7:4]), .out(HEX5));

endmodule

module alu(
    input [3:0] A,
    input [7:0] B,
    input [2:0] ctrl,
    output reg [7:0] out
);

    wire [4:0] add_result;
    
    four_bit_adder adder(.A(A), .B(B[3:0]), .Cin(1'b0), .Sum(add_result[3:0]), .Cout(add_result[4]));

    always @(*) begin
        case(ctrl)
            3'b000: out = {3'b0, add_result};
            3'b001: out = A + B;
            3'b010: out = A & B[3:0];
            3'b011: out = (A > B[3:0]) ? 8'd1 : 8'd0;
            3'b100: out = (A == B[3:0]) ? 8'd1 : 8'd0;
            3'b101: out = {A, B[3:0]};
            3'b110: out = B;
            default: out = 8'b0;
        endcase
    end

endmodule

module four_bit_adder(
    input [3:0] A, B,
    input Cin,
    output [3:0] Sum,
    output Cout
);

    wire [3:0] C;

    full_adder fa0(.A(A[0]), .B(B[0]), .Cin(Cin), .Sum(Sum[0]), .Cout(C[0]));
    full_adder fa1(.A(A[1]), .B(B[1]), .Cin(C[0]), .Sum(Sum[1]), .Cout(C[1]));
    full_adder fa2(.A(A[2]), .B(B[2]), .Cin(C[1]), .Sum(Sum[2]), .Cout(C[2]));
    full_adder fa3(.A(A[3]), .B(B[3]), .Cin(C[2]), .Sum(Sum[3]), .Cout(Cout));

endmodule

module full_adder(
    input A, B, Cin,
    output Sum, Cout
);

    assign Sum = A ^ B ^ Cin;
    assign Cout = (A & B) | (Cin & (A ^ B));

endmodule

module seg7(
    input [3:0] in,
    output reg [6:0] out
);

    always @(*) begin
        case(in)
            4'h0: out = 7'b1000000;
            4'h1: out = 7'b1111001;
            4'h2: out = 7'b0100100;
            4'h3: out = 7'b0110000;
            4'h4: out = 7'b0011001;
            4'h5: out = 7'b0010010;
            4'h6: out = 7'b0000010;
            4'h7: out = 7'b1111000;
            4'h8: out = 7'b0000000;
            4'h9: out = 7'b0010000;
            4'ha: out = 7'b0001000;
            4'hb: out = 7'b0000011;
            4'hc: out = 7'b1000110;
            4'hd: out = 7'b0100001;
            4'he: out = 7'b0000110;
            4'hf: out = 7'b0001110;
        endcase
    end

endmodule