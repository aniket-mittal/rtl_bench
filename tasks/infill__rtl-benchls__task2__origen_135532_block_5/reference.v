module origen_135532 (
    input [15:0] A,
    input [15:0] B,
    input [3:0] CTRL,
    output reg [15:0] Result,
    output reg Overflow
);

wire [15:0] adder_out, shifter_out;
wire adder_overflow;
reg [15:0] adder_in_a, adder_in_b;
reg adder_cin;
reg [3:0] shift_amount;
reg [1:0] shift_type;

// Ripple Carry Adder
ripple_carry_adder rca (
    .A(adder_in_a),
    .B(adder_in_b),
    .Cin(adder_cin),
    .Sum(adder_out),
    .Cout(adder_overflow)
);

// Barrel Shifter
barrel_shifter bs (
    .Data(A),
    .ShiftAmount(shift_amount),
    .ShiftType(shift_type),
    .Result(shifter_out)
);

always @(*) begin
    case (CTRL)
        4'b0000: begin // Addition
            adder_in_a = A;
            adder_in_b = B;
            adder_cin = 1'b0;
            Result = adder_out;
            Overflow = adder_overflow;
        end
        4'b0001: begin // Subtraction
            adder_in_a = A;
            adder_in_b = ~B;
            adder_cin = 1'b1;
            Result = adder_out;
            Overflow = adder_overflow;
        end
        4'b0010: begin // Left shift
            shift_amount = B[3:0];
            shift_type = 2'b00;
            Result = shifter_out;
            Overflow = 1'b0;
        end
        4'b0011: begin // Logical right shift
            shift_amount = B[3:0];
            shift_type = 2'b01;
            Result = shifter_out;
            Overflow = 1'b0;
        end
        4'b0100: begin // Arithmetic right shift
            shift_amount = B[3:0];
            shift_type = 2'b10;
            Result = shifter_out;
            Overflow = 1'b0;
        end
        4'b0101: begin // Rotate right
            shift_amount = B[3:0];
            shift_type = 2'b11;
            Result = shifter_out;
            Overflow = 1'b0;
        end
        default: begin
            Result = 16'b0;
            Overflow = 1'b0;
        end
    endcase
end

endmodule

module ripple_carry_adder (
    input [15:0] A,
    input [15:0] B,
    input Cin,
    output [15:0] Sum,
    output Cout
);

wire [16:0] carry;
assign carry[0] = Cin;

genvar i;
generate
    for (i = 0; i < 16; i = i + 1) begin : full_adder_gen
        full_adder fa (
            .A(A[i]),
            .B(B[i]),
            .Cin(carry[i]),
            .Sum(Sum[i]),
            .Cout(carry[i+1])
        );
    end
endgenerate

assign Cout = carry[16];

endmodule

module full_adder (
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);

assign Sum = A ^ B ^ Cin;
assign Cout = (A & B) | (Cin & (A ^ B));

endmodule

module barrel_shifter (
    input [15:0] Data,
    input [3:0] ShiftAmount,
    input [1:0] ShiftType,
    output reg [15:0] Result
);

always @(*) begin
    case (ShiftType)
        2'b00: Result = Data << ShiftAmount; // Left shift
        2'b01: Result = Data >> ShiftAmount; // Logical right shift
        2'b10: Result = $signed(Data) >>> ShiftAmount; // Arithmetic right shift
        2'b11: Result = (Data >> ShiftAmount) | (Data << (16 - ShiftAmount)); // Rotate right
    endcase
end

endmodule