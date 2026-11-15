module rtlpp_10333 (
    A_mul_src1,
    A_mul_src2,
    clk,
    reset_n,
    A_mul_cell_result
);

output [31:0] A_mul_cell_result;
input [31:0] A_mul_src1;
input [31:0] A_mul_src2;
input clk;
input reset_n;

reg [31:0] A_mul_cell_result;
wire [31:0] A_mul_cell_result_part_1;
wire [15:0] A_mul_cell_result_part_2;
wire mul_clr;

assign mul_clr = ~reset_n;

// Part 1 Multiplier Logic
reg [31:0] part_1_dataa, part_1_datab, part_1_result;
always @(posedge clk or posedge mul_clr) begin
    if (mul_clr) 
        part_1_result <= 32'b0;
    else 
        part_1_result <= part_1_dataa * part_1_datab;
end
assign part_1_dataa = {16'b0, A_mul_src1[15:0]};
assign part_1_datab = {16'b0, A_mul_src2[15:0]};
assign A_mul_cell_result_part_1 = part_1_result;

// Part 2 Multiplier Logic
reg [31:0] part_2_dataa, part_2_datab, part_2_result;
always @(posedge clk or posedge mul_clr) begin
    if (mul_clr) 
        part_2_result <= 32'b0;
    else 
        part_2_result <= part_2_dataa * part_2_datab;
end
assign part_2_dataa = {16'b0, A_mul_src1[31:16]};
assign part_2_datab = {16'b0, A_mul_src2[15:0]};
assign A_mul_cell_result_part_2 = part_2_result[15:0];

// Final Result Assignment
always @(posedge clk or posedge mul_clr) begin
    if (mul_clr)
        A_mul_cell_result <= 32'b0;
    else
        A_mul_cell_result <= {A_mul_cell_result_part_1[31:16] + A_mul_cell_result_part_2, A_mul_cell_result_part_1[15:0]};
end

endmodule