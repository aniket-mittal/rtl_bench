module origen_034226 (
    input wire clk,
    input wire rst,
    input wire [1:0] WB,
    input wire [1:0] M,
    input wire [4:0] EX,
    input wire [31:0] readData1,
    input wire [31:0] readData2,
    input wire [31:0] S_EXTEND_out_b,
    input wire [4:0] rs,
    input wire [4:0] rt,
    input wire [4:0] rd,
    
    output reg [1:0] EX_WB,
    output reg [1:0] EX_M,
    output reg [4:0] EX_EX,
    output reg [31:0] EX_SRC_A,
    output reg [31:0] EX_SRC_B,
    output reg [31:0] EX_SE,
    output reg [4:0] EX_rs,
    output reg [4:0] EX_rt,
    output reg [4:0] EX_rd
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            EX_WB <= 2'b0;
            EX_M <= 2'b0;
            EX_EX <= 5'b0;
            EX_SRC_A <= 32'b0;
            EX_SRC_B <= 32'b0;
            EX_SE <= 32'b0;
            EX_rs <= 5'b0;
            EX_rt <= 5'b0;
            EX_rd <= 5'b0;
        end
        else begin
            EX_WB <= WB;
            EX_M <= M;
            EX_EX <= EX;
            EX_SRC_A <= readData1;
            EX_SRC_B <= readData2;
            EX_SE <= S_EXTEND_out_b;
            EX_rs <= rs;
            EX_rt <= rt;
            EX_rd <= rd;
        end
    end

endmodule