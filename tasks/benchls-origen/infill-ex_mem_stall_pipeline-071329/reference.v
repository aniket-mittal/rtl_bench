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

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            E_regwr <= 1'b0;
            E_memtoreg <= 1'b0;
            E_memwr <= 1'b0;
            E_dmem <= 1'b0;
            E_result <= 32'b0;
            E_b <= 32'b0;
            E_regdst_addr <= 5'b0;
        end
        else if (!pa_idexmemwr) begin
            E_regwr <= ex_regwr;
            E_memtoreg <= ex_memtoreg;
            E_memwr <= ex_memwr;
            E_dmem <= ex_dmen;
            E_result <= ex_result;
            E_b <= ex_b;
            E_regdst_addr <= ex_regdst_addr;
        end
    end

    assign mem_regwr = E_regwr;
    assign mem_dmen = E_dmem;
    assign mem_memtoreg = E_memtoreg;
    assign mem_memwr = E_memwr;
    assign mem_result = E_result;
    assign mem_rt = E_b;
    assign mem_regdst_addr = E_regdst_addr;

endmodule