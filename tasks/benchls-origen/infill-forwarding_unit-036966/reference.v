module origen_036966 (
    input wire WriteReg_ex_mem,
    input wire WriteReg_mem_wb,
    input wire MemRead_ex_mem,
    input wire [4:0] Rs_id_ex,
    input wire [4:0] Rt_id_ex,
    input wire [4:0] Rd_ex_mem,
    input wire [4:0] Rd_mem_wb,
    input wire [4:0] Rs_ex_mem,
    input wire Rs_id_ex_valid,
    input wire Rt_id_ex_valid,
    input wire Rd_ex_mem_valid,
    input wire Rd_mem_wb_valid,
    output reg [1:0] forwardA,
    output reg [1:0] forwardB
);

    // Hazard detection signals
    wire Rs_ex_hazard, Rt_ex_hazard, Rs_mem_hazard, Rt_mem_hazard;
    wire load_ex_mem;

    // Hazard detection logic
    assign Rs_ex_hazard = WriteReg_ex_mem && Rd_ex_mem_valid && (Rs_id_ex == Rd_ex_mem) && (Rs_id_ex != 5'b0) && Rs_id_ex_valid;
    assign Rt_ex_hazard = WriteReg_ex_mem && Rd_ex_mem_valid && (Rt_id_ex == Rd_ex_mem) && (Rt_id_ex != 5'b0) && Rt_id_ex_valid;
    assign Rs_mem_hazard = WriteReg_mem_wb && Rd_mem_wb_valid && (Rs_id_ex == Rd_mem_wb) && (Rs_id_ex != 5'b0) && Rs_id_ex_valid;
    assign Rt_mem_hazard = WriteReg_mem_wb && Rd_mem_wb_valid && (Rt_id_ex == Rd_mem_wb) && (Rt_id_ex != 5'b0) && Rt_id_ex_valid;

    // Load-use hazard detection
    assign load_ex_mem = MemRead_ex_mem && (Rs_ex_mem == Rd_ex_mem) && Rd_ex_mem_valid;

    // Forwarding logic for Rs (forwardA)
    always @(*) begin
        if (load_ex_mem && (Rs_id_ex == Rd_ex_mem) && Rs_id_ex_valid)
            forwardA = 2'b11; // Load-use hazard
        else if (Rs_ex_hazard)
            forwardA = 2'b10; // EX hazard
        else if (Rs_mem_hazard)
            forwardA = 2'b01; // MEM hazard
        else
            forwardA = 2'b00; // No forwarding
    end

    // Forwarding logic for Rt (forwardB)
    always @(*) begin
        if (Rt_ex_hazard)
            forwardB = 2'b10; // EX hazard
        else if (Rt_mem_hazard)
            forwardB = 2'b01; // MEM hazard
        else
            forwardB = 2'b00; // No forwarding
    end

endmodule