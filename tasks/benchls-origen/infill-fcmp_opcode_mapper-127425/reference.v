module origen_127425 (
    input [31:0] din0,
    input [31:0] din1,
    input [4:0] opcode,
    output dout
);

    // Internal signals
    reg [31:0] din0_clean, din1_clean;
    reg [7:0] fpv6_opcode;
    wire comparison_result;

    // Clean input values (convert 'x' to '0')
    always @(*) begin
        din0_clean = (din0 === 32'bx) ? 32'b0 : din0;
        din1_clean = (din1 === 32'bx) ? 32'b0 : din1;
    end

    // Map AutoESL opcodes to FPV6 opcodes
    always @(*) begin
        case (opcode)
            5'b00001: fpv6_opcode = 8'b00010100; // AP_OEQ -> OP_EQ
            5'b00010: fpv6_opcode = 8'b00100100; // AP_OGT -> OP_GT
            5'b00011: fpv6_opcode = 8'b00110100; // AP_OGE -> OP_GE
            5'b00100: fpv6_opcode = 8'b00001100; // AP_OLT -> OP_LT
            5'b00101: fpv6_opcode = 8'b00011100; // AP_OLE -> OP_LE
            5'b00110: fpv6_opcode = 8'b00101100; // AP_ONE -> OP_NE
            5'b01000: fpv6_opcode = 8'b00000100; // AP_UNO -> OP_UO
            default:  fpv6_opcode = 8'b00000000; // Invalid opcode
        endcase
    end

    // Instantiate the feedforward comparison module
    feedforward_ap_fcmp_0_no_dsp_32 comparator (
        .din0(din0_clean),
        .din1(din1_clean),
        .opcode(fpv6_opcode),
        .dout(comparison_result)
    );

    // Assign the comparison result to the output
    assign dout = comparison_result;

endmodule

// Placeholder module for feedforward_ap_fcmp_0_no_dsp_32
module feedforward_ap_fcmp_0_no_dsp_32 (
    input [31:0] din0,
    input [31:0] din1,
    input [7:0] opcode,
    output dout
);
    // Placeholder implementation
    assign dout = 1'b0;
endmodule