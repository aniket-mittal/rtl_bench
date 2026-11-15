module origen_000749 (
    input [3:0] OP,
    input [7:0] FLGIN,
    input [15:0] A,
    input [15:0] B,
    output reg [7:0] flgOut,
    output reg [15:0] out,
    output reg shouldWriteBack
);

    wire [15:0] add_result, adc_result, sub_result, sbb_result, lsl_result, lsr_result;
    wire [15:0] and_result, or_result, not_result, xor_result;
    wire add_carry, adc_carry, sub_borrow, sbb_borrow;

    assign {add_carry, add_result} = A + B;
    assign {adc_carry, adc_result} = A + B + FLGIN[0];
    assign {sub_borrow, sub_result} = A - B;
    assign {sbb_borrow, sbb_result} = A - B - FLGIN[0];
    assign lsl_result = A << B[3:0];
    assign lsr_result = A >> B[3:0];
    assign and_result = A & B;
    assign or_result = A | B;
    assign not_result = ~A;
    assign xor_result = A ^ B;

    [MASKED]

endmodule