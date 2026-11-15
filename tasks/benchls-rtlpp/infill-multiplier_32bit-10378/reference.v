module rtlpp_10378 (
    E_src1,
    E_src2,
    M_en,
    clk,
    reset_n,
    M_mul_cell_p1,
    M_mul_cell_p2,
    M_mul_cell_p3
);

output [31:0] M_mul_cell_p1;
output [31:0] M_mul_cell_p2;
output [31:0] M_mul_cell_p3;
input [31:0] E_src1;
input [31:0] E_src2;
input M_en;
input clk;
input reset_n;

reg [31:0] M_mul_cell_p1;
reg [31:0] M_mul_cell_p2;
reg [31:0] M_mul_cell_p3;

always @(posedge clk or negedge reset_n) begin
    if (reset_n == 0) begin
        M_mul_cell_p1 <= 0;
        M_mul_cell_p2 <= 0;
        M_mul_cell_p3 <= 0;
    end else if (M_en) begin
        M_mul_cell_p1 <= E_src1[15:0] * E_src2[15:0];
        M_mul_cell_p2 <= E_src1[15:0] * E_src2[31:16];
        M_mul_cell_p3 <= E_src1[31:16] * E_src2[15:0];
    end
end

endmodule