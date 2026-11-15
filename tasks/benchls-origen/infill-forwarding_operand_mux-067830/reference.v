module origen_067830 #(
    parameter WIDTH = 32
)(
    input wire [WIDTH-1:0] i_Data_From_MEM,
    input wire [WIDTH-1:0] i_Data_From_WB,
    input wire [WIDTH-1:0] i_Data_From_vWB,
    input wire [WIDTH-1:0] i_Rs1,
    input wire [WIDTH-1:0] i_Rs2,
    input wire [WIDTH-1:0] i_Immediate,
    input wire [WIDTH-1:0] i_PC,
    input wire [1:0] i_Fwrd_Ctrl1,
    input wire [1:0] i_Fwrd_Ctrl2,
    input wire [1:0] i_ALU_src1_Ctrl,
    input wire i_ALU_src2_Ctrl,
    output reg [WIDTH-1:0] o_Op1,
    output reg [WIDTH-1:0] o_Op2,
    output reg [WIDTH-1:0] o_Store_Data
);

    reg [WIDTH-1:0] r_Alu_Src1;
    reg [WIDTH-1:0] r_Alu_Src2;

    always @(*) begin
        // Data Forwarding for ALU Source 1
        case (i_Fwrd_Ctrl1)
            2'b00: r_Alu_Src1 = i_Rs1;
            2'b01: r_Alu_Src1 = i_Data_From_MEM;
            2'b10: r_Alu_Src1 = i_Data_From_WB;
            2'b11: r_Alu_Src1 = i_Data_From_vWB;
        endcase

        // Data Forwarding for ALU Source 2
        case (i_Fwrd_Ctrl2)
            2'b00: r_Alu_Src2 = i_Rs2;
            2'b01: r_Alu_Src2 = i_Data_From_MEM;
            2'b10: r_Alu_Src2 = i_Data_From_WB;
            2'b11: r_Alu_Src2 = i_Data_From_vWB;
        endcase

        // ALU Operand 1 Selection
        case (i_ALU_src1_Ctrl)
            2'b00: o_Op1 = r_Alu_Src1;
            2'b01: o_Op1 = i_PC;
            2'b10: o_Op1 = {WIDTH{1'b0}}; // Zero
            default: o_Op1 = r_Alu_Src1;
        endcase

        // ALU Operand 2 Selection
        o_Op2 = i_ALU_src2_Ctrl ? i_Immediate : r_Alu_Src2;

        // Store Data Selection
        o_Store_Data = r_Alu_Src2;
    end

endmodule