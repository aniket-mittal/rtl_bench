module origen_149643(
    input clk,
    input reset,
    
    // Input signals from EX_MEM stage
    input MemEn_EX_MEM,
    input MemWrite_EX_MEM,
    input MemToReg_EX_MEM,
    input [31:0] RegWaddr_EX_MEM,
    input [31:0] ALUResult_EX_MEM,
    input [31:0] MemWdata_EX_MEM,
    input [31:0] PC_EX_MEM,
    input MFHL_EX_MEM,
    
    // Output signals to MEM_WB stage
    output reg MemEn_MEM,
    output reg MemWrite_MEM,
    output reg [31:0] data_sram_addr,
    output reg [31:0] MemWdata_MEM,
    output reg [31:0] RegWaddr_MEM_WB,
    output reg [31:0] ALUResult_MEM_WB,
    output reg [31:0] PC_MEM_WB,
    output reg MFHL_MEM_WB
);

    always @(posedge clk) begin
        if (reset) begin
            MemEn_MEM <= 0;
            MemWrite_MEM <= 0;
            data_sram_addr <= 0;
            MemWdata_MEM <= 0;
            RegWaddr_MEM_WB <= 0;
            ALUResult_MEM_WB <= 0;
            PC_MEM_WB <= 0;
            MFHL_MEM_WB <= 0;
        end
        else begin
            // Manage memory operations
            MemEn_MEM <= MemEn_EX_MEM;
            MemWrite_MEM <= MemWrite_EX_MEM;
            data_sram_addr <= ALUResult_EX_MEM;
            MemWdata_MEM <= MemWdata_EX_MEM;
            
            // Transfer pipeline data
            RegWaddr_MEM_WB <= RegWaddr_EX_MEM;
            ALUResult_MEM_WB <= ALUResult_EX_MEM;
            PC_MEM_WB <= PC_EX_MEM;
            
            // Handle special register operations
            MFHL_MEM_WB <= MFHL_EX_MEM;
        end
    end

endmodule