module origen_190982(
    input [31:0] instruction,
    input clk,
    input ir_w,
    output [25:0] jumpAddress,
    output [5:0] opcode,
    output [5:0] funct,
    output [4:0] rs,
    output [4:0] rt,
    output [4:0] rd,
    output [15:0] immediate
);

reg [31:0] instruction_reg;
reg [25:0] jumpAddress_reg;
reg [5:0] opcode_reg;
reg [5:0] funct_reg;
reg [4:0] rs_reg;
reg [4:0] rt_reg;
reg [4:0] rd_reg;
reg [15:0] immediate_reg;
reg [1:0] type_opcode;

always @(negedge clk) begin
    if (ir_w) begin
        instruction_reg <= instruction;

        // Extract instruction fields
        jumpAddress_reg <= instruction[25:0];
        opcode_reg <= instruction[31:26];
        funct_reg <= instruction[5:0];
        rs_reg <= instruction[25:21];
        rt_reg <= instruction[20:16];
        rd_reg <= instruction[15:11];
        immediate_reg <= instruction[15:0];

        // Determine instruction type
        if (opcode_reg == 6'b000000) begin
            type_opcode <= 2'b00; // type_R
        end else if (opcode_reg[5:3] == 3'b010) begin
            type_opcode <= 2'b01; // type_I
        end else begin
            type_opcode <= 2'b10; // type_J
        end
    end
end

assign jumpAddress = jumpAddress_reg;
assign opcode = opcode_reg;
assign funct = funct_reg;
assign rs = rs_reg;
assign rt = rt_reg;
assign rd = rd_reg;
assign immediate = immediate_reg;

endmodule