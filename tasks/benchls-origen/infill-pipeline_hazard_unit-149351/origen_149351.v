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

    [MASKED]

endmodule