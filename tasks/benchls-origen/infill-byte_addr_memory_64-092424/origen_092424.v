module origen_092424 (
    input [63:0] Mem_Addr,
    input [63:0] Write_Data,
    input clk,
    input MemWrite,
    input MemRead,
    output reg [63:0] Read_Data
);

    reg [7:0] memory [0:63];
    reg [63:0] temp_data;
    integer i;

    // Initialize memory with zeros
    initial begin
        for (i = 0; i < 64; i = i + 1) begin
            memory[i] = 8'b0;
        end
    end

    // Write operation (little-endian)
    always @(negedge clk) begin
        if (MemWrite) begin
            memory[Mem_Addr]     <= Write_Data[7:0];
            memory[Mem_Addr + 1] <= Write_Data[15:8];
            memory[Mem_Addr + 2] <= Write_Data[23:16];
            memory[Mem_Addr + 3] <= Write_Data[31:24];
            memory[Mem_Addr + 4] <= Write_Data[39:32];
            memory[Mem_Addr + 5] <= Write_Data[47:40];
            memory[Mem_Addr + 6] <= Write_Data[55:48];
            memory[Mem_Addr + 7] <= Write_Data[63:56];
        end
    end

    // Read operation (little-endian)
    [MASKED]

    // Output assignment
    always @(*) begin
        Read_Data = temp_data;
    end

endmodule