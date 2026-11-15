module origen_052060 (
    input wire RegWrite_EX_MEM, RegWrite_MEM_WB, RegWrite_ID_EX,
    input wire [4:0] RS_ID_EX, RT_ID_EX, RS_IF_ID,
    input wire [4:0] RegRd_MEM_WB,
    input wire [1:0] PCSrc,
    input wire ID_EX_RegDst, MEM_WB_RegDst, EX_MEM_RegDst,
    input wire [31:0] instruction_ID_EX, instruction_EX_MEM, instruction_MEM_WB,
    output reg [1:0] ForwardA, ForwardB, ForwardJR
);

    wire [4:0] AddrC_EX_MEM, AddrC_MEM_WB, AddrC_ID_EX;

    // Determine AddrC for different pipeline stages
    assign AddrC_EX_MEM = EX_MEM_RegDst ? instruction_EX_MEM[15:11] : instruction_EX_MEM[20:16];
    assign AddrC_MEM_WB = MEM_WB_RegDst ? instruction_MEM_WB[15:11] : instruction_MEM_WB[20:16];
    assign AddrC_ID_EX = ID_EX_RegDst ? instruction_ID_EX[15:11] : instruction_ID_EX[20:16];

    // ForwardA logic
    always @(*) begin
        if (RegWrite_EX_MEM && (AddrC_EX_MEM != 0) && (AddrC_EX_MEM == RS_ID_EX))
            ForwardA = 2'b10;
        else if (RegWrite_MEM_WB && (AddrC_MEM_WB != 0) && (AddrC_MEM_WB == RS_ID_EX))
            ForwardA = 2'b01;
        else
            ForwardA = 2'b00;
    end

    // ForwardB logic
    always @(*) begin
        if (RegWrite_EX_MEM && (AddrC_EX_MEM != 0) && (AddrC_EX_MEM == RT_ID_EX))
            ForwardB = 2'b10;
        else if (RegWrite_MEM_WB && (AddrC_MEM_WB != 0) && (AddrC_MEM_WB == RT_ID_EX))
            ForwardB = 2'b01;
        else
            ForwardB = 2'b00;
    end

    // ForwardJR logic
    always @(*) begin
        if (PCSrc == 2'b11) begin
            if (RegWrite_ID_EX && (AddrC_ID_EX != 0) && (AddrC_ID_EX == RS_IF_ID))
                ForwardJR = 2'b11;
            else if (RegWrite_EX_MEM && (AddrC_EX_MEM != 0) && (AddrC_EX_MEM == RS_IF_ID))
                ForwardJR = 2'b10;
            else if (RegWrite_MEM_WB && (AddrC_MEM_WB != 0) && (AddrC_MEM_WB == RS_IF_ID))
                ForwardJR = 2'b01;
            else
                ForwardJR = 2'b00;
        end
        else
            ForwardJR = 2'b00;
    end

endmodule