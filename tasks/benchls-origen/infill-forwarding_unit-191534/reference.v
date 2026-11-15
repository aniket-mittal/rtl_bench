module origen_191534(
    input [3:0] rf_waddr_exmem,
    input [3:0] rf_waddr_memwb,
    input [3:0] inst_curr_IDEX_7_4_rs,
    input [3:0] inst_curr_IDEX_3_0_rt,
    input [3:0] inst_curr_IDEX_11_8_rd,
    input rf_wen_exmem,
    input rf_wen_memwb,
    input mem2reg_memwb,
    input mem2reg_exmem,
    input dmem_wen_idex,
    output reg [1:0] forwardA,
    output reg [1:0] forwardB,
    output reg [1:0] rdata2_sw_fcontrol
);

always @(*) begin
    // Forwarding logic for operand A (rs)
    if ((rf_wen_exmem && (rf_waddr_exmem == inst_curr_IDEX_7_4_rs) && (inst_curr_IDEX_7_4_rs != 0))) begin
        forwardA = 2'b10; // Forward from EX/MEM
    end
    else if ((rf_wen_memwb && (rf_waddr_memwb == inst_curr_IDEX_7_4_rs) && (inst_curr_IDEX_7_4_rs != 0))) begin
        forwardA = 2'b01; // Forward from MEM/WB
    end
    else begin
        forwardA = 2'b00; // No forwarding, use value from register file
    end

    // Forwarding logic for operand B (rt)
    if ((rf_wen_exmem && (rf_waddr_exmem == inst_curr_IDEX_3_0_rt) && (inst_curr_IDEX_3_0_rt != 0))) begin
        forwardB = 2'b10; // Forward from EX/MEM
    end
    else if ((rf_wen_memwb && (rf_waddr_memwb == inst_curr_IDEX_3_0_rt) && (inst_curr_IDEX_3_0_rt != 0))) begin
        forwardB = 2'b01; // Forward from MEM/WB
    end
    else begin
        forwardB = 2'b00; // No forwarding, use value from register file
    end

    // Forwarding logic for store data (rdata2)
    if ((rf_wen_exmem && (rf_waddr_exmem == inst_curr_IDEX_3_0_rt) && (inst_curr_IDEX_3_0_rt != 0))) begin
        rdata2_sw_fcontrol = 2'b10; // Forward from EX/MEM
    end
    else if ((rf_wen_memwb && (rf_waddr_memwb == inst_curr_IDEX_3_0_rt) && (inst_curr_IDEX_3_0_rt != 0))) begin
        rdata2_sw_fcontrol = 2'b01; // Forward from MEM/WB
    end
    else begin
        rdata2_sw_fcontrol = 2'b00; // No forwarding, use value from register file
    end
end

endmodule