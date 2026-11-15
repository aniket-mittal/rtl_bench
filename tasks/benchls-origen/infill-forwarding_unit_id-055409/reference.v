module origen_055409(
    input [4:0] ex_mem_register_rd,
    input [4:0] mem_wb_register_rd,
    input [4:0] id_ex_register_rs,
    input [4:0] id_ex_register_rt,
    input [4:0] if_id_register_rs,
    input [4:0] if_id_register_rt,
    input ex_mem_regwrite,
    input mem_wb_regwrite,
    output reg [1:0] forward_a,
    output reg [1:0] forward_b,
    output reg forward_c,
    output reg forward_d
);

always @(*) begin
    // Default: No forwarding
    forward_a = 2'b00;
    forward_b = 2'b00;
    forward_c = 1'b0;
    forward_d = 1'b0;

    // EX hazard
    if (ex_mem_regwrite && (ex_mem_register_rd != 0) && (ex_mem_register_rd == id_ex_register_rs)) begin
        forward_a = 2'b10;
    end
    if (ex_mem_regwrite && (ex_mem_register_rd != 0) && (ex_mem_register_rd == id_ex_register_rt)) begin
        forward_b = 2'b10;
    end

    // MEM hazard
    if (mem_wb_regwrite && (mem_wb_register_rd != 0) && 
        !(ex_mem_regwrite && (ex_mem_register_rd != 0) && (ex_mem_register_rd == id_ex_register_rs)) &&
        (mem_wb_register_rd == id_ex_register_rs)) begin
        forward_a = 2'b01;
    end
    if (mem_wb_regwrite && (mem_wb_register_rd != 0) && 
        !(ex_mem_regwrite && (ex_mem_register_rd != 0) && (ex_mem_register_rd == id_ex_register_rt)) &&
        (mem_wb_register_rd == id_ex_register_rt)) begin
        forward_b = 2'b01;
    end

    // ID stage forwarding
    if (mem_wb_regwrite && (mem_wb_register_rd != 0) && (mem_wb_register_rd == if_id_register_rs)) begin
        forward_c = 1'b1;
    end
    if (mem_wb_regwrite && (mem_wb_register_rd != 0) && (mem_wb_register_rd == if_id_register_rt)) begin
        forward_d = 1'b1;
    end
end

endmodule