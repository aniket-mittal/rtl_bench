module origen_062589 (
    input wire clk,
    input wire rst_n,
    
    // EX stage inputs
    input wire EX_rf_we,
    input wire [1:0] EX_wd_sel,
    input wire EX_dram_we,
    input wire [31:0] EX_ALUC,
    input wire [31:0] EX_rD2,
    input wire [31:0] EX_pc4,
    input wire [4:0] EX_wR,
    input wire [31:0] EX_PC,
    input wire ex_have_inst,
    
    // MEM stage outputs
    output reg MEM_rf_we,
    output reg [1:0] MEM_wd_sel,
    output reg MEM_dram_we,
    output reg [31:0] MEM_ALUC,
    output reg [31:0] MEM_rD2,
    output reg [31:0] MEM_pc4,
    output reg [4:0] MEM_wR,
    output reg [31:0] MEM_PC,
    output reg mem_have_inst
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            MEM_rf_we <= 1'b0;
            MEM_wd_sel <= 2'b00;
            MEM_dram_we <= 1'b0;
            MEM_ALUC <= 32'b0;
            MEM_rD2 <= 32'b0;
            MEM_pc4 <= 32'b0;
            MEM_wR <= 5'b0;
            MEM_PC <= 32'b0;
            mem_have_inst <= 1'b0;
        end else begin
            MEM_rf_we <= EX_rf_we;
            MEM_wd_sel <= EX_wd_sel;
            MEM_dram_we <= EX_dram_we;
            MEM_ALUC <= EX_ALUC;
            MEM_rD2 <= EX_rD2;
            MEM_pc4 <= EX_pc4;
            MEM_wR <= EX_wR;
            MEM_PC <= EX_PC;
            mem_have_inst <= ex_have_inst;
        end
    end

endmodule