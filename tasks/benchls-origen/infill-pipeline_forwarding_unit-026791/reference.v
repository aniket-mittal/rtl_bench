module origen_026791 (
    input [4:0] EX_Rs, EX_Rt, MEM_Rt, MEM_WriteReg, WB_WriteReg,
    input MEM_RegWrite, WB_RegWrite, ALUSrcSelect, ShiftSelect,
    input [5:0] MEM_OPCode, EX_OPCode,
    output reg [1:0] EX_ALUSrc, EX_Shift,
    output reg MEM_WriteData, EX_WriteData
);

    // Opcodes for store instructions
    localparam SW = 6'b101011;
    localparam SH = 6'b101001;
    localparam SB = 6'b101000;

    always @(*) begin
        // Default values
        EX_ALUSrc = 2'b00;
        EX_Shift = 2'b00;
        MEM_WriteData = 1'b0;
        EX_WriteData = 1'b0;

        // Forwarding for EX_Rs
        if (MEM_RegWrite && (MEM_WriteReg != 0) && (MEM_WriteReg == EX_Rs))
            EX_ALUSrc[0] = 1'b1;
        else if (WB_RegWrite && (WB_WriteReg != 0) && (WB_WriteReg == EX_Rs))
            EX_ALUSrc[0] = 1'b1;

        // Forwarding for EX_Rt
        if (!ALUSrcSelect) begin
            if (MEM_RegWrite && (MEM_WriteReg != 0) && (MEM_WriteReg == EX_Rt))
                EX_ALUSrc[1] = 1'b1;
            else if (WB_RegWrite && (WB_WriteReg != 0) && (WB_WriteReg == EX_Rt))
                EX_ALUSrc[1] = 1'b1;
        end

        // Forwarding for shift amount
        if (ShiftSelect) begin
            if (MEM_RegWrite && (MEM_WriteReg != 0) && (MEM_WriteReg == EX_Rs))
                EX_Shift = 2'b10;
            else if (WB_RegWrite && (WB_WriteReg != 0) && (WB_WriteReg == EX_Rs))
                EX_Shift = 2'b01;
        end

        // Forwarding for store instructions
        if (MEM_OPCode == SW || MEM_OPCode == SH || MEM_OPCode == SB) begin
            if (WB_RegWrite && (WB_WriteReg != 0) && (WB_WriteReg == MEM_Rt))
                MEM_WriteData = 1'b1;
        end

        if (EX_OPCode == SW || EX_OPCode == SH || EX_OPCode == SB) begin
            if (WB_RegWrite && (WB_WriteReg != 0) && (WB_WriteReg == EX_Rt))
                EX_WriteData = 1'b1;
        end
    end

endmodule