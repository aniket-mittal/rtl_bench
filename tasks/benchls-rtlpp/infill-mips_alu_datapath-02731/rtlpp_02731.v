module rtlpp_02731(
input wire [31:0] pc4,
input wire [31:0] register_rs,
input wire [31:0] register_rt,
input wire [5:0] function_opcode,
input wire [31:0] sign_extend,
input wire [4:0] wreg_rd,
input wire [4:0] wreg_rt,
input wire [1:0] aluop,
input wire branch,
input wire alusrc,
input wire regdst,

output reg [31:0] alu_result,
output wire [31:0] branch_addr,
output wire [4:0] wreg_address,
output wire do_branch
);

wire zero;
wire [31:0] ainput;
wire [31:0] binput;
reg [2:0] alu_ctl;

assign ainput = register_rs;
assign binput = (alusrc == 1'b1) ? sign_extend : register_rt;

[MASKED]

always @(*) begin
    case (alu_ctl)
        3'b010: alu_result = ainput + binput; // ADD
        3'b110: alu_result = ainput - binput; // SUB
        3'b000: alu_result = ainput & binput; // AND
        3'b001: alu_result = ainput | binput; // OR
        3'b111: alu_result = (ainput < binput) ? 32'b1 : 32'b0; // SLT
        default: alu_result = 32'bxxxxxxxx; // Undefined
    endcase
end

assign zero = (alu_result == 32'h00000000) ? 1'b1 : 1'b0;
assign do_branch = branch & zero;
assign wreg_address = (regdst == 1'b1) ? wreg_rd : wreg_rt;
assign branch_addr = pc4 + {sign_extend[29:0], 2'b00};

endmodule