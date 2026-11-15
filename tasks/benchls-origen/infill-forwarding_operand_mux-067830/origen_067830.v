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

    [MASKED]

endmodule