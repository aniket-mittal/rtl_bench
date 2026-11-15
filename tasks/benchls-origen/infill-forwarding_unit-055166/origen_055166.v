module origen_055166 (
    input [4:0] rs1_id, rs2_id, rs1_ex, rs2_ex, rd_ex, rd_mem, rd_wb,
    input RegWrite_ex, RegWrite_mem, RegWrite_wb,
    input AluSrcB_ex,
    output reg [1:0] Forward_A_ex, Forward_B_ex, Forward_MemWriteData_ex,
    output reg [1:0] Forward_RegWriteData_A_id, Forward_RegWriteData_B_id
);

    [MASKED]

endmodule