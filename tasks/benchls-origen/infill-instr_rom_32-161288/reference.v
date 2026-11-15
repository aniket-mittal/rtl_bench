module origen_161288(
    input [4:0] a,
    input [31:0] d,
    input we,
    input clk,
    output reg [31:0] spo
);

    reg [31:0] ins_reg [0:31];

    initial begin
        ins_reg[0] = 32'h00000093; // addi x1, x0, 0
        ins_reg[1] = 32'h00100113; // addi x2, x0, 1
        ins_reg[2] = 32'h00200193; // addi x3, x0, 2
        ins_reg[3] = 32'h00300213; // addi x4, x0, 3
        ins_reg[4] = 32'h00400293; // addi x5, x0, 4
        ins_reg[5] = 32'h00500313; // addi x6, x0, 5
        ins_reg[6] = 32'h00600393; // addi x7, x0, 6
        ins_reg[7] = 32'h00700413; // addi x8, x0, 7
        ins_reg[8] = 32'h00800493; // addi x9, x0, 8
        ins_reg[9] = 32'h00900513; // addi x10, x0, 9
        ins_reg[10] = 32'h00a00593; // addi x11, x0, 10
        ins_reg[11] = 32'h00b00613; // addi x12, x0, 11
        ins_reg[12] = 32'h00000000; // 0
        ins_reg[13] = 32'h00000000; // 0
        ins_reg[14] = 32'h00000000; // 0
        ins_reg[15] = 32'h00000000; // 0
        ins_reg[16] = 32'h00000000; // 0
        ins_reg[17] = 32'h00000000; // 0
        ins_reg[18] = 32'h00000000; // 0
        ins_reg[19] = 32'h00000000; // 0
        ins_reg[20] = 32'h00000000; // 0
        ins_reg[21] = 32'h00000000; // 0
        ins_reg[22] = 32'h00000000; // 0
        ins_reg[23] = 32'h00000000; // 0
        ins_reg[24] = 32'h00000000; // 0
        ins_reg[25] = 32'h00000000; // 0
        ins_reg[26] = 32'h00000000; // 0
        ins_reg[27] = 32'h00000000; // 0
        ins_reg[28] = 32'h00000000; // 0
        ins_reg[29] = 32'h00000000; // 0
        ins_reg[30] = 32'h00000000; // 0
        ins_reg[31] = 32'h00000000; // 0
    end

    assign spo = ins_reg[a];

    always @(posedge clk) begin
        if (we == 1'b0) begin
            ins_reg[a] <= d;
        end
    end

endmodule