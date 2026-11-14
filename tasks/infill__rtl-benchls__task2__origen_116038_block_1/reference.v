module origen_116038 (
    input wire clk,
    input wire reset,
    input wire Branch,
    input wire MemRead,
    input wire MemWrite,
    input wire RegWrite,
    input wire MemtoReg,
    input wire [63:0] mux_ForwardB,
    input wire [63:0] mux_ALU,
    input wire ALUzero,
    input wire [63:0] adder2out,
    input wire [4:0] rd,
    
    output reg EX_MEM_Branch,
    output reg EX_MEM_MemRead,
    output reg EX_MEM_MemWrite,
    output reg EX_MEM_RegWrite,
    output reg EX_MEM_MemtoReg,
    output reg [63:0] EX_MEM_mux_ForwardB,
    output reg [63:0] EX_MEM_mux_ALU,
    output reg EX_MEM_ALUzero,
    output reg [63:0] EX_MEM_adder2out,
    output reg [4:0] EX_MEM_rd
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        EX_MEM_Branch <= 1'b0;
        EX_MEM_MemRead <= 1'b0;
        EX_MEM_MemWrite <= 1'b0;
        EX_MEM_RegWrite <= 1'b0;
        EX_MEM_MemtoReg <= 1'b0;
        EX_MEM_mux_ForwardB <= 64'b0;
        EX_MEM_mux_ALU <= 64'b0;
        EX_MEM_ALUzero <= 1'b0;
        EX_MEM_adder2out <= 64'b0;
        EX_MEM_rd <= 5'b0;
    end else begin
        EX_MEM_Branch <= Branch;
        EX_MEM_MemRead <= MemRead;
        EX_MEM_MemWrite <= MemWrite;
        EX_MEM_RegWrite <= RegWrite;
        EX_MEM_MemtoReg <= MemtoReg;
        EX_MEM_mux_ForwardB <= mux_ForwardB;
        EX_MEM_mux_ALU <= mux_ALU;
        EX_MEM_ALUzero <= ALUzero;
        EX_MEM_adder2out <= adder2out;
        EX_MEM_rd <= rd;
    end
end

endmodule