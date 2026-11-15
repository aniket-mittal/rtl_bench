module origen_149351(
    input [1:0] MemtoRegE,
    input [4:0] IFID_rs,
    input [4:0] IFID_rt,
    input [4:0] IDEX_WA,
    input [4:0] EXMEM_WA,
    input nPC_sel,
    input RegWriteE,
    input [1:0] MemtoRegM,
    input jr,
    input MemWriteD,
    output reg IFID_en,
    output reg pc_en,
    output reg IDEX_reset
);

    reg stall_load;
    reg stall_b;
    reg stall_jr;
    reg [1:0] stall;
    reg restall;

    initial begin
        IFID_en = 1'b1;
        pc_en = 1'b1;
        IDEX_reset = 1'b0;
    end

    always @(*) begin
        // Detect load-use data hazard
        stall_load = (MemtoRegE != 2'b00) && ((IFID_rs == IDEX_WA) || (IFID_rt == IDEX_WA));

        // Detect control hazards
        stall_b = (nPC_sel && RegWriteE) && ((IFID_rs == IDEX_WA) || (IFID_rt == IDEX_WA) || (IFID_rs == EXMEM_WA) || (IFID_rt == EXMEM_WA));
        stall_jr = (jr && RegWriteE) && ((IFID_rs == IDEX_WA) || (IFID_rs == EXMEM_WA));

        // Combine stall conditions
        stall = {(stall_load || stall_b || stall_jr), (stall_load || stall_b || stall_jr)};
        restall = (MemtoRegM != 2'b00) && MemWriteD;

        // Update output signals
        if (stall == 2'b10) begin
            IFID_en = 1'b0;
            pc_en = 1'b0;
            IDEX_reset = 1'b1;
        end else if (stall[0] || restall) begin
            IFID_en = 1'b0;
            pc_en = 1'b0;
            IDEX_reset = 1'b1;
        end else begin
            IFID_en = 1'b1;
            pc_en = 1'b1;
            IDEX_reset = 1'b0;
        end
    end

endmodule