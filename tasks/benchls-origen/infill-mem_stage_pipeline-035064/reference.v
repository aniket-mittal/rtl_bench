module origen_035064 (
    input wire clk,
    input wire rst_n,
    input wire memory_stall,
    input wire [31:0] ALU_result_3,
    input wire [31:0] writedata_3,
    input wire [31:0] D_readData,
    input wire WriteBack_3,
    input wire [1:0] Mem_3,
    input wire [4:0] Rd_3,
    
    output reg [31:0] memory_result_4,
    output reg [31:0] ALU_result_4,
    output reg [31:0] forward_result_4,
    output reg [4:0] Rd_4,
    output reg WriteBack_4,
    output reg Mem2Reg,
    output wire [29:0] D_addr,
    output wire D_wen,
    output wire D_ren,
    output wire [31:0] D_writeData
);

    // Memory access
    assign D_addr = ALU_result_3[31:2];
    assign D_wen = Mem_3[0];
    assign D_ren = Mem_3[1];
    assign D_writeData = {writedata_3[7:0], writedata_3[15:8], writedata_3[23:16], writedata_3[31:24]};

    // Byte swapping for read data
    wire [31:0] swapped_D_readData = {D_readData[7:0], D_readData[15:8], D_readData[23:16], D_readData[31:24]};

    // Data forwarding
    wire [31:0] forward_result = Mem_3[1] ? swapped_D_readData : ALU_result_3;

    // Pipeline registers
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            memory_result_4 <= 32'b0;
            ALU_result_4 <= 32'b0;
            forward_result_4 <= 32'b0;
            Rd_4 <= 5'b0;
            WriteBack_4 <= 1'b0;
            Mem2Reg <= 1'b0;
        end else if (!memory_stall) begin
            memory_result_4 <= swapped_D_readData;
            ALU_result_4 <= ALU_result_3;
            forward_result_4 <= forward_result;
            Rd_4 <= Rd_3;
            WriteBack_4 <= WriteBack_3;
            Mem2Reg <= Mem_3[1];
        end
    end

endmodule