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

    always @(*) begin
        case (OP)
            4'b0000: begin // NOP
                out = 16'b0;
                flgOut = FLGIN;
                shouldWriteBack = 1'b0;
            end
            4'b0001: begin // Addition
                out = add_result;
                flgOut = {5'b0, add_result[15], add_carry, (add_result == 16'b0)};
                shouldWriteBack = 1'b1;
            end
            4'b0010: begin // Addition with carry
                out = adc_result;
                flgOut = {5'b0, adc_result[15], adc_carry, (adc_result == 16'b0)};
                shouldWriteBack = 1'b1;
            end
            4'b0011: begin // Subtraction
                out = sub_result;
                flgOut = {5'b0, sub_result[15], sub_borrow, (sub_result == 16'b0)};
                shouldWriteBack = 1'b1;
            end
            4'b0100: begin // Subtraction with borrow
                out = sbb_result;
                flgOut = {5'b0, sbb_result[15], sbb_borrow, (sbb_result == 16'b0)};
                shouldWriteBack = 1'b1;
            end
            4'b0101: begin // Logical left shift
                out = lsl_result;
                flgOut = {5'b0, lsl_result[15], 1'b0, (lsl_result == 16'b0)};
                shouldWriteBack = 1'b1;
            end
            4'b0110: begin // Logical right shift
                out = lsr_result;
                flgOut = {5'b0, lsr_result[15], 1'b0, (lsr_result == 16'b0)};
                shouldWriteBack = 1'b1;
            end
            4'b0111: begin // Bitwise AND
                out = and_result;
                flgOut = {5'b0, and_result[15], 1'b0, (and_result == 16'b0)};
                shouldWriteBack = 1'b1;
            end
            4'b1000: begin // Bitwise OR
                out = or_result;
                flgOut = {5'b0, or_result[15], 1'b0, (or_result == 16'b0)};
                shouldWriteBack = 1'b1;
            end
            4'b1001: begin // Bitwise NOT
                out = not_result;
                flgOut = {5'b0, not_result[15], 1'b0, (not_result == 16'b0)};
                shouldWriteBack = 1'b1;
            end
            4'b1010: begin // Bitwise XOR
                out = xor_result;
                flgOut = {5'b0, xor_result[15], 1'b0, (xor_result == 16'b0)};
                shouldWriteBack = 1'b1;
            end
            default: begin // NOP for unused OP values
                out = 16'b0;
                flgOut = FLGIN;
                shouldWriteBack = 1'b0;
            end
        endcase
    end

endmodule