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

[MASKED]

assign jumpAddress = jumpAddress_reg;
assign opcode = opcode_reg;
assign funct = funct_reg;
assign rs = rs_reg;
assign rt = rt_reg;
assign rd = rd_reg;
assign immediate = immediate_reg;

endmodule