module origen_070832 (
    input wire Clk,
    
    // Control signals
    input wire MemRead_in, MemWrite_in, RegWrite_in, regWrite_jal_in,
    input wire MemToReg_in, HiOrLo_in, HiLoReg_in, Add64_in, HiLoSelect_in, HiRsSel_in,
    input wire WriteHi_in, WriteLo_in,
    
    // Data paths
    input wire [31:0] ALU_in, ALU_hi_in,
    input wire [4:0] RtRd_in,
    input wire [31:0] Read1_in, Read2_in,
    input wire [31:0] PC_in,
    
    // Operation type
    input wire [3:0] MEMop_in,
    
    // Output signals
    output reg MemRead_out, MemWrite_out, RegWrite_out, regWrite_jal_out,
    output reg MemToReg_out, HiOrLo_out, HiLoReg_out, Add64_out, HiLoSelect_out, HiRsSel_out,
    output reg WriteHi_out, WriteLo_out,
    output reg [31:0] ALU_out, ALU_hi_out,
    output reg [4:0] RtRd_out,
    output reg [31:0] Read1_out, Read2_out,
    output reg [31:0] PC_out,
    output reg [3:0] MEMop_out
);

    always @(posedge Clk) begin
        // Control signals
        MemRead_out <= MemRead_in;
        MemWrite_out <= MemWrite_in;
        RegWrite_out <= RegWrite_in;
        regWrite_jal_out <= regWrite_jal_in;
        MemToReg_out <= MemToReg_in;
        HiOrLo_out <= HiOrLo_in;
        HiLoReg_out <= HiLoReg_in;
        Add64_out <= Add64_in;
        HiLoSelect_out <= HiLoSelect_in;
        HiRsSel_out <= HiRsSel_in;
        WriteHi_out <= WriteHi_in;
        WriteLo_out <= WriteLo_in;
        
        // Data paths
        ALU_out <= ALU_in;
        ALU_hi_out <= ALU_hi_in;
        RtRd_out <= RtRd_in;
        Read1_out <= Read1_in;
        Read2_out <= Read2_in;
        PC_out <= PC_in;
        
        // Operation type
        MEMop_out <= MEMop_in;
    end

endmodule