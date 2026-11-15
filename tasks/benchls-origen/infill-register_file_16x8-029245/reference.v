module origen_029245 (
    input wire [3:0] R_Addr, W_Addr,
    input wire Clk, Rst, R_en, W_en,
    input wire [7:0] W_Data,
    output reg [7:0] R_Data,
    output wire [7:0] debug_Reg0, debug_Reg1, debug_Reg2, debug_Reg3,
    output wire [7:0] debug_Reg4, debug_Reg5, debug_Reg6, debug_Reg7,
    output wire [7:0] debug_Reg8, debug_Reg9, debug_Reg10, debug_Reg11,
    output wire [7:0] debug_Reg12, debug_Reg13, debug_Reg14, debug_Reg15
);

    reg [7:0] RegFile [0:15];

    // Debug outputs
    assign debug_Reg0 = RegFile[0];
    assign debug_Reg1 = RegFile[1];
    assign debug_Reg2 = RegFile[2];
    assign debug_Reg3 = RegFile[3];
    assign debug_Reg4 = RegFile[4];
    assign debug_Reg5 = RegFile[5];
    assign debug_Reg6 = RegFile[6];
    assign debug_Reg7 = RegFile[7];
    assign debug_Reg8 = RegFile[8];
    assign debug_Reg9 = RegFile[9];
    assign debug_Reg10 = RegFile[10];
    assign debug_Reg11 = RegFile[11];
    assign debug_Reg12 = RegFile[12];
    assign debug_Reg13 = RegFile[13];
    assign debug_Reg14 = RegFile[14];
    assign debug_Reg15 = RegFile[15];

    // Reset and Write operation
    always @(posedge Clk or posedge Rst) begin
        if (Rst) begin
            RegFile[0] <= 8'h00; RegFile[1] <= 8'h11; RegFile[2] <= 8'h22; RegFile[3] <= 8'h33;
            RegFile[4] <= 8'h44; RegFile[5] <= 8'h55; RegFile[6] <= 8'h66; RegFile[7] <= 8'h77;
            RegFile[8] <= 8'h88; RegFile[9] <= 8'h99; RegFile[10] <= 8'hAA; RegFile[11] <= 8'hBB;
            RegFile[12] <= 8'hCC; RegFile[13] <= 8'hDD; RegFile[14] <= 8'hEE; RegFile[15] <= 8'hFF;
        end else if (W_en) begin
            RegFile[W_Addr] <= W_Data;
        end
    end

    // Read operation
    always @(*) begin
        if (R_en)
            R_Data = RegFile[R_Addr];
        else
            R_Data = 8'bZZZZZZZZ;
    end

endmodule