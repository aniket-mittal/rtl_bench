module origen_071329 (
    input wire clk,
    input wire reset,
    input wire pa_idexmemwr,
    input wire ex_regwr,
    input wire ex_memtoreg,
    input wire ex_memwr,
    input wire ex_dmen,
    input wire [31:0] ex_result,
    input wire [31:0] ex_b,
    input wire [4:0] ex_regdst_addr,
    output wire mem_regwr,
    output wire mem_dmen,
    output wire mem_memtoreg,
    output wire mem_memwr,
    output wire [31:0] mem_result,
    output wire [31:0] mem_rt,
    output wire [4:0] mem_regdst_addr
);

    reg E_regwr, E_memtoreg, E_memwr, E_dmem;
    reg [31:0] E_result, E_b;
    reg [4:0] E_regdst_addr;

    [MASKED]

    assign mem_regwr = E_regwr;
    assign mem_dmen = E_dmem;
    assign mem_memtoreg = E_memtoreg;
    assign mem_memwr = E_memwr;
    assign mem_result = E_result;
    assign mem_rt = E_b;
    assign mem_regdst_addr = E_regdst_addr;

endmodule