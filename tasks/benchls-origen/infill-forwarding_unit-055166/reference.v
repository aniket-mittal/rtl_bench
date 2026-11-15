module origen_055166 (
    input [4:0] rs1_id, rs2_id, rs1_ex, rs2_ex, rd_ex, rd_mem, rd_wb,
    input RegWrite_ex, RegWrite_mem, RegWrite_wb,
    input AluSrcB_ex,
    output reg [1:0] Forward_A_ex, Forward_B_ex, Forward_MemWriteData_ex,
    output reg [1:0] Forward_RegWriteData_A_id, Forward_RegWriteData_B_id
);

    always @(*) begin
        // Forward_A_ex
        if (RegWrite_mem && (rd_mem != 0) && (rd_mem == rs1_ex))
            Forward_A_ex = 2'b10;
        else if (RegWrite_wb && (rd_wb != 0) && (rd_wb == rs1_ex))
            Forward_A_ex = 2'b01;
        else
            Forward_A_ex = 2'b00;

        // Forward_B_ex
        if (AluSrcB_ex == 1'b0) begin
            if (RegWrite_mem && (rd_mem != 0) && (rd_mem == rs2_ex))
                Forward_B_ex = 2'b10;
            else if (RegWrite_wb && (rd_wb != 0) && (rd_wb == rs2_ex))
                Forward_B_ex = 2'b01;
            else
                Forward_B_ex = 2'b00;
        end else
            Forward_B_ex = 2'b11;

        // Forward_MemWriteData_ex
        if (RegWrite_mem && (rd_mem != 0) && (rd_mem == rs2_ex))
            Forward_MemWriteData_ex = 2'b10;
        else if (RegWrite_wb && (rd_wb != 0) && (rd_wb == rs2_ex))
            Forward_MemWriteData_ex = 2'b01;
        else
            Forward_MemWriteData_ex = 2'b00;

        // Forward_RegWriteData_A_id
        if (RegWrite_ex && (rd_ex != 0) && (rd_ex == rs1_id))
            Forward_RegWriteData_A_id = 2'b10;
        else if (RegWrite_mem && (rd_mem != 0) && (rd_mem == rs1_id))
            Forward_RegWriteData_A_id = 2'b01;
        else
            Forward_RegWriteData_A_id = 2'b00;

        // Forward_RegWriteData_B_id
        if (RegWrite_ex && (rd_ex != 0) && (rd_ex == rs2_id))
            Forward_RegWriteData_B_id = 2'b10;
        else if (RegWrite_mem && (rd_mem != 0) && (rd_mem == rs2_id))
            Forward_RegWriteData_B_id = 2'b01;
        else
            Forward_RegWriteData_B_id = 2'b00;
    end

endmodule