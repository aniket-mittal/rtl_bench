module origen_215200(
    input [4:0] ID_rs, ID_rt,
    input [4:0] EX_rs, EX_rt,
    input [4:0] MEM_rt, MEM_RW, WB_RW,
    input MEM_ramwe, MEM_regwe, WB_regwe,
    output reg [1:0] ID_forwardA, ID_forwardB,
    output reg [1:0] EX_forwardA, EX_forwardB,
    output reg MEM_forward
);

always @(*) begin
    // Forwarding logic for ID stage
    if (MEM_regwe && (ID_rs == MEM_RW)) begin
        ID_forwardA = 2'b10;
    end else if (WB_regwe && (ID_rs == WB_RW)) begin
        ID_forwardA = 2'b01;
    end else begin
        ID_forwardA = 2'b00;
    end

    if (MEM_regwe && (ID_rt == MEM_RW)) begin
        ID_forwardB = 2'b10;
    end else if (WB_regwe && (ID_rt == WB_RW)) begin
        ID_forwardB = 2'b01;
    end else begin
        ID_forwardB = 2'b00;
    end

    // Forwarding logic for EX stage
    if (MEM_regwe && (EX_rs == MEM_RW)) begin
        EX_forwardA = 2'b10;
    end else if (WB_regwe && (EX_rs == WB_RW)) begin
        EX_forwardA = 2'b01;
    end else begin
        EX_forwardA = 2'b00;
    end

    if (MEM_regwe && (EX_rt == MEM_RW)) begin
        EX_forwardB = 2'b10;
    end else if (WB_regwe && (EX_rt == WB_RW)) begin
        EX_forwardB = 2'b01;
    end else begin
        EX_forwardB = 2'b00;
    end

    // Forwarding logic for memory write
    if (MEM_ramwe && (MEM_rt == WB_RW) && WB_regwe) begin
        MEM_forward = 1'b1;
    end else begin
        MEM_forward = 1'b0;
    end
end

endmodule