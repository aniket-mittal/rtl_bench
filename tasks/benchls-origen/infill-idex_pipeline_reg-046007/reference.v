module origen_046007 (
    input wire clk, rst, Flush, Freeze,
    input wire [4:0] Dest_in,
    input wire [31:0] Val1_in, Val2_in, Reg2_in, PC_in,
    input wire [3:0] EXE_CMD_in,
    input wire MEM_R_EN_in, MEM_W_EN_in, WB_EN_in,
    input wire [1:0] Branch_Type_in,
    input wire is_imm_in,
    input wire [4:0] src1_in, src2_in,

    output reg [4:0] Dest,
    output reg [31:0] Val1, Val2, Reg2, PC,
    output reg [3:0] EXE_CMD,
    output reg MEM_R_EN, MEM_W_EN, WB_EN,
    output reg [1:0] Branch_Type,
    output reg is_imm,
    output reg [4:0] src1, src2
);

    always @(posedge clk) begin
        if (rst || Flush) begin
            Dest <= 5'b0;
            Val1 <= 32'b0;
            Val2 <= 32'b0;
            Reg2 <= 32'b0;
            PC <= 32'b0;
            EXE_CMD <= 4'b0;
            MEM_R_EN <= 1'b0;
            MEM_W_EN <= 1'b0;
            WB_EN <= 1'b0;
            Branch_Type <= 2'b0;
            is_imm <= 1'b0;
            src1 <= 5'b0;
            src2 <= 5'b0;
        end
        else if (!Freeze) begin
            Dest <= Dest_in;
            Val1 <= Val1_in;
            Val2 <= Val2_in;
            Reg2 <= Reg2_in;
            PC <= PC_in;
            EXE_CMD <= EXE_CMD_in;
            MEM_R_EN <= MEM_R_EN_in;
            MEM_W_EN <= MEM_W_EN_in;
            WB_EN <= WB_EN_in;
            Branch_Type <= Branch_Type_in;
            is_imm <= is_imm_in;
            src1 <= src1_in;
            src2 <= src2_in;
        end
    end

endmodule